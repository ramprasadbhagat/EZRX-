// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_material_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubmitMaterialInfoDto _$SubmitMaterialInfoDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitMaterialInfoDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitMaterialInfoDto {
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
  List<SubmitMaterialItemBonusDto> get bonuses =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Comment', defaultValue: '')
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentID', defaultValue: '')
  String get parentId => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'override',
      toJson: overrideTojson,
      readValue: materialItemOverrideread,
      includeIfNull: false)
  MaterialItemOverrideDto get materialItemOverride =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductType', defaultValue: '')
  String get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'price', defaultValue: 0)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax', defaultValue: 0)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mrp', defaultValue: 0)
  double get mrp => throw _privateConstructorUsedError;
  @JsonKey(name: 'PromoStatus', defaultValue: false)
  bool get promoStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'PromoType', defaultValue: '')
  String get promoType => throw _privateConstructorUsedError;

  ///Todo: consider to delete it
  @JsonKey(
      name: 'batch',
      defaultValue: '',
      toJson: overrideBatchJson,
      includeIfNull: false)
  String get batch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitMaterialInfoDtoCopyWith<SubmitMaterialInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitMaterialInfoDtoCopyWith<$Res> {
  factory $SubmitMaterialInfoDtoCopyWith(SubmitMaterialInfoDto value,
          $Res Function(SubmitMaterialInfoDto) then) =
      _$SubmitMaterialInfoDtoCopyWithImpl<$Res, SubmitMaterialInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0)
          int qty,
      @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
          List<SubmitMaterialItemBonusDto> bonuses,
      @JsonKey(name: 'Comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'ParentID', defaultValue: '')
          String parentId,
      @JsonKey(name: 'override', toJson: overrideTojson, readValue: materialItemOverrideread, includeIfNull: false)
          MaterialItemOverrideDto materialItemOverride,
      @JsonKey(name: 'ProductType', defaultValue: '')
          String productType,
      @JsonKey(name: 'price', defaultValue: 0)
          double price,
      @JsonKey(name: 'tax', defaultValue: 0)
          double tax,
      @JsonKey(name: 'Mrp', defaultValue: 0)
          double mrp,
      @JsonKey(name: 'PromoStatus', defaultValue: false)
          bool promoStatus,
      @JsonKey(name: 'PromoType', defaultValue: '')
          String promoType,
      @JsonKey(name: 'batch', defaultValue: '', toJson: overrideBatchJson, includeIfNull: false)
          String batch});

  $MaterialItemOverrideDtoCopyWith<$Res> get materialItemOverride;
}

/// @nodoc
class _$SubmitMaterialInfoDtoCopyWithImpl<$Res,
        $Val extends SubmitMaterialInfoDto>
    implements $SubmitMaterialInfoDtoCopyWith<$Res> {
  _$SubmitMaterialInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
    Object? bonuses = null,
    Object? comment = null,
    Object? parentId = null,
    Object? materialItemOverride = null,
    Object? productType = null,
    Object? price = null,
    Object? tax = null,
    Object? mrp = null,
    Object? promoStatus = null,
    Object? promoType = null,
    Object? batch = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialItemBonusDto>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      materialItemOverride: null == materialItemOverride
          ? _value.materialItemOverride
          : materialItemOverride // ignore: cast_nullable_to_non_nullable
              as MaterialItemOverrideDto,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      promoType: null == promoType
          ? _value.promoType
          : promoType // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialItemOverrideDtoCopyWith<$Res> get materialItemOverride {
    return $MaterialItemOverrideDtoCopyWith<$Res>(_value.materialItemOverride,
        (value) {
      return _then(_value.copyWith(materialItemOverride: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubmitMaterialInfoDtoCopyWith<$Res>
    implements $SubmitMaterialInfoDtoCopyWith<$Res> {
  factory _$$_SubmitMaterialInfoDtoCopyWith(_$_SubmitMaterialInfoDto value,
          $Res Function(_$_SubmitMaterialInfoDto) then) =
      __$$_SubmitMaterialInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0)
          int qty,
      @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
          List<SubmitMaterialItemBonusDto> bonuses,
      @JsonKey(name: 'Comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'ParentID', defaultValue: '')
          String parentId,
      @JsonKey(name: 'override', toJson: overrideTojson, readValue: materialItemOverrideread, includeIfNull: false)
          MaterialItemOverrideDto materialItemOverride,
      @JsonKey(name: 'ProductType', defaultValue: '')
          String productType,
      @JsonKey(name: 'price', defaultValue: 0)
          double price,
      @JsonKey(name: 'tax', defaultValue: 0)
          double tax,
      @JsonKey(name: 'Mrp', defaultValue: 0)
          double mrp,
      @JsonKey(name: 'PromoStatus', defaultValue: false)
          bool promoStatus,
      @JsonKey(name: 'PromoType', defaultValue: '')
          String promoType,
      @JsonKey(name: 'batch', defaultValue: '', toJson: overrideBatchJson, includeIfNull: false)
          String batch});

  @override
  $MaterialItemOverrideDtoCopyWith<$Res> get materialItemOverride;
}

/// @nodoc
class __$$_SubmitMaterialInfoDtoCopyWithImpl<$Res>
    extends _$SubmitMaterialInfoDtoCopyWithImpl<$Res, _$_SubmitMaterialInfoDto>
    implements _$$_SubmitMaterialInfoDtoCopyWith<$Res> {
  __$$_SubmitMaterialInfoDtoCopyWithImpl(_$_SubmitMaterialInfoDto _value,
      $Res Function(_$_SubmitMaterialInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
    Object? bonuses = null,
    Object? comment = null,
    Object? parentId = null,
    Object? materialItemOverride = null,
    Object? productType = null,
    Object? price = null,
    Object? tax = null,
    Object? mrp = null,
    Object? promoStatus = null,
    Object? promoType = null,
    Object? batch = null,
  }) {
    return _then(_$_SubmitMaterialInfoDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialItemBonusDto>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String,
      materialItemOverride: null == materialItemOverride
          ? _value.materialItemOverride
          : materialItemOverride // ignore: cast_nullable_to_non_nullable
              as MaterialItemOverrideDto,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      promoType: null == promoType
          ? _value.promoType
          : promoType // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubmitMaterialInfoDto extends _SubmitMaterialInfoDto {
  const _$_SubmitMaterialInfoDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0)
          required this.qty,
      @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
          required final List<SubmitMaterialItemBonusDto> bonuses,
      @JsonKey(name: 'Comment', defaultValue: '')
          required this.comment,
      @JsonKey(name: 'ParentID', defaultValue: '')
          required this.parentId,
      @JsonKey(name: 'override', toJson: overrideTojson, readValue: materialItemOverrideread, includeIfNull: false)
          required this.materialItemOverride,
      @JsonKey(name: 'ProductType', defaultValue: '')
          required this.productType,
      @JsonKey(name: 'price', defaultValue: 0)
          required this.price,
      @JsonKey(name: 'tax', defaultValue: 0)
          required this.tax,
      @JsonKey(name: 'Mrp', defaultValue: 0)
          required this.mrp,
      @JsonKey(name: 'PromoStatus', defaultValue: false)
          required this.promoStatus,
      @JsonKey(name: 'PromoType', defaultValue: '')
          required this.promoType,
      @JsonKey(name: 'batch', defaultValue: '', toJson: overrideBatchJson, includeIfNull: false)
          required this.batch})
      : _bonuses = bonuses,
        super._();

  factory _$_SubmitMaterialInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_SubmitMaterialInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  final int qty;
  final List<SubmitMaterialItemBonusDto> _bonuses;
  @override
  @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
  List<SubmitMaterialItemBonusDto> get bonuses {
    if (_bonuses is EqualUnmodifiableListView) return _bonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  @override
  @JsonKey(name: 'Comment', defaultValue: '')
  final String comment;
  @override
  @JsonKey(name: 'ParentID', defaultValue: '')
  final String parentId;
  @override
  @JsonKey(
      name: 'override',
      toJson: overrideTojson,
      readValue: materialItemOverrideread,
      includeIfNull: false)
  final MaterialItemOverrideDto materialItemOverride;
  @override
  @JsonKey(name: 'ProductType', defaultValue: '')
  final String productType;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  final double price;
  @override
  @JsonKey(name: 'tax', defaultValue: 0)
  final double tax;
  @override
  @JsonKey(name: 'Mrp', defaultValue: 0)
  final double mrp;
  @override
  @JsonKey(name: 'PromoStatus', defaultValue: false)
  final bool promoStatus;
  @override
  @JsonKey(name: 'PromoType', defaultValue: '')
  final String promoType;

  ///Todo: consider to delete it
  @override
  @JsonKey(
      name: 'batch',
      defaultValue: '',
      toJson: overrideBatchJson,
      includeIfNull: false)
  final String batch;

  @override
  String toString() {
    return 'SubmitMaterialInfoDto(materialNumber: $materialNumber, qty: $qty, bonuses: $bonuses, comment: $comment, parentId: $parentId, materialItemOverride: $materialItemOverride, productType: $productType, price: $price, tax: $tax, mrp: $mrp, promoStatus: $promoStatus, promoType: $promoType, batch: $batch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitMaterialInfoDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.materialItemOverride, materialItemOverride) ||
                other.materialItemOverride == materialItemOverride) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.promoStatus, promoStatus) ||
                other.promoStatus == promoStatus) &&
            (identical(other.promoType, promoType) ||
                other.promoType == promoType) &&
            (identical(other.batch, batch) || other.batch == batch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialNumber,
      qty,
      const DeepCollectionEquality().hash(_bonuses),
      comment,
      parentId,
      materialItemOverride,
      productType,
      price,
      tax,
      mrp,
      promoStatus,
      promoType,
      batch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitMaterialInfoDtoCopyWith<_$_SubmitMaterialInfoDto> get copyWith =>
      __$$_SubmitMaterialInfoDtoCopyWithImpl<_$_SubmitMaterialInfoDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubmitMaterialInfoDtoToJson(
      this,
    );
  }
}

abstract class _SubmitMaterialInfoDto extends SubmitMaterialInfoDto {
  const factory _SubmitMaterialInfoDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0)
          required final int qty,
      @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
          required final List<SubmitMaterialItemBonusDto> bonuses,
      @JsonKey(name: 'Comment', defaultValue: '')
          required final String comment,
      @JsonKey(name: 'ParentID', defaultValue: '')
          required final String parentId,
      @JsonKey(name: 'override', toJson: overrideTojson, readValue: materialItemOverrideread, includeIfNull: false)
          required final MaterialItemOverrideDto materialItemOverride,
      @JsonKey(name: 'ProductType', defaultValue: '')
          required final String productType,
      @JsonKey(name: 'price', defaultValue: 0)
          required final double price,
      @JsonKey(name: 'tax', defaultValue: 0)
          required final double tax,
      @JsonKey(name: 'Mrp', defaultValue: 0)
          required final double mrp,
      @JsonKey(name: 'PromoStatus', defaultValue: false)
          required final bool promoStatus,
      @JsonKey(name: 'PromoType', defaultValue: '')
          required final String promoType,
      @JsonKey(name: 'batch', defaultValue: '', toJson: overrideBatchJson, includeIfNull: false)
          required final String batch}) = _$_SubmitMaterialInfoDto;
  const _SubmitMaterialInfoDto._() : super._();

  factory _SubmitMaterialInfoDto.fromJson(Map<String, dynamic> json) =
      _$_SubmitMaterialInfoDto.fromJson;

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty;
  @override
  @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
  List<SubmitMaterialItemBonusDto> get bonuses;
  @override
  @JsonKey(name: 'Comment', defaultValue: '')
  String get comment;
  @override
  @JsonKey(name: 'ParentID', defaultValue: '')
  String get parentId;
  @override
  @JsonKey(
      name: 'override',
      toJson: overrideTojson,
      readValue: materialItemOverrideread,
      includeIfNull: false)
  MaterialItemOverrideDto get materialItemOverride;
  @override
  @JsonKey(name: 'ProductType', defaultValue: '')
  String get productType;
  @override
  @JsonKey(name: 'price', defaultValue: 0)
  double get price;
  @override
  @JsonKey(name: 'tax', defaultValue: 0)
  double get tax;
  @override
  @JsonKey(name: 'Mrp', defaultValue: 0)
  double get mrp;
  @override
  @JsonKey(name: 'PromoStatus', defaultValue: false)
  bool get promoStatus;
  @override
  @JsonKey(name: 'PromoType', defaultValue: '')
  String get promoType;
  @override

  ///Todo: consider to delete it
  @JsonKey(
      name: 'batch',
      defaultValue: '',
      toJson: overrideBatchJson,
      includeIfNull: false)
  String get batch;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitMaterialInfoDtoCopyWith<_$_SubmitMaterialInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
