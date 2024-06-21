// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_basic_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @JsonKey(name: 'PaymentTerm')
  PaymentTermDto get paymentTerm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryBasicInfoDtoCopyWith<OrderHistoryBasicInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryBasicInfoDtoCopyWith<$Res> {
  factory $OrderHistoryBasicInfoDtoCopyWith(OrderHistoryBasicInfoDto value,
          $Res Function(OrderHistoryBasicInfoDto) then) =
      _$OrderHistoryBasicInfoDtoCopyWithImpl<$Res, OrderHistoryBasicInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SoldTo') String soldTo,
      @JsonKey(name: 'ShipTo') String shipTo,
      @JsonKey(name: 'CompanyName') String companyName,
      @JsonKey(name: 'PaymentTerm') PaymentTermDto paymentTerm});

  $PaymentTermDtoCopyWith<$Res> get paymentTerm;
}

/// @nodoc
class _$OrderHistoryBasicInfoDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryBasicInfoDto>
    implements $OrderHistoryBasicInfoDtoCopyWith<$Res> {
  _$OrderHistoryBasicInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? paymentTerm = null,
  }) {
    return _then(_value.copyWith(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as PaymentTermDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentTermDtoCopyWith<$Res> get paymentTerm {
    return $PaymentTermDtoCopyWith<$Res>(_value.paymentTerm, (value) {
      return _then(_value.copyWith(paymentTerm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryBasicInfoDtoImplCopyWith<$Res>
    implements $OrderHistoryBasicInfoDtoCopyWith<$Res> {
  factory _$$OrderHistoryBasicInfoDtoImplCopyWith(
          _$OrderHistoryBasicInfoDtoImpl value,
          $Res Function(_$OrderHistoryBasicInfoDtoImpl) then) =
      __$$OrderHistoryBasicInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SoldTo') String soldTo,
      @JsonKey(name: 'ShipTo') String shipTo,
      @JsonKey(name: 'CompanyName') String companyName,
      @JsonKey(name: 'PaymentTerm') PaymentTermDto paymentTerm});

  @override
  $PaymentTermDtoCopyWith<$Res> get paymentTerm;
}

/// @nodoc
class __$$OrderHistoryBasicInfoDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryBasicInfoDtoCopyWithImpl<$Res,
        _$OrderHistoryBasicInfoDtoImpl>
    implements _$$OrderHistoryBasicInfoDtoImplCopyWith<$Res> {
  __$$OrderHistoryBasicInfoDtoImplCopyWithImpl(
      _$OrderHistoryBasicInfoDtoImpl _value,
      $Res Function(_$OrderHistoryBasicInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? paymentTerm = null,
  }) {
    return _then(_$OrderHistoryBasicInfoDtoImpl(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as PaymentTermDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryBasicInfoDtoImpl extends _OrderHistoryBasicInfoDto {
  const _$OrderHistoryBasicInfoDtoImpl(
      {@JsonKey(name: 'SoldTo') required this.soldTo,
      @JsonKey(name: 'ShipTo') required this.shipTo,
      @JsonKey(name: 'CompanyName') required this.companyName,
      @JsonKey(name: 'PaymentTerm') required this.paymentTerm})
      : super._();

  factory _$OrderHistoryBasicInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryBasicInfoDtoImplFromJson(json);

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
  @JsonKey(name: 'PaymentTerm')
  final PaymentTermDto paymentTerm;

  @override
  String toString() {
    return 'OrderHistoryBasicInfoDto(soldTo: $soldTo, shipTo: $shipTo, companyName: $companyName, paymentTerm: $paymentTerm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryBasicInfoDtoImpl &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.paymentTerm, paymentTerm) ||
                other.paymentTerm == paymentTerm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, soldTo, shipTo, companyName, paymentTerm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryBasicInfoDtoImplCopyWith<_$OrderHistoryBasicInfoDtoImpl>
      get copyWith => __$$OrderHistoryBasicInfoDtoImplCopyWithImpl<
          _$OrderHistoryBasicInfoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryBasicInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryBasicInfoDto extends OrderHistoryBasicInfoDto {
  const factory _OrderHistoryBasicInfoDto(
          {@JsonKey(name: 'SoldTo') required final String soldTo,
          @JsonKey(name: 'ShipTo') required final String shipTo,
          @JsonKey(name: 'CompanyName') required final String companyName,
          @JsonKey(name: 'PaymentTerm')
          required final PaymentTermDto paymentTerm}) =
      _$OrderHistoryBasicInfoDtoImpl;
  const _OrderHistoryBasicInfoDto._() : super._();

  factory _OrderHistoryBasicInfoDto.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryBasicInfoDtoImpl.fromJson;

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
  @JsonKey(name: 'PaymentTerm')
  PaymentTermDto get paymentTerm;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryBasicInfoDtoImplCopyWith<_$OrderHistoryBasicInfoDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentTermDto _$PaymentTermDtoFromJson(Map<String, dynamic> json) {
  return _PaymentTermDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentTermDto {
  @JsonKey(name: 'PaymentTermCode')
  String get paymentTermCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentTermDescription')
  String get paymentTermDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentTermDtoCopyWith<PaymentTermDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTermDtoCopyWith<$Res> {
  factory $PaymentTermDtoCopyWith(
          PaymentTermDto value, $Res Function(PaymentTermDto) then) =
      _$PaymentTermDtoCopyWithImpl<$Res, PaymentTermDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentTermCode') String paymentTermCode,
      @JsonKey(name: 'PaymentTermDescription') String paymentTermDescription});
}

/// @nodoc
class _$PaymentTermDtoCopyWithImpl<$Res, $Val extends PaymentTermDto>
    implements $PaymentTermDtoCopyWith<$Res> {
  _$PaymentTermDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermDescription = null,
  }) {
    return _then(_value.copyWith(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentTermDtoImplCopyWith<$Res>
    implements $PaymentTermDtoCopyWith<$Res> {
  factory _$$PaymentTermDtoImplCopyWith(_$PaymentTermDtoImpl value,
          $Res Function(_$PaymentTermDtoImpl) then) =
      __$$PaymentTermDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentTermCode') String paymentTermCode,
      @JsonKey(name: 'PaymentTermDescription') String paymentTermDescription});
}

/// @nodoc
class __$$PaymentTermDtoImplCopyWithImpl<$Res>
    extends _$PaymentTermDtoCopyWithImpl<$Res, _$PaymentTermDtoImpl>
    implements _$$PaymentTermDtoImplCopyWith<$Res> {
  __$$PaymentTermDtoImplCopyWithImpl(
      _$PaymentTermDtoImpl _value, $Res Function(_$PaymentTermDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermDescription = null,
  }) {
    return _then(_$PaymentTermDtoImpl(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentTermDtoImpl extends _PaymentTermDto {
  const _$PaymentTermDtoImpl(
      {@JsonKey(name: 'PaymentTermCode') required this.paymentTermCode,
      @JsonKey(name: 'PaymentTermDescription')
      required this.paymentTermDescription})
      : super._();

  factory _$PaymentTermDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentTermDtoImplFromJson(json);

  @override
  @JsonKey(name: 'PaymentTermCode')
  final String paymentTermCode;
  @override
  @JsonKey(name: 'PaymentTermDescription')
  final String paymentTermDescription;

  @override
  String toString() {
    return 'PaymentTermDto(paymentTermCode: $paymentTermCode, paymentTermDescription: $paymentTermDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentTermDtoImpl &&
            (identical(other.paymentTermCode, paymentTermCode) ||
                other.paymentTermCode == paymentTermCode) &&
            (identical(other.paymentTermDescription, paymentTermDescription) ||
                other.paymentTermDescription == paymentTermDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentTermCode, paymentTermDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentTermDtoImplCopyWith<_$PaymentTermDtoImpl> get copyWith =>
      __$$PaymentTermDtoImplCopyWithImpl<_$PaymentTermDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentTermDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentTermDto extends PaymentTermDto {
  const factory _PaymentTermDto(
      {@JsonKey(name: 'PaymentTermCode') required final String paymentTermCode,
      @JsonKey(name: 'PaymentTermDescription')
      required final String paymentTermDescription}) = _$PaymentTermDtoImpl;
  const _PaymentTermDto._() : super._();

  factory _PaymentTermDto.fromJson(Map<String, dynamic> json) =
      _$PaymentTermDtoImpl.fromJson;

  @override
  @JsonKey(name: 'PaymentTermCode')
  String get paymentTermCode;
  @override
  @JsonKey(name: 'PaymentTermDescription')
  String get paymentTermDescription;
  @override
  @JsonKey(ignore: true)
  _$$PaymentTermDtoImplCopyWith<_$PaymentTermDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
