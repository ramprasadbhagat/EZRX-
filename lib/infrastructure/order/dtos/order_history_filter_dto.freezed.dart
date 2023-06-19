// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistoryFilterDto _$OrderHistoryFilterDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnSummaryFilterDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryFilterDto {
//TODO: will remove if it's not required in filter purpose
// @JsonKey(
//   name: 'orderNumber',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String orderNumber,
// @JsonKey(
//   name: 'poReference',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String poReference,
// @JsonKey(
//   name: 'materialSearch',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String materialSearch,
  @JsonKey(name: 'orderStatus', defaultValue: [])
  List<String> get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryFilterDtoCopyWith<OrderHistoryFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryFilterDtoCopyWith<$Res> {
  factory $OrderHistoryFilterDtoCopyWith(OrderHistoryFilterDto value,
          $Res Function(OrderHistoryFilterDto) then) =
      _$OrderHistoryFilterDtoCopyWithImpl<$Res, OrderHistoryFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderStatus', defaultValue: []) List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom});
}

/// @nodoc
class _$OrderHistoryFilterDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryFilterDto>
    implements $OrderHistoryFilterDtoCopyWith<$Res> {
  _$OrderHistoryFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
    Object? dateTo = null,
    Object? dateFrom = null,
  }) {
    return _then(_value.copyWith(
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryFilterDtoCopyWith<$Res>
    implements $OrderHistoryFilterDtoCopyWith<$Res> {
  factory _$$_ReturnSummaryFilterDtoCopyWith(_$_ReturnSummaryFilterDto value,
          $Res Function(_$_ReturnSummaryFilterDto) then) =
      __$$_ReturnSummaryFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderStatus', defaultValue: []) List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom});
}

/// @nodoc
class __$$_ReturnSummaryFilterDtoCopyWithImpl<$Res>
    extends _$OrderHistoryFilterDtoCopyWithImpl<$Res, _$_ReturnSummaryFilterDto>
    implements _$$_ReturnSummaryFilterDtoCopyWith<$Res> {
  __$$_ReturnSummaryFilterDtoCopyWithImpl(_$_ReturnSummaryFilterDto _value,
      $Res Function(_$_ReturnSummaryFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
    Object? dateTo = null,
    Object? dateFrom = null,
  }) {
    return _then(_$_ReturnSummaryFilterDto(
      orderStatus: null == orderStatus
          ? _value._orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTo: null == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String,
      dateFrom: null == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnSummaryFilterDto extends _ReturnSummaryFilterDto {
  const _$_ReturnSummaryFilterDto(
      {@JsonKey(name: 'orderStatus', defaultValue: [])
          required final List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '')
          required this.dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '')
          required this.dateFrom})
      : _orderStatus = orderStatus,
        super._();

  factory _$_ReturnSummaryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnSummaryFilterDtoFromJson(json);

//TODO: will remove if it's not required in filter purpose
// @JsonKey(
//   name: 'orderNumber',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String orderNumber,
// @JsonKey(
//   name: 'poReference',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String poReference,
// @JsonKey(
//   name: 'materialSearch',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String materialSearch,
  final List<String> _orderStatus;
//TODO: will remove if it's not required in filter purpose
// @JsonKey(
//   name: 'orderNumber',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String orderNumber,
// @JsonKey(
//   name: 'poReference',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String poReference,
// @JsonKey(
//   name: 'materialSearch',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String materialSearch,
  @override
  @JsonKey(name: 'orderStatus', defaultValue: [])
  List<String> get orderStatus {
    if (_orderStatus is EqualUnmodifiableListView) return _orderStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderStatus);
  }

  @override
  @JsonKey(name: 'toDate', defaultValue: '')
  final String dateTo;
  @override
  @JsonKey(name: 'fromDate', defaultValue: '')
  final String dateFrom;

  @override
  String toString() {
    return 'OrderHistoryFilterDto(orderStatus: $orderStatus, dateTo: $dateTo, dateFrom: $dateFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryFilterDto &&
            const DeepCollectionEquality()
                .equals(other._orderStatus, _orderStatus) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_orderStatus), dateTo, dateFrom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryFilterDtoCopyWith<_$_ReturnSummaryFilterDto> get copyWith =>
      __$$_ReturnSummaryFilterDtoCopyWithImpl<_$_ReturnSummaryFilterDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnSummaryFilterDtoToJson(
      this,
    );
  }
}

abstract class _ReturnSummaryFilterDto extends OrderHistoryFilterDto {
  const factory _ReturnSummaryFilterDto(
      {@JsonKey(name: 'orderStatus', defaultValue: [])
          required final List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '')
          required final String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '')
          required final String dateFrom}) = _$_ReturnSummaryFilterDto;
  const _ReturnSummaryFilterDto._() : super._();

  factory _ReturnSummaryFilterDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnSummaryFilterDto.fromJson;

  @override //TODO: will remove if it's not required in filter purpose
// @JsonKey(
//   name: 'orderNumber',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String orderNumber,
// @JsonKey(
//   name: 'poReference',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String poReference,
// @JsonKey(
//   name: 'materialSearch',
//   defaultValue: '',
//   toJson: valueTojson,
// )
// required String materialSearch,
  @JsonKey(name: 'orderStatus', defaultValue: [])
  List<String> get orderStatus;
  @override
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo;
  @override
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryFilterDtoCopyWith<_$_ReturnSummaryFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}
