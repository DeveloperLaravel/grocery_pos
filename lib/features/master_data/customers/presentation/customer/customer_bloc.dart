
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/customer.dart';
import '../../domain/usecases/get_customers_usecase.dart';
import '../../domain/usecases/watch_customers_usecase.dart';
import '../../domain/usecases/get_customer_by_id_usecase.dart';
import '../../domain/usecases/search_customers_usecase.dart';
import '../../domain/usecases/insert_customer_usecase.dart';
import '../../domain/usecases/update_customer_usecase.dart';
import '../../domain/usecases/delete_customer_usecase.dart';
import '../../domain/usecases/toggle_customer_status_usecase.dart';

import 'customer_event.dart';
import 'customer_state.dart';

@injectable
class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final GetCustomersUseCase _getCustomers;
  final WatchCustomersUseCase _watchCustomers;
  final GetCustomerByIdUseCase _getCustomerById;
  final SearchCustomersUseCase _searchCustomers;
  final InsertCustomerUseCase _insertCustomer;
  final UpdateCustomerUseCase _updateCustomer;
  final DeleteCustomerUseCase _deleteCustomer;
  final ToggleCustomerStatusUseCase _toggleCustomerStatus;

  StreamSubscription<List<Customer>>? _customersSubscription;

  CustomerBloc(
    this._getCustomers,
    this._watchCustomers,
    this._getCustomerById,
    this._searchCustomers,
    this._insertCustomer,
    this._updateCustomer,
    this._deleteCustomer,
    this._toggleCustomerStatus,
  ) : super(const CustomerState()) {
    on<LoadCustomers>(_onLoadCustomers);
    on<WatchCustomers>(_onWatchCustomers);
    on<GetCustomerById>(_onGetCustomerById);
    on<SearchCustomers>(_onSearchCustomers);
    on<InsertCustomer>(_onInsertCustomer);
    on<UpdateCustomer>(_onUpdateCustomer);
    on<DeleteCustomer>(_onDeleteCustomer);
    on<ToggleCustomerStatus>(_onToggleCustomerStatus);
  }

  // =====================================================
  // 1. Load Customers
  // =====================================================

  Future<void> _onLoadCustomers(
    LoadCustomers event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final customers = await _getCustomers();

      emit(state.copyWith(
        customers: customers,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _errorText(e),
      ));
    }
  }

  // =====================================================
  // 2. Watch Customers
  // =====================================================

 
Future<void> _onWatchCustomers(
  WatchCustomers event,
  Emitter<CustomerState> emit,
) async {
  await _customersSubscription?.cancel();

  emit(state.copyWith(
    errorMessage: null,
  ));

  _customersSubscription = _watchCustomers().listen(
    (customers) {
      if (!isClosed) {
        add(CustomerEvent.customersUpdated(customers));
      }
    },
    onError: (Object error) {
      if (!isClosed) {
        add(CustomerEvent.watchError(_errorText(error)));
      }
    },
  );
}


  // =====================================================
  // 3. Get Customer By ID
  // =====================================================

  Future<void> _onGetCustomerById(
    GetCustomerById event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
    ));

    try {
      final customer = await _getCustomerById(event.id);

      emit(state.copyWith(
        selectedCustomer: customer,
        isLoading: false,
        errorMessage: customer == null ? 'العميل غير موجود' : null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _errorText(e),
      ));
    }
  }

  // =====================================================
  // 4. Search Customers
  // =====================================================

  Future<void> _onSearchCustomers(
    SearchCustomers event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      searchQuery: event.query,
      errorMessage: null,
    ));

    try {
      final customers = event.query.trim().isEmpty
          ? await _getCustomers()
          : await _searchCustomers(event.query.trim());

      emit(state.copyWith(
        customers: customers,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: _errorText(e),
      ));
    }
  }

  // =====================================================
  // 5. Insert Customer
  // =====================================================

  Future<void> _onInsertCustomer(
    InsertCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final id = await _insertCustomer(event.customer);

      final customers = await _getCustomers();

      emit(state.copyWith(
        customers: customers,
        isSaving: false,
        successMessage: 'تمت إضافة العميل بنجاح',
      ));
    } catch (e) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: _errorText(e),
      ));
    }
  }

  // =====================================================
  // 6. Update Customer
  // =====================================================

  Future<void> _onUpdateCustomer(
    UpdateCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(
      isSaving: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final updated = await _updateCustomer(event.customer);

      if (!updated) {
        emit(state.copyWith(
          isSaving: false,
          errorMessage: 'لم يتم العثور على العميل لتعديله',
        ));
        return;
      }

      final customers = await _getCustomers();

      emit(state.copyWith(
        customers: customers,
        selectedCustomer: event.customer,
        isSaving: false,
        successMessage: 'تم تعديل بيانات العميل بنجاح',
      ));
    } catch (e) {
      emit(state.copyWith(
        isSaving: false,
        errorMessage: _errorText(e),
      ));
    }
  }

  // =====================================================
  // 7. Delete Customer
  // =====================================================

  Future<void> _onDeleteCustomer(
    DeleteCustomer event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(
      isDeleting: true,
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final deleted = await _deleteCustomer(event.id);

      if (!deleted) {
        emit(state.copyWith(
          isDeleting: false,
          errorMessage: 'لم يتم العثور على العميل لحذفه',
        ));
        return;
      }

      final customers = await _getCustomers();

      emit(state.copyWith(
        customers: customers,
        selectedCustomer: state.selectedCustomer?.id == event.id
            ? null
            : state.selectedCustomer,
        isDeleting: false,
        successMessage: 'تم حذف العميل بنجاح',
      ));
    } catch (e) {
      emit(state.copyWith(
        isDeleting: false,
        errorMessage: _errorText(e),
      ));
    }
  }

  // =====================================================
  // 8. Toggle Customer Status
  // =====================================================

  Future<void> _onToggleCustomerStatus(
    ToggleCustomerStatus event,
    Emitter<CustomerState> emit,
  ) async {
    emit(state.copyWith(
      errorMessage: null,
      successMessage: null,
    ));

    try {
      final updated = await _toggleCustomerStatus(
        id: event.id,
        isActive: event.isActive,
      );

      if (!updated) {
        emit(state.copyWith(
          errorMessage: 'لم يتم العثور على العميل لتغيير حالته',
        ));
        return;
      }

      final customers = await _getCustomers();

      final selected = state.selectedCustomer;
      final updatedSelected = selected?.id == event.id
          ? _copyCustomerStatus(selected!, event.isActive)
          : selected;

      emit(state.copyWith(
        customers: customers,
        selectedCustomer: updatedSelected,
        successMessage: event.isActive
            ? 'تم تفعيل العميل'
            : 'تم تعطيل العميل',
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: _errorText(e),
      ));
    }
  }

  // =====================================================
  // Helpers
  // =====================================================

  Customer _copyCustomerStatus(Customer customer, bool isActive) {
    return Customer(
      id: customer.id,
      customerCode: customer.customerCode,
      customerType: customer.customerType,
      name: customer.name,
      companyName: customer.companyName,
      contactPerson: customer.contactPerson,
      imagePath: customer.imagePath,
      phone: customer.phone,
      secondaryPhone: customer.secondaryPhone,
      whatsapp: customer.whatsapp,
      email: customer.email,
      website: customer.website,
      nationalId: customer.nationalId,
      taxNumber: customer.taxNumber,
      commercialRegister: customer.commercialRegister,
      address: customer.address,
      country: customer.country,
      city: customer.city,
      region: customer.region,
      street: customer.street,
      buildingNumber: customer.buildingNumber,
      postalCode: customer.postalCode,
      billingAddress: customer.billingAddress,
      shippingAddress: customer.shippingAddress,
      customerCategory: customer.customerCategory,
      priceLevel: customer.priceLevel,
      allowCredit: customer.allowCredit,
      creditLimit: customer.creditLimit,
      openingBalance: customer.openingBalance,
      currentBalance: customer.currentBalance,
      paymentTermsDays: customer.paymentTermsDays,
      defaultDiscount: customer.defaultDiscount,
      preferredPaymentMethod: customer.preferredPaymentMethod,
      loyaltyPoints: customer.loyaltyPoints,
      lastSaleAt: customer.lastSaleAt,
      lastPaymentAt: customer.lastPaymentAt,
      isActive: isActive,
      notes: customer.notes,
      createdAt: customer.createdAt,
      updatedAt: customer.updatedAt,
    );
  }

  String _errorText(Object error) {
    return error.toString().replaceFirst('Exception: ', '');
  }

  @override
  Future<void> close() async {
    await _customersSubscription?.cancel();
    return super.close();
  }
}
