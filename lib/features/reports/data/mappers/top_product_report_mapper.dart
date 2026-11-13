
import '../../domain/entities/top_product_report.dart';
import '../models/top_product_report_model.dart';

class TopProductReportMapper {
  const TopProductReportMapper._();

  static TopProductReport toEntity(
    TopProductReportModel model,
  ) {
    return TopProductReport(
      productId: model.productId,
      productName: model.productName,
      quantitySold: model.quantitySold,
      salesTotal: model.salesTotal,
      costTotal: model.costTotal,
      profit: model.profit,
    );
  }

  static List<TopProductReport> toEntityList(
    List<TopProductReportModel> models,
  ) {
    return models.map(toEntity).toList();
  }
}