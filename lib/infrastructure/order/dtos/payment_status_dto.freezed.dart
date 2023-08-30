// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentStatusDto _$PaymentStatusDtoFromJson(Map<String, dynamic> json) {
  return _PaymentStatusDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentStatusDto {
  @JsonKey(name: 'paymentID', defaultValue: '')
  String get paymentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'txnStatus', defaultValue: '')
  String get txnStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionRef', defaultValue: '')
  String get transactionRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentStatusDtoCopyWith<PaymentStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatusDtoCopyWith<$Res> {
  factory $PaymentStatusDtoCopyWith(
          PaymentStatusDto value, $Res Function(PaymentStatusDto) then) =
      _$PaymentStatusDtoCopyWithImpl<$Res, PaymentStatusDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentID', defaultValue: '') String paymentID,
      @JsonKey(name: 'txnStatus', defaultValue: '') String txnStatus,
      @JsonKey(name: 'transactionRef', defaultValue: '')
      String transactionRef});
}

/// @nodoc
class _$PaymentStatusDtoCopyWithImpl<$Res, $Val extends PaymentStatusDto>
    implements $PaymentStatusDtoCopyWith<$Res> {
  _$PaymentStatusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentID = null,
    Object? txnStatus = null,
    Object? transactionRef = null,
  }) {
    return _then(_value.copyWith(
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      txnStatus: null == txnStatus
          ? _value.txnStatus
          : txnStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transactionRef: null == transactionRef
          ? _value.transactionRef
          : transactionRef // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentStatusDtoCopyWith<$Res>
    implements $PaymentStatusDtoCopyWith<$Res> {
  factory _$$_PaymentStatusDtoCopyWith(
          _$_PaymentStatusDto value, $Res Function(_$_PaymentStatusDto) then) =
      __$$_PaymentStatusDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentID', defaultValue: '') String paymentID,
      @JsonKey(name: 'txnStatus', defaultValue: '') String txnStatus,
      @JsonKey(name: 'transactionRef', defaultValue: '')
      String transactionRef});
}

/// @nodoc
class __$$_PaymentStatusDtoCopyWithImpl<$Res>
    extends _$PaymentStatusDtoCopyWithImpl<$Res, _$_PaymentStatusDto>
    implements _$$_PaymentStatusDtoCopyWith<$Res> {
  __$$_PaymentStatusDtoCopyWithImpl(
      _$_PaymentStatusDto _value, $Res Function(_$_PaymentStatusDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentID = null,
    Object? txnStatus = null,
    Object? transactionRef = null,
  }) {
    return _then(_$_PaymentStatusDto(
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      txnStatus: null == txnStatus
          ? _value.txnStatus
          : txnStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transactionRef: null == transactionRef
          ? _value.transactionRef
          : transactionRef // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentStatusDto extends _PaymentStatusDto {
  const _$_PaymentStatusDto(
      {@JsonKey(name: 'paymentID', defaultValue: '') required this.paymentID,
      @JsonKey(name: 'txnStatus', defaultValue: '') required this.txnStatus,
      @JsonKey(name: 'transactionRef', defaultValue: '')
      required this.transactionRef})
      : super._();

  factory _$_PaymentStatusDto.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentStatusDtoFromJson(json);

  @override
  @JsonKey(name: 'paymentID', defaultValue: '')
  final String paymentID;
  @override
  @JsonKey(name: 'txnStatus', defaultValue: '')
  final String txnStatus;
  @override
  @JsonKey(name: 'transactionRef', defaultValue: '')
  final String transactionRef;

  @override
  String toString() {
    return 'PaymentStatusDto(paymentID: $paymentID, txnStatus: $txnStatus, transactionRef: $transactionRef)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentStatusDto &&
            (identical(other.paymentID, paymentID) ||
                other.paymentID == paymentID) &&
            (identical(other.txnStatus, txnStatus) ||
                other.txnStatus == txnStatus) &&
            (identical(other.transactionRef, transactionRef) ||
                other.transactionRef == transactionRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentID, txnStatus, transactionRef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentStatusDtoCopyWith<_$_PaymentStatusDto> get copyWith =>
      __$$_PaymentStatusDtoCopyWithImpl<_$_PaymentStatusDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentStatusDtoToJson(
      this,
    );
  }
}

abstract class _PaymentStatusDto extends PaymentStatusDto {
  const factory _PaymentStatusDto(
      {@JsonKey(name: 'paymentID', defaultValue: '')
      required final String paymentID,
      @JsonKey(name: 'txnStatus', defaultValue: '')
      required final String txnStatus,
      @JsonKey(name: 'transactionRef', defaultValue: '')
      required final String transactionRef}) = _$_PaymentStatusDto;
  const _PaymentStatusDto._() : super._();

  factory _PaymentStatusDto.fromJson(Map<String, dynamic> json) =
      _$_PaymentStatusDto.fromJson;

  @override
  @JsonKey(name: 'paymentID', defaultValue: '')
  String get paymentID;
  @override
  @JsonKey(name: 'txnStatus', defaultValue: '')
  String get txnStatus;
  @override
  @JsonKey(name: 'transactionRef', defaultValue: '')
  String get transactionRef;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentStatusDtoCopyWith<_$_PaymentStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}
