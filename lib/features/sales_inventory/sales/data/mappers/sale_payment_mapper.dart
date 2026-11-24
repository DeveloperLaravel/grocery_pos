
import 'package:drift/drift.dart';

import '../../../../../core/database/app_database.dart';
import '../../domain/entities/sale_payment.dart';
import '../models/sale_payment_model.dart';


extension SalePaymentDbMapper on SalePaymentDb {
  SalePaymentModel toModel() {
    return SalePaymentModel(
      id: id,
      saleId: saleId,
      amount: amount,
      paymentMethod: paymentMethod,
      transactionReference: transactionReference,
      notes: notes,
      paymentDate: paymentDate,
      createdAt: createdAt,
    );
  }
}

extension SalePaymentModelMapper on SalePaymentModel {
  SalePayment toEntity() {
    return SalePayment(
      id: id,
      saleId: saleId,
      amount: amount,
      paymentMethod: paymentMethod,
      transactionReference: transactionReference,
      notes: notes,
      paymentDate: paymentDate,
      createdAt: createdAt,
    );
  }
}

extension SalePaymentEntityMapper on SalePayment {
  SalePaymentModel toModel() {
    return SalePaymentModel(
      id: id,
      saleId: saleId,
      amount: amount,
      paymentMethod: paymentMethod,
      transactionReference: transactionReference,
      notes: notes,
      paymentDate: paymentDate,
      createdAt: createdAt,
    );
  }
}

extension SalePaymentModelCompanionMapper on SalePaymentModel {
  SalePaymentsCompanion toCompanion() {
    return SalePaymentsCompanion.insert(
      saleId: saleId,
      amount: amount,
      paymentMethod: paymentMethod,
      transactionReference: Value(transactionReference),
      notes: Value(notes),
      paymentDate: Value(paymentDate),
      createdAt: Value(createdAt),
    );
  }
}
