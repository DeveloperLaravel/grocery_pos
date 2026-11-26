
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';



import '../../domain/entities/supplier.dart';
import '../../domain/usecases/supplier_crud_usecases.dart';
import '../../domain/usecases/supplier_search_usecases.dart';
import '../../domain/usecases/supplier_usecases.dart' hide SupplierSearchUseCases, SupplierCrudUseCases;
import 'supplier_event.dart';
import 'supplier_state.dart';

@injectable
class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  // ===========================================================
  // Dependencies
  // ===========================================================

  final SupplierCrudUseCases _crud;

  final SupplierQueryUseCases _query;

  final SupplierSearchUseCases _search;

  final SupplierClassificationUseCases _classification;

  final SupplierFinancialUseCases _financial;

  final SupplierManagementUseCases _management;

  final SupplierStatisticsUseCases _statistics;

  final SupplierValidationUseCases _validation;

  // ===========================================================
  // Stream Subscriptions
  // ===========================================================

  StreamSubscription<List<Supplier>>? _suppliersSubscription;

  StreamSubscription<Supplier?>? _supplierSubscription;

  // ===========================================================
  // Constructor
  // ===========================================================

  SupplierBloc(
    this._crud,
    this._query,
    this._search,
    this._classification,
    this._financial,
    this._management,
    this._statistics,
    this._validation,
  ) : super(const SupplierState()) {
    on<SupplierEvent>(_onEvent);
  }

  // ===========================================================
  // Event Validation
  // ===========================================================

  T _required<T>(T? value, String field) {
    if (value == null) {
      throw ArgumentError('Missing required event field: $field');
    }

    return value;
  }

  // ===========================================================
  // Main Event Handler
  // ===========================================================

  Future<void> _onEvent(
    SupplierEvent event,
    Emitter<SupplierState> emit,
  ) async {
    switch (event.type) {
      // Queries
      case SupplierEventType.loadList:
        await _loadList(event, emit);
        break;

      case SupplierEventType.watchList:
        await _watchList(event, emit);
        break;

      case SupplierEventType.loadById:
        await _loadById(
          _required(event.id, 'id'),
          emit,
        );
        break;

      case SupplierEventType.loadByCode:
        await _loadByCode(
          _required(event.code, 'code'),
          emit,
        );
        break;

      case SupplierEventType.watchById:
        await _watchById(
          _required(event.id, 'id'),
          emit,
        );
        break;

      // CRUD
      case SupplierEventType.insert:
        await _insert(
          _required(event.supplier, 'supplier'),
          emit,
        );
        break;

      case SupplierEventType.update:
        await _update(
          _required(event.id, 'id'),
          _required(event.supplier, 'supplier'),
          emit,
        );
        break;

      case SupplierEventType.delete:
        await _delete(
          _required(event.id, 'id'),
          emit,
        );
        break;

      case SupplierEventType.archive:
        await _archive(
          _required(event.id, 'id'),
          emit,
        );
        break;

      // Financial
      case SupplierEventType.updateBalance:
        await _updateBalance(
          _required(event.id, 'id'),
          _required(event.balance, 'balance'),
          emit,
        );
        break;

      // Management
      case SupplierEventType.updateRating:
        await _updateRating(
          _required(event.id, 'id'),
          _required(event.rating, 'rating'),
          emit,
        );
        break;

      case SupplierEventType.togglePreferred:
        await _togglePreferred(
          _required(event.id, 'id'),
          _required(event.isPreferred, 'isPreferred'),
          emit,
        );
        break;

      case SupplierEventType.toggleStatus:
        await _toggleStatus(
          _required(event.id, 'id'),
          _required(event.isActive, 'isActive'),
          emit,
        );
        break;

      case SupplierEventType.updateLastPurchase:
        await _updateLastPurchase(
          _required(event.id, 'id'),
          _required(event.date, 'date'),
          emit,
        );
        break;

      case SupplierEventType.updateLastPayment:
        await _updateLastPayment(
          _required(event.id, 'id'),
          _required(event.date, 'date'),
          emit,
        );
        break;

      // Statistics
      case SupplierEventType.loadStatistics:
        await _loadStatistics(emit);
        break;

      // Validation
      case SupplierEventType.validateCode:
        await _validateCode(
          _required(event.code, 'code'),
          event.excludeId,
          emit,
        );
        break;

      // Pagination
      case SupplierEventType.loadNextPage:
        await _loadNextPage(emit);
        break;

      // Internal Stream Events
      case SupplierEventType.streamUpdated:
        emit(state.copyWith(
          suppliers: event.suppliers ?? [],
          isWatching: true,
          errorMessage: null,
        ));
        break;

      case SupplierEventType.streamError:
        emit(state.copyWith(
          isWatching: false,
          errorMessage: event.message,
        ));
        break;

      case SupplierEventType.selectedSupplierUpdated:
        emit(state.copyWith(
          selectedSupplier: event.supplier,
          isWatching: true,
          isLoadingDetails: false,
          errorMessage: null,
        ));
        break;

      // UI
      case SupplierEventType.clearError:
        emit(state.copyWith(errorMessage: null));
        break;

      case SupplierEventType.clearMessages:
        emit(state.copyWith(
          errorMessage: null,
          successMessage: null,
        ));
        break;

      case SupplierEventType.clearSelection:
        await _cancelSupplierSubscription();

        emit(state.copyWith(
          selectedSupplier: null,
          isLoadingDetails: false,
          isWatching: false,
        ));
        break;
    }
  }

  // ===========================================================
  // 1. Load Suppliers
  // ===========================================================

  Future<void> _loadList(
    SupplierEvent event,
    Emitter<SupplierState> emit,
  ) async {
    final query = _required(event.query, 'query');

    final isSearch = query == SupplierListQuery.search;

    emit(state.copyWith(
      isLoading: true,
      isSearching: isSearch,
      currentQuery: query,
      currentSearchQuery: isSearch ? event.value ?? '' : '',
      errorMessage: null,
    ));

    final result = switch (query) {
      SupplierListQuery.all =>
        _query.getAll(),

      SupplierListQuery.active =>
        _query.getActive(),

      SupplierListQuery.search =>
        _search.search(event.value ?? ''),

      SupplierListQuery.byCategory =>
        _classification.byCategory(event.value ?? ''),

      SupplierListQuery.byLevel =>
        _classification.byLevel(event.value ?? ''),

      SupplierListQuery.byType =>
        _classification.byType(event.value ?? ''),

      SupplierListQuery.preferred =>
        _classification.preferred(),

      SupplierListQuery.withDebt =>
        _classification.withDebt(),

      SupplierListQuery.credit =>
        _classification.credit(),

      SupplierListQuery.paginated =>
        _search.paginate(
          limit: event.limit ?? state.pageSize,
          offset: event.offset ?? 0,
        ),
    };

    final response = await result.run();

    response.match(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isSearching: false,
          errorMessage: failure.message,
        ));
      },
      (suppliers) {
        final isPaginated = query == SupplierListQuery.paginated;

        emit(state.copyWith(
          suppliers: suppliers,
          isLoading: false,
          isSearching: false,
          currentOffset: isPaginated ? suppliers.length : 0,
          pageSize: event.limit ?? state.pageSize,
          hasMore: isPaginated
              ? suppliers.length == (event.limit ?? state.pageSize)
              : false,
          errorMessage: null,
        ));
      },
    );
  }

  // ===========================================================
  // 2. Watch Suppliers
  // ===========================================================

  Future<void> _watchList(
    SupplierEvent event,
    Emitter<SupplierState> emit,
  ) async {
    final watchQuery = _required(
      event.watchQuery,
      'watchQuery',
    );

    await _cancelListSubscription();

    emit(state.copyWith(
      isWatching: true,
      currentWatchQuery: watchQuery,
      errorMessage: null,
    ));

    try {
      final stream = switch (watchQuery) {
        SupplierWatchQuery.all =>
          _query.watchAll(),

        SupplierWatchQuery.active =>
          _query.watchActive(),

        SupplierWatchQuery.search =>
          _search.watchSearch(event.value ?? ''),
      };

      _suppliersSubscription = stream.listen(
        (suppliers) {
          if (!isClosed) {
            add(SupplierEvent(
              type: SupplierEventType.streamUpdated,
              suppliers: suppliers,
            ));
          }
        },
        onError: (Object error) {
          if (!isClosed) {
            add(SupplierEvent(
              type: SupplierEventType.streamError,
              message: error.toString(),
            ));
          }
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isWatching: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // ===========================================================
  // 3. Load Supplier By ID
  // ===========================================================

  Future<void> _loadById(
    int id,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isLoadingDetails: true,
      errorMessage: null,
    ));

    final result = await _query.getById(id).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isLoadingDetails: false,
          errorMessage: failure.message,
        ));
      },
      (supplier) {
        emit(state.copyWith(
          isLoadingDetails: false,
          selectedSupplier: supplier,
          errorMessage: supplier == null
              ? 'المورد غير موجود'
              : null,
        ));
      },
    );
  }

  // ===========================================================
  // 4. Load Supplier By Code
  // ===========================================================

  Future<void> _loadByCode(
    String code,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isLoadingDetails: true,
      errorMessage: null,
    ));

    final result = await _query.getByCode(code).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isLoadingDetails: false,
          errorMessage: failure.message,
        ));
      },
      (supplier) {
        emit(state.copyWith(
          isLoadingDetails: false,
          selectedSupplier: supplier,
          errorMessage: supplier == null
              ? 'المورد غير موجود'
              : null,
        ));
      },
    );
  }

  // ===========================================================
  // 5. Watch Supplier Details
  // ===========================================================

  Future<void> _watchById(
    int id,
    Emitter<SupplierState> emit,
  ) async {
    await _cancelSupplierSubscription();

    emit(state.copyWith(
      isLoadingDetails: true,
      isWatching: true,
      errorMessage: null,
    ));

    try {
      _supplierSubscription = _query.watchById(id).listen(
        (supplier) {
          if (!isClosed) {
            add(SupplierEvent(
              type: SupplierEventType.selectedSupplierUpdated,
              supplier: supplier,
            ));
          }
        },
        onError: (Object error) {
          if (!isClosed) {
            add(SupplierEvent(
              type: SupplierEventType.streamError,
              message: error.toString(),
            ));
          }
        },
      );
    } catch (error) {
      emit(state.copyWith(
        isLoadingDetails: false,
        isWatching: false,
        errorMessage: error.toString(),
      ));
    }
  }

  // ===========================================================
  // 6. Insert Supplier
  // ===========================================================

  Future<void> _insert(
    Supplier supplier,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await _crud.insert(supplier).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: failure.message,
        ));
      },
      (id) {
        emit(state.copyWith(
          isSubmitting: false,
          successMessage: 'تمت إضافة المورد بنجاح',
          errorMessage: null,
        ));

        add(const SupplierEvent(
          type: SupplierEventType.loadStatistics,
        ));
      },
    );
  }

  // ===========================================================
  // 7. Update Supplier
  // ===========================================================

  Future<void> _update(
    int id,
    Supplier supplier,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await _crud.update(
      id: id,
      supplier: supplier,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: failure.message,
        ));
      },
      (rows) {
        emit(state.copyWith(
          isSubmitting: false,
          selectedSupplier:
              state.selectedSupplier?.id == id
                  ? supplier
                  : state.selectedSupplier,
          successMessage: 'تم تحديث بيانات المورد بنجاح',
          errorMessage: null,
        ));
      },
    );
  }

  // ===========================================================
  // 8. Delete Supplier
  // ===========================================================

  Future<void> _delete(
    int id,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isDeleting: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await _crud.delete(id).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isDeleting: false,
          errorMessage: failure.message,
        ));
      },
      (rows) {
        emit(state.copyWith(
          isDeleting: false,
          suppliers: state.suppliers
              .where((supplier) => supplier.id != id)
              .toList(),
          selectedSupplier:
              state.selectedSupplier?.id == id
                  ? null
                  : state.selectedSupplier,
          successMessage: 'تم حذف المورد بنجاح',
          errorMessage: null,
        ));

        add(const SupplierEvent(
          type: SupplierEventType.loadStatistics,
        ));
      },
    );
  }

  // ===========================================================
  // 9. Archive Supplier
  // ===========================================================

  Future<void> _archive(
    int id,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      successMessage: null,
    ));

    final result = await _crud.archive(id).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: failure.message,
        ));
      },
      (rows) {
        emit(state.copyWith(
          isSubmitting: false,
          successMessage: 'تمت أرشفة المورد بنجاح',
          errorMessage: null,
        ));

        add(const SupplierEvent(
          type: SupplierEventType.loadStatistics,
        ));
      },
    );
  }

  // ===========================================================
  // 10. Update Supplier Balance
  // ===========================================================

  Future<void> _updateBalance(
    int id,
    double balance,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isUpdatingBalance: true,
      errorMessage: null,
    ));

    final result = await _financial.updateBalance(
      id: id,
      balance: balance,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isUpdatingBalance: false,
          errorMessage: failure.message,
        ));
      },
      (rows) {
        emit(state.copyWith(
          isUpdatingBalance: false,
          successMessage: 'تم تحديث رصيد المورد بنجاح',
        ));

        add(const SupplierEvent(
          type: SupplierEventType.loadStatistics,
        ));
      },
    );
  }

  // ===========================================================
  // 11. Update Supplier Rating
  // ===========================================================

  Future<void> _updateRating(
    int id,
    double rating,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isUpdatingRating: true,
      errorMessage: null,
    ));

    final result = await _management.updateRating(
      id: id,
      rating: rating,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isUpdatingRating: false,
          errorMessage: failure.message,
        ));
      },
      (rows) {
        emit(state.copyWith(
          isUpdatingRating: false,
          successMessage: 'تم تحديث تقييم المورد',
        ));
      },
    );
  }

  // ===========================================================
  // 12. Toggle Preferred
  // ===========================================================

  Future<void> _togglePreferred(
    int id,
    bool isPreferred,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isUpdatingPreferred: true,
      errorMessage: null,
    ));

    final result = await _management.togglePreferred(
      id: id,
      isPreferred: isPreferred,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isUpdatingPreferred: false,
          errorMessage: failure.message,
        ));
      },
      (rows) {
        emit(state.copyWith(
          isUpdatingPreferred: false,
          successMessage: isPreferred
              ? 'تمت إضافة المورد إلى المفضلين'
              : 'تمت إزالة المورد من المفضلين',
        ));
      },
    );
  }

  // ===========================================================
  // 13. Toggle Supplier Status
  // ===========================================================

  Future<void> _toggleStatus(
    int id,
    bool isActive,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isUpdatingStatus: true,
      errorMessage: null,
    ));

    final result = await _management.toggleStatus(
      id: id,
      isActive: isActive,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isUpdatingStatus: false,
          errorMessage: failure.message,
        ));
      },
      (rows) {
        emit(state.copyWith(
          isUpdatingStatus: false,
          successMessage: isActive
              ? 'تم تفعيل المورد'
              : 'تم إيقاف المورد',
        ));

        add(const SupplierEvent(
          type: SupplierEventType.loadStatistics,
        ));
      },
    );
  }

  // ===========================================================
  // 14. Update Last Purchase
  // ===========================================================

  Future<void> _updateLastPurchase(
    int id,
    DateTime date,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isUpdatingActivityDate: true,
      errorMessage: null,
    ));

    final result = await _management.updateLastPurchase(
      id: id,
      date: date,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isUpdatingActivityDate: false,
          errorMessage: failure.message,
        ));
      },
      (rows) {
        emit(state.copyWith(
          isUpdatingActivityDate: false,
          successMessage: 'تم تحديث تاريخ آخر عملية شراء',
        ));
      },
    );
  }

  // ===========================================================
  // 15. Update Last Payment
  // ===========================================================

  Future<void> _updateLastPayment(
    int id,
    DateTime date,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isUpdatingActivityDate: true,
      errorMessage: null,
    ));

    final result = await _management.updateLastPayment(
      id: id,
      date: date,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isUpdatingActivityDate: false,
          errorMessage: failure.message,
        ));
      },
      (rows) {
        emit(state.copyWith(
          isUpdatingActivityDate: false,
          successMessage: 'تم تحديث تاريخ آخر دفعة',
        ));
      },
    );
  }

  // ===========================================================
  // 16. Load Statistics
  // ===========================================================

  Future<void> _loadStatistics(
    Emitter<SupplierState> emit,
  ) async {
    final result = await _statistics.getStatistics().run();

    result.match(
      (failure) {
        emit(state.copyWith(
          errorMessage: failure.message,
        ));
      },
      (statistics) {
        emit(state.copyWith(
          statistics: statistics,
          totalSuppliers: statistics.total,
          activeSuppliers: statistics.active,
          totalBalance: statistics.totalBalance,
          errorMessage: null,
        ));
      },
    );
  }

  // ===========================================================
  // 17. Validate Supplier Code
  // ===========================================================

  Future<void> _validateCode(
    String code,
    int? excludeId,
    Emitter<SupplierState> emit,
  ) async {
    emit(state.copyWith(
      isValidatingCode: true,
      supplierCodeExists: null,
      errorMessage: null,
    ));

    final result = await _validation.codeExists(
      code,
      excludeId: excludeId,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isValidatingCode: false,
          errorMessage: failure.message,
        ));
      },
      (exists) {
        emit(state.copyWith(
          isValidatingCode: false,
          supplierCodeExists: exists,
        ));
      },
    );
  }

  // ===========================================================
  // 18. Load Next Page
  // ===========================================================

  Future<void> _loadNextPage(
    Emitter<SupplierState> emit,
  ) async {
    if (state.isLoadingMore || !state.hasMore) {
      return;
    }

    emit(state.copyWith(
      isLoadingMore: true,
      errorMessage: null,
    ));

    final result = await _search.paginate(
      limit: state.pageSize,
      offset: state.currentOffset,
    ).run();

    result.match(
      (failure) {
        emit(state.copyWith(
          isLoadingMore: false,
          errorMessage: failure.message,
        ));
      },
      (newSuppliers) {
        final existingIds = state.suppliers
            .map((supplier) => supplier.id)
            .toSet();

        final uniqueSuppliers = newSuppliers
            .where((supplier) => !existingIds.contains(supplier.id))
            .toList();

        emit(state.copyWith(
          suppliers: [
            ...state.suppliers,
            ...uniqueSuppliers,
          ],
          currentOffset: state.currentOffset + newSuppliers.length,
          hasMore: newSuppliers.length == state.pageSize,
          isLoadingMore: false,
          errorMessage: null,
        ));
      },
    );
  }

  // ===========================================================
  // 19. Stream Management
  // ===========================================================

  Future<void> _cancelListSubscription() async {
    await _suppliersSubscription?.cancel();
    _suppliersSubscription = null;
  }

  Future<void> _cancelSupplierSubscription() async {
    await _supplierSubscription?.cancel();
    _supplierSubscription = null;
  }

  // ===========================================================
  // 20. Close
  // ===========================================================

  @override
  Future<void> close() async {
    await _cancelListSubscription();
    await _cancelSupplierSubscription();

    return super.close();
  }
}
