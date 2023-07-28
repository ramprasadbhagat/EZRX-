// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_history_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ViewByItemHistoryFilterDto _$ViewByItemHistoryFilterDtoFromJson(
    Map<String, dynamic> json) {
  return _ViewByItemHistoryFilterDto.fromJson(json);
}

/// @nodoc
mixin _$ViewByItemHistoryFilterDto {
  @JsonKey(name: 'orderStatus', defaultValue: <String>[])
  List<String> get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViewByItemHistoryFilterDtoCopyWith<ViewByItemHistoryFilterDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemHistoryFilterDtoCopyWith<$Res> {
  factory $ViewByItemHistoryFilterDtoCopyWith(ViewByItemHistoryFilterDto value,
          $Res Function(ViewByItemHistoryFilterDto) then) =
      _$ViewByItemHistoryFilterDtoCopyWithImpl<$Res,
          ViewByItemHistoryFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderStatus', defaultValue: <String>[])
      List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom});
}

/// @nodoc
class _$ViewByItemHistoryFilterDtoCopyWithImpl<$Res,
        $Val extends ViewByItemHistoryFilterDto>
    implements $ViewByItemHistoryFilterDtoCopyWith<$Res> {
  _$ViewByItemHistoryFilterDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_ViewByItemHistoryFilterDtoCopyWith<$Res>
    implements $ViewByItemHistoryFilterDtoCopyWith<$Res> {
  factory _$$_ViewByItemHistoryFilterDtoCopyWith(
          _$_ViewByItemHistoryFilterDto value,
          $Res Function(_$_ViewByItemHistoryFilterDto) then) =
      __$$_ViewByItemHistoryFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderStatus', defaultValue: <String>[])
      List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') String dateFrom});
}

/// @nodoc
class __$$_ViewByItemHistoryFilterDtoCopyWithImpl<$Res>
    extends _$ViewByItemHistoryFilterDtoCopyWithImpl<$Res,
        _$_ViewByItemHistoryFilterDto>
    implements _$$_ViewByItemHistoryFilterDtoCopyWith<$Res> {
  __$$_ViewByItemHistoryFilterDtoCopyWithImpl(
      _$_ViewByItemHistoryFilterDto _value,
      $Res Function(_$_ViewByItemHistoryFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderStatus = null,
    Object? dateTo = null,
    Object? dateFrom = null,
  }) {
    return _then(_$_ViewByItemHistoryFilterDto(
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
class _$_ViewByItemHistoryFilterDto extends _ViewByItemHistoryFilterDto {
  const _$_ViewByItemHistoryFilterDto(
      {@JsonKey(name: 'orderStatus', defaultValue: <String>[])
      required final List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') required this.dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '') required this.dateFrom})
      : _orderStatus = orderStatus,
        super._();

  factory _$_ViewByItemHistoryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_ViewByItemHistoryFilterDtoFromJson(json);

  final List<String> _orderStatus;
  @override
  @JsonKey(name: 'orderStatus', defaultValue: <String>[])
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
    return 'ViewByItemHistoryFilterDto(orderStatus: $orderStatus, dateTo: $dateTo, dateFrom: $dateFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByItemHistoryFilterDto &&
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
  _$$_ViewByItemHistoryFilterDtoCopyWith<_$_ViewByItemHistoryFilterDto>
      get copyWith => __$$_ViewByItemHistoryFilterDtoCopyWithImpl<
          _$_ViewByItemHistoryFilterDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ViewByItemHistoryFilterDtoToJson(
      this,
    );
  }
}

abstract class _ViewByItemHistoryFilterDto extends ViewByItemHistoryFilterDto {
  const factory _ViewByItemHistoryFilterDto(
      {@JsonKey(name: 'orderStatus', defaultValue: <String>[])
      required final List<String> orderStatus,
      @JsonKey(name: 'toDate', defaultValue: '') required final String dateTo,
      @JsonKey(name: 'fromDate', defaultValue: '')
      required final String dateFrom}) = _$_ViewByItemHistoryFilterDto;
  const _ViewByItemHistoryFilterDto._() : super._();

  factory _ViewByItemHistoryFilterDto.fromJson(Map<String, dynamic> json) =
      _$_ViewByItemHistoryFilterDto.fromJson;

  @override
  @JsonKey(name: 'orderStatus', defaultValue: <String>[])
  List<String> get orderStatus;
  @override
  @JsonKey(name: 'toDate', defaultValue: '')
  String get dateTo;
  @override
  @JsonKey(name: 'fromDate', defaultValue: '')
  String get dateFrom;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByItemHistoryFilterDtoCopyWith<_$_ViewByItemHistoryFilterDto>
      get copyWith => throw _privateConstructorUsedError;
}
