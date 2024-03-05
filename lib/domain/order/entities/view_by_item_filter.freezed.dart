// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByItemFilter {
  DateTimeStringValue get orderDateFrom => throw _privateConstructorUsedError;
  DateTimeStringValue get orderDateTo => throw _privateConstructorUsedError;
  List<StatusType> get orderStatusList => throw _privateConstructorUsedError;
  OrderHistoryType get orderHistoryType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByItemFilterCopyWith<ViewByItemFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemFilterCopyWith<$Res> {
  factory $ViewByItemFilterCopyWith(
          ViewByItemFilter value, $Res Function(ViewByItemFilter) then) =
      _$ViewByItemFilterCopyWithImpl<$Res, ViewByItemFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue orderDateFrom,
      DateTimeStringValue orderDateTo,
      List<StatusType> orderStatusList,
      OrderHistoryType orderHistoryType});
}

/// @nodoc
class _$ViewByItemFilterCopyWithImpl<$Res, $Val extends ViewByItemFilter>
    implements $ViewByItemFilterCopyWith<$Res> {
  _$ViewByItemFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDateFrom = null,
    Object? orderDateTo = null,
    Object? orderStatusList = null,
    Object? orderHistoryType = null,
  }) {
    return _then(_value.copyWith(
      orderDateFrom: null == orderDateFrom
          ? _value.orderDateFrom
          : orderDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderDateTo: null == orderDateTo
          ? _value.orderDateTo
          : orderDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderStatusList: null == orderStatusList
          ? _value.orderStatusList
          : orderStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      orderHistoryType: null == orderHistoryType
          ? _value.orderHistoryType
          : orderHistoryType // ignore: cast_nullable_to_non_nullable
              as OrderHistoryType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByItemFilterCopyWith<$Res>
    implements $ViewByItemFilterCopyWith<$Res> {
  factory _$$_ViewByItemFilterCopyWith(
          _$_ViewByItemFilter value, $Res Function(_$_ViewByItemFilter) then) =
      __$$_ViewByItemFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue orderDateFrom,
      DateTimeStringValue orderDateTo,
      List<StatusType> orderStatusList,
      OrderHistoryType orderHistoryType});
}

/// @nodoc
class __$$_ViewByItemFilterCopyWithImpl<$Res>
    extends _$ViewByItemFilterCopyWithImpl<$Res, _$_ViewByItemFilter>
    implements _$$_ViewByItemFilterCopyWith<$Res> {
  __$$_ViewByItemFilterCopyWithImpl(
      _$_ViewByItemFilter _value, $Res Function(_$_ViewByItemFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderDateFrom = null,
    Object? orderDateTo = null,
    Object? orderStatusList = null,
    Object? orderHistoryType = null,
  }) {
    return _then(_$_ViewByItemFilter(
      orderDateFrom: null == orderDateFrom
          ? _value.orderDateFrom
          : orderDateFrom // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderDateTo: null == orderDateTo
          ? _value.orderDateTo
          : orderDateTo // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      orderStatusList: null == orderStatusList
          ? _value._orderStatusList
          : orderStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      orderHistoryType: null == orderHistoryType
          ? _value.orderHistoryType
          : orderHistoryType // ignore: cast_nullable_to_non_nullable
              as OrderHistoryType,
    ));
  }
}

/// @nodoc

class _$_ViewByItemFilter extends _ViewByItemFilter {
  _$_ViewByItemFilter(
      {required this.orderDateFrom,
      required this.orderDateTo,
      required final List<StatusType> orderStatusList,
      required this.orderHistoryType})
      : _orderStatusList = orderStatusList,
        super._();

  @override
  final DateTimeStringValue orderDateFrom;
  @override
  final DateTimeStringValue orderDateTo;
  final List<StatusType> _orderStatusList;
  @override
  List<StatusType> get orderStatusList {
    if (_orderStatusList is EqualUnmodifiableListView) return _orderStatusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderStatusList);
  }

  @override
  final OrderHistoryType orderHistoryType;

  @override
  String toString() {
    return 'ViewByItemFilter(orderDateFrom: $orderDateFrom, orderDateTo: $orderDateTo, orderStatusList: $orderStatusList, orderHistoryType: $orderHistoryType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByItemFilter &&
            (identical(other.orderDateFrom, orderDateFrom) ||
                other.orderDateFrom == orderDateFrom) &&
            (identical(other.orderDateTo, orderDateTo) ||
                other.orderDateTo == orderDateTo) &&
            const DeepCollectionEquality()
                .equals(other._orderStatusList, _orderStatusList) &&
            (identical(other.orderHistoryType, orderHistoryType) ||
                other.orderHistoryType == orderHistoryType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderDateFrom, orderDateTo,
      const DeepCollectionEquality().hash(_orderStatusList), orderHistoryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByItemFilterCopyWith<_$_ViewByItemFilter> get copyWith =>
      __$$_ViewByItemFilterCopyWithImpl<_$_ViewByItemFilter>(this, _$identity);
}

abstract class _ViewByItemFilter extends ViewByItemFilter {
  factory _ViewByItemFilter(
      {required final DateTimeStringValue orderDateFrom,
      required final DateTimeStringValue orderDateTo,
      required final List<StatusType> orderStatusList,
      required final OrderHistoryType orderHistoryType}) = _$_ViewByItemFilter;
  _ViewByItemFilter._() : super._();

  @override
  DateTimeStringValue get orderDateFrom;
  @override
  DateTimeStringValue get orderDateTo;
  @override
  List<StatusType> get orderStatusList;
  @override
  OrderHistoryType get orderHistoryType;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByItemFilterCopyWith<_$_ViewByItemFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
