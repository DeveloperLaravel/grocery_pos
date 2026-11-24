
import '../../../../../core/database/app_database.dart';
import '../../domain/entities/sale.dart';
import '../models/sale_model.dart';
import 'package:drift/drift.dart';


extension SaleDbMapper on SaleDb {
  SaleModel toModel() {
    return SaleModel(
      id: id,
      invoiceNumber: invoiceNumber,
      customerId: customerId,
      subtotal: subtotal,
      discountAmount: discountAmount,
      taxAmount: taxAmount,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      remainingAmount: remainingAmount,
      saleType: saleType,
      paymentMethod: paymentMethod,
      paymentStatus: paymentStatus,
      status: status,
      notes: notes,
      createdBy: createdBy,
      saleDate: saleDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension SaleModelMapper on SaleModel {
  Sale toEntity() {
    return Sale(
      id: id,
      invoiceNumber: invoiceNumber,
      customerId: customerId,
      subtotal: subtotal,
      discountAmount: discountAmount,
      taxAmount: taxAmount,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      remainingAmount: remainingAmount,
      saleType: saleType,
      paymentMethod: paymentMethod,
      paymentStatus: paymentStatus,
      status: status,
      notes: notes,
      createdBy: createdBy,
      saleDate: saleDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension SaleEntityMapper on Sale {
  SaleModel toModel() {
    return SaleModel(
      id: id,
      invoiceNumber: invoiceNumber,
      customerId: customerId,
      subtotal: subtotal,
      discountAmount: discountAmount,
      taxAmount: taxAmount,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      remainingAmount: remainingAmount,
      saleType: saleType,
      paymentMethod: paymentMethod,
      paymentStatus: paymentStatus,
      status: status,
      notes: notes,
      createdBy: createdBy,
      saleDate: saleDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

extension SaleModelCompanionMapper on SaleModel {
  SalesCompanion toCompanion() {
    return SalesCompanion.insert(
      invoiceNumber: invoiceNumber,
      customerId: Value(customerId),
      subtotal: Value(subtotal),
      discountAmount: Value(discountAmount),
      taxAmount: Value(taxAmount),
      totalAmount: Value(totalAmount),
      paidAmount: Value(paidAmount),
      remainingAmount: Value(remainingAmount),
      saleType: Value(saleType),
      paymentMethod: Value(paymentMethod),
      paymentStatus: Value(paymentStatus),
      status: Value(status),
      notes: Value(notes),
      createdBy: Value(createdBy),
      saleDate: Value(saleDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }
}
