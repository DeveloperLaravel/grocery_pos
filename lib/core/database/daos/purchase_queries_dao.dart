
// import 'package:drift/drift.dart';

// import '../app_database.dart';
// import '../tables/master_data/parties/suppliers_table.dart';
// import '../tables/sales_inventory/purchases/purchase_orders_table.dart';
// import '../tables/sales_inventory/purchases/purchase_items_table.dart';
// import '../tables/sales_inventory/purchases/purchase_receipts_table.dart';
// import '../tables/sales_inventory/purchases/purchase_receipt_items_table.dart';

// part 'purchase_queries_dao.g.dart';

// class PurchaseOrderQueryResult {
//   final PurchaseOrderDb order;
//   final String supplierName;

//   const PurchaseOrderQueryResult({
//     required this.order,
//     required this.supplierName,
//   });
// }

// class PurchaseStatistics {
//   final int totalOrders;
//   final int draftOrders;
//   final int confirmedOrders;
//   final int partiallyReceivedOrders;
//   final int receivedOrders;
//   final int cancelledOrders;

//   final double totalAmount;
//   final double paidAmount;
//   final double remainingAmount;

//   const PurchaseStatistics({
//     required this.totalOrders,
//     required this.draftOrders,
//     required this.confirmedOrders,
//     required this.partiallyReceivedOrders,
//     required this.receivedOrders,
//     required this.cancelledOrders,
//     required this.totalAmount,
//     required this.paidAmount,
//     required this.remainingAmount,
//   });
// }

// @DriftAccessor(
//   tables: [
//     Suppliers,
//     PurchaseOrders,
//     PurchaseItems,
//     PurchaseReceipts,
//     PurchaseReceiptItems,
//   ],
// )
// class PurchaseQueriesDao extends DatabaseAccessor<AppDatabase>
//     with _$PurchaseQueriesDaoMixin {
//   PurchaseQueriesDao(super.db);

//   // =====================================================
//   // SEARCH PURCHASE ORDERS
//   // =====================================================

//   Future<List<PurchaseOrderQueryResult>> getPurchaseOrders({
//     int? supplierId,
//     String? search,
//     String? status,
//     String? paymentStatus,
//     DateTime? fromDate,
//     DateTime? toDate,
//     int? limit,
//     int? offset,
//   }) async {
//     final query = select(purchaseOrders).join([
//       innerJoin(
//         suppliers,
//         suppliers.id.equalsExp(purchaseOrders.supplierId),
//       ),
//     ]);

//     if (supplierId != null) {
//       query.where(
//         purchaseOrders.supplierId.equals(supplierId),
//       );
//     }

//     if (status != null) {
//       query.where(purchaseOrders.status.equals(status));
//     }

//     if (paymentStatus != null) {
//       query.where(
//         purchaseOrders.paymentStatus.equals(paymentStatus),
//       );
//     }

//     if (fromDate != null) {
//       query.where(
//         purchaseOrders.purchaseDate.isBiggerOrEqualValue(fromDate),
//       );
//     }

//     if (toDate != null) {
//       query.where(
//         purchaseOrders.purchaseDate.isSmallerOrEqualValue(
//           toDate,
//         ),
//       );
//     }

//     final keyword = search?.trim();

//     if (keyword != null && keyword.isNotEmpty) {
//       final pattern = '%$keyword%';

//       query.where(
//         purchaseOrders.invoiceNumber.like(pattern) |
//             purchaseOrders.supplierInvoiceNumber.like(pattern) |
//             suppliers.name.like(pattern),
//       );
//     }

//     query.orderBy([
//       OrderingTerm(
//         expression: purchaseOrders.purchaseDate,
//         mode: OrderingMode.desc,
//       ),
//     ]);

//     if (limit != null) {
//       query.limit(
//         limit,
//         offset: offset ?? 0,
//       );
//     }

//     final rows = await query.get();

//     return rows.map((row) {
//       return PurchaseOrderQueryResult(
//         order: row.readTable(purchaseOrders),
//         supplierName: row.readTable(suppliers).name,
//       );
//     }).toList();
//   }

//   // =====================================================
//   // WATCH PURCHASE ORDERS
//   // =====================================================

//   Stream<List<PurchaseOrderQueryResult>> watchPurchaseOrders({
//     int? supplierId,
//     String? search,
//     String? status,
//     String? paymentStatus,
//   }) {
//     final query = select(purchaseOrders).join([
//       innerJoin(
//         suppliers,
//         suppliers.id.equalsExp(purchaseOrders.supplierId),
//       ),
//     ]);

//     if (supplierId != null) {
//       query.where(
//         purchaseOrders.supplierId.equals(supplierId),
//       );
//     }

//     if (status != null) {
//       query.where(purchaseOrders.status.equals(status));
//     }

//     if (paymentStatus != null) {
//       query.where(
//         purchaseOrders.paymentStatus.equals(paymentStatus),
//       );
//     }

//     final keyword = search?.trim();

//     if (keyword != null && keyword.isNotEmpty) {
//       final pattern = '%$keyword%';

//       query.where(
//         purchaseOrders.invoiceNumber.like(pattern) |
//             purchaseOrders.supplierInvoiceNumber.like(pattern) |
//             suppliers.name.like(pattern),
//       );
//     }

//     query.orderBy([
//       OrderingTerm(
//         expression: purchaseOrders.purchaseDate,
//         mode: OrderingMode.desc,
//       ),
//     ]);

//     return query.watch().map((rows) {
//       return rows.map((row) {
//         return PurchaseOrderQueryResult(
//           order: row.readTable(purchaseOrders),
//           supplierName: row.readTable(suppliers).name,
//         );
//       }).toList();
//     });
//   }

//   // =====================================================
//   // GET BY ID
//   // =====================================================

//   Future<PurchaseOrderQueryResult?> getById(int id) async {
//     final query = select(purchaseOrders).join([
//       innerJoin(
//         suppliers,
//         suppliers.id.equalsExp(purchaseOrders.supplierId),
//       ),
//     ])..where(purchaseOrders.id.equals(id));

//     final row = await query.getSingleOrNull();

//     if (row == null) return null;

//     return PurchaseOrderQueryResult(
//       order: row.readTable(purchaseOrders),
//       supplierName: row.readTable(suppliers).name,
//     );
//   }

//   // =====================================================
//   // GET BY INVOICE
//   // =====================================================

//   Future<PurchaseOrderDb?> getByInvoice(
//     String invoiceNumber,
//   ) {
//     return (select(purchaseOrders)
//           ..where(
//             (t) => t.invoiceNumber.equals(invoiceNumber.trim()),
//           ))
//         .getSingleOrNull();
//   }

//   // =====================================================
//   // STATISTICS
//   // =====================================================

//   Future<PurchaseStatistics> getStatistics({
//     DateTime? fromDate,
//     DateTime? toDate,
//   }) async {
//     final query = select(purchaseOrders);

//     if (fromDate != null) {
//       query.where(
//         (t) => t.purchaseDate.isBiggerOrEqualValue(fromDate),
//       );
//     }

//     if (toDate != null) {
//       query.where(
//         (t) => t.purchaseDate.isSmallerOrEqualValue(toDate),
//       );
//     }

//     final orders = await query.get();

//     return PurchaseStatistics(
//       totalOrders: orders.length,

//       draftOrders: orders.where(
//         (e) => e.status == 'draft',
//       ).length,

//       confirmedOrders: orders.where(
//         (e) => e.status == 'confirmed',
//       ).length,

//       partiallyReceivedOrders: orders.where(
//         (e) => e.status == 'partially_received',
//       ).length,

//       receivedOrders: orders.where(
//         (e) => e.status == 'received',
//       ).length,

//       cancelledOrders: orders.where(
//         (e) => e.status == 'cancelled',
//       ).length,

//       totalAmount: orders.fold(
//         0.0,
//         (sum, e) => sum + e.total,
//       ),

//       paidAmount: orders.fold(
//         0.0,
//         (sum, e) => sum + e.paidAmount,
//       ),

//       remainingAmount: orders.fold(
//         0.0,
//         (sum, e) => sum + e.remainingAmount,
//       ),
//     );
//   }

//   // =====================================================
//   // GET ITEMS
//   // =====================================================

//   Future<List<PurchaseItemDb>> getPurchaseItems(int orderId) {
//     return (select(purchaseItems)
//           ..where((t) => t.purchaseOrderId.equals(orderId))
//           ..orderBy([
//             (t) => OrderingTerm.asc(t.id),
//           ]))
//         .get();
//   }

//   // =====================================================
//   // GET RECEIPTS
//   // =====================================================

//   Future<List<PurchaseReceiptDb>> getPurchaseReceipts(
//     int orderId,
//   ) {
//     return (select(purchaseReceipts)
//           ..where((t) => t.purchaseOrderId.equals(orderId))
//           ..orderBy([
//             (t) => OrderingTerm.desc(t.receivedAt),
//           ]))
//         .get();
//   }

//   // =====================================================
//   // GET RECEIPT ITEMS
//   // =====================================================

//   Future<List<PurchaseReceiptItemDb>> getReceiptItems(
//     int receiptId,
//   ) {
//     return (select(purchaseReceiptItems)
//           ..where((t) => t.purchaseReceiptId.equals(receiptId)))
//         .get();
//   }
// }
