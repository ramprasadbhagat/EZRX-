import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_item.freezed.dart';

@freezed
class Favourite with _$Favourite {
  const Favourite._();

  const factory Favourite({
    required String id,
    required MaterialNumber materialNumber,
    required bool isFOC,
    required bool isTenderContract,
    required String materialDescription,
  }) = _Favourite;

  factory Favourite.empty() => Favourite(
        id: '',
        materialNumber: MaterialNumber(''),
        isFOC: false,
        isTenderContract: false,
        materialDescription: '',
      );
}
