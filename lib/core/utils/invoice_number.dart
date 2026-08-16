class InvoiceNumber {
  const InvoiceNumber._();

  static String generate({DateTime? now}) {
    final date = now ?? DateTime.now();
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    final second = date.second.toString().padLeft(2, '0');
    final millis = date.millisecond.toString().padLeft(3, '0');

    return 'INV-$year$month$day-$hour$minute$second$millis';
  }
}
