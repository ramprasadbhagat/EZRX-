// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViewByOrderHistoryDto _$ViewByOrderHistoryDtoFromJson(
    Map<String, dynamic> json) {
  return _ViewByOrderHistoryDto.fromJson(json);
}

/// @nodoc
mixin _$ViewByOrderHistoryDto {
  @JsonKey(name: 'orderCount', defaultValue: 0)
  int get orderCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
  List<String> get creatingOrderIds => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'orderHeaders',
      defaultValue: <OrderHistoryDetailsOrderHeadersDto>[])
  List<OrderHistoryDetailsOrderHeadersDto> get orderHeaders =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewByOrderHistoryDtoCopyWith<ViewByOrderHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderHistoryDtoCopyWith<$Res> {
  factory $ViewByOrderHistoryDtoCopyWith(ViewByOrderHistoryDto value,
          $Res Function(ViewByOrderHistoryDto) then) =
      _$ViewByOrderHistoryDtoCopyWithImpl<$Res, ViewByOrderHistoryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCount', defaultValue: 0)
          int orderCount,
      @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
          List<String> creatingOrderIds,
      @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsOrderHeadersDto>[])
          List<OrderHistoryDetailsOrderHeadersDto> orderHeaders});
}

/// @nodoc
class _$ViewByOrderHistoryDtoCopyWithImpl<$Res,
        $Val extends ViewByOrderHistoryDto>
    implements $ViewByOrderHistoryDtoCopyWith<$Res> {
  _$ViewByOrderHistoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCount = null,
    Object? creatingOrderIds = null,
    Object? orderHeaders = null,
  }) {
    return _then(_value.copyWith(
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      creatingOrderIds: null == creatingOrderIds
          ? _value.creatingOrderIds
          : creatingOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orderHeaders: null == orderHeaders
          ? _value.orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderHeadersDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByOrderHistoryDtoCopyWith<$Res>
    implements $ViewByOrderHistoryDtoCopyWith<$Res> {
  factory _$$_ViewByOrderHistoryDtoCopyWith(_$_ViewByOrderHistoryDto value,
          $Res Function(_$_ViewByOrderHistoryDto) then) =
      __$$_ViewByOrderHistoryDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCount', defaultValue: 0)
          int orderCount,
      @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
          List<String> creatingOrderIds,
      @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsOrderHeadersDto>[])
          List<OrderHistoryDetailsOrderHeadersDto> orderHeaders});
}

/// @nodoc
class __$$_ViewByOrderHistoryDtoCopyWithImpl<$Res>
    extends _$ViewByOrderHistoryDtoCopyWithImpl<$Res, _$_ViewByOrderHistoryDto>
    implements _$$_ViewByOrderHistoryDtoCopyWith<$Res> {
  __$$_ViewByOrderHistoryDtoCopyWithImpl(_$_ViewByOrderHistoryDto _value,
      $Res Function(_$_ViewByOrderHistoryDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderCount = null,
    Object? creatingOrderIds = null,
    Object? orderHeaders = null,
  }) {
    return _then(_$_ViewByOrderHistoryDto(
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      creatingOrderIds: null == creatingOrderIds
          ? _value._creatingOrderIds
          : creatingOrderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orderHeaders: null == orderHeaders
          ? _value._orderHeaders
          : orderHeaders // ignore: cast_nullable_to_non_nullable
              as List<OrderHistoryDetailsOrderHeadersDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ViewByOrderHistoryDto extends _ViewByOrderHistoryDto {
  const _$_ViewByOrderHistoryDto(
      {@JsonKey(name: 'orderCount', defaultValue: 0)
          required this.orderCount,
      @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
          required final List<String> creatingOrderIds,
      @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsOrderHeadersDto>[])
          required final List<OrderHistoryDetailsOrderHeadersDto> orderHeaders})
      : _creatingOrderIds = creatingOrderIds,
        _orderHeaders = orderHeaders,
        super._();

  factory _$_ViewByOrderHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$$_ViewByOrderHistoryDtoFromJson(json);

  @override
  @JsonKey(name: 'orderCount', defaultValue: 0)
  final int orderCount;
  final List<String> _creatingOrderIds;
  @override
  @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
  List<String> get creatingOrderIds {
    if (_creatingOrderIds is EqualUnmodifiableListView)
      return _creatingOrderIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creatingOrderIds);
  }

  final List<OrderHistoryDetailsOrderHeadersDto> _orderHeaders;
  @override
  @JsonKey(
      name: 'orderHeaders',
      defaultValue: <OrderHistoryDetailsOrderHeadersDto>[])
  List<OrderHistoryDetailsOrderHeadersDto> get orderHeaders {
    if (_orderHeaders is EqualUnmodifiableListView) return _orderHeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderHeaders);
  }

  @override
  String toString() {
    return 'ViewByOrderHistoryDto(orderCount: $orderCount, creatingOrderIds: $creatingOrderIds, orderHeaders: $orderHeaders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderHistoryDto &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            const DeepCollectionEquality()
                .equals(other._creatingOrderIds, _creatingOrderIds) &&
            const DeepCollectionEquality()
                .equals(other._orderHeaders, _orderHeaders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderCount,
      const DeepCollectionEquality().hash(_creatingOrderIds),
      const DeepCollectionEquality().hash(_orderHeaders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderHistoryDtoCopyWith<_$_ViewByOrderHistoryDto> get copyWith =>
      __$$_ViewByOrderHistoryDtoCopyWithImpl<_$_ViewByOrderHistoryDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViewByOrderHistoryDtoToJson(
      this,
    );
  }
}

abstract class _ViewByOrderHistoryDto extends ViewByOrderHistoryDto {
  const factory _ViewByOrderHistoryDto(
      {@JsonKey(name: 'orderCount', defaultValue: 0)
          required final int orderCount,
      @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
          required final List<String> creatingOrderIds,
      @JsonKey(name: 'orderHeaders', defaultValue: <OrderHistoryDetailsOrderHeadersDto>[])
          required final List<OrderHistoryDetailsOrderHeadersDto> orderHeaders}) = _$_ViewByOrderHistoryDto;
  const _ViewByOrderHistoryDto._() : super._();

  factory _ViewByOrderHistoryDto.fromJson(Map<String, dynamic> json) =
      _$_ViewByOrderHistoryDto.fromJson;

  @override
  @JsonKey(name: 'orderCount', defaultValue: 0)
  int get orderCount;
  @override
  @JsonKey(name: 'creatingOrderIds', defaultValue: <String>[])
  List<String> get creatingOrderIds;
  @override
  @JsonKey(
      name: 'orderHeaders',
      defaultValue: <OrderHistoryDetailsOrderHeadersDto>[])
  List<OrderHistoryDetailsOrderHeadersDto> get orderHeaders;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderHistoryDtoCopyWith<_$_ViewByOrderHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}
