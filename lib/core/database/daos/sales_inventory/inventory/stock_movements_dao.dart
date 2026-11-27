import 'package:drift/drift.dart';

import '../../../app_database.dart';

import '../../../tables/sales_inventory/inventory/stock_movements_table.dart';
import '../../../tables/sales_inventory/inventory/product_stocks_table.dart';
import '../../../tables/sales_inventory/inventory/stores_table.dart';

import '../../../tables/master_data/products/products_table.dart';
import '../../../tables/master_data/products/product_units_table.dart';

part 'stock_movements_dao.g.dart';

@DriftAccessor(
  tables: [
    StockMovements,
    ProductStocks,
    ProductUnits,
    Products,
    Stores,
  ],
)
class StockMovementsDao extends DatabaseAccessor<AppDatabase>
    with _$StockMovementsDaoMixin {
  StockMovementsDao(super.db);

  // =========================================================
  // Constants
  // =========================================================

  static const double _epsilon = 0.000001;

  static const List<String> movementTypes = [
    'in',
    'out',
    'sale',
    'purchase',
    'return',
    'adjustment',
    'transfer_in',
    'transfer_out',
  ];

  static const List<String> incomingTypes = [
    'in',
    'purchase',
    'return',
    'transfer_in',
  ];

  static const List<String> outgoingTypes = [
    'out',
    'sale',
    'transfer_out',
  ];

  // =========================================================
  // Validation Helpers
  // =========================================================

  void _validatePositiveId(int value, String field) {
    if (value <= 0) {
      throw ArgumentError('$field يجب أن يكون أكبر من صفر.');
    }
  }

  void _validatePositiveNumber(double value, String field) {
    if (!value.isFinite || value <= 0) {
      throw ArgumentError('$field يجب أن يكون أكبر من صفر.');
    }
  }

  void _validateNonNegativeNumber(double value, String field) {
    if (!value.isFinite || value < 0) {
      throw ArgumentError('$field يجب ألا يكون سالباً.');
    }
  }

  String _normalizeText(String value, String field) {
    final normalized = value.trim();

    if (normalized.isEmpty) {
      throw ArgumentError('$field مطلوب.');
    }

    return normalized;
  }

  String _normalizeMovementNumber(String value) {
    final number = _normalizeText(value, 'رقم الحركة');

    if (number.length > 50) {
      throw ArgumentError('رقم الحركة يجب ألا يتجاوز 50 حرفاً.');
    }

    return number;
  }

  // =========================================================
  // Movement Number Helpers
  // =========================================================

  String addMovementSuffix(String number, String suffix) {
    final result = '${number.trim()}-$suffix';

    if (result.length > 50) {
      throw ArgumentError(
        'رقم الحركة بعد إضافة اللاحقة تجاوز 50 حرفاً.',
      );
    }

    return result;
  }

  // =========================================================
  // Store Validation
  // =========================================================

  Future<StoreDb> _validateStore(int storeId) async {
    _validatePositiveId(storeId, 'رقم المخزن');

    final store = await (select(stores)
          ..where(
            (t) => t.id.equals(storeId) & t.isActive.equals(true),
          ))
        .getSingleOrNull();

    if (store == null) {
      throw StateError('المخزن غير موجود أو غير نشط.');
    }

    return store;
  }

  // =========================================================
  // Product Validation
  // =========================================================

  Future<ProductDb> _getActiveProduct(int productId) async {
    _validatePositiveId(productId, 'رقم المنتج');

    final product = await (select(products)
          ..where(
            (t) => t.id.equals(productId) & t.isActive.equals(true),
          ))
        .getSingleOrNull();

    if (product == null) {
      throw StateError('المنتج غير موجود أو غير نشط.');
    }

    return product;
  }

  // =========================================================
  // Unit Resolution
  // =========================================================

  Future<_ResolvedUnit> _resolveUnit({
    required int productId,
    int? productUnitId,
    double? conversionFactor,
    String? unitName,
  }) async {
    final product = await _getActiveProduct(productId);

    if (productUnitId != null) {
      _validatePositiveId(productUnitId, 'رقم وحدة المنتج');

      final unit = await (select(productUnits)
            ..where(
              (t) =>
                  t.id.equals(productUnitId) &
                  t.productId.equals(productId) &
                  t.isActive.equals(true),
            ))
          .getSingleOrNull();

      if (unit == null) {
        throw StateError('وحدة المنتج غير موجودة أو غير نشطة.');
      }

      if (conversionFactor != null &&
          (conversionFactor - unit.conversionFactor).abs() > _epsilon) {
        throw ArgumentError(
          'معامل التحويل المرسل لا يطابق معامل الوحدة المسجل.',
        );
      }

      return _ResolvedUnit(
        unitId: unit.id,
        unitName: unit.unitName,
        conversionFactor: unit.conversionFactor,
      );
    }

    if (conversionFactor != null && (conversionFactor - 1).abs() > _epsilon) {
      throw ArgumentError(
        'لا يمكن استخدام معامل تحويل مختلف دون تحديد وحدة المنتج.',
      );
    }

    return _ResolvedUnit(
      unitId: null,
      unitName: unitName?.trim().isNotEmpty == true
          ? unitName!.trim()
          : product.baseUnit,
      conversionFactor: 1,
    );
  }

  // =========================================================
  // Stock Helpers
  // =========================================================

  Future<ProductStockDb?> _getProductStock({
    required int storeId,
    required int productId,
  }) {
    return (select(productStocks)
          ..where(
            (t) => t.storeId.equals(storeId) & t.productId.equals(productId),
          ))
        .getSingleOrNull();
  }

  Future<void> _validateStockValues({
    required double quantity,
    required double reservedQuantity,
    required double availableQuantity,
    required double averageCost,
    required double totalCost,
  }) async {
    _validateNonNegativeNumber(quantity, 'كمية المخزون');
    _validateNonNegativeNumber(reservedQuantity, 'الكمية المحجوزة');
    _validateNonNegativeNumber(availableQuantity, 'الكمية المتاحة');
    _validateNonNegativeNumber(averageCost, 'متوسط التكلفة');
    _validateNonNegativeNumber(totalCost, 'قيمة المخزون');

    if (reservedQuantity - quantity > _epsilon) {
      throw StateError('الكمية المحجوزة أكبر من الكمية الموجودة.');
    }

    final expectedAvailable = quantity - reservedQuantity;

    if ((availableQuantity - expectedAvailable).abs() > _epsilon) {
      throw StateError('الكمية المتاحة لا تتطابق مع كمية المخزون.');
    }
  }

  // =========================================================
  // Public Record Movement
  // =========================================================

  Future<int> recordMovement({
    required int storeId,
    required int productId,
    int? productUnitId,
    required String movementNumber,
    required String movementType,
    String? referenceType,
    int? referenceId,
    required double enteredQuantity,
    double? conversionFactor,
    String? unitName,
    double? unitCost,
    String? note,
    int? createdBy,
    DateTime? movementDate,
    bool? adjustmentIsIncoming,
  }) {
    return transaction(
      () => _recordMovement(
        storeId: storeId,
        productId: productId,
        productUnitId: productUnitId,
        movementNumber: movementNumber,
        movementType: movementType,
        referenceType: referenceType,
        referenceId: referenceId,
        enteredQuantity: enteredQuantity,
        conversionFactor: conversionFactor,
        unitName: unitName,
        unitCost: unitCost,
        note: note,
        createdBy: createdBy,
        movementDate: movementDate,
        adjustmentIsIncoming: adjustmentIsIncoming,
      ),
    );
  }

  // =========================================================
  // Record Movement Inside Existing Transaction
  // =========================================================

  Future<int> recordMovementInTransaction({
    required int storeId,
    required int productId,
    int? productUnitId,
    required String movementNumber,
    required String movementType,
    String? referenceType,
    int? referenceId,
    required double enteredQuantity,
    double? conversionFactor,
    String? unitName,
    double? unitCost,
    String? note,
    int? createdBy,
    DateTime? movementDate,
    bool? adjustmentIsIncoming,
  }) {
    return _recordMovement(
      storeId: storeId,
      productId: productId,
      productUnitId: productUnitId,
      movementNumber: movementNumber,
      movementType: movementType,
      referenceType: referenceType,
      referenceId: referenceId,
      enteredQuantity: enteredQuantity,
      conversionFactor: conversionFactor,
      unitName: unitName,
      unitCost: unitCost,
      note: note,
      createdBy: createdBy,
      movementDate: movementDate,
      adjustmentIsIncoming: adjustmentIsIncoming,
    );
  }

  // =========================================================
  // Private Movement Engine
  // =========================================================

  Future<int> _recordMovement({
    required int storeId,
    required int productId,
    int? productUnitId,
    required String movementNumber,
    required String movementType,
    String? referenceType,
    int? referenceId,
    required double enteredQuantity,
    double? conversionFactor,
    String? unitName,
    double? unitCost,
    String? note,
    int? createdBy,
    DateTime? movementDate,
    bool? adjustmentIsIncoming,
  }) async {
    // -------------------------------------------------------
    // 1. Validate Inputs
    // -------------------------------------------------------

    _validatePositiveId(storeId, 'رقم المخزن');
    _validatePositiveId(productId, 'رقم المنتج');

    final number = _normalizeMovementNumber(movementNumber);

    if (!movementTypes.contains(movementType)) {
      throw ArgumentError('نوع حركة المخزون غير صحيح.');
    }

    _validatePositiveNumber(enteredQuantity, 'الكمية المدخلة');

    if (unitCost != null) {
      _validateNonNegativeNumber(unitCost, 'تكلفة الوحدة');
    }

    if (referenceId != null && referenceId <= 0) {
      throw ArgumentError('رقم المرجع غير صحيح.');
    }

    if (movementType == 'adjustment' && adjustmentIsIncoming == null) {
      throw ArgumentError(
        'يجب تحديد ما إذا كانت التسوية زيادة أو نقصاً.',
      );
    }

    if (movementType != 'adjustment' && adjustmentIsIncoming != null) {
      throw ArgumentError(
        'المعامل adjustmentIsIncoming مخصص لحركات التسوية فقط.',
      );
    }

    // -------------------------------------------------------
    // 2. Prevent Duplicate Movement Number
    // -------------------------------------------------------

    final existingMovement = await (select(stockMovements)
          ..where((t) => t.movementNumber.equals(number)))
        .getSingleOrNull();

    if (existingMovement != null) {
      throw StateError('رقم حركة المخزون مستخدم مسبقاً.');
    }

    // -------------------------------------------------------
    // 3. Validate Store and Product
    // -------------------------------------------------------

    await _validateStore(storeId);

    // -------------------------------------------------------
    // 4. Resolve Product Unit
    // -------------------------------------------------------

    final unit = await _resolveUnit(
      productId: productId,
      productUnitId: productUnitId,
      conversionFactor: conversionFactor,
      unitName: unitName,
    );

    final factor = unit.conversionFactor;

    _validatePositiveNumber(factor, 'معامل التحويل');

    final baseQuantity = enteredQuantity * factor;

    _validatePositiveNumber(baseQuantity, 'الكمية الأساسية');

    // -------------------------------------------------------
    // 5. Determine Movement Direction
    // -------------------------------------------------------

    final isIncoming = incomingTypes.contains(movementType) ||
        (movementType == 'adjustment' && adjustmentIsIncoming == true);

    final isOutgoing = outgoingTypes.contains(movementType) ||
        (movementType == 'adjustment' && adjustmentIsIncoming == false);

    if (!isIncoming && !isOutgoing) {
      throw StateError('تعذر تحديد اتجاه حركة المخزون.');
    }

    // -------------------------------------------------------
    // 6. Read Current Stock
    // -------------------------------------------------------

    final oldStock = await _getProductStock(
      storeId: storeId,
      productId: productId,
    );

    final previousQuantity = oldStock?.quantity ?? 0.0;
    final reservedQuantity = oldStock?.reservedQuantity ?? 0.0;
    final previousAverageCost = oldStock?.averageCost ?? 0.0;

    final availableBefore = previousQuantity - reservedQuantity;

    if (availableBefore < -_epsilon) {
      throw StateError('بيانات المخزون الحالية غير صحيحة.');
    }

    // -------------------------------------------------------
    // 7. Calculate New Quantity
    // -------------------------------------------------------

    late double newQuantity;

    if (isIncoming) {
      newQuantity = previousQuantity + baseQuantity;
    } else {
      if (baseQuantity - availableBefore > _epsilon) {
        throw StateError(
          'الكمية المتاحة غير كافية. '
          'المتاح: $availableBefore، المطلوب: $baseQuantity',
        );
      }

      newQuantity = previousQuantity - baseQuantity;

      if (newQuantity < 0 && newQuantity.abs() <= _epsilon) {
        newQuantity = 0;
      }
    }

    final availableAfter = newQuantity - reservedQuantity;

    if (availableAfter < -_epsilon) {
      throw StateError('لا يمكن أن تصبح الكمية المتاحة سالبة.');
    }

    // -------------------------------------------------------
    // 8. Calculate Cost
    // -------------------------------------------------------

    // تكلفة الوحدة المدخلة تحول إلى تكلفة الوحدة الأساسية.
    // في الحركات الواردة: نعتمد التكلفة المرسلة.
    // في الحركات الصادرة: نعتمد متوسط تكلفة المخزون.

    final baseUnitCost = isIncoming
        ? (unitCost ?? previousAverageCost * factor) / factor
        : previousAverageCost;

    _validateNonNegativeNumber(baseUnitCost, 'تكلفة الوحدة الأساسية');

    final movementTotalCost = baseQuantity * baseUnitCost;

    late double newAverageCost;
    late double newTotalCost;

    if (isIncoming) {
      final oldTotalCost = previousQuantity * previousAverageCost;

      newTotalCost = oldTotalCost + movementTotalCost;

      newAverageCost = newQuantity > _epsilon ? newTotalCost / newQuantity : 0;
    } else {
      newAverageCost = previousAverageCost;
      newTotalCost = newQuantity * newAverageCost;
    }

    // -------------------------------------------------------
    // 9. Validate Calculated Values
    // -------------------------------------------------------

    await _validateStockValues(
      quantity: newQuantity,
      reservedQuantity: reservedQuantity,
      availableQuantity: availableAfter < 0 ? 0 : availableAfter,
      averageCost: newAverageCost,
      totalCost: newTotalCost,
    );

    // -------------------------------------------------------
    // 10. Update or Insert Product Stock
    // -------------------------------------------------------

    final now = DateTime.now();

    if (oldStock == null) {
      await into(productStocks).insert(
        ProductStocksCompanion.insert(
          storeId: storeId,
          productId: productId,
          quantity: Value(newQuantity),
          reservedQuantity: const Value(0.0),
          availableQuantity: Value(newQuantity),
          averageCost: Value(newAverageCost),
          totalCost: Value(newTotalCost),
          lastMovementAt: Value(movementDate ?? now),
          updatedAt: Value(now),
        ),
      );
    } else {
      await (update(productStocks)..where((t) => t.id.equals(oldStock.id)))
          .write(
        ProductStocksCompanion(
          quantity: Value(newQuantity),
          availableQuantity: Value(
            availableAfter < 0 ? 0 : availableAfter,
          ),
          averageCost: Value(newAverageCost),
          totalCost: Value(newTotalCost),
          lastMovementAt: Value(movementDate ?? now),
          updatedAt: Value(now),
        ),
      );
    }

    // -------------------------------------------------------
    // 11. Insert Stock Movement
    // -------------------------------------------------------

    final movementId = await into(stockMovements).insert(
      StockMovementsCompanion.insert(
        storeId: storeId,
        productId: productId,
        productUnitId: Value(unit.unitId),
        movementNumber: Value(number),
        movementType: movementType,
        referenceType: Value(referenceType),
        referenceId: Value(referenceId),
        enteredQuantity: enteredQuantity,
        conversionFactor: Value(factor),
        quantity: baseQuantity,
        unitName: unit.unitName,
        previousQuantity: previousQuantity,
        newQuantity: newQuantity,
        unitCost: Value(baseUnitCost),
        totalCost: Value(movementTotalCost),
        note: Value(note?.trim()),
        createdBy: Value(createdBy?.toString()),
        movementDate: Value(movementDate ?? now),
      ),
    );

    return movementId;
  }

  // =========================================================
  // Transfer Stock
  // =========================================================

  Future<void> transferStock({
    required int fromStoreId,
    required int toStoreId,
    required int productId,
    int? productUnitId,
    required double enteredQuantity,
    double? conversionFactor,
    String? unitName,
    required String movementNumber,
    double? unitCost,
    int? createdBy,
    String? note,
    DateTime? movementDate,
  }) async {
    _validatePositiveId(fromStoreId, 'المخزن المصدر');
    _validatePositiveId(toStoreId, 'المخزن المستلم');

    if (fromStoreId == toStoreId) {
      throw ArgumentError('لا يمكن التحويل إلى نفس المخزن.');
    }

    _validatePositiveNumber(enteredQuantity, 'كمية التحويل');

    await transaction(() async {
      await _validateStore(fromStoreId);
      await _validateStore(toStoreId);

      final unit = await _resolveUnit(
        productId: productId,
        productUnitId: productUnitId,
        conversionFactor: conversionFactor,
        unitName: unitName,
      );

      final date = movementDate ?? DateTime.now();

      await _recordMovement(
        storeId: fromStoreId,
        productId: productId,
        productUnitId: unit.unitId,
        movementNumber: addMovementSuffix(
          movementNumber,
          'OUT',
        ),
        movementType: 'transfer_out',
        referenceType: 'stock_transfer',
        enteredQuantity: enteredQuantity,
        conversionFactor: unit.conversionFactor,
        unitName: unit.unitName,
        unitCost: unitCost,
        note: note ?? 'تحويل مخزون إلى المخزن رقم $toStoreId',
        createdBy: createdBy,
        movementDate: date,
      );

      await _recordMovement(
        storeId: toStoreId,
        productId: productId,
        productUnitId: unit.unitId,
        movementNumber: addMovementSuffix(
          movementNumber,
          'IN',
        ),
        movementType: 'transfer_in',
        referenceType: 'stock_transfer',
        enteredQuantity: enteredQuantity,
        conversionFactor: unit.conversionFactor,
        unitName: unit.unitName,
        unitCost: unitCost,
        note: note ?? 'تحويل مخزون من المخزن رقم $fromStoreId',
        createdBy: createdBy,
        movementDate: date,
      );
    });
  }

  // =========================================================
  // Read: All Movements
  // =========================================================

  Future<List<StockMovementDb>> getAllMovements({
    int? limit,
    int? offset,
  }) {
    final query = select(stockMovements)
      ..orderBy([
        (t) => OrderingTerm.desc(t.movementDate),
        (t) => OrderingTerm.desc(t.id),
      ]);

    if (limit != null) {
      query.limit(
        limit,
        offset: offset ?? 0,
      );
    }

    return query.get();
  }

  // =========================================================
  // Read: Movement By ID
  // =========================================================

  Future<StockMovementDb?> getMovementById(int id) {
    _validatePositiveId(id, 'رقم الحركة');

    return (select(stockMovements)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  // =========================================================
  // Read: Movement By Number
  // =========================================================

  Future<StockMovementDb?> getMovementByNumber(String number) {
    final normalized = _normalizeMovementNumber(number);

    return (select(stockMovements)
          ..where((t) => t.movementNumber.equals(normalized)))
        .getSingleOrNull();
  }

  // =========================================================
  // Read: Product Movements
  // =========================================================

  Future<List<StockMovementDb>> getMovementsByProduct(
    int productId, {
    int? limit,
    int? offset,
  }) {
    _validatePositiveId(productId, 'رقم المنتج');

    final query = select(stockMovements)
      ..where((t) => t.productId.equals(productId))
      ..orderBy([
        (t) => OrderingTerm.desc(t.movementDate),
        (t) => OrderingTerm.desc(t.id),
      ]);

    if (limit != null) {
      query.limit(limit, offset: offset ?? 0);
    }

    return query.get();
  }

  // =========================================================
  // Read: Store Movements
  // =========================================================

  Future<List<StockMovementDb>> getMovementsByStore(
    int storeId, {
    int? limit,
    int? offset,
  }) {
    _validatePositiveId(storeId, 'رقم المخزن');

    final query = select(stockMovements)
      ..where((t) => t.storeId.equals(storeId))
      ..orderBy([
        (t) => OrderingTerm.desc(t.movementDate),
        (t) => OrderingTerm.desc(t.id),
      ]);

    if (limit != null) {
      query.limit(limit, offset: offset ?? 0);
    }

    return query.get();
  }

  // =========================================================
  // Read: Movement Type
  // =========================================================

  Future<List<StockMovementDb>> getMovementsByType(
    String type,
  ) {
    if (!movementTypes.contains(type)) {
      throw ArgumentError('نوع الحركة غير صحيح.');
    }

    return (select(stockMovements)
          ..where((t) => t.movementType.equals(type))
          ..orderBy([
            (t) => OrderingTerm.desc(t.movementDate),
          ]))
        .get();
  }

  // =========================================================
  // Read: Reference
  // =========================================================

  Future<List<StockMovementDb>> getMovementsByReference({
    required String referenceType,
    required int referenceId,
  }) {
    _validatePositiveId(referenceId, 'رقم المرجع');

    return (select(stockMovements)
          ..where(
            (t) =>
                t.referenceType.equals(referenceType) &
                t.referenceId.equals(referenceId),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.id),
          ]))
        .get();
  }

  // =========================================================
  // Read: Date Range
  // =========================================================

  Future<List<StockMovementDb>> getMovementsByDateRange({
    required DateTime startDate,
    required DateTime endDate,
    int? storeId,
    int? productId,
  }) {
    if (endDate.isBefore(startDate)) {
      throw ArgumentError('تاريخ النهاية يجب ألا يسبق تاريخ البداية.');
    }

    final query = select(stockMovements)
      ..where(
        (t) =>
            t.movementDate.isBiggerOrEqualValue(startDate) &
            t.movementDate.isSmallerOrEqualValue(endDate),
      )
      ..orderBy([
        (t) => OrderingTerm.desc(t.movementDate),
      ]);

    if (storeId != null) {
      query.where((t) => t.storeId.equals(storeId));
    }

    if (productId != null) {
      query.where((t) => t.productId.equals(productId));
    }

    return query.get();
  }

  // =========================================================
  // Watch: All Movements
  // =========================================================

  Stream<List<StockMovementDb>> watchAllMovements() {
    return (select(stockMovements)
          ..orderBy([
            (t) => OrderingTerm.desc(t.movementDate),
            (t) => OrderingTerm.desc(t.id),
          ]))
        .watch();
  }

  // =========================================================
  // Watch: Product Movements
  // =========================================================

  Stream<List<StockMovementDb>> watchMovementsByProduct(
    int productId,
  ) {
    _validatePositiveId(productId, 'رقم المنتج');

    return (select(stockMovements)
          ..where((t) => t.productId.equals(productId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.movementDate),
          ]))
        .watch();
  }

  // =========================================================
  // Watch: Store Movements
  // =========================================================

  Stream<List<StockMovementDb>> watchMovementsByStore(
    int storeId,
  ) {
    _validatePositiveId(storeId, 'رقم المخزن');

    return (select(stockMovements)
          ..where((t) => t.storeId.equals(storeId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.movementDate),
          ]))
        .watch();
  }

  // =========================================================
  // Count: All Movements
  // =========================================================

  Future<int> countMovements() async {
    final countExpression = countAll();

    final query = selectOnly(stockMovements)..addColumns([countExpression]);

    final row = await query.getSingle();

    return row.read(countExpression) ?? 0;
  }

  // =========================================================
  // Count: Store Movements
  // =========================================================

  Future<int> countMovementsByStore(int storeId) async {
    _validatePositiveId(storeId, 'رقم المخزن');

    final countExpression = countAll();

    final query = selectOnly(stockMovements)
      ..addColumns([countExpression])
      ..where(stockMovements.storeId.equals(storeId));

    final row = await query.getSingle();

    return row.read(countExpression) ?? 0;
  }

  // =========================================================
  // Count: Product Movements
  // =========================================================

  Future<int> countMovementsByProduct(int productId) async {
    _validatePositiveId(productId, 'رقم المنتج');

    final countExpression = countAll();

    final query = selectOnly(stockMovements)
      ..addColumns([countExpression])
      ..where(stockMovements.productId.equals(productId));

    final row = await query.getSingle();

    return row.read(countExpression) ?? 0;
  }

  // =========================================================
  // Count: Movement Type
  // =========================================================

  Future<int> countMovementsByType(String type) async {
    if (!movementTypes.contains(type)) {
      throw ArgumentError('نوع الحركة غير صحيح.');
    }

    final countExpression = countAll();

    final query = selectOnly(stockMovements)
      ..addColumns([countExpression])
      ..where(stockMovements.movementType.equals(type));

    final row = await query.getSingle();

    return row.read(countExpression) ?? 0;
  }

  // =========================================================
  // Stock Balance
  // =========================================================

  Future<double> getCurrentStock({
    required int storeId,
    required int productId,
  }) async {
    _validatePositiveId(storeId, 'رقم المخزن');
    _validatePositiveId(productId, 'رقم المنتج');

    final stock = await _getProductStock(
      storeId: storeId,
      productId: productId,
    );

    return stock?.quantity ?? 0;
  }

  // =========================================================
  // Available Stock
  // =========================================================

  Future<double> getAvailableStock({
    required int storeId,
    required int productId,
  }) async {
    _validatePositiveId(storeId, 'رقم المخزن');
    _validatePositiveId(productId, 'رقم المنتج');

    final stock = await _getProductStock(
      storeId: storeId,
      productId: productId,
    );

    return stock?.availableQuantity ?? 0;
  }

  // =========================================================
  // Average Cost
  // =========================================================

  Future<double> getAverageCost({
    required int storeId,
    required int productId,
  }) async {
    _validatePositiveId(storeId, 'رقم المخزن');
    _validatePositiveId(productId, 'رقم المنتج');

    final stock = await _getProductStock(
      storeId: storeId,
      productId: productId,
    );

    return stock?.averageCost ?? 0;
  }
}

// =============================================================
// Internal Unit Model
// =============================================================

class _ResolvedUnit {
  const _ResolvedUnit({
    required this.unitId,
    required this.unitName,
    required this.conversionFactor,
  });

  final int? unitId;
  final String unitName;
  final double conversionFactor;
}
