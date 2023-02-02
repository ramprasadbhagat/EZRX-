// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'approver_return_requests_id_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApproverReturnRequestsIdDto _$ApproverReturnRequestsIdDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnRequestsApproverRequestIdDto.fromJson(json);
}

/// @nodoc
mixin _$ApproverReturnRequestsIdDto {
  @JsonKey(name: 'requestId', defaultValue: '')
  String get requestId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproverReturnRequestsIdDtoCopyWith<ApproverReturnRequestsIdDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproverReturnRequestsIdDtoCopyWith<$Res> {
  factory $ApproverReturnRequestsIdDtoCopyWith(
          ApproverReturnRequestsIdDto value,
          $Res Function(ApproverReturnRequestsIdDto) then) =
      _$ApproverReturnRequestsIdDtoCopyWithImpl<$Res,
          ApproverReturnRequestsIdDto>;
  @useResult
  $Res call({@JsonKey(name: 'requestId', defaultValue: '') String requestId});
}

/// @nodoc
class _$ApproverReturnRequestsIdDtoCopyWithImpl<$Res,
        $Val extends ApproverReturnRequestsIdDto>
    implements $ApproverReturnRequestsIdDtoCopyWith<$Res> {
  _$ApproverReturnRequestsIdDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_ReturnRequestsApproverRequestIdDtoCopyWith<$Res>
    implements $ApproverReturnRequestsIdDtoCopyWith<$Res> {
  factory _$$_ReturnRequestsApproverRequestIdDtoCopyWith(
          _$_ReturnRequestsApproverRequestIdDto value,
          $Res Function(_$_ReturnRequestsApproverRequestIdDto) then) =
      __$$_ReturnRequestsApproverRequestIdDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'requestId', defaultValue: '') String requestId});
}

/// @nodoc
class __$$_ReturnRequestsApproverRequestIdDtoCopyWithImpl<$Res>
    extends _$ApproverReturnRequestsIdDtoCopyWithImpl<$Res,
        _$_ReturnRequestsApproverRequestIdDto>
    implements _$$_ReturnRequestsApproverRequestIdDtoCopyWith<$Res> {
  __$$_ReturnRequestsApproverRequestIdDtoCopyWithImpl(
      _$_ReturnRequestsApproverRequestIdDto _value,
      $Res Function(_$_ReturnRequestsApproverRequestIdDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$_ReturnRequestsApproverRequestIdDto(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnRequestsApproverRequestIdDto
    extends _ReturnRequestsApproverRequestIdDto {
  _$_ReturnRequestsApproverRequestIdDto(
      {@JsonKey(name: 'requestId', defaultValue: '') required this.requestId})
      : super._();

  factory _$_ReturnRequestsApproverRequestIdDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReturnRequestsApproverRequestIdDtoFromJson(json);

  @override
  @JsonKey(name: 'requestId', defaultValue: '')
  final String requestId;

  @override
  String toString() {
    return 'ApproverReturnRequestsIdDto(requestId: $requestId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnRequestsApproverRequestIdDto &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnRequestsApproverRequestIdDtoCopyWith<
          _$_ReturnRequestsApproverRequestIdDto>
      get copyWith => __$$_ReturnRequestsApproverRequestIdDtoCopyWithImpl<
          _$_ReturnRequestsApproverRequestIdDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnRequestsApproverRequestIdDtoToJson(
      this,
    );
  }
}

abstract class _ReturnRequestsApproverRequestIdDto
    extends ApproverReturnRequestsIdDto {
  factory _ReturnRequestsApproverRequestIdDto(
          {@JsonKey(name: 'requestId', defaultValue: '')
              required final String requestId}) =
      _$_ReturnRequestsApproverRequestIdDto;
  _ReturnRequestsApproverRequestIdDto._() : super._();

  factory _ReturnRequestsApproverRequestIdDto.fromJson(
          Map<String, dynamic> json) =
      _$_ReturnRequestsApproverRequestIdDto.fromJson;

  @override
  @JsonKey(name: 'requestId', defaultValue: '')
  String get requestId;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnRequestsApproverRequestIdDtoCopyWith<
          _$_ReturnRequestsApproverRequestIdDto>
      get copyWith => throw _privateConstructorUsedError;
}
