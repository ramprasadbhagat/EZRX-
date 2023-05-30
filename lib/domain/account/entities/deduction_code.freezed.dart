// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deduction_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeductionCode {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  StringValue get salesDistrict => throw _privateConstructorUsedError;
  StringValue get deductionCode => throw _privateConstructorUsedError;
  StringValue get deductionDescription => throw _privateConstructorUsedError;
  StringValue get amountType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeductionCodeCopyWith<DeductionCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeductionCodeCopyWith<$Res> {
  factory $DeductionCodeCopyWith(
          DeductionCode value, $Res Function(DeductionCode) then) =
      _$DeductionCodeCopyWithImpl<$Res, DeductionCode>;
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      StringValue salesDistrict,
      StringValue deductionCode,
      StringValue deductionDescription,
      StringValue amountType});
}

/// @nodoc
class _$DeductionCodeCopyWithImpl<$Res, $Val extends DeductionCode>
    implements $DeductionCodeCopyWith<$Res> {
  _$DeductionCodeCopyWithImpl(this._value, this._then);

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
    Object? deductionDescription = null,
    Object? amountType = null,
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
      deductionDescription: null == deductionDescription
          ? _value.deductionDescription
          : deductionDescription // ignore: cast_nullable_to_non_nullable
              as StringValue,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeductionCodeCopyWith<$Res>
    implements $DeductionCodeCopyWith<$Res> {
  factory _$$_DeductionCodeCopyWith(
          _$_DeductionCode value, $Res Function(_$_DeductionCode) then) =
      __$$_DeductionCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      StringValue salesDistrict,
      StringValue deductionCode,
      StringValue deductionDescription,
      StringValue amountType});
}

/// @nodoc
class __$$_DeductionCodeCopyWithImpl<$Res>
    extends _$DeductionCodeCopyWithImpl<$Res, _$_DeductionCode>
    implements _$$_DeductionCodeCopyWith<$Res> {
  __$$_DeductionCodeCopyWithImpl(
      _$_DeductionCode _value, $Res Function(_$_DeductionCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? salesDistrict = null,
    Object? deductionCode = null,
    Object? deductionDescription = null,
    Object? amountType = null,
  }) {
    return _then(_$_DeductionCode(
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
      deductionDescription: null == deductionDescription
          ? _value.deductionDescription
          : deductionDescription // ignore: cast_nullable_to_non_nullable
              as StringValue,
      amountType: null == amountType
          ? _value.amountType
          : amountType // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_DeductionCode extends _DeductionCode {
  const _$_DeductionCode(
      {required this.salesOrg,
      required this.salesDistrict,
      required this.deductionCode,
      required this.deductionDescription,
      required this.amountType})
      : super._();

  @override
  final SalesOrg salesOrg;
  @override
  final StringValue salesDistrict;
  @override
  final StringValue deductionCode;
  @override
  final StringValue deductionDescription;
  @override
  final StringValue amountType;

  @override
  String toString() {
    return 'DeductionCode(salesOrg: $salesOrg, salesDistrict: $salesDistrict, deductionCode: $deductionCode, deductionDescription: $deductionDescription, amountType: $amountType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeductionCode &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.deductionCode, deductionCode) ||
                other.deductionCode == deductionCode) &&
            (identical(other.deductionDescription, deductionDescription) ||
                other.deductionDescription == deductionDescription) &&
            (identical(other.amountType, amountType) ||
                other.amountType == amountType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, salesDistrict,
      deductionCode, deductionDescription, amountType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeductionCodeCopyWith<_$_DeductionCode> get copyWith =>
      __$$_DeductionCodeCopyWithImpl<_$_DeductionCode>(this, _$identity);
}

abstract class _DeductionCode extends DeductionCode {
  const factory _DeductionCode(
      {required final SalesOrg salesOrg,
      required final StringValue salesDistrict,
      required final StringValue deductionCode,
      required final StringValue deductionDescription,
      required final StringValue amountType}) = _$_DeductionCode;
  const _DeductionCode._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  StringValue get salesDistrict;
  @override
  StringValue get deductionCode;
  @override
  StringValue get deductionDescription;
  @override
  StringValue get amountType;
  @override
  @JsonKey(ignore: true)
  _$$_DeductionCodeCopyWith<_$_DeductionCode> get copyWith =>
      throw _privateConstructorUsedError;
}
