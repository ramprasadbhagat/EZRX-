// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_payment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerPaymentDto _$CustomerPaymentDtoFromJson(Map<String, dynamic> json) {
  return _CustomerPaymentDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerPaymentDto {
  @JsonKey(name: 'total', defaultValue: 0)
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'showing', defaultValue: 0)
  int get showing => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
  int get totalPaymentInProgress => throw _privateConstructorUsedError;
  @JsonKey(name: 'resultPaymentInProgress', defaultValue: 0)
  int get resultPaymentInProgress => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerPaymentResponse', defaultValue: [])
  List<CustomerPaymentItemDto> get customerPaymentResponse =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerPaymentDtoCopyWith<CustomerPaymentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPaymentDtoCopyWith<$Res> {
  factory $CustomerPaymentDtoCopyWith(
          CustomerPaymentDto value, $Res Function(CustomerPaymentDto) then) =
      _$CustomerPaymentDtoCopyWithImpl<$Res, CustomerPaymentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total', defaultValue: 0) int total,
      @JsonKey(name: 'showing', defaultValue: 0) int showing,
      @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
      int totalPaymentInProgress,
      @JsonKey(name: 'resultPaymentInProgress', defaultValue: 0)
      int resultPaymentInProgress,
      @JsonKey(name: 'customerPaymentResponse', defaultValue: [])
      List<CustomerPaymentItemDto> customerPaymentResponse});
}

/// @nodoc
class _$CustomerPaymentDtoCopyWithImpl<$Res, $Val extends CustomerPaymentDto>
    implements $CustomerPaymentDtoCopyWith<$Res> {
  _$CustomerPaymentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? showing = null,
    Object? totalPaymentInProgress = null,
    Object? resultPaymentInProgress = null,
    Object? customerPaymentResponse = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      showing: null == showing
          ? _value.showing
          : showing // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaymentInProgress: null == totalPaymentInProgress
          ? _value.totalPaymentInProgress
          : totalPaymentInProgress // ignore: cast_nullable_to_non_nullable
              as int,
      resultPaymentInProgress: null == resultPaymentInProgress
          ? _value.resultPaymentInProgress
          : resultPaymentInProgress // ignore: cast_nullable_to_non_nullable
              as int,
      customerPaymentResponse: null == customerPaymentResponse
          ? _value.customerPaymentResponse
          : customerPaymentResponse // ignore: cast_nullable_to_non_nullable
              as List<CustomerPaymentItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerPaymentDtoCopyWith<$Res>
    implements $CustomerPaymentDtoCopyWith<$Res> {
  factory _$$_CustomerPaymentDtoCopyWith(_$_CustomerPaymentDto value,
          $Res Function(_$_CustomerPaymentDto) then) =
      __$$_CustomerPaymentDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total', defaultValue: 0) int total,
      @JsonKey(name: 'showing', defaultValue: 0) int showing,
      @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
      int totalPaymentInProgress,
      @JsonKey(name: 'resultPaymentInProgress', defaultValue: 0)
      int resultPaymentInProgress,
      @JsonKey(name: 'customerPaymentResponse', defaultValue: [])
      List<CustomerPaymentItemDto> customerPaymentResponse});
}

/// @nodoc
class __$$_CustomerPaymentDtoCopyWithImpl<$Res>
    extends _$CustomerPaymentDtoCopyWithImpl<$Res, _$_CustomerPaymentDto>
    implements _$$_CustomerPaymentDtoCopyWith<$Res> {
  __$$_CustomerPaymentDtoCopyWithImpl(
      _$_CustomerPaymentDto _value, $Res Function(_$_CustomerPaymentDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? showing = null,
    Object? totalPaymentInProgress = null,
    Object? resultPaymentInProgress = null,
    Object? customerPaymentResponse = null,
  }) {
    return _then(_$_CustomerPaymentDto(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      showing: null == showing
          ? _value.showing
          : showing // ignore: cast_nullable_to_non_nullable
              as int,
      totalPaymentInProgress: null == totalPaymentInProgress
          ? _value.totalPaymentInProgress
          : totalPaymentInProgress // ignore: cast_nullable_to_non_nullable
              as int,
      resultPaymentInProgress: null == resultPaymentInProgress
          ? _value.resultPaymentInProgress
          : resultPaymentInProgress // ignore: cast_nullable_to_non_nullable
              as int,
      customerPaymentResponse: null == customerPaymentResponse
          ? _value._customerPaymentResponse
          : customerPaymentResponse // ignore: cast_nullable_to_non_nullable
              as List<CustomerPaymentItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerPaymentDto extends _CustomerPaymentDto {
  const _$_CustomerPaymentDto(
      {@JsonKey(name: 'total', defaultValue: 0) required this.total,
      @JsonKey(name: 'showing', defaultValue: 0) required this.showing,
      @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
      required this.totalPaymentInProgress,
      @JsonKey(name: 'resultPaymentInProgress', defaultValue: 0)
      required this.resultPaymentInProgress,
      @JsonKey(name: 'customerPaymentResponse', defaultValue: [])
      required final List<CustomerPaymentItemDto> customerPaymentResponse})
      : _customerPaymentResponse = customerPaymentResponse,
        super._();

  factory _$_CustomerPaymentDto.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerPaymentDtoFromJson(json);

  @override
  @JsonKey(name: 'total', defaultValue: 0)
  final int total;
  @override
  @JsonKey(name: 'showing', defaultValue: 0)
  final int showing;
  @override
  @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
  final int totalPaymentInProgress;
  @override
  @JsonKey(name: 'resultPaymentInProgress', defaultValue: 0)
  final int resultPaymentInProgress;
  final List<CustomerPaymentItemDto> _customerPaymentResponse;
  @override
  @JsonKey(name: 'customerPaymentResponse', defaultValue: [])
  List<CustomerPaymentItemDto> get customerPaymentResponse {
    if (_customerPaymentResponse is EqualUnmodifiableListView)
      return _customerPaymentResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerPaymentResponse);
  }

  @override
  String toString() {
    return 'CustomerPaymentDto(total: $total, showing: $showing, totalPaymentInProgress: $totalPaymentInProgress, resultPaymentInProgress: $resultPaymentInProgress, customerPaymentResponse: $customerPaymentResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerPaymentDto &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.showing, showing) || other.showing == showing) &&
            (identical(other.totalPaymentInProgress, totalPaymentInProgress) ||
                other.totalPaymentInProgress == totalPaymentInProgress) &&
            (identical(
                    other.resultPaymentInProgress, resultPaymentInProgress) ||
                other.resultPaymentInProgress == resultPaymentInProgress) &&
            const DeepCollectionEquality().equals(
                other._customerPaymentResponse, _customerPaymentResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      total,
      showing,
      totalPaymentInProgress,
      resultPaymentInProgress,
      const DeepCollectionEquality().hash(_customerPaymentResponse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerPaymentDtoCopyWith<_$_CustomerPaymentDto> get copyWith =>
      __$$_CustomerPaymentDtoCopyWithImpl<_$_CustomerPaymentDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerPaymentDtoToJson(
      this,
    );
  }
}

abstract class _CustomerPaymentDto extends CustomerPaymentDto {
  const factory _CustomerPaymentDto(
      {@JsonKey(name: 'total', defaultValue: 0) required final int total,
      @JsonKey(name: 'showing', defaultValue: 0) required final int showing,
      @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
      required final int totalPaymentInProgress,
      @JsonKey(name: 'resultPaymentInProgress', defaultValue: 0)
      required final int resultPaymentInProgress,
      @JsonKey(name: 'customerPaymentResponse', defaultValue: [])
      required final List<CustomerPaymentItemDto>
          customerPaymentResponse}) = _$_CustomerPaymentDto;
  const _CustomerPaymentDto._() : super._();

  factory _CustomerPaymentDto.fromJson(Map<String, dynamic> json) =
      _$_CustomerPaymentDto.fromJson;

  @override
  @JsonKey(name: 'total', defaultValue: 0)
  int get total;
  @override
  @JsonKey(name: 'showing', defaultValue: 0)
  int get showing;
  @override
  @JsonKey(name: 'totalPaymentInProgress', defaultValue: 0)
  int get totalPaymentInProgress;
  @override
  @JsonKey(name: 'resultPaymentInProgress', defaultValue: 0)
  int get resultPaymentInProgress;
  @override
  @JsonKey(name: 'customerPaymentResponse', defaultValue: [])
  List<CustomerPaymentItemDto> get customerPaymentResponse;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerPaymentDtoCopyWith<_$_CustomerPaymentDto> get copyWith =>
      throw _privateConstructorUsedError;
}
