// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_order_items_tender_contract_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryDetailsOrderItemTenderContractDetailsDto
    _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoFromJson(
        Map<String, dynamic> json) {
  return _OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsOrderItemTenderContractDetailsDto {
  @JsonKey(name: 'TenderContractNumber')
  String get tenderContractNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'TenderContractReference')
  String get tenderContractReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'TenderPackageDescription')
  String get tenderPackageDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<
          OrderHistoryDetailsOrderItemTenderContractDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<
    $Res> {
  factory $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith(
          OrderHistoryDetailsOrderItemTenderContractDetailsDto value,
          $Res Function(OrderHistoryDetailsOrderItemTenderContractDetailsDto)
              then) =
      _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'TenderContractNumber')
          String tenderContractNumber,
      @JsonKey(name: 'TenderContractReference')
          String tenderContractReference,
      @JsonKey(name: 'TenderPackageDescription')
          String tenderPackageDescription});
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<$Res>
    implements
        $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl(
      this._value, this._then);

  final OrderHistoryDetailsOrderItemTenderContractDetailsDto _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryDetailsOrderItemTenderContractDetailsDto)
      _then;

  @override
  $Res call({
    Object? tenderContractNumber = freezed,
    Object? tenderContractReference = freezed,
    Object? tenderPackageDescription = freezed,
  }) {
    return _then(_value.copyWith(
      tenderContractNumber: tenderContractNumber == freezed
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractReference: tenderContractReference == freezed
          ? _value.tenderContractReference
          : tenderContractReference // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPackageDescription: tenderPackageDescription == freezed
          ? _value.tenderPackageDescription
          : tenderPackageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<
        $Res>
    implements
        $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith(
          _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto value,
          $Res Function(_$_OrderHistoryDetailsOrderItemTenderContractDetailsDto)
              then) =
      __$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<
          $Res>;
  @override
  $Res call(
      {@JsonKey(name: 'TenderContractNumber')
          String tenderContractNumber,
      @JsonKey(name: 'TenderContractReference')
          String tenderContractReference,
      @JsonKey(name: 'TenderPackageDescription')
          String tenderPackageDescription});
}

/// @nodoc
class __$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<
        $Res>
    extends _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<
        $Res>
    implements
        _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl(
      _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto _value,
      $Res Function(_$_OrderHistoryDetailsOrderItemTenderContractDetailsDto)
          _then)
      : super(
            _value,
            (v) => _then(
                v as _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto));

  @override
  _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto get _value =>
      super._value as _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto;

  @override
  $Res call({
    Object? tenderContractNumber = freezed,
    Object? tenderContractReference = freezed,
    Object? tenderPackageDescription = freezed,
  }) {
    return _then(_$_OrderHistoryDetailsOrderItemTenderContractDetailsDto(
      tenderContractNumber: tenderContractNumber == freezed
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractReference: tenderContractReference == freezed
          ? _value.tenderContractReference
          : tenderContractReference // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPackageDescription: tenderPackageDescription == freezed
          ? _value.tenderPackageDescription
          : tenderPackageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto
    extends _OrderHistoryDetailsOrderItemTenderContractDetailsDto {
  const _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto(
      {@JsonKey(name: 'TenderContractNumber')
          required this.tenderContractNumber,
      @JsonKey(name: 'TenderContractReference')
          required this.tenderContractReference,
      @JsonKey(name: 'TenderPackageDescription')
          required this.tenderPackageDescription})
      : super._();

  factory _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoFromJson(json);

  @override
  @JsonKey(name: 'TenderContractNumber')
  final String tenderContractNumber;
  @override
  @JsonKey(name: 'TenderContractReference')
  final String tenderContractReference;
  @override
  @JsonKey(name: 'TenderPackageDescription')
  final String tenderPackageDescription;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItemTenderContractDetailsDto(tenderContractNumber: $tenderContractNumber, tenderContractReference: $tenderContractReference, tenderPackageDescription: $tenderPackageDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto &&
            const DeepCollectionEquality()
                .equals(other.tenderContractNumber, tenderContractNumber) &&
            const DeepCollectionEquality().equals(
                other.tenderContractReference, tenderContractReference) &&
            const DeepCollectionEquality().equals(
                other.tenderPackageDescription, tenderPackageDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tenderContractNumber),
      const DeepCollectionEquality().hash(tenderContractReference),
      const DeepCollectionEquality().hash(tenderPackageDescription));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<
          _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto>
      get copyWith =>
          __$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<
                  _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsOrderItemTenderContractDetailsDto
    extends OrderHistoryDetailsOrderItemTenderContractDetailsDto {
  const factory _OrderHistoryDetailsOrderItemTenderContractDetailsDto(
          {@JsonKey(name: 'TenderContractNumber')
              required final String tenderContractNumber,
          @JsonKey(name: 'TenderContractReference')
              required final String tenderContractReference,
          @JsonKey(name: 'TenderPackageDescription')
              required final String tenderPackageDescription}) =
      _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto;
  const _OrderHistoryDetailsOrderItemTenderContractDetailsDto._() : super._();

  factory _OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(
          Map<String, dynamic> json) =
      _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson;

  @override
  @JsonKey(name: 'TenderContractNumber')
  String get tenderContractNumber;
  @override
  @JsonKey(name: 'TenderContractReference')
  String get tenderContractReference;
  @override
  @JsonKey(name: 'TenderPackageDescription')
  String get tenderPackageDescription;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<
          _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}
