import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../app/theme/app_colors.dart';

class InventoryFormatters {
  const InventoryFormatters._();

  static String currency(double value) {
    return '${value.toStringAsFixed(2)} د.ل';
  }

  static String quantity(double value) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(2);
  }

  static String date(DateTime value) {
    final date = value.toLocal();

    return '${date.year}/${date.month.toString().padLeft(2, '0')}/'
        '${date.day.toString().padLeft(2, '0')}';
  }

static String dateTime(DateTime value) {
  return DateFormat('yyyy-MM-dd HH:mm', 'ar')
      .format(value.toLocal());
}

  static Color stockColor({
    required double quantity,
    required double minStock,
  }) {
    if (quantity <= 0) return AppColors.stockOut;
    if (quantity <= minStock) return AppColors.stockLow;

    return AppColors.stockAvailable;
  }

  static String stockLabel({
    required double quantity,
    required double minStock,
  }) {
    if (quantity <= 0) return 'نفد المخزون';
    if (quantity <= minStock) return 'مخزون منخفض';

    return 'متوفر';
  }

  static String movementLabel(String type) {
    switch (type) {
      case 'in':
        return 'إضافة للمخزون';
      case 'out':
        return 'صرف من المخزون';
      case 'sale':
        return 'عملية بيع';
      case 'return':
        return 'مرتجع';
      default:
        return 'حركة أخرى';
    }
  }

  static IconData movementIcon(String type) {
    switch (type) {
      case 'in':
        return Icons.add_circle_outline_rounded;
      case 'out':
        return Icons.remove_circle_outline_rounded;
      case 'sale':
        return Icons.shopping_cart_checkout_rounded;
      case 'return':
        return Icons.assignment_return_rounded;
      default:
        return Icons.inventory_2_outlined;
    }
  }
}