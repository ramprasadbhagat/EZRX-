import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_request.freezed.dart';

@freezed
class CartProductRequest with _$CartProductRequest {
  const CartProductRequest._();

  const factory CartProductRequest({
    required SalesOrg salesOrg,
    required String customerCode,
    required String shipToId,
    required String productNumber,
    required int quantity,
    required String language,
    required String parentID,
    required double counterOfferPrice,
    required String comment,
    required String counterOfferCurrency,
  }) = _CartProductRequest;

  factory CartProductRequest.empty() => CartProductRequest(
        salesOrg: SalesOrg(''),
        customerCode: '',
        shipToId: '',
        productNumber: '',
        quantity: 0,
        language: '',
        parentID: '',
        counterOfferPrice: 0,
        comment: '',
        counterOfferCurrency: '',
      );
}
