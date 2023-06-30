import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_images.freezed.dart';

@freezed
class ProductImages with _$ProductImages {
  const ProductImages._();

  const factory ProductImages({
    required MaterialNumber materialNumber,
    required String name,
    required String description,
    required List<String> image,
    required String thumbNail,
  }) = _ProductImages;
  factory ProductImages.empty() => ProductImages(
        materialNumber: MaterialNumber(''),
        name: '',
        description: '',
        image: <String>[],
        thumbNail: '',
      );
}
