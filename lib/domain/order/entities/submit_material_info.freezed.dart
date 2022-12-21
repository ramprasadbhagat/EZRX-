// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'submit_material_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitMaterialInfo {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  List<MaterialItemBonus> get bonuses => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get batch => throw _privateConstructorUsedError;
  String get salesDistrict => throw _privateConstructorUsedError;
  MaterialItemOverride get materialItemOverride =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitMaterialInfoCopyWith<SubmitMaterialInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitMaterialInfoCopyWith<$Res> {
  factory $SubmitMaterialInfoCopyWith(
          SubmitMaterialInfo value, $Res Function(SubmitMaterialInfo) then) =
      _$SubmitMaterialInfoCopyWithImpl<$Res, SubmitMaterialInfo>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      int quantity,
      List<MaterialItemBonus> bonuses,
      String comment,
      String batch,
      String salesDistrict,
      MaterialItemOverride materialItemOverride});

  $MaterialItemOverrideCopyWith<$Res> get materialItemOverride;
}

/// @nodoc
class _$SubmitMaterialInfoCopyWithImpl<$Res, $Val extends SubmitMaterialInfo>
    implements $SubmitMaterialInfoCopyWith<$Res> {
  _$SubmitMaterialInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? quantity = null,
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
              as MaterialNumber,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonus>,
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
              as MaterialItemOverride,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialItemOverrideCopyWith<$Res> get materialItemOverride {
    return $MaterialItemOverrideCopyWith<$Res>(_value.materialItemOverride,
        (value) {
      return _then(_value.copyWith(materialItemOverride: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubmitMaterialInfoCopyWith<$Res>
    implements $SubmitMaterialInfoCopyWith<$Res> {
  factory _$$_SubmitMaterialInfoCopyWith(_$_SubmitMaterialInfo value,
          $Res Function(_$_SubmitMaterialInfo) then) =
      __$$_SubmitMaterialInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      int quantity,
      List<MaterialItemBonus> bonuses,
      String comment,
      String batch,
      String salesDistrict,
      MaterialItemOverride materialItemOverride});

  @override
  $MaterialItemOverrideCopyWith<$Res> get materialItemOverride;
}

/// @nodoc
class __$$_SubmitMaterialInfoCopyWithImpl<$Res>
    extends _$SubmitMaterialInfoCopyWithImpl<$Res, _$_SubmitMaterialInfo>
    implements _$$_SubmitMaterialInfoCopyWith<$Res> {
  __$$_SubmitMaterialInfoCopyWithImpl(
      _$_SubmitMaterialInfo _value, $Res Function(_$_SubmitMaterialInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? quantity = null,
    Object? bonuses = null,
    Object? comment = null,
    Object? batch = null,
    Object? salesDistrict = null,
    Object? materialItemOverride = null,
  }) {
    return _then(_$_SubmitMaterialInfo(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonus>,
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
              as MaterialItemOverride,
    ));
  }
}

/// @nodoc

class _$_SubmitMaterialInfo extends _SubmitMaterialInfo {
  const _$_SubmitMaterialInfo(
      {required this.materialNumber,
      required this.quantity,
      required final List<MaterialItemBonus> bonuses,
      required this.comment,
      required this.batch,
      required this.salesDistrict,
      required this.materialItemOverride})
      : _bonuses = bonuses,
        super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final int quantity;
  final List<MaterialItemBonus> _bonuses;
  @override
  List<MaterialItemBonus> get bonuses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  @override
  final String comment;
  @override
  final String batch;
  @override
  final String salesDistrict;
  @override
  final MaterialItemOverride materialItemOverride;

  @override
  String toString() {
    return 'SubmitMaterialInfo(materialNumber: $materialNumber, quantity: $quantity, bonuses: $bonuses, comment: $comment, batch: $batch, salesDistrict: $salesDistrict, materialItemOverride: $materialItemOverride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitMaterialInfo &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.materialItemOverride, materialItemOverride) ||
                other.materialItemOverride == materialItemOverride));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialNumber,
      quantity,
      const DeepCollectionEquality().hash(_bonuses),
      comment,
      batch,
      salesDistrict,
      materialItemOverride);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitMaterialInfoCopyWith<_$_SubmitMaterialInfo> get copyWith =>
      __$$_SubmitMaterialInfoCopyWithImpl<_$_SubmitMaterialInfo>(
          this, _$identity);
}

abstract class _SubmitMaterialInfo extends SubmitMaterialInfo {
  const factory _SubmitMaterialInfo(
          {required final MaterialNumber materialNumber,
          required final int quantity,
          required final List<MaterialItemBonus> bonuses,
          required final String comment,
          required final String batch,
          required final String salesDistrict,
          required final MaterialItemOverride materialItemOverride}) =
      _$_SubmitMaterialInfo;
  const _SubmitMaterialInfo._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  int get quantity;
  @override
  List<MaterialItemBonus> get bonuses;
  @override
  String get comment;
  @override
  String get batch;
  @override
  String get salesDistrict;
  @override
  MaterialItemOverride get materialItemOverride;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitMaterialInfoCopyWith<_$_SubmitMaterialInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
