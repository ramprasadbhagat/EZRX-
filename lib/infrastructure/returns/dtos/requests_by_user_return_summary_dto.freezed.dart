// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'requests_by_user_return_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnSummaryRequestByUserDto _$ReturnSummaryRequestByUserDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnSummaryRequestByUserDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnSummaryRequestByUserDto {
  @JsonKey(name: 'requestID', defaultValue: '')
  String get requestID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnSummaryRequestByUserDtoCopyWith<ReturnSummaryRequestByUserDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryRequestByUserDtoCopyWith<$Res> {
  factory $ReturnSummaryRequestByUserDtoCopyWith(
          ReturnSummaryRequestByUserDto value,
          $Res Function(ReturnSummaryRequestByUserDto) then) =
      _$ReturnSummaryRequestByUserDtoCopyWithImpl<$Res,
          ReturnSummaryRequestByUserDto>;
  @useResult
  $Res call({@JsonKey(name: 'requestID', defaultValue: '') String requestID});
}

/// @nodoc
class _$ReturnSummaryRequestByUserDtoCopyWithImpl<$Res,
        $Val extends ReturnSummaryRequestByUserDto>
    implements $ReturnSummaryRequestByUserDtoCopyWith<$Res> {
  _$ReturnSummaryRequestByUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestID = null,
  }) {
    return _then(_value.copyWith(
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryRequestByUserDtoCopyWith<$Res>
    implements $ReturnSummaryRequestByUserDtoCopyWith<$Res> {
  factory _$$_ReturnSummaryRequestByUserDtoCopyWith(
          _$_ReturnSummaryRequestByUserDto value,
          $Res Function(_$_ReturnSummaryRequestByUserDto) then) =
      __$$_ReturnSummaryRequestByUserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'requestID', defaultValue: '') String requestID});
}

/// @nodoc
class __$$_ReturnSummaryRequestByUserDtoCopyWithImpl<$Res>
    extends _$ReturnSummaryRequestByUserDtoCopyWithImpl<$Res,
        _$_ReturnSummaryRequestByUserDto>
    implements _$$_ReturnSummaryRequestByUserDtoCopyWith<$Res> {
  __$$_ReturnSummaryRequestByUserDtoCopyWithImpl(
      _$_ReturnSummaryRequestByUserDto _value,
      $Res Function(_$_ReturnSummaryRequestByUserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestID = null,
  }) {
    return _then(_$_ReturnSummaryRequestByUserDto(
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnSummaryRequestByUserDto extends _ReturnSummaryRequestByUserDto {
  const _$_ReturnSummaryRequestByUserDto(
      {@JsonKey(name: 'requestID', defaultValue: '') required this.requestID})
      : super._();

  factory _$_ReturnSummaryRequestByUserDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReturnSummaryRequestByUserDtoFromJson(json);

  @override
  @JsonKey(name: 'requestID', defaultValue: '')
  final String requestID;

  @override
  String toString() {
    return 'ReturnSummaryRequestByUserDto(requestID: $requestID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryRequestByUserDto &&
            (identical(other.requestID, requestID) ||
                other.requestID == requestID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryRequestByUserDtoCopyWith<_$_ReturnSummaryRequestByUserDto>
      get copyWith => __$$_ReturnSummaryRequestByUserDtoCopyWithImpl<
          _$_ReturnSummaryRequestByUserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnSummaryRequestByUserDtoToJson(
      this,
    );
  }
}

abstract class _ReturnSummaryRequestByUserDto
    extends ReturnSummaryRequestByUserDto {
  const factory _ReturnSummaryRequestByUserDto(
      {@JsonKey(name: 'requestID', defaultValue: '')
          required final String requestID}) = _$_ReturnSummaryRequestByUserDto;
  const _ReturnSummaryRequestByUserDto._() : super._();

  factory _ReturnSummaryRequestByUserDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnSummaryRequestByUserDto.fromJson;

  @override
  @JsonKey(name: 'requestID', defaultValue: '')
  String get requestID;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryRequestByUserDtoCopyWith<_$_ReturnSummaryRequestByUserDto>
      get copyWith => throw _privateConstructorUsedError;
}
