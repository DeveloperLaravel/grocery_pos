
import 'package:injectable/injectable.dart';

import '../../entities/sale.dart';
import '../../entities/sale_item.dart';
import '../../entities/sale_payment.dart';
import '../../repositories/sales_repository.dart';
@injectable
class CompleteSaleUseCase {
  final SalesRepository repository;

  CompleteSaleUseCase(this.repository);

  Future<int> call({
    required Sale sale,
    required List<SaleItem> items,
    required List<SalePayment> payments,
  }) {
    return repository.completeSale(
      sale: sale,
      items: items,
      payments: payments,
    );
  }
}
