// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: 'ContractNumber', defaultValue: '')
  String get tenderContractNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ContractReference', defaultValue: '')
  String get tenderContractReference => throw _privateConstructorUsedError;

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
      _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<$Res,
          OrderHistoryDetailsOrderItemTenderContractDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ContractNumber', defaultValue: '')
      String tenderContractNumber,
      @JsonKey(name: 'ContractReference', defaultValue: '')
      String tenderContractReference});
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsOrderItemTenderContractDetailsDto>
    implements
        $OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContractNumber = null,
    Object? tenderContractReference = null,
  }) {
    return _then(_value.copyWith(
      tenderContractNumber: null == tenderContractNumber
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractReference: null == tenderContractReference
          ? _value.tenderContractReference
          : tenderContractReference // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  @useResult
  $Res call(
      {@JsonKey(name: 'ContractNumber', defaultValue: '')
      String tenderContractNumber,
      @JsonKey(name: 'ContractReference', defaultValue: '')
      String tenderContractReference});
}

/// @nodoc
class __$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<
        $Res>
    extends _$OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl<
        $Res, _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto>
    implements
        _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<$Res> {
  __$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWithImpl(
      _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto _value,
      $Res Function(_$_OrderHistoryDetailsOrderItemTenderContractDetailsDto)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContractNumber = null,
    Object? tenderContractReference = null,
  }) {
    return _then(_$_OrderHistoryDetailsOrderItemTenderContractDetailsDto(
      tenderContractNumber: null == tenderContractNumber
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractReference: null == tenderContractReference
          ? _value.tenderContractReference
          : tenderContractReference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto
    extends _OrderHistoryDetailsOrderItemTenderContractDetailsDto {
  const _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto(
      {@JsonKey(name: 'ContractNumber', defaultValue: '')
      required this.tenderContractNumber,
      @JsonKey(name: 'ContractReference', defaultValue: '')
      required this.tenderContractReference})
      : super._();

  factory _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoFromJson(json);

  @override
  @JsonKey(name: 'ContractNumber', defaultValue: '')
  final String tenderContractNumber;
  @override
  @JsonKey(name: 'ContractReference', defaultValue: '')
  final String tenderContractReference;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItemTenderContractDetailsDto(tenderContractNumber: $tenderContractNumber, tenderContractReference: $tenderContractReference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto &&
            (identical(other.tenderContractNumber, tenderContractNumber) ||
                other.tenderContractNumber == tenderContractNumber) &&
            (identical(
                    other.tenderContractReference, tenderContractReference) ||
                other.tenderContractReference == tenderContractReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tenderContractNumber, tenderContractReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
          {@JsonKey(name: 'ContractNumber', defaultValue: '')
          required final String tenderContractNumber,
          @JsonKey(name: 'ContractReference', defaultValue: '')
          required final String tenderContractReference}) =
      _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto;
  const _OrderHistoryDetailsOrderItemTenderContractDetailsDto._() : super._();

  factory _OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson(
          Map<String, dynamic> json) =
      _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto.fromJson;

  @override
  @JsonKey(name: 'ContractNumber', defaultValue: '')
  String get tenderContractNumber;
  @override
  @JsonKey(name: 'ContractReference', defaultValue: '')
  String get tenderContractReference;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsOrderItemTenderContractDetailsDtoCopyWith<
          _$_OrderHistoryDetailsOrderItemTenderContractDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}
