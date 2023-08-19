// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByOrderFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ViewByOrdersFilter viewByOrdersFilter)
        setDateRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ViewByOrdersFilter viewByOrdersFilter)? setDateRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ViewByOrdersFilter viewByOrdersFilter)? setDateRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SetDateRange value) setDateRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SetDateRange value)? setDateRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SetDateRange value)? setDateRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderFilterEventCopyWith<$Res> {
  factory $ViewByOrderFilterEventCopyWith(ViewByOrderFilterEvent value,
          $Res Function(ViewByOrderFilterEvent) then) =
      _$ViewByOrderFilterEventCopyWithImpl<$Res, ViewByOrderFilterEvent>;
}

/// @nodoc
class _$ViewByOrderFilterEventCopyWithImpl<$Res,
        $Val extends ViewByOrderFilterEvent>
    implements $ViewByOrderFilterEventCopyWith<$Res> {
  _$ViewByOrderFilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ViewByOrdersFilter viewByOrdersFilter)
        setDateRange,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ViewByOrdersFilter viewByOrdersFilter)? setDateRange,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ViewByOrdersFilter viewByOrdersFilter)? setDateRange,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SetDateRange value) setDateRange,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SetDateRange value)? setDateRange,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SetDateRange value)? setDateRange,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByOrderFilterEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_SetDateRangeCopyWith<$Res> {
  factory _$$_SetDateRangeCopyWith(
          _$_SetDateRange value, $Res Function(_$_SetDateRange) then) =
      __$$_SetDateRangeCopyWithImpl<$Res>;
  @useResult
  $Res call({ViewByOrdersFilter viewByOrdersFilter});

  $ViewByOrdersFilterCopyWith<$Res> get viewByOrdersFilter;
}

/// @nodoc
class __$$_SetDateRangeCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res, _$_SetDateRange>
    implements _$$_SetDateRangeCopyWith<$Res> {
  __$$_SetDateRangeCopyWithImpl(
      _$_SetDateRange _value, $Res Function(_$_SetDateRange) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewByOrdersFilter = null,
  }) {
    return _then(_$_SetDateRange(
      null == viewByOrdersFilter
          ? _value.viewByOrdersFilter
          : viewByOrdersFilter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByOrdersFilterCopyWith<$Res> get viewByOrdersFilter {
    return $ViewByOrdersFilterCopyWith<$Res>(_value.viewByOrdersFilter,
        (value) {
      return _then(_value.copyWith(viewByOrdersFilter: value));
    });
  }
}

/// @nodoc

class _$_SetDateRange implements _SetDateRange {
  const _$_SetDateRange(this.viewByOrdersFilter);

  @override
  final ViewByOrdersFilter viewByOrdersFilter;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.setDateRange(viewByOrdersFilter: $viewByOrdersFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetDateRange &&
            (identical(other.viewByOrdersFilter, viewByOrdersFilter) ||
                other.viewByOrdersFilter == viewByOrdersFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewByOrdersFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetDateRangeCopyWith<_$_SetDateRange> get copyWith =>
      __$$_SetDateRangeCopyWithImpl<_$_SetDateRange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ViewByOrdersFilter viewByOrdersFilter)
        setDateRange,
  }) {
    return setDateRange(viewByOrdersFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ViewByOrdersFilter viewByOrdersFilter)? setDateRange,
  }) {
    return setDateRange?.call(viewByOrdersFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ViewByOrdersFilter viewByOrdersFilter)? setDateRange,
    required TResult orElse(),
  }) {
    if (setDateRange != null) {
      return setDateRange(viewByOrdersFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SetDateRange value) setDateRange,
  }) {
    return setDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SetDateRange value)? setDateRange,
  }) {
    return setDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SetDateRange value)? setDateRange,
    required TResult orElse(),
  }) {
    if (setDateRange != null) {
      return setDateRange(this);
    }
    return orElse();
  }
}

abstract class _SetDateRange implements ViewByOrderFilterEvent {
  const factory _SetDateRange(final ViewByOrdersFilter viewByOrdersFilter) =
      _$_SetDateRange;

  ViewByOrdersFilter get viewByOrdersFilter;
  @JsonKey(ignore: true)
  _$$_SetDateRangeCopyWith<_$_SetDateRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ViewByOrderFilterState {
  ViewByOrdersFilter get filter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrderFilterStateCopyWith<ViewByOrderFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderFilterStateCopyWith<$Res> {
  factory $ViewByOrderFilterStateCopyWith(ViewByOrderFilterState value,
          $Res Function(ViewByOrderFilterState) then) =
      _$ViewByOrderFilterStateCopyWithImpl<$Res, ViewByOrderFilterState>;
  @useResult
  $Res call({ViewByOrdersFilter filter});

  $ViewByOrdersFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$ViewByOrderFilterStateCopyWithImpl<$Res,
        $Val extends ViewByOrderFilterState>
    implements $ViewByOrderFilterStateCopyWith<$Res> {
  _$ViewByOrderFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByOrdersFilterCopyWith<$Res> get filter {
    return $ViewByOrdersFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViewByOrderFilterStateCopyWith<$Res>
    implements $ViewByOrderFilterStateCopyWith<$Res> {
  factory _$$_ViewByOrderFilterStateCopyWith(_$_ViewByOrderFilterState value,
          $Res Function(_$_ViewByOrderFilterState) then) =
      __$$_ViewByOrderFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ViewByOrdersFilter filter});

  @override
  $ViewByOrdersFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$_ViewByOrderFilterStateCopyWithImpl<$Res>
    extends _$ViewByOrderFilterStateCopyWithImpl<$Res,
        _$_ViewByOrderFilterState>
    implements _$$_ViewByOrderFilterStateCopyWith<$Res> {
  __$$_ViewByOrderFilterStateCopyWithImpl(_$_ViewByOrderFilterState _value,
      $Res Function(_$_ViewByOrderFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$_ViewByOrderFilterState(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
    ));
  }
}

/// @nodoc

class _$_ViewByOrderFilterState implements _ViewByOrderFilterState {
  const _$_ViewByOrderFilterState({required this.filter});

  @override
  final ViewByOrdersFilter filter;

  @override
  String toString() {
    return 'ViewByOrderFilterState(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderFilterState &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderFilterStateCopyWith<_$_ViewByOrderFilterState> get copyWith =>
      __$$_ViewByOrderFilterStateCopyWithImpl<_$_ViewByOrderFilterState>(
          this, _$identity);
}

abstract class _ViewByOrderFilterState implements ViewByOrderFilterState {
  const factory _ViewByOrderFilterState(
      {required final ViewByOrdersFilter filter}) = _$_ViewByOrderFilterState;

  @override
  ViewByOrdersFilter get filter;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderFilterStateCopyWith<_$_ViewByOrderFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
