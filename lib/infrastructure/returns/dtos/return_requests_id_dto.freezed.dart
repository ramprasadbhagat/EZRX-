// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_requests_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnRequestsIdDto _$ReturnRequestsIdDtoFromJson(Map<String, dynamic> json) {
  return _ReturnRequestsIdDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnRequestsIdDto {
  @JsonKey(name: 'requestId', defaultValue: '')
  String get requestId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnRequestsIdDtoCopyWith<ReturnRequestsIdDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestsIdDtoCopyWith<$Res> {
  factory $ReturnRequestsIdDtoCopyWith(
          ReturnRequestsIdDto value, $Res Function(ReturnRequestsIdDto) then) =
      _$ReturnRequestsIdDtoCopyWithImpl<$Res, ReturnRequestsIdDto>;
  @useResult
  $Res call({@JsonKey(name: 'requestId', defaultValue: '') String requestId});
}

/// @nodoc
class _$ReturnRequestsIdDtoCopyWithImpl<$Res, $Val extends ReturnRequestsIdDto>
    implements $ReturnRequestsIdDtoCopyWith<$Res> {
  _$ReturnRequestsIdDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnRequestsIdDtoCopyWith<$Res>
    implements $ReturnRequestsIdDtoCopyWith<$Res> {
  factory _$$_ReturnRequestsIdDtoCopyWith(_$_ReturnRequestsIdDto value,
          $Res Function(_$_ReturnRequestsIdDto) then) =
      __$$_ReturnRequestsIdDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'requestId', defaultValue: '') String requestId});
}

/// @nodoc
class __$$_ReturnRequestsIdDtoCopyWithImpl<$Res>
    extends _$ReturnRequestsIdDtoCopyWithImpl<$Res, _$_ReturnRequestsIdDto>
    implements _$$_ReturnRequestsIdDtoCopyWith<$Res> {
  __$$_ReturnRequestsIdDtoCopyWithImpl(_$_ReturnRequestsIdDto _value,
      $Res Function(_$_ReturnRequestsIdDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$_ReturnRequestsIdDto(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnRequestsIdDto extends _ReturnRequestsIdDto {
  _$_ReturnRequestsIdDto(
      {@JsonKey(name: 'requestId', defaultValue: '') required this.requestId})
      : super._();

  factory _$_ReturnRequestsIdDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnRequestsIdDtoFromJson(json);

  @override
  @JsonKey(name: 'requestId', defaultValue: '')
  final String requestId;

  @override
  String toString() {
    return 'ReturnRequestsIdDto(requestId: $requestId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnRequestsIdDto &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnRequestsIdDtoCopyWith<_$_ReturnRequestsIdDto> get copyWith =>
      __$$_ReturnRequestsIdDtoCopyWithImpl<_$_ReturnRequestsIdDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnRequestsIdDtoToJson(
      this,
    );
  }
}

abstract class _ReturnRequestsIdDto extends ReturnRequestsIdDto {
  factory _ReturnRequestsIdDto(
      {@JsonKey(name: 'requestId', defaultValue: '')
          required final String requestId}) = _$_ReturnRequestsIdDto;
  _ReturnRequestsIdDto._() : super._();

  factory _ReturnRequestsIdDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnRequestsIdDto.fromJson;

  @override
  @JsonKey(name: 'requestId', defaultValue: '')
  String get requestId;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnRequestsIdDtoCopyWith<_$_ReturnRequestsIdDto> get copyWith =>
      throw _privateConstructorUsedError;
}
