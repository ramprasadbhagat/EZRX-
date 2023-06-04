// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_beneficiary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BankBeneficiaryResponse {
  String get info => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankBeneficiaryResponseCopyWith<BankBeneficiaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankBeneficiaryResponseCopyWith<$Res> {
  factory $BankBeneficiaryResponseCopyWith(BankBeneficiaryResponse value,
          $Res Function(BankBeneficiaryResponse) then) =
      _$BankBeneficiaryResponseCopyWithImpl<$Res, BankBeneficiaryResponse>;
  @useResult
  $Res call({String info});
}

/// @nodoc
class _$BankBeneficiaryResponseCopyWithImpl<$Res,
        $Val extends BankBeneficiaryResponse>
    implements $BankBeneficiaryResponseCopyWith<$Res> {
  _$BankBeneficiaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankBeneficiaryResponseCopyWith<$Res>
    implements $BankBeneficiaryResponseCopyWith<$Res> {
  factory _$$_BankBeneficiaryResponseCopyWith(_$_BankBeneficiaryResponse value,
          $Res Function(_$_BankBeneficiaryResponse) then) =
      __$$_BankBeneficiaryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String info});
}

/// @nodoc
class __$$_BankBeneficiaryResponseCopyWithImpl<$Res>
    extends _$BankBeneficiaryResponseCopyWithImpl<$Res,
        _$_BankBeneficiaryResponse>
    implements _$$_BankBeneficiaryResponseCopyWith<$Res> {
  __$$_BankBeneficiaryResponseCopyWithImpl(_$_BankBeneficiaryResponse _value,
      $Res Function(_$_BankBeneficiaryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$_BankBeneficiaryResponse(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BankBeneficiaryResponse extends _BankBeneficiaryResponse {
  const _$_BankBeneficiaryResponse({required this.info}) : super._();

  @override
  final String info;

  @override
  String toString() {
    return 'BankBeneficiaryResponse(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankBeneficiaryResponse &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankBeneficiaryResponseCopyWith<_$_BankBeneficiaryResponse>
      get copyWith =>
          __$$_BankBeneficiaryResponseCopyWithImpl<_$_BankBeneficiaryResponse>(
              this, _$identity);
}

abstract class _BankBeneficiaryResponse extends BankBeneficiaryResponse {
  const factory _BankBeneficiaryResponse({required final String info}) =
      _$_BankBeneficiaryResponse;
  const _BankBeneficiaryResponse._() : super._();

  @override
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_BankBeneficiaryResponseCopyWith<_$_BankBeneficiaryResponse>
      get copyWith => throw _privateConstructorUsedError;
}
