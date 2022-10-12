// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_basicInfo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryBasicInfoDto _$OrderHistoryBasicInfoDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryBasicInfoDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryBasicInfoDto {
  @JsonKey(name: 'SoldTo')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShipTo')
  String get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompanyName')
  String get companyName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryBasicInfoDtoCopyWith<OrderHistoryBasicInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryBasicInfoDtoCopyWith<$Res> {
  factory $OrderHistoryBasicInfoDtoCopyWith(OrderHistoryBasicInfoDto value,
          $Res Function(OrderHistoryBasicInfoDto) then) =
      _$OrderHistoryBasicInfoDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'SoldTo') String soldTo,
      @JsonKey(name: 'ShipTo') String shipTo,
      @JsonKey(name: 'CompanyName') String companyName});
}

/// @nodoc
class _$OrderHistoryBasicInfoDtoCopyWithImpl<$Res>
    implements $OrderHistoryBasicInfoDtoCopyWith<$Res> {
  _$OrderHistoryBasicInfoDtoCopyWithImpl(this._value, this._then);

  final OrderHistoryBasicInfoDto _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryBasicInfoDto) _then;

  @override
  $Res call({
    Object? soldTo = freezed,
    Object? shipTo = freezed,
    Object? companyName = freezed,
  }) {
    return _then(_value.copyWith(
      soldTo: soldTo == freezed
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: shipTo == freezed
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderHistoryBasicInfoDtoCopyWith<$Res>
    implements $OrderHistoryBasicInfoDtoCopyWith<$Res> {
  factory _$$_OrderHistoryBasicInfoDtoCopyWith(
          _$_OrderHistoryBasicInfoDto value,
          $Res Function(_$_OrderHistoryBasicInfoDto) then) =
      __$$_OrderHistoryBasicInfoDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'SoldTo') String soldTo,
      @JsonKey(name: 'ShipTo') String shipTo,
      @JsonKey(name: 'CompanyName') String companyName});
}

/// @nodoc
class __$$_OrderHistoryBasicInfoDtoCopyWithImpl<$Res>
    extends _$OrderHistoryBasicInfoDtoCopyWithImpl<$Res>
    implements _$$_OrderHistoryBasicInfoDtoCopyWith<$Res> {
  __$$_OrderHistoryBasicInfoDtoCopyWithImpl(_$_OrderHistoryBasicInfoDto _value,
      $Res Function(_$_OrderHistoryBasicInfoDto) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryBasicInfoDto));

  @override
  _$_OrderHistoryBasicInfoDto get _value =>
      super._value as _$_OrderHistoryBasicInfoDto;

  @override
  $Res call({
    Object? soldTo = freezed,
    Object? shipTo = freezed,
    Object? companyName = freezed,
  }) {
    return _then(_$_OrderHistoryBasicInfoDto(
      soldTo: soldTo == freezed
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: shipTo == freezed
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryBasicInfoDto extends _OrderHistoryBasicInfoDto {
  const _$_OrderHistoryBasicInfoDto(
      {@JsonKey(name: 'SoldTo') required this.soldTo,
      @JsonKey(name: 'ShipTo') required this.shipTo,
      @JsonKey(name: 'CompanyName') required this.companyName})
      : super._();

  factory _$_OrderHistoryBasicInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_OrderHistoryBasicInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'SoldTo')
  final String soldTo;
  @override
  @JsonKey(name: 'ShipTo')
  final String shipTo;
  @override
  @JsonKey(name: 'CompanyName')
  final String companyName;

  @override
  String toString() {
    return 'OrderHistoryBasicInfoDto(soldTo: $soldTo, shipTo: $shipTo, companyName: $companyName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryBasicInfoDto &&
            const DeepCollectionEquality().equals(other.soldTo, soldTo) &&
            const DeepCollectionEquality().equals(other.shipTo, shipTo) &&
            const DeepCollectionEquality()
                .equals(other.companyName, companyName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(soldTo),
      const DeepCollectionEquality().hash(shipTo),
      const DeepCollectionEquality().hash(companyName));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryBasicInfoDtoCopyWith<_$_OrderHistoryBasicInfoDto>
      get copyWith => __$$_OrderHistoryBasicInfoDtoCopyWithImpl<
          _$_OrderHistoryBasicInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryBasicInfoDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryBasicInfoDto extends OrderHistoryBasicInfoDto {
  const factory _OrderHistoryBasicInfoDto(
          {@JsonKey(name: 'SoldTo') required final String soldTo,
          @JsonKey(name: 'ShipTo') required final String shipTo,
          @JsonKey(name: 'CompanyName') required final String companyName}) =
      _$_OrderHistoryBasicInfoDto;
  const _OrderHistoryBasicInfoDto._() : super._();

  factory _OrderHistoryBasicInfoDto.fromJson(Map<String, dynamic> json) =
      _$_OrderHistoryBasicInfoDto.fromJson;

  @override
  @JsonKey(name: 'SoldTo')
  String get soldTo;
  @override
  @JsonKey(name: 'ShipTo')
  String get shipTo;
  @override
  @JsonKey(name: 'CompanyName')
  String get companyName;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryBasicInfoDtoCopyWith<_$_OrderHistoryBasicInfoDto>
      get copyWith => throw _privateConstructorUsedError;
}
