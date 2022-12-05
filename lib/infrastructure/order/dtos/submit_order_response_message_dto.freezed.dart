// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'submit_order_response_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubmitOrderResponseMessageDto _$SubmitOrderResponseMessageDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitOrderResponseMessageDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitOrderResponseMessageDto {
  @JsonKey(name: 'Type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message', defaultValue: '')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitOrderResponseMessageDtoCopyWith<SubmitOrderResponseMessageDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitOrderResponseMessageDtoCopyWith<$Res> {
  factory $SubmitOrderResponseMessageDtoCopyWith(
          SubmitOrderResponseMessageDto value,
          $Res Function(SubmitOrderResponseMessageDto) then) =
      _$SubmitOrderResponseMessageDtoCopyWithImpl<$Res,
          SubmitOrderResponseMessageDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'Message', defaultValue: '') String message});
}

/// @nodoc
class _$SubmitOrderResponseMessageDtoCopyWithImpl<$Res,
        $Val extends SubmitOrderResponseMessageDto>
    implements $SubmitOrderResponseMessageDtoCopyWith<$Res> {
  _$SubmitOrderResponseMessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitOrderResponseMessageDtoCopyWith<$Res>
    implements $SubmitOrderResponseMessageDtoCopyWith<$Res> {
  factory _$$_SubmitOrderResponseMessageDtoCopyWith(
          _$_SubmitOrderResponseMessageDto value,
          $Res Function(_$_SubmitOrderResponseMessageDto) then) =
      __$$_SubmitOrderResponseMessageDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'Message', defaultValue: '') String message});
}

/// @nodoc
class __$$_SubmitOrderResponseMessageDtoCopyWithImpl<$Res>
    extends _$SubmitOrderResponseMessageDtoCopyWithImpl<$Res,
        _$_SubmitOrderResponseMessageDto>
    implements _$$_SubmitOrderResponseMessageDtoCopyWith<$Res> {
  __$$_SubmitOrderResponseMessageDtoCopyWithImpl(
      _$_SubmitOrderResponseMessageDto _value,
      $Res Function(_$_SubmitOrderResponseMessageDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_$_SubmitOrderResponseMessageDto(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubmitOrderResponseMessageDto extends _SubmitOrderResponseMessageDto {
  const _$_SubmitOrderResponseMessageDto(
      {@JsonKey(name: 'Type', defaultValue: '') required this.type,
      @JsonKey(name: 'Message', defaultValue: '') required this.message})
      : super._();

  factory _$_SubmitOrderResponseMessageDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_SubmitOrderResponseMessageDtoFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'Message', defaultValue: '')
  final String message;

  @override
  String toString() {
    return 'SubmitOrderResponseMessageDto(type: $type, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitOrderResponseMessageDto &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitOrderResponseMessageDtoCopyWith<_$_SubmitOrderResponseMessageDto>
      get copyWith => __$$_SubmitOrderResponseMessageDtoCopyWithImpl<
          _$_SubmitOrderResponseMessageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubmitOrderResponseMessageDtoToJson(
      this,
    );
  }
}

abstract class _SubmitOrderResponseMessageDto
    extends SubmitOrderResponseMessageDto {
  const factory _SubmitOrderResponseMessageDto(
      {@JsonKey(name: 'Type', defaultValue: '')
          required final String type,
      @JsonKey(name: 'Message', defaultValue: '')
          required final String message}) = _$_SubmitOrderResponseMessageDto;
  const _SubmitOrderResponseMessageDto._() : super._();

  factory _SubmitOrderResponseMessageDto.fromJson(Map<String, dynamic> json) =
      _$_SubmitOrderResponseMessageDto.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'Message', defaultValue: '')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitOrderResponseMessageDtoCopyWith<_$_SubmitOrderResponseMessageDto>
      get copyWith => throw _privateConstructorUsedError;
}
