// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDto _$OrderHistoryDtoFromJson(Map<String, dynamic> json) {
  return _OrderHistoryItemDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDto {
  @JsonKey(name: 'OrderBasicInformation')
  OrderHistoryBasicInfoDto get orderBasicInformation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderItems')
  List<OrderHistoryItemDto> get orderItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDtoCopyWith<OrderHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDtoCopyWith<$Res> {
  factory $OrderHistoryDtoCopyWith(
          OrderHistoryDto value, $Res Function(OrderHistoryDto) then) =
      _$OrderHistoryDtoCopyWithImpl<$Res, OrderHistoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderBasicInformation')
          OrderHistoryBasicInfoDto orderBasicInformation,
      @JsonKey(name: 'OrderItems')
          List<OrderHistoryItemDto> orderItems});

  $OrderHistoryBasicInfoDtoCopyWith<$Res> get orderBasicInformation;
}

/// @nodoc
class _$OrderHistoryDtoCopyWithImpl<$Res, $Val extends OrderHistoryDto>
    implements $OrderHistoryDtoCopyWith<$Res> {
  _$OrderHistoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderBasicInformation = null,
    Object? orderItems = null,
  }) {
    return _then(_value.copyWith(
      orderBasicInformation: null == orderBasicInformation
          ? _value.orderBasicInformation
          : orderBasicInformation // ignore: cast_nullable_to_non_nullable
              as OrderHistoryBasicInfoDto,
      orderItems: null == orderItems
          ? _value.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItemDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryBasicInfoDtoCopyWith<$Res> get orderBasicInformation {
    return $OrderHistoryBasicInfoDtoCopyWith<$Res>(_value.orderBasicInformation,
        (value) {
      return _then(_value.copyWith(orderBasicInformation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryItemDtoCopyWith<$Res>
    implements $OrderHistoryDtoCopyWith<$Res> {
  factory _$$_OrderHistoryItemDtoCopyWith(_$_OrderHistoryItemDto value,
          $Res Function(_$_OrderHistoryItemDto) then) =
      __$$_OrderHistoryItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OrderBasicInformation')
          OrderHistoryBasicInfoDto orderBasicInformation,
      @JsonKey(name: 'OrderItems')
          List<OrderHistoryItemDto> orderItems});

  @override
  $OrderHistoryBasicInfoDtoCopyWith<$Res> get orderBasicInformation;
}

/// @nodoc
class __$$_OrderHistoryItemDtoCopyWithImpl<$Res>
    extends _$OrderHistoryDtoCopyWithImpl<$Res, _$_OrderHistoryItemDto>
    implements _$$_OrderHistoryItemDtoCopyWith<$Res> {
  __$$_OrderHistoryItemDtoCopyWithImpl(_$_OrderHistoryItemDto _value,
      $Res Function(_$_OrderHistoryItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderBasicInformation = null,
    Object? orderItems = null,
  }) {
    return _then(_$_OrderHistoryItemDto(
      orderBasicInformation: null == orderBasicInformation
          ? _value.orderBasicInformation
          : orderBasicInformation // ignore: cast_nullable_to_non_nullable
              as OrderHistoryBasicInfoDto,
      orderItems: null == orderItems
          ? _value._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryItemDto extends _OrderHistoryItemDto {
  const _$_OrderHistoryItemDto(
      {@JsonKey(name: 'OrderBasicInformation')
          required this.orderBasicInformation,
      @JsonKey(name: 'OrderItems')
          required final List<OrderHistoryItemDto> orderItems})
      : _orderItems = orderItems,
        super._();

  factory _$_OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderHistoryItemDtoFromJson(json);

  @override
  @JsonKey(name: 'OrderBasicInformation')
  final OrderHistoryBasicInfoDto orderBasicInformation;
  final List<OrderHistoryItemDto> _orderItems;
  @override
  @JsonKey(name: 'OrderItems')
  List<OrderHistoryItemDto> get orderItems {
    if (_orderItems is EqualUnmodifiableListView) return _orderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderItems);
  }

  @override
  String toString() {
    return 'OrderHistoryDto(orderBasicInformation: $orderBasicInformation, orderItems: $orderItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryItemDto &&
            (identical(other.orderBasicInformation, orderBasicInformation) ||
                other.orderBasicInformation == orderBasicInformation) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderBasicInformation,
      const DeepCollectionEquality().hash(_orderItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryItemDtoCopyWith<_$_OrderHistoryItemDto> get copyWith =>
      __$$_OrderHistoryItemDtoCopyWithImpl<_$_OrderHistoryItemDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryItemDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryItemDto extends OrderHistoryDto {
  const factory _OrderHistoryItemDto(
          {@JsonKey(name: 'OrderBasicInformation')
              required final OrderHistoryBasicInfoDto orderBasicInformation,
          @JsonKey(name: 'OrderItems')
              required final List<OrderHistoryItemDto> orderItems}) =
      _$_OrderHistoryItemDto;
  const _OrderHistoryItemDto._() : super._();

  factory _OrderHistoryItemDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryItemDto.fromJson;

  @override
  @JsonKey(name: 'OrderBasicInformation')
  OrderHistoryBasicInfoDto get orderBasicInformation;
  @override
  @JsonKey(name: 'OrderItems')
  List<OrderHistoryItemDto> get orderItems;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryItemDtoCopyWith<_$_OrderHistoryItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
