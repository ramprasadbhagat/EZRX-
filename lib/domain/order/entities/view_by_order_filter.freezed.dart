// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByOrdersFilter {
  DateTimeRange get dateRange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrdersFilterCopyWith<ViewByOrdersFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrdersFilterCopyWith<$Res> {
  factory $ViewByOrdersFilterCopyWith(
          ViewByOrdersFilter value, $Res Function(ViewByOrdersFilter) then) =
      _$ViewByOrdersFilterCopyWithImpl<$Res, ViewByOrdersFilter>;
  @useResult
  $Res call({DateTimeRange dateRange});
}

/// @nodoc
class _$ViewByOrdersFilterCopyWithImpl<$Res, $Val extends ViewByOrdersFilter>
    implements $ViewByOrdersFilterCopyWith<$Res> {
  _$ViewByOrdersFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
  }) {
    return _then(_value.copyWith(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByOrderHistoryFilterCopyWith<$Res>
    implements $ViewByOrdersFilterCopyWith<$Res> {
  factory _$$_ViewByOrderHistoryFilterCopyWith(
          _$_ViewByOrderHistoryFilter value,
          $Res Function(_$_ViewByOrderHistoryFilter) then) =
      __$$_ViewByOrderHistoryFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTimeRange dateRange});
}

/// @nodoc
class __$$_ViewByOrderHistoryFilterCopyWithImpl<$Res>
    extends _$ViewByOrdersFilterCopyWithImpl<$Res, _$_ViewByOrderHistoryFilter>
    implements _$$_ViewByOrderHistoryFilterCopyWith<$Res> {
  __$$_ViewByOrderHistoryFilterCopyWithImpl(_$_ViewByOrderHistoryFilter _value,
      $Res Function(_$_ViewByOrderHistoryFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
  }) {
    return _then(_$_ViewByOrderHistoryFilter(
      dateRange: null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$_ViewByOrderHistoryFilter extends _ViewByOrderHistoryFilter {
  _$_ViewByOrderHistoryFilter({required this.dateRange}) : super._();

  @override
  final DateTimeRange dateRange;

  @override
  String toString() {
    return 'ViewByOrdersFilter(dateRange: $dateRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderHistoryFilter &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderHistoryFilterCopyWith<_$_ViewByOrderHistoryFilter>
      get copyWith => __$$_ViewByOrderHistoryFilterCopyWithImpl<
          _$_ViewByOrderHistoryFilter>(this, _$identity);
}

abstract class _ViewByOrderHistoryFilter extends ViewByOrdersFilter {
  factory _ViewByOrderHistoryFilter({required final DateTimeRange dateRange}) =
      _$_ViewByOrderHistoryFilter;
  _ViewByOrderHistoryFilter._() : super._();

  @override
  DateTimeRange get dateRange;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderHistoryFilterCopyWith<_$_ViewByOrderHistoryFilter>
      get copyWith => throw _privateConstructorUsedError;
}
