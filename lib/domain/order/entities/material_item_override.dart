import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_override.freezed.dart';

@freezed
class MaterialItemOverride with _$MaterialItemOverride {
  const MaterialItemOverride._();

  const factory MaterialItemOverride({
    required String reference,
    required List<ValueOverride> valueOverride,
    required dynamic percentageOverride,
  }) = _MaterialItemOverride;

  factory MaterialItemOverride.empty() => const MaterialItemOverride(
        reference: '',
        valueOverride: <ValueOverride>[],
        percentageOverride: '',
      );
}

@freezed
class ValueOverride with _$ValueOverride {
  const factory ValueOverride({
    required String code,
    required dynamic price,
    required Currency currency,
  }) = _ValueOverride;

  factory ValueOverride.empty() => ValueOverride(
        code: '',
        price: '',
        currency: Currency(''),
      );
}
