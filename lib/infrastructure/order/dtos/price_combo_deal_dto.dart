import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'price_combo_deal_dto.freezed.dart';
part 'price_combo_deal_dto.g.dart';

@freezed
class PriceComboDealDto with _$PriceComboDealDto {
  const PriceComboDealDto._();
  @HiveType(typeId: 17, adapterName: 'PriceComboDealDtoAdapter')
  const factory PriceComboDealDto({
    @JsonKey(name: 'Eligible', defaultValue: false)
    @HiveField(0, defaultValue: false)
        required bool isEligible,
    @JsonKey(name: 'FlexibleGroup', defaultValue: '')
    @HiveField(1, defaultValue: '')
        required String flexibleGroup,
    @JsonKey(name: 'SalesDeal', defaultValue: '')
    @HiveField(2, defaultValue: '')
        required String salesDeal,
    @Default(PriceComboDealCategoryDto.empty)
    @JsonKey(name: 'Category')
    @HiveField(3, defaultValue: PriceComboDealCategoryDto.empty)
        PriceComboDealCategoryDto category,
  }) = _PriceComboDealDto;

  factory PriceComboDealDto.fromDomain(PriceComboDeal domain) {
    return PriceComboDealDto(
      isEligible: domain.isEligible,
      flexibleGroup: domain.flexibleGroup.getOrDefaultValue(''),
      salesDeal: domain.salesDeal.getOrDefaultValue(''),
      category: PriceComboDealCategoryDto.fromDomain(domain.category),
    );
  }

  PriceComboDeal get toDomain => PriceComboDeal(
        isEligible: isEligible,
        flexibleGroup: FlexibleGroup(flexibleGroup),
        salesDeal: SalesDealNumber(salesDeal),
        category: category.toDomain,
      );

  static const empty = PriceComboDealDto(
    isEligible: false,
    flexibleGroup: '',
    salesDeal: '',
    category: PriceComboDealCategoryDto.empty,
  );

  factory PriceComboDealDto.fromJson(Map<String, dynamic> json) =>
      _$PriceComboDealDtoFromJson(json);
}

@freezed
class PriceComboDealCategoryDto with _$PriceComboDealCategoryDto {
  const PriceComboDealCategoryDto._();
  @HiveType(typeId: 23, adapterName: 'PriceComboDealCategoryDtoAdapter')
  const factory PriceComboDealCategoryDto({
    @JsonKey(name: 'Type', defaultValue: '')
    @HiveField(0, defaultValue: '')
        required String type,
    @JsonKey(name: 'Value', defaultValue: [])
    @HiveField(1, defaultValue: [])
        required List<String> value,
  }) = _PriceComboDealCategoryDto;

  factory PriceComboDealCategoryDto.fromDomain(PriceComboDealCategory domain) =>
      PriceComboDealCategoryDto(
        type: domain.type.getOrDefaultValue(''),
        value: domain.comboMaterialNumbers
            .map(
              (e) => e.getOrDefaultValue(''),
            )
            .toList(),
      );

  PriceComboDealCategory get toDomain => PriceComboDealCategory(
        type: ComboDealType(type),
        comboMaterialNumbers: value
            .map(
              (e) => MaterialNumber(e),
            )
            .toList(),
      );

  static const empty = PriceComboDealCategoryDto(
    type: '',
    value: [],
  );

  factory PriceComboDealCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$PriceComboDealCategoryDtoFromJson(json);
}
