// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_details_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentSummaryDetailsResponseDto _$PaymentSummaryDetailsResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _PaymentSummaryDetailsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentSummaryDetailsResponseDto {
  @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
  double get totalPaymentInProgress => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'customerPaymentResponse',
      defaultValue: <PaymentSummaryDetailsDto>[])
  List<PaymentSummaryDetailsDto> get paymentSummaryList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentSummaryDetailsResponseDtoCopyWith<PaymentSummaryDetailsResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryDetailsResponseDtoCopyWith<$Res> {
  factory $PaymentSummaryDetailsResponseDtoCopyWith(
          PaymentSummaryDetailsResponseDto value,
          $Res Function(PaymentSummaryDetailsResponseDto) then) =
      _$PaymentSummaryDetailsResponseDtoCopyWithImpl<$Res,
          PaymentSummaryDetailsResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
          double totalPaymentInProgress,
      @JsonKey(
          name: 'customerPaymentResponse', defaultValue: <
              PaymentSummaryDetailsDto>[])
          List<PaymentSummaryDetailsDto> paymentSummaryList});
}

/// @nodoc
class _$PaymentSummaryDetailsResponseDtoCopyWithImpl<$Res,
        $Val extends PaymentSummaryDetailsResponseDto>
    implements $PaymentSummaryDetailsResponseDtoCopyWith<$Res> {
  _$PaymentSummaryDetailsResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPaymentInProgress = null,
    Object? paymentSummaryList = null,
  }) {
    return _then(_value.copyWith(
      totalPaymentInProgress: null == totalPaymentInProgress
          ? _value.totalPaymentInProgress
          : totalPaymentInProgress // ignore: cast_nullable_to_non_nullable
              as double,
      paymentSummaryList: null == paymentSummaryList
          ? _value.paymentSummaryList
          : paymentSummaryList // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetailsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentSummaryDetailsResponseDtoCopyWith<$Res>
    implements $PaymentSummaryDetailsResponseDtoCopyWith<$Res> {
  factory _$$_PaymentSummaryDetailsResponseDtoCopyWith(
          _$_PaymentSummaryDetailsResponseDto value,
          $Res Function(_$_PaymentSummaryDetailsResponseDto) then) =
      __$$_PaymentSummaryDetailsResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
          double totalPaymentInProgress,
      @JsonKey(
          name: 'customerPaymentResponse', defaultValue: <
              PaymentSummaryDetailsDto>[])
          List<PaymentSummaryDetailsDto> paymentSummaryList});
}

/// @nodoc
class __$$_PaymentSummaryDetailsResponseDtoCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsResponseDtoCopyWithImpl<$Res,
        _$_PaymentSummaryDetailsResponseDto>
    implements _$$_PaymentSummaryDetailsResponseDtoCopyWith<$Res> {
  __$$_PaymentSummaryDetailsResponseDtoCopyWithImpl(
      _$_PaymentSummaryDetailsResponseDto _value,
      $Res Function(_$_PaymentSummaryDetailsResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPaymentInProgress = null,
    Object? paymentSummaryList = null,
  }) {
    return _then(_$_PaymentSummaryDetailsResponseDto(
      totalPaymentInProgress: null == totalPaymentInProgress
          ? _value.totalPaymentInProgress
          : totalPaymentInProgress // ignore: cast_nullable_to_non_nullable
              as double,
      paymentSummaryList: null == paymentSummaryList
          ? _value._paymentSummaryList
          : paymentSummaryList // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetailsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentSummaryDetailsResponseDto
    extends _PaymentSummaryDetailsResponseDto {
  _$_PaymentSummaryDetailsResponseDto(
      {@JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
          required this.totalPaymentInProgress,
      @JsonKey(
          name: 'customerPaymentResponse', defaultValue: <
              PaymentSummaryDetailsDto>[])
          required final List<PaymentSummaryDetailsDto> paymentSummaryList})
      : _paymentSummaryList = paymentSummaryList,
        super._();

  factory _$_PaymentSummaryDetailsResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_PaymentSummaryDetailsResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
  final double totalPaymentInProgress;
  final List<PaymentSummaryDetailsDto> _paymentSummaryList;
  @override
  @JsonKey(
      name: 'customerPaymentResponse',
      defaultValue: <PaymentSummaryDetailsDto>[])
  List<PaymentSummaryDetailsDto> get paymentSummaryList {
    if (_paymentSummaryList is EqualUnmodifiableListView)
      return _paymentSummaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentSummaryList);
  }

  @override
  String toString() {
    return 'PaymentSummaryDetailsResponseDto(totalPaymentInProgress: $totalPaymentInProgress, paymentSummaryList: $paymentSummaryList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentSummaryDetailsResponseDto &&
            (identical(other.totalPaymentInProgress, totalPaymentInProgress) ||
                other.totalPaymentInProgress == totalPaymentInProgress) &&
            const DeepCollectionEquality()
                .equals(other._paymentSummaryList, _paymentSummaryList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalPaymentInProgress,
      const DeepCollectionEquality().hash(_paymentSummaryList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentSummaryDetailsResponseDtoCopyWith<
          _$_PaymentSummaryDetailsResponseDto>
      get copyWith => __$$_PaymentSummaryDetailsResponseDtoCopyWithImpl<
          _$_PaymentSummaryDetailsResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentSummaryDetailsResponseDtoToJson(
      this,
    );
  }
}

abstract class _PaymentSummaryDetailsResponseDto
    extends PaymentSummaryDetailsResponseDto {
  factory _PaymentSummaryDetailsResponseDto(
      {@JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
          required final double totalPaymentInProgress,
      @JsonKey(
          name: 'customerPaymentResponse', defaultValue: <
              PaymentSummaryDetailsDto>[])
          required final List<PaymentSummaryDetailsDto>
              paymentSummaryList}) = _$_PaymentSummaryDetailsResponseDto;
  _PaymentSummaryDetailsResponseDto._() : super._();

  factory _PaymentSummaryDetailsResponseDto.fromJson(
      Map<String, dynamic> json) = _$_PaymentSummaryDetailsResponseDto.fromJson;

  @override
  @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
  double get totalPaymentInProgress;
  @override
  @JsonKey(
      name: 'customerPaymentResponse',
      defaultValue: <PaymentSummaryDetailsDto>[])
  List<PaymentSummaryDetailsDto> get paymentSummaryList;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentSummaryDetailsResponseDtoCopyWith<
          _$_PaymentSummaryDetailsResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}
