// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_history_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByOrderHistoryFilter {
  DateTimeStringValue get toDate => throw _privateConstructorUsedError;
  DateTimeStringValue get fromDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrderHistoryFilterCopyWith<ViewByOrderHistoryFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderHistoryFilterCopyWith<$Res> {
  factory $ViewByOrderHistoryFilterCopyWith(ViewByOrderHistoryFilter value,
          $Res Function(ViewByOrderHistoryFilter) then) =
      _$ViewByOrderHistoryFilterCopyWithImpl<$Res, ViewByOrderHistoryFilter>;
  @useResult
  $Res call({DateTimeStringValue toDate, DateTimeStringValue fromDate});
}

/// @nodoc
class _$ViewByOrderHistoryFilterCopyWithImpl<$Res,
        $Val extends ViewByOrderHistoryFilter>
    implements $ViewByOrderHistoryFilterCopyWith<$Res> {
  _$ViewByOrderHistoryFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toDate = null,
    Object? fromDate = null,
  }) {
    return _then(_value.copyWith(
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewByOrderHistoryFilterCopyWith<$Res>
    implements $ViewByOrderHistoryFilterCopyWith<$Res> {
  factory _$$_ViewByOrderHistoryFilterCopyWith(
          _$_ViewByOrderHistoryFilter value,
          $Res Function(_$_ViewByOrderHistoryFilter) then) =
      __$$_ViewByOrderHistoryFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTimeStringValue toDate, DateTimeStringValue fromDate});
}

/// @nodoc
class __$$_ViewByOrderHistoryFilterCopyWithImpl<$Res>
    extends _$ViewByOrderHistoryFilterCopyWithImpl<$Res,
        _$_ViewByOrderHistoryFilter>
    implements _$$_ViewByOrderHistoryFilterCopyWith<$Res> {
  __$$_ViewByOrderHistoryFilterCopyWithImpl(_$_ViewByOrderHistoryFilter _value,
      $Res Function(_$_ViewByOrderHistoryFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toDate = null,
    Object? fromDate = null,
  }) {
    return _then(_$_ViewByOrderHistoryFilter(
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ));
  }
}

/// @nodoc

class _$_ViewByOrderHistoryFilter extends _ViewByOrderHistoryFilter {
  _$_ViewByOrderHistoryFilter({required this.toDate, required this.fromDate})
      : super._();

  @override
  final DateTimeStringValue toDate;
  @override
  final DateTimeStringValue fromDate;

  @override
  String toString() {
    return 'ViewByOrderHistoryFilter(toDate: $toDate, fromDate: $fromDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderHistoryFilter &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toDate, fromDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderHistoryFilterCopyWith<_$_ViewByOrderHistoryFilter>
      get copyWith => __$$_ViewByOrderHistoryFilterCopyWithImpl<
          _$_ViewByOrderHistoryFilter>(this, _$identity);
}

abstract class _ViewByOrderHistoryFilter extends ViewByOrderHistoryFilter {
  factory _ViewByOrderHistoryFilter(
          {required final DateTimeStringValue toDate,
          required final DateTimeStringValue fromDate}) =
      _$_ViewByOrderHistoryFilter;
  _ViewByOrderHistoryFilter._() : super._();

  @override
  DateTimeStringValue get toDate;
  @override
  DateTimeStringValue get fromDate;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderHistoryFilterCopyWith<_$_ViewByOrderHistoryFilter>
      get copyWith => throw _privateConstructorUsedError;
}
