// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_type_code_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnRequestTypeCodeDetails {
  String get returnCode => throw _privateConstructorUsedError;
  String get returnDescription => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnRequestTypeCodeDetailsCopyWith<ReturnRequestTypeCodeDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestTypeCodeDetailsCopyWith<$Res> {
  factory $ReturnRequestTypeCodeDetailsCopyWith(
          ReturnRequestTypeCodeDetails value,
          $Res Function(ReturnRequestTypeCodeDetails) then) =
      _$ReturnRequestTypeCodeDetailsCopyWithImpl<$Res,
          ReturnRequestTypeCodeDetails>;
  @useResult
  $Res call({String returnCode, String returnDescription});
}

/// @nodoc
class _$ReturnRequestTypeCodeDetailsCopyWithImpl<$Res,
        $Val extends ReturnRequestTypeCodeDetails>
    implements $ReturnRequestTypeCodeDetailsCopyWith<$Res> {
  _$ReturnRequestTypeCodeDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnCode = null,
    Object? returnDescription = null,
  }) {
    return _then(_value.copyWith(
      returnCode: null == returnCode
          ? _value.returnCode
          : returnCode // ignore: cast_nullable_to_non_nullable
              as String,
      returnDescription: null == returnDescription
          ? _value.returnDescription
          : returnDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnRequestTypeCodeDetailsImplCopyWith<$Res>
    implements $ReturnRequestTypeCodeDetailsCopyWith<$Res> {
  factory _$$ReturnRequestTypeCodeDetailsImplCopyWith(
          _$ReturnRequestTypeCodeDetailsImpl value,
          $Res Function(_$ReturnRequestTypeCodeDetailsImpl) then) =
      __$$ReturnRequestTypeCodeDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String returnCode, String returnDescription});
}

/// @nodoc
class __$$ReturnRequestTypeCodeDetailsImplCopyWithImpl<$Res>
    extends _$ReturnRequestTypeCodeDetailsCopyWithImpl<$Res,
        _$ReturnRequestTypeCodeDetailsImpl>
    implements _$$ReturnRequestTypeCodeDetailsImplCopyWith<$Res> {
  __$$ReturnRequestTypeCodeDetailsImplCopyWithImpl(
      _$ReturnRequestTypeCodeDetailsImpl _value,
      $Res Function(_$ReturnRequestTypeCodeDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnCode = null,
    Object? returnDescription = null,
  }) {
    return _then(_$ReturnRequestTypeCodeDetailsImpl(
      returnCode: null == returnCode
          ? _value.returnCode
          : returnCode // ignore: cast_nullable_to_non_nullable
              as String,
      returnDescription: null == returnDescription
          ? _value.returnDescription
          : returnDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReturnRequestTypeCodeDetailsImpl extends _ReturnRequestTypeCodeDetails {
  const _$ReturnRequestTypeCodeDetailsImpl(
      {required this.returnCode, required this.returnDescription})
      : super._();

  @override
  final String returnCode;
  @override
  final String returnDescription;

  @override
  String toString() {
    return 'ReturnRequestTypeCodeDetails(returnCode: $returnCode, returnDescription: $returnDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnRequestTypeCodeDetailsImpl &&
            (identical(other.returnCode, returnCode) ||
                other.returnCode == returnCode) &&
            (identical(other.returnDescription, returnDescription) ||
                other.returnDescription == returnDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnCode, returnDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnRequestTypeCodeDetailsImplCopyWith<
          _$ReturnRequestTypeCodeDetailsImpl>
      get copyWith => __$$ReturnRequestTypeCodeDetailsImplCopyWithImpl<
          _$ReturnRequestTypeCodeDetailsImpl>(this, _$identity);
}

abstract class _ReturnRequestTypeCodeDetails
    extends ReturnRequestTypeCodeDetails {
  const factory _ReturnRequestTypeCodeDetails(
          {required final String returnCode,
          required final String returnDescription}) =
      _$ReturnRequestTypeCodeDetailsImpl;
  const _ReturnRequestTypeCodeDetails._() : super._();

  @override
  String get returnCode;
  @override
  String get returnDescription;
  @override
  @JsonKey(ignore: true)
  _$$ReturnRequestTypeCodeDetailsImplCopyWith<
          _$ReturnRequestTypeCodeDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
