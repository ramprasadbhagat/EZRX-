import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_addition_info_product.freezed.dart';

@freezed
class CartAdditionInfoProduct with _$CartAdditionInfoProduct {
  const CartAdditionInfoProduct._();

  const factory CartAdditionInfoProduct({
    required List<ProductImages> productImages,
    // List<Items> items,
  }) = _CartAdditionInfoProduct;

  factory CartAdditionInfoProduct.empty() => const CartAdditionInfoProduct(
    productImages: [],
    // items: [],
  );
}

// @freezed
// class Items with _$Items {
//   const Items._();
//
//   factory Items({
//     required String promotionMaterial,
//     required bool hidePrice,
//     required XP xp,
//   }) = _Items;
//
//   factory Items.empty() => Items(
//         promotionMaterial: '',
//         hidePrice: false,
//         xp: XP.empty(),
//       );
// }
//
// @freezed
// class XP with _$XP {
//   const XP._();
//
//   factory XP({
//     required String dosage,
//     required String howToUse,
//     required String composition,
//     required String deliveryInstructions,
//     required String usability,
//   }) = _XP;
//
//   factory XP.empty() => XP(
//       dosage: '',
//       howToUse: '',
//       composition: '',
//       deliveryInstructions: '',
//       usability: '');
// }