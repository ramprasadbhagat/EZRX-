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
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
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
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$_Initialized(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.initialized(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
  }) {
    return initialized(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
  }) {
    return initialized?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByOrderFilterEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganisation}) = _$_Initialized;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateCurrentFilterCopyWith<$Res> {
  factory _$$_UpdateCurrentFilterCopyWith(_$_UpdateCurrentFilter value,
          $Res Function(_$_UpdateCurrentFilter) then) =
      __$$_UpdateCurrentFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({ViewByOrdersFilter currentFilter});

  $ViewByOrdersFilterCopyWith<$Res> get currentFilter;
}

/// @nodoc
class __$$_UpdateCurrentFilterCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res, _$_UpdateCurrentFilter>
    implements _$$_UpdateCurrentFilterCopyWith<$Res> {
  __$$_UpdateCurrentFilterCopyWithImpl(_$_UpdateCurrentFilter _value,
      $Res Function(_$_UpdateCurrentFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFilter = null,
  }) {
    return _then(_$_UpdateCurrentFilter(
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByOrdersFilterCopyWith<$Res> get currentFilter {
    return $ViewByOrdersFilterCopyWith<$Res>(_value.currentFilter, (value) {
      return _then(_value.copyWith(currentFilter: value));
    });
  }
}

/// @nodoc

class _$_UpdateCurrentFilter implements _UpdateCurrentFilter {
  const _$_UpdateCurrentFilter({required this.currentFilter});

  @override
  final ViewByOrdersFilter currentFilter;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.updateCurrentFilter(currentFilter: $currentFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateCurrentFilter &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCurrentFilterCopyWith<_$_UpdateCurrentFilter> get copyWith =>
      __$$_UpdateCurrentFilterCopyWithImpl<_$_UpdateCurrentFilter>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
  }) {
    return updateCurrentFilter(currentFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
  }) {
    return updateCurrentFilter?.call(currentFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    required TResult orElse(),
  }) {
    if (updateCurrentFilter != null) {
      return updateCurrentFilter(currentFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
  }) {
    return updateCurrentFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
  }) {
    return updateCurrentFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    required TResult orElse(),
  }) {
    if (updateCurrentFilter != null) {
      return updateCurrentFilter(this);
    }
    return orElse();
  }
}

abstract class _UpdateCurrentFilter implements ViewByOrderFilterEvent {
  const factory _UpdateCurrentFilter(
          {required final ViewByOrdersFilter currentFilter}) =
      _$_UpdateCurrentFilter;

  ViewByOrdersFilter get currentFilter;
  @JsonKey(ignore: true)
  _$$_UpdateCurrentFilterCopyWith<_$_UpdateCurrentFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetDateRangeCopyWith<$Res> {
  factory _$$_SetDateRangeCopyWith(
          _$_SetDateRange value, $Res Function(_$_SetDateRange) then) =
      __$$_SetDateRangeCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange dateRange});
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
    Object? dateRange = null,
  }) {
    return _then(_$_SetDateRange(
      null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$_SetDateRange implements _SetDateRange {
  const _$_SetDateRange(this.dateRange);

  @override
  final DateTimeRange dateRange;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.setDateRange(dateRange: $dateRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetDateRange &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetDateRangeCopyWith<_$_SetDateRange> get copyWith =>
      __$$_SetDateRangeCopyWithImpl<_$_SetDateRange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
  }) {
    return setDateRange(dateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
  }) {
    return setDateRange?.call(dateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    required TResult orElse(),
  }) {
    if (setDateRange != null) {
      return setDateRange(dateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
  }) {
    return setDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
  }) {
    return setDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    required TResult orElse(),
  }) {
    if (setDateRange != null) {
      return setDateRange(this);
    }
    return orElse();
  }
}

abstract class _SetDateRange implements ViewByOrderFilterEvent {
  const factory _SetDateRange(final DateTimeRange dateRange) = _$_SetDateRange;

  DateTimeRange get dateRange;
  @JsonKey(ignore: true)
  _$$_SetDateRangeCopyWith<_$_SetDateRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetOrderStatusCopyWith<$Res> {
  factory _$$_SetOrderStatusCopyWith(
          _$_SetOrderStatus value, $Res Function(_$_SetOrderStatus) then) =
      __$$_SetOrderStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({StatusType status, bool value});
}

/// @nodoc
class __$$_SetOrderStatusCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res, _$_SetOrderStatus>
    implements _$$_SetOrderStatusCopyWith<$Res> {
  __$$_SetOrderStatusCopyWithImpl(
      _$_SetOrderStatus _value, $Res Function(_$_SetOrderStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? value = null,
  }) {
    return _then(_$_SetOrderStatus(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SetOrderStatus implements _SetOrderStatus {
  const _$_SetOrderStatus({required this.status, required this.value});

  @override
  final StatusType status;
  @override
  final bool value;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.setOrderStatus(status: $status, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetOrderStatus &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetOrderStatusCopyWith<_$_SetOrderStatus> get copyWith =>
      __$$_SetOrderStatusCopyWithImpl<_$_SetOrderStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
  }) {
    return setOrderStatus(status, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
  }) {
    return setOrderStatus?.call(status, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    required TResult orElse(),
  }) {
    if (setOrderStatus != null) {
      return setOrderStatus(status, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
  }) {
    return setOrderStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
  }) {
    return setOrderStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    required TResult orElse(),
  }) {
    if (setOrderStatus != null) {
      return setOrderStatus(this);
    }
    return orElse();
  }
}

abstract class _SetOrderStatus implements ViewByOrderFilterEvent {
  const factory _SetOrderStatus(
      {required final StatusType status,
      required final bool value}) = _$_SetOrderStatus;

  StatusType get status;
  bool get value;
  @JsonKey(ignore: true)
  _$$_SetOrderStatusCopyWith<_$_SetOrderStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ViewByOrderFilterState {
  ViewByOrdersFilter get filter => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;

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
  $Res call({ViewByOrdersFilter filter, SalesOrganisation salesOrganisation});

  $ViewByOrdersFilterCopyWith<$Res> get filter;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
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
    Object? salesOrganisation = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByOrdersFilterCopyWith<$Res> get filter {
    return $ViewByOrdersFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
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
  $Res call({ViewByOrdersFilter filter, SalesOrganisation salesOrganisation});

  @override
  $ViewByOrdersFilterCopyWith<$Res> get filter;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
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
    Object? salesOrganisation = null,
  }) {
    return _then(_$_ViewByOrderFilterState(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }
}

/// @nodoc

class _$_ViewByOrderFilterState extends _ViewByOrderFilterState {
  const _$_ViewByOrderFilterState(
      {required this.filter, required this.salesOrganisation})
      : super._();

  @override
  final ViewByOrdersFilter filter;
  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'ViewByOrderFilterState(filter: $filter, salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderFilterState &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderFilterStateCopyWith<_$_ViewByOrderFilterState> get copyWith =>
      __$$_ViewByOrderFilterStateCopyWithImpl<_$_ViewByOrderFilterState>(
          this, _$identity);
}

abstract class _ViewByOrderFilterState extends ViewByOrderFilterState {
  const factory _ViewByOrderFilterState(
          {required final ViewByOrdersFilter filter,
          required final SalesOrganisation salesOrganisation}) =
      _$_ViewByOrderFilterState;
  const _ViewByOrderFilterState._() : super._();

  @override
  ViewByOrdersFilter get filter;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderFilterStateCopyWith<_$_ViewByOrderFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
