// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_return_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubmitReturnResponseDto _$SubmitReturnResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitReturnResponseDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitReturnResponseDto {
  @JsonKey(name: 'requestID', defaultValue: '')
  String get requestID => throw _privateConstructorUsedError;
  @JsonKey(name: 'messages', defaultValue: '')
  String get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitReturnResponseDtoCopyWith<SubmitReturnResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitReturnResponseDtoCopyWith<$Res> {
  factory $SubmitReturnResponseDtoCopyWith(SubmitReturnResponseDto value,
          $Res Function(SubmitReturnResponseDto) then) =
      _$SubmitReturnResponseDtoCopyWithImpl<$Res, SubmitReturnResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestID', defaultValue: '') String requestID,
      @JsonKey(name: 'messages', defaultValue: '') String messages});
}

/// @nodoc
class _$SubmitReturnResponseDtoCopyWithImpl<$Res,
        $Val extends SubmitReturnResponseDto>
    implements $SubmitReturnResponseDtoCopyWith<$Res> {
  _$SubmitReturnResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestID = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitReturnResponseDtoCopyWith<$Res>
    implements $SubmitReturnResponseDtoCopyWith<$Res> {
  factory _$$_SubmitReturnResponseDtoCopyWith(_$_SubmitReturnResponseDto value,
          $Res Function(_$_SubmitReturnResponseDto) then) =
      __$$_SubmitReturnResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestID', defaultValue: '') String requestID,
      @JsonKey(name: 'messages', defaultValue: '') String messages});
}

/// @nodoc
class __$$_SubmitReturnResponseDtoCopyWithImpl<$Res>
    extends _$SubmitReturnResponseDtoCopyWithImpl<$Res,
        _$_SubmitReturnResponseDto>
    implements _$$_SubmitReturnResponseDtoCopyWith<$Res> {
  __$$_SubmitReturnResponseDtoCopyWithImpl(_$_SubmitReturnResponseDto _value,
      $Res Function(_$_SubmitReturnResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestID = null,
    Object? messages = null,
  }) {
    return _then(_$_SubmitReturnResponseDto(
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubmitReturnResponseDto extends _SubmitReturnResponseDto {
  const _$_SubmitReturnResponseDto(
      {@JsonKey(name: 'requestID', defaultValue: '') required this.requestID,
      @JsonKey(name: 'messages', defaultValue: '') required this.messages})
      : super._();

  factory _$_SubmitReturnResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_SubmitReturnResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'requestID', defaultValue: '')
  final String requestID;
  @override
  @JsonKey(name: 'messages', defaultValue: '')
  final String messages;

  @override
  String toString() {
    return 'SubmitReturnResponseDto(requestID: $requestID, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitReturnResponseDto &&
            (identical(other.requestID, requestID) ||
                other.requestID == requestID) &&
            (identical(other.messages, messages) ||
                other.messages == messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestID, messages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitReturnResponseDtoCopyWith<_$_SubmitReturnResponseDto>
      get copyWith =>
          __$$_SubmitReturnResponseDtoCopyWithImpl<_$_SubmitReturnResponseDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubmitReturnResponseDtoToJson(
      this,
    );
  }
}

abstract class _SubmitReturnResponseDto extends SubmitReturnResponseDto {
  const factory _SubmitReturnResponseDto(
      {@JsonKey(name: 'requestID', defaultValue: '')
          required final String requestID,
      @JsonKey(name: 'messages', defaultValue: '')
          required final String messages}) = _$_SubmitReturnResponseDto;
  const _SubmitReturnResponseDto._() : super._();

  factory _SubmitReturnResponseDto.fromJson(Map<String, dynamic> json) =
      _$_SubmitReturnResponseDto.fromJson;

  @override
  @JsonKey(name: 'requestID', defaultValue: '')
  String get requestID;
  @override
  @JsonKey(name: 'messages', defaultValue: '')
  String get messages;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitReturnResponseDtoCopyWith<_$_SubmitReturnResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}
