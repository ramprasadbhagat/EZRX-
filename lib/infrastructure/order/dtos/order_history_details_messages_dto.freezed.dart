// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_messages_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDetailsMessagesDto _$OrderHistoryDetailsMessagesDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsMessagesDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsMessagesDto {
  @JsonKey(name: 'Type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message', defaultValue: '')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsMessagesDtoCopyWith<OrderHistoryDetailsMessagesDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsMessagesDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsMessagesDtoCopyWith(
          OrderHistoryDetailsMessagesDto value,
          $Res Function(OrderHistoryDetailsMessagesDto) then) =
      _$OrderHistoryDetailsMessagesDtoCopyWithImpl<$Res,
          OrderHistoryDetailsMessagesDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'Message', defaultValue: '') String message});
}

/// @nodoc
class _$OrderHistoryDetailsMessagesDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsMessagesDto>
    implements $OrderHistoryDetailsMessagesDtoCopyWith<$Res> {
  _$OrderHistoryDetailsMessagesDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_OrderHistoryDetailsMessagesDtoCopyWith<$Res>
    implements $OrderHistoryDetailsMessagesDtoCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsMessagesDtoCopyWith(
          _$_OrderHistoryDetailsMessagesDto value,
          $Res Function(_$_OrderHistoryDetailsMessagesDto) then) =
      __$$_OrderHistoryDetailsMessagesDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '') String type,
      @JsonKey(name: 'Message', defaultValue: '') String message});
}

/// @nodoc
class __$$_OrderHistoryDetailsMessagesDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsMessagesDtoCopyWithImpl<$Res,
        _$_OrderHistoryDetailsMessagesDto>
    implements _$$_OrderHistoryDetailsMessagesDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsMessagesDtoCopyWithImpl(
      _$_OrderHistoryDetailsMessagesDto _value,
      $Res Function(_$_OrderHistoryDetailsMessagesDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
  }) {
    return _then(_$_OrderHistoryDetailsMessagesDto(
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
class _$_OrderHistoryDetailsMessagesDto
    extends _OrderHistoryDetailsMessagesDto {
  const _$_OrderHistoryDetailsMessagesDto(
      {@JsonKey(name: 'Type', defaultValue: '') required this.type,
      @JsonKey(name: 'Message', defaultValue: '') required this.message})
      : super._();

  factory _$_OrderHistoryDetailsMessagesDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsMessagesDtoFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'Message', defaultValue: '')
  final String message;

  @override
  String toString() {
    return 'OrderHistoryDetailsMessagesDto(type: $type, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsMessagesDto &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailsMessagesDtoCopyWith<_$_OrderHistoryDetailsMessagesDto>
      get copyWith => __$$_OrderHistoryDetailsMessagesDtoCopyWithImpl<
          _$_OrderHistoryDetailsMessagesDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryDetailsMessagesDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsMessagesDto
    extends OrderHistoryDetailsMessagesDto {
  const factory _OrderHistoryDetailsMessagesDto(
      {@JsonKey(name: 'Type', defaultValue: '')
          required final String type,
      @JsonKey(name: 'Message', defaultValue: '')
          required final String message}) = _$_OrderHistoryDetailsMessagesDto;
  const _OrderHistoryDetailsMessagesDto._() : super._();

  factory _OrderHistoryDetailsMessagesDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryDetailsMessagesDto.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'Message', defaultValue: '')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsMessagesDtoCopyWith<_$_OrderHistoryDetailsMessagesDto>
      get copyWith => throw _privateConstructorUsedError;
}
