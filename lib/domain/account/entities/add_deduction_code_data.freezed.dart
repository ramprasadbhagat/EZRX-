// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_deduction_code_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddDeductionCodeData {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  StringValue get salesDistrict => throw _privateConstructorUsedError;
  StringValue get deductionCode => throw _privateConstructorUsedError;
  StringValue get amountType => throw _privateConstructorUsedError;
  StringValue get deductionDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddDeductionCodeDataCopyWith<AddDeductionCodeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddDeductionCodeDataCopyWith<$Res> {
  factory $AddDeductionCodeDataCopyWith(AddDeductionCodeData value,
          $Res Function(AddDeductionCodeData) then) =
      _$AddDeductionCodeDataCopyWithImpl<$Res, AddDeductionCodeData>;
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      StringValue salesDistrict,
      StringValue deductionCode,
      StringValue amountType,
      StringValue deductionDescription});
}

/// @nodoc
class _$AddDeductionCodeDataCopyWithImpl<$Res,
        $Val extends AddDeductionCodeData>
    implements $AddDeductionCodeDataCopyWith<$Res> {
  _$AddDeductionCodeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? salesDistrict = null,
    Object? deductionCode = null,
    Object? amountType = null,
    Object? deductionDescription = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as StringValue,
      deductionCode: null == deductionCode
          ? _value.deductionCode
          : deductionCode // ignore: cast_nullable_to_non_nullable
              as StringValue,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as StringValue,
      deductionDescription: null == deductionDescription
          ? _value.deductionDescription
          : deductionDescription // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddDeductionCodeDataCopyWith<$Res>
    implements $AddDeductionCodeDataCopyWith<$Res> {
  factory _$$_AddDeductionCodeDataCopyWith(_$_AddDeductionCodeData value,
          $Res Function(_$_AddDeductionCodeData) then) =
      __$$_AddDeductionCodeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      StringValue salesDistrict,
      StringValue deductionCode,
      StringValue amountType,
      StringValue deductionDescription});
}

/// @nodoc
class __$$_AddDeductionCodeDataCopyWithImpl<$Res>
    extends _$AddDeductionCodeDataCopyWithImpl<$Res, _$_AddDeductionCodeData>
    implements _$$_AddDeductionCodeDataCopyWith<$Res> {
  __$$_AddDeductionCodeDataCopyWithImpl(_$_AddDeductionCodeData _value,
      $Res Function(_$_AddDeductionCodeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? salesDistrict = null,
    Object? deductionCode = null,
    Object? amountType = null,
    Object? deductionDescription = null,
  }) {
    return _then(_$_AddDeductionCodeData(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as StringValue,
      deductionCode: null == deductionCode
          ? _value.deductionCode
          : deductionCode // ignore: cast_nullable_to_non_nullable
              as StringValue,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as StringValue,
      deductionDescription: null == deductionDescription
          ? _value.deductionDescription
          : deductionDescription // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_AddDeductionCodeData extends _AddDeductionCodeData {
  const _$_AddDeductionCodeData(
      {required this.salesOrg,
      required this.salesDistrict,
      required this.deductionCode,
      required this.amountType,
      required this.deductionDescription})
      : super._();

  @override
  final SalesOrg salesOrg;
  @override
  final StringValue salesDistrict;
  @override
  final StringValue deductionCode;
  @override
  final StringValue amountType;
  @override
  final StringValue deductionDescription;

  @override
  String toString() {
    return 'AddDeductionCodeData(salesOrg: $salesOrg, salesDistrict: $salesDistrict, deductionCode: $deductionCode, amountType: $amountType, deductionDescription: $deductionDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddDeductionCodeData &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.deductionCode, deductionCode) ||
                other.deductionCode == deductionCode) &&
            (identical(other.amountType, amountType) ||
                other.amountType == amountType) &&
            (identical(other.deductionDescription, deductionDescription) ||
                other.deductionDescription == deductionDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, salesDistrict,
      deductionCode, amountType, deductionDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddDeductionCodeDataCopyWith<_$_AddDeductionCodeData> get copyWith =>
      __$$_AddDeductionCodeDataCopyWithImpl<_$_AddDeductionCodeData>(
          this, _$identity);
}

abstract class _AddDeductionCodeData extends AddDeductionCodeData {
  const factory _AddDeductionCodeData(
          {required final SalesOrg salesOrg,
          required final StringValue salesDistrict,
          required final StringValue deductionCode,
          required final StringValue amountType,
          required final StringValue deductionDescription}) =
      _$_AddDeductionCodeData;
  const _AddDeductionCodeData._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  StringValue get salesDistrict;
  @override
  StringValue get deductionCode;
  @override
  StringValue get amountType;
  @override
  StringValue get deductionDescription;
  @override
  @JsonKey(ignore: true)
  _$$_AddDeductionCodeDataCopyWith<_$_AddDeductionCodeData> get copyWith =>
      throw _privateConstructorUsedError;
}
