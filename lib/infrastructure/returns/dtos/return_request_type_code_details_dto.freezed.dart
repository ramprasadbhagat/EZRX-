// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_type_code_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReturnRequestTypeCodeDetailsDto _$ReturnRequestTypeCodeDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnRequestTypeCodeDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnRequestTypeCodeDetailsDto {
  @JsonKey(name: 'returnCode', defaultValue: '')
  String get returnCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnDesc', defaultValue: '')
  String get returnDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnRequestTypeCodeDetailsDtoCopyWith<ReturnRequestTypeCodeDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestTypeCodeDetailsDtoCopyWith<$Res> {
  factory $ReturnRequestTypeCodeDetailsDtoCopyWith(
          ReturnRequestTypeCodeDetailsDto value,
          $Res Function(ReturnRequestTypeCodeDetailsDto) then) =
      _$ReturnRequestTypeCodeDetailsDtoCopyWithImpl<$Res,
          ReturnRequestTypeCodeDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'returnCode', defaultValue: '') String returnCode,
      @JsonKey(name: 'returnDesc', defaultValue: '') String returnDescription});
}

/// @nodoc
class _$ReturnRequestTypeCodeDetailsDtoCopyWithImpl<$Res,
        $Val extends ReturnRequestTypeCodeDetailsDto>
    implements $ReturnRequestTypeCodeDetailsDtoCopyWith<$Res> {
  _$ReturnRequestTypeCodeDetailsDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$ReturnRequestTypeCodeDetailsDtoImplCopyWith<$Res>
    implements $ReturnRequestTypeCodeDetailsDtoCopyWith<$Res> {
  factory _$$ReturnRequestTypeCodeDetailsDtoImplCopyWith(
          _$ReturnRequestTypeCodeDetailsDtoImpl value,
          $Res Function(_$ReturnRequestTypeCodeDetailsDtoImpl) then) =
      __$$ReturnRequestTypeCodeDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'returnCode', defaultValue: '') String returnCode,
      @JsonKey(name: 'returnDesc', defaultValue: '') String returnDescription});
}

/// @nodoc
class __$$ReturnRequestTypeCodeDetailsDtoImplCopyWithImpl<$Res>
    extends _$ReturnRequestTypeCodeDetailsDtoCopyWithImpl<$Res,
        _$ReturnRequestTypeCodeDetailsDtoImpl>
    implements _$$ReturnRequestTypeCodeDetailsDtoImplCopyWith<$Res> {
  __$$ReturnRequestTypeCodeDetailsDtoImplCopyWithImpl(
      _$ReturnRequestTypeCodeDetailsDtoImpl _value,
      $Res Function(_$ReturnRequestTypeCodeDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnCode = null,
    Object? returnDescription = null,
  }) {
    return _then(_$ReturnRequestTypeCodeDetailsDtoImpl(
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
@JsonSerializable()
class _$ReturnRequestTypeCodeDetailsDtoImpl
    extends _ReturnRequestTypeCodeDetailsDto {
  const _$ReturnRequestTypeCodeDetailsDtoImpl(
      {@JsonKey(name: 'returnCode', defaultValue: '') required this.returnCode,
      @JsonKey(name: 'returnDesc', defaultValue: '')
      required this.returnDescription})
      : super._();

  factory _$ReturnRequestTypeCodeDetailsDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ReturnRequestTypeCodeDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'returnCode', defaultValue: '')
  final String returnCode;
  @override
  @JsonKey(name: 'returnDesc', defaultValue: '')
  final String returnDescription;

  @override
  String toString() {
    return 'ReturnRequestTypeCodeDetailsDto(returnCode: $returnCode, returnDescription: $returnDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnRequestTypeCodeDetailsDtoImpl &&
            (identical(other.returnCode, returnCode) ||
                other.returnCode == returnCode) &&
            (identical(other.returnDescription, returnDescription) ||
                other.returnDescription == returnDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, returnCode, returnDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnRequestTypeCodeDetailsDtoImplCopyWith<
          _$ReturnRequestTypeCodeDetailsDtoImpl>
      get copyWith => __$$ReturnRequestTypeCodeDetailsDtoImplCopyWithImpl<
          _$ReturnRequestTypeCodeDetailsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReturnRequestTypeCodeDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _ReturnRequestTypeCodeDetailsDto
    extends ReturnRequestTypeCodeDetailsDto {
  const factory _ReturnRequestTypeCodeDetailsDto(
          {@JsonKey(name: 'returnCode', defaultValue: '')
          required final String returnCode,
          @JsonKey(name: 'returnDesc', defaultValue: '')
          required final String returnDescription}) =
      _$ReturnRequestTypeCodeDetailsDtoImpl;
  const _ReturnRequestTypeCodeDetailsDto._() : super._();

  factory _ReturnRequestTypeCodeDetailsDto.fromJson(Map<String, dynamic> json) =
      _$ReturnRequestTypeCodeDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'returnCode', defaultValue: '')
  String get returnCode;
  @override
  @JsonKey(name: 'returnDesc', defaultValue: '')
  String get returnDescription;
  @override
  @JsonKey(ignore: true)
  _$$ReturnRequestTypeCodeDetailsDtoImplCopyWith<
          _$ReturnRequestTypeCodeDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
