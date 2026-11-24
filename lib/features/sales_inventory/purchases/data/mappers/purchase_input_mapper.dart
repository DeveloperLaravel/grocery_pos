

// import '../models/purchase_line_input_model.dart';
// import '../models/purchase_receipt_item_input_model.dart';

// class PurchaseInputMapper {
//   const PurchaseInputMapper._();

//   // Purchase Order

//   static PurchaseLineInput toPurchaseLineInput(
//     PurchaseLineInputModel model,
//   ) {
//     return PurchaseLineInput(
//       productId: model.productId,
//       productUnitId: model.productUnitId,
//       quantity: model.quantity,
//       unitPrice: model.unitPrice,
//       notes: model.notes,
//     );
//   }

//   static List<PurchaseLineInput> toPurchaseLineInputList(
//     List<PurchaseLineInputModel> models,
//   ) {
//     return models
//         .map(toPurchaseLineInput)
//         .toList(growable: false);
//   }

//   // Purchase Receipt

//   static PurchaseReceiptLineInput toReceiptLineInput(
//     PurchaseReceiptItemInputModel model,
//   ) {
//     return PurchaseReceiptLineInput(
//       purchaseItemId: model.purchaseItemId,
//       quantity: model.quantity,
//     );
//   }

//   static List<PurchaseReceiptLineInput> toReceiptLineInputList(
//     List<PurchaseReceiptItemInputModel> models,
//   ) {
//     return models
//         .map(toReceiptLineInput)
//         .toList(growable: false);
//   }
// }
