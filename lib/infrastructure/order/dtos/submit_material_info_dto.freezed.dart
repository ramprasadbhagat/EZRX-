// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  @JsonKey(name: 'contract')
  SubmitTenderContractDto get tenderContract =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
  List<SubmitMaterialItemBonusDto> get bonuses =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'batch',
      defaultValue: '',
      toJson: overrideBatchJson,
      includeIfNull: false)
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  String get salesDistrict => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'override',
      toJson: overrideTojson,
      readValue: materialItemOverrideread,
      includeIfNull: false)
  MaterialItemOverrideDto get materialItemOverride =>
      throw _privateConstructorUsedError;

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
      @JsonKey(name: 'contract')
          SubmitTenderContractDto tenderContract,
      @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
          List<SubmitMaterialItemBonusDto> bonuses,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'batch', defaultValue: '', toJson: overrideBatchJson, includeIfNull: false)
          String batch,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
          String salesDistrict,
      @JsonKey(name: 'override', toJson: overrideTojson, readValue: materialItemOverrideread, includeIfNull: false)
          MaterialItemOverrideDto materialItemOverride});

  $SubmitTenderContractDtoCopyWith<$Res> get tenderContract;
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
    Object? tenderContract = null,
    Object? bonuses = null,
    Object? comment = null,
    Object? batch = null,
    Object? salesDistrict = null,
    Object? materialItemOverride = null,
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
      tenderContract: null == tenderContract
          ? _value.tenderContract
          : tenderContract // ignore: cast_nullable_to_non_nullable
              as SubmitTenderContractDto,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialItemBonusDto>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      materialItemOverride: null == materialItemOverride
          ? _value.materialItemOverride
          : materialItemOverride // ignore: cast_nullable_to_non_nullable
              as MaterialItemOverrideDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubmitTenderContractDtoCopyWith<$Res> get tenderContract {
    return $SubmitTenderContractDtoCopyWith<$Res>(_value.tenderContract,
        (value) {
      return _then(_value.copyWith(tenderContract: value) as $Val);
    });
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
      @JsonKey(name: 'contract')
          SubmitTenderContractDto tenderContract,
      @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
          List<SubmitMaterialItemBonusDto> bonuses,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'batch', defaultValue: '', toJson: overrideBatchJson, includeIfNull: false)
          String batch,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
          String salesDistrict,
      @JsonKey(name: 'override', toJson: overrideTojson, readValue: materialItemOverrideread, includeIfNull: false)
          MaterialItemOverrideDto materialItemOverride});

  @override
  $SubmitTenderContractDtoCopyWith<$Res> get tenderContract;
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
    Object? tenderContract = null,
    Object? bonuses = null,
    Object? comment = null,
    Object? batch = null,
    Object? salesDistrict = null,
    Object? materialItemOverride = null,
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
      tenderContract: null == tenderContract
          ? _value.tenderContract
          : tenderContract // ignore: cast_nullable_to_non_nullable
              as SubmitTenderContractDto,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialItemBonusDto>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      materialItemOverride: null == materialItemOverride
          ? _value.materialItemOverride
          : materialItemOverride // ignore: cast_nullable_to_non_nullable
              as MaterialItemOverrideDto,
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
      @JsonKey(name: 'contract')
          required this.tenderContract,
      @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
          required final List<SubmitMaterialItemBonusDto> bonuses,
      @JsonKey(name: 'comment', defaultValue: '')
          required this.comment,
      @JsonKey(name: 'batch', defaultValue: '', toJson: overrideBatchJson, includeIfNull: false)
          required this.batch,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
          required this.salesDistrict,
      @JsonKey(name: 'override', toJson: overrideTojson, readValue: materialItemOverrideread, includeIfNull: false)
          required this.materialItemOverride})
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
  @override
  @JsonKey(name: 'contract')
  final SubmitTenderContractDto tenderContract;
  final List<SubmitMaterialItemBonusDto> _bonuses;
  @override
  @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
  List<SubmitMaterialItemBonusDto> get bonuses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  @override
  @JsonKey(name: 'comment', defaultValue: '')
  final String comment;
  @override
  @JsonKey(
      name: 'batch',
      defaultValue: '',
      toJson: overrideBatchJson,
      includeIfNull: false)
  final String batch;
  @override
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  final String salesDistrict;
  @override
  @JsonKey(
      name: 'override',
      toJson: overrideTojson,
      readValue: materialItemOverrideread,
      includeIfNull: false)
  final MaterialItemOverrideDto materialItemOverride;

  @override
  String toString() {
    return 'SubmitMaterialInfoDto(materialNumber: $materialNumber, qty: $qty, tenderContract: $tenderContract, bonuses: $bonuses, comment: $comment, batch: $batch, salesDistrict: $salesDistrict, materialItemOverride: $materialItemOverride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitMaterialInfoDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.tenderContract, tenderContract) ||
                other.tenderContract == tenderContract) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.materialItemOverride, materialItemOverride) ||
                other.materialItemOverride == materialItemOverride));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialNumber,
      qty,
      tenderContract,
      const DeepCollectionEquality().hash(_bonuses),
      comment,
      batch,
      salesDistrict,
      materialItemOverride);

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
      @JsonKey(name: 'contract')
          required final SubmitTenderContractDto tenderContract,
      @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
          required final List<SubmitMaterialItemBonusDto> bonuses,
      @JsonKey(name: 'comment', defaultValue: '')
          required final String comment,
      @JsonKey(name: 'batch', defaultValue: '', toJson: overrideBatchJson, includeIfNull: false)
          required final String batch,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
          required final String salesDistrict,
      @JsonKey(name: 'override', toJson: overrideTojson, readValue: materialItemOverrideread, includeIfNull: false)
          required final MaterialItemOverrideDto materialItemOverride}) = _$_SubmitMaterialInfoDto;
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
  @JsonKey(name: 'contract')
  SubmitTenderContractDto get tenderContract;
  @override
  @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
  List<SubmitMaterialItemBonusDto> get bonuses;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment;
  @override
  @JsonKey(
      name: 'batch',
      defaultValue: '',
      toJson: overrideBatchJson,
      includeIfNull: false)
  String get batch;
  @override
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  String get salesDistrict;
  @override
  @JsonKey(
      name: 'override',
      toJson: overrideTojson,
      readValue: materialItemOverrideread,
      includeIfNull: false)
  MaterialItemOverrideDto get materialItemOverride;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitMaterialInfoDtoCopyWith<_$_SubmitMaterialInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
