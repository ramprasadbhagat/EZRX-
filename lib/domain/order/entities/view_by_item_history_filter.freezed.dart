// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_history_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByItemHistoryFilter {
  DateTimeRange get dateRange => throw _privateConstructorUsedError;
  List<StatusType> get orderStatusList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByItemHistoryFilterCopyWith<ViewByItemHistoryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemHistoryFilterCopyWith<$Res> {
  factory $ViewByItemHistoryFilterCopyWith(ViewByItemHistoryFilter value,
          $Res Function(ViewByItemHistoryFilter) then) =
      _$ViewByItemHistoryFilterCopyWithImpl<$Res, ViewByItemHistoryFilter>;
  @useResult
  $Res call({DateTimeRange dateRange, List<StatusType> orderStatusList});
}

/// @nodoc
class _$ViewByItemHistoryFilterCopyWithImpl<$Res,
        $Val extends ViewByItemHistoryFilter>
    implements $ViewByItemHistoryFilterCopyWith<$Res> {
  _$ViewByItemHistoryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
    Object? orderStatusList = null,
  }) {
    return _then(_value.copyWith(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
      orderStatusList: null == orderStatusList
          ? _value.orderStatusList
          : orderStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByItemHistoryFilterCopyWith<$Res>
    implements $ViewByItemHistoryFilterCopyWith<$Res> {
  factory _$$_ViewByItemHistoryFilterCopyWith(_$_ViewByItemHistoryFilter value,
          $Res Function(_$_ViewByItemHistoryFilter) then) =
      __$$_ViewByItemHistoryFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTimeRange dateRange, List<StatusType> orderStatusList});
}

/// @nodoc
class __$$_ViewByItemHistoryFilterCopyWithImpl<$Res>
    extends _$ViewByItemHistoryFilterCopyWithImpl<$Res,
        _$_ViewByItemHistoryFilter>
    implements _$$_ViewByItemHistoryFilterCopyWith<$Res> {
  __$$_ViewByItemHistoryFilterCopyWithImpl(_$_ViewByItemHistoryFilter _value,
      $Res Function(_$_ViewByItemHistoryFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
    Object? orderStatusList = null,
  }) {
    return _then(_$_ViewByItemHistoryFilter(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
      orderStatusList: null == orderStatusList
          ? _value._orderStatusList
          : orderStatusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
    ));
  }
}

/// @nodoc

class _$_ViewByItemHistoryFilter extends _ViewByItemHistoryFilter {
  _$_ViewByItemHistoryFilter(
      {required this.dateRange,
      required final List<StatusType> orderStatusList})
      : _orderStatusList = orderStatusList,
        super._();

  @override
  final DateTimeRange dateRange;
  final List<StatusType> _orderStatusList;
  @override
  List<StatusType> get orderStatusList {
    if (_orderStatusList is EqualUnmodifiableListView) return _orderStatusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderStatusList);
  }

  @override
  String toString() {
    return 'ViewByItemHistoryFilter(dateRange: $dateRange, orderStatusList: $orderStatusList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByItemHistoryFilter &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            const DeepCollectionEquality()
                .equals(other._orderStatusList, _orderStatusList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateRange,
      const DeepCollectionEquality().hash(_orderStatusList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByItemHistoryFilterCopyWith<_$_ViewByItemHistoryFilter>
      get copyWith =>
          __$$_ViewByItemHistoryFilterCopyWithImpl<_$_ViewByItemHistoryFilter>(
              this, _$identity);
}

abstract class _ViewByItemHistoryFilter extends ViewByItemHistoryFilter {
  factory _ViewByItemHistoryFilter(
          {required final DateTimeRange dateRange,
          required final List<StatusType> orderStatusList}) =
      _$_ViewByItemHistoryFilter;
  _ViewByItemHistoryFilter._() : super._();

  @override
  DateTimeRange get dateRange;
  @override
  List<StatusType> get orderStatusList;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByItemHistoryFilterCopyWith<_$_ViewByItemHistoryFilter>
      get copyWith => throw _privateConstructorUsedError;
}
