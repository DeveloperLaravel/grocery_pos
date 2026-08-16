class Validators {
  const Validators._();

  static String? requiredText(String? value, {String field = 'الحقل'}) {
    if (value == null || value.trim().isEmpty) {
      return '$field مطلوب';
    }
    return null;
  }

  static String? positiveNumber(String? value, {String field = 'القيمة'}) {
    final number = double.tryParse(value?.trim() ?? '');
    if (number == null) return '$field غير صحيحة';
    if (number < 0) return '$field لا يمكن أن تكون سالبة';
    return null;
  }

  static String? salePrice(String? value) {
    final number = double.tryParse(value?.trim() ?? '');
    if (number == null || number <= 0) {
      return 'سعر البيع يجب أن يكون أكبر من صفر';
    }
    return null;
  }
}
