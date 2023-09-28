// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outstanding_invoice_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OutstandingInvoiceFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingInvoiceFilterEventCopyWith<$Res> {
  factory $OutstandingInvoiceFilterEventCopyWith(
          OutstandingInvoiceFilterEvent value,
          $Res Function(OutstandingInvoiceFilterEvent) then) =
      _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
          OutstandingInvoiceFilterEvent>;
}

/// @nodoc
class _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        $Val extends OutstandingInvoiceFilterEvent>
    implements $OutstandingInvoiceFilterEventCopyWith<$Res> {
  _$OutstandingInvoiceFilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializeCopyWith<$Res> {
  factory _$$_InitializeCopyWith(
          _$_Initialize value, $Res Function(_$_Initialize) then) =
      __$$_InitializeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize();

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements OutstandingInvoiceFilterEvent {
  const factory _Initialize() = _$_Initialize;
}

/// @nodoc
abstract class _$$_UpdateFiltersToLastAppliedCopyWith<$Res> {
  factory _$$_UpdateFiltersToLastAppliedCopyWith(
          _$_UpdateFiltersToLastApplied value,
          $Res Function(_$_UpdateFiltersToLastApplied) then) =
      __$$_UpdateFiltersToLastAppliedCopyWithImpl<$Res>;
  @useResult
  $Res call({OutstandingInvoiceFilter lastAppliedFilter});

  $OutstandingInvoiceFilterCopyWith<$Res> get lastAppliedFilter;
}

/// @nodoc
class __$$_UpdateFiltersToLastAppliedCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$_UpdateFiltersToLastApplied>
    implements _$$_UpdateFiltersToLastAppliedCopyWith<$Res> {
  __$$_UpdateFiltersToLastAppliedCopyWithImpl(
      _$_UpdateFiltersToLastApplied _value,
      $Res Function(_$_UpdateFiltersToLastApplied) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastAppliedFilter = null,
  }) {
    return _then(_$_UpdateFiltersToLastApplied(
      lastAppliedFilter: null == lastAppliedFilter
          ? _value.lastAppliedFilter
          : lastAppliedFilter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OutstandingInvoiceFilterCopyWith<$Res> get lastAppliedFilter {
    return $OutstandingInvoiceFilterCopyWith<$Res>(_value.lastAppliedFilter,
        (value) {
      return _then(_value.copyWith(lastAppliedFilter: value));
    });
  }
}

/// @nodoc

class _$_UpdateFiltersToLastApplied implements _UpdateFiltersToLastApplied {
  const _$_UpdateFiltersToLastApplied({required this.lastAppliedFilter});

  @override
  final OutstandingInvoiceFilter lastAppliedFilter;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.updateFilterToLastApplied(lastAppliedFilter: $lastAppliedFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateFiltersToLastApplied &&
            (identical(other.lastAppliedFilter, lastAppliedFilter) ||
                other.lastAppliedFilter == lastAppliedFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastAppliedFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateFiltersToLastAppliedCopyWith<_$_UpdateFiltersToLastApplied>
      get copyWith => __$$_UpdateFiltersToLastAppliedCopyWithImpl<
          _$_UpdateFiltersToLastApplied>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return updateFilterToLastApplied(lastAppliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return updateFilterToLastApplied?.call(lastAppliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (updateFilterToLastApplied != null) {
      return updateFilterToLastApplied(lastAppliedFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return updateFilterToLastApplied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return updateFilterToLastApplied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (updateFilterToLastApplied != null) {
      return updateFilterToLastApplied(this);
    }
    return orElse();
  }
}

abstract class _UpdateFiltersToLastApplied
    implements OutstandingInvoiceFilterEvent {
  const factory _UpdateFiltersToLastApplied(
          {required final OutstandingInvoiceFilter lastAppliedFilter}) =
      _$_UpdateFiltersToLastApplied;

  OutstandingInvoiceFilter get lastAppliedFilter;
  @JsonKey(ignore: true)
  _$$_UpdateFiltersToLastAppliedCopyWith<_$_UpdateFiltersToLastApplied>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetDocumentDateCopyWith<$Res> {
  factory _$$_SetDocumentDateCopyWith(
          _$_SetDocumentDate value, $Res Function(_$_SetDocumentDate) then) =
      __$$_SetDocumentDateCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange documentDateRange});
}

/// @nodoc
class __$$_SetDocumentDateCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$_SetDocumentDate> implements _$$_SetDocumentDateCopyWith<$Res> {
  __$$_SetDocumentDateCopyWithImpl(
      _$_SetDocumentDate _value, $Res Function(_$_SetDocumentDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDateRange = null,
  }) {
    return _then(_$_SetDocumentDate(
      documentDateRange: null == documentDateRange
          ? _value.documentDateRange
          : documentDateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$_SetDocumentDate implements _SetDocumentDate {
  const _$_SetDocumentDate({required this.documentDateRange});

  @override
  final DateTimeRange documentDateRange;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setDocumentDate(documentDateRange: $documentDateRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetDocumentDate &&
            (identical(other.documentDateRange, documentDateRange) ||
                other.documentDateRange == documentDateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentDateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetDocumentDateCopyWith<_$_SetDocumentDate> get copyWith =>
      __$$_SetDocumentDateCopyWithImpl<_$_SetDocumentDate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setDocumentDate(documentDateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setDocumentDate?.call(documentDateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setDocumentDate != null) {
      return setDocumentDate(documentDateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setDocumentDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setDocumentDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setDocumentDate != null) {
      return setDocumentDate(this);
    }
    return orElse();
  }
}

abstract class _SetDocumentDate implements OutstandingInvoiceFilterEvent {
  const factory _SetDocumentDate(
      {required final DateTimeRange documentDateRange}) = _$_SetDocumentDate;

  DateTimeRange get documentDateRange;
  @JsonKey(ignore: true)
  _$$_SetDocumentDateCopyWith<_$_SetDocumentDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetDueDateCopyWith<$Res> {
  factory _$$_SetDueDateCopyWith(
          _$_SetDueDate value, $Res Function(_$_SetDueDate) then) =
      __$$_SetDueDateCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange dueDateRange});
}

/// @nodoc
class __$$_SetDueDateCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res, _$_SetDueDate>
    implements _$$_SetDueDateCopyWith<$Res> {
  __$$_SetDueDateCopyWithImpl(
      _$_SetDueDate _value, $Res Function(_$_SetDueDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDateRange = null,
  }) {
    return _then(_$_SetDueDate(
      dueDateRange: null == dueDateRange
          ? _value.dueDateRange
          : dueDateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$_SetDueDate implements _SetDueDate {
  const _$_SetDueDate({required this.dueDateRange});

  @override
  final DateTimeRange dueDateRange;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setDueDate(dueDateRange: $dueDateRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetDueDate &&
            (identical(other.dueDateRange, dueDateRange) ||
                other.dueDateRange == dueDateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dueDateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetDueDateCopyWith<_$_SetDueDate> get copyWith =>
      __$$_SetDueDateCopyWithImpl<_$_SetDueDate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setDueDate(dueDateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setDueDate?.call(dueDateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setDueDate != null) {
      return setDueDate(dueDateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setDueDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setDueDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setDueDate != null) {
      return setDueDate(this);
    }
    return orElse();
  }
}

abstract class _SetDueDate implements OutstandingInvoiceFilterEvent {
  const factory _SetDueDate({required final DateTimeRange dueDateRange}) =
      _$_SetDueDate;

  DateTimeRange get dueDateRange;
  @JsonKey(ignore: true)
  _$$_SetDueDateCopyWith<_$_SetDueDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetAmountFromCopyWith<$Res> {
  factory _$$_SetAmountFromCopyWith(
          _$_SetAmountFrom value, $Res Function(_$_SetAmountFrom) then) =
      __$$_SetAmountFromCopyWithImpl<$Res>;
  @useResult
  $Res call({String amountFrom});
}

/// @nodoc
class __$$_SetAmountFromCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res, _$_SetAmountFrom>
    implements _$$_SetAmountFromCopyWith<$Res> {
  __$$_SetAmountFromCopyWithImpl(
      _$_SetAmountFrom _value, $Res Function(_$_SetAmountFrom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountFrom = null,
  }) {
    return _then(_$_SetAmountFrom(
      amountFrom: null == amountFrom
          ? _value.amountFrom
          : amountFrom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetAmountFrom implements _SetAmountFrom {
  const _$_SetAmountFrom({required this.amountFrom});

  @override
  final String amountFrom;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setAmountFrom(amountFrom: $amountFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetAmountFrom &&
            (identical(other.amountFrom, amountFrom) ||
                other.amountFrom == amountFrom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amountFrom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetAmountFromCopyWith<_$_SetAmountFrom> get copyWith =>
      __$$_SetAmountFromCopyWithImpl<_$_SetAmountFrom>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setAmountFrom(amountFrom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setAmountFrom?.call(amountFrom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setAmountFrom != null) {
      return setAmountFrom(amountFrom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setAmountFrom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setAmountFrom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setAmountFrom != null) {
      return setAmountFrom(this);
    }
    return orElse();
  }
}

abstract class _SetAmountFrom implements OutstandingInvoiceFilterEvent {
  const factory _SetAmountFrom({required final String amountFrom}) =
      _$_SetAmountFrom;

  String get amountFrom;
  @JsonKey(ignore: true)
  _$$_SetAmountFromCopyWith<_$_SetAmountFrom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetAmountToCopyWith<$Res> {
  factory _$$_SetAmountToCopyWith(
          _$_SetAmountTo value, $Res Function(_$_SetAmountTo) then) =
      __$$_SetAmountToCopyWithImpl<$Res>;
  @useResult
  $Res call({String amountTo});
}

/// @nodoc
class __$$_SetAmountToCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res, _$_SetAmountTo>
    implements _$$_SetAmountToCopyWith<$Res> {
  __$$_SetAmountToCopyWithImpl(
      _$_SetAmountTo _value, $Res Function(_$_SetAmountTo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountTo = null,
  }) {
    return _then(_$_SetAmountTo(
      amountTo: null == amountTo
          ? _value.amountTo
          : amountTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetAmountTo implements _SetAmountTo {
  const _$_SetAmountTo({required this.amountTo});

  @override
  final String amountTo;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setAmountTo(amountTo: $amountTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetAmountTo &&
            (identical(other.amountTo, amountTo) ||
                other.amountTo == amountTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amountTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetAmountToCopyWith<_$_SetAmountTo> get copyWith =>
      __$$_SetAmountToCopyWithImpl<_$_SetAmountTo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setAmountTo(amountTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setAmountTo?.call(amountTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setAmountTo != null) {
      return setAmountTo(amountTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setAmountTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setAmountTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setAmountTo != null) {
      return setAmountTo(this);
    }
    return orElse();
  }
}

abstract class _SetAmountTo implements OutstandingInvoiceFilterEvent {
  const factory _SetAmountTo({required final String amountTo}) = _$_SetAmountTo;

  String get amountTo;
  @JsonKey(ignore: true)
  _$$_SetAmountToCopyWith<_$_SetAmountTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetOutstandingInvoiceStatusCopyWith<$Res> {
  factory _$$_SetOutstandingInvoiceStatusCopyWith(
          _$_SetOutstandingInvoiceStatus value,
          $Res Function(_$_SetOutstandingInvoiceStatus) then) =
      __$$_SetOutstandingInvoiceStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({StatusType status, bool value});
}

/// @nodoc
class __$$_SetOutstandingInvoiceStatusCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$_SetOutstandingInvoiceStatus>
    implements _$$_SetOutstandingInvoiceStatusCopyWith<$Res> {
  __$$_SetOutstandingInvoiceStatusCopyWithImpl(
      _$_SetOutstandingInvoiceStatus _value,
      $Res Function(_$_SetOutstandingInvoiceStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? value = null,
  }) {
    return _then(_$_SetOutstandingInvoiceStatus(
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

class _$_SetOutstandingInvoiceStatus implements _SetOutstandingInvoiceStatus {
  const _$_SetOutstandingInvoiceStatus(
      {required this.status, required this.value});

  @override
  final StatusType status;
  @override
  final bool value;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setOutstandingInvoiceStatus(status: $status, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetOutstandingInvoiceStatus &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetOutstandingInvoiceStatusCopyWith<_$_SetOutstandingInvoiceStatus>
      get copyWith => __$$_SetOutstandingInvoiceStatusCopyWithImpl<
          _$_SetOutstandingInvoiceStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setOutstandingInvoiceStatus(status, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setOutstandingInvoiceStatus?.call(status, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setOutstandingInvoiceStatus != null) {
      return setOutstandingInvoiceStatus(status, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setOutstandingInvoiceStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setOutstandingInvoiceStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setOutstandingInvoiceStatus != null) {
      return setOutstandingInvoiceStatus(this);
    }
    return orElse();
  }
}

abstract class _SetOutstandingInvoiceStatus
    implements OutstandingInvoiceFilterEvent {
  const factory _SetOutstandingInvoiceStatus(
      {required final StatusType status,
      required final bool value}) = _$_SetOutstandingInvoiceStatus;

  StatusType get status;
  bool get value;
  @JsonKey(ignore: true)
  _$$_SetOutstandingInvoiceStatusCopyWith<_$_SetOutstandingInvoiceStatus>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetValidationFailureCopyWith<$Res> {
  factory _$$_SetValidationFailureCopyWith(_$_SetValidationFailure value,
          $Res Function(_$_SetValidationFailure) then) =
      __$$_SetValidationFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetValidationFailureCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$_SetValidationFailure>
    implements _$$_SetValidationFailureCopyWith<$Res> {
  __$$_SetValidationFailureCopyWithImpl(_$_SetValidationFailure _value,
      $Res Function(_$_SetValidationFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SetValidationFailure implements _SetValidationFailure {
  const _$_SetValidationFailure();

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setValidationFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SetValidationFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setValidationFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setValidationFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setValidationFailure != null) {
      return setValidationFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setValidationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setValidationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setValidationFailure != null) {
      return setValidationFailure(this);
    }
    return orElse();
  }
}

abstract class _SetValidationFailure implements OutstandingInvoiceFilterEvent {
  const factory _SetValidationFailure() = _$_SetValidationFailure;
}

/// @nodoc
abstract class _$$_ResetFiltersCopyWith<$Res> {
  factory _$$_ResetFiltersCopyWith(
          _$_ResetFilters value, $Res Function(_$_ResetFilters) then) =
      __$$_ResetFiltersCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetFiltersCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res, _$_ResetFilters>
    implements _$$_ResetFiltersCopyWith<$Res> {
  __$$_ResetFiltersCopyWithImpl(
      _$_ResetFilters _value, $Res Function(_$_ResetFilters) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ResetFilters implements _ResetFilters {
  const _$_ResetFilters();

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.resetFilters()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ResetFilters);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return resetFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return resetFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (resetFilters != null) {
      return resetFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return resetFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return resetFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (resetFilters != null) {
      return resetFilters(this);
    }
    return orElse();
  }
}

abstract class _ResetFilters implements OutstandingInvoiceFilterEvent {
  const factory _ResetFilters() = _$_ResetFilters;
}

/// @nodoc
mixin _$OutstandingInvoiceFilterState {
  OutstandingInvoiceFilter get filter => throw _privateConstructorUsedError;
  List<StatusType> get statusList => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OutstandingInvoiceFilterStateCopyWith<OutstandingInvoiceFilterState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingInvoiceFilterStateCopyWith<$Res> {
  factory $OutstandingInvoiceFilterStateCopyWith(
          OutstandingInvoiceFilterState value,
          $Res Function(OutstandingInvoiceFilterState) then) =
      _$OutstandingInvoiceFilterStateCopyWithImpl<$Res,
          OutstandingInvoiceFilterState>;
  @useResult
  $Res call(
      {OutstandingInvoiceFilter filter,
      List<StatusType> statusList,
      bool showErrorMessage});

  $OutstandingInvoiceFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$OutstandingInvoiceFilterStateCopyWithImpl<$Res,
        $Val extends OutstandingInvoiceFilterState>
    implements $OutstandingInvoiceFilterStateCopyWith<$Res> {
  _$OutstandingInvoiceFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? statusList = null,
    Object? showErrorMessage = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
      statusList: null == statusList
          ? _value.statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OutstandingInvoiceFilterCopyWith<$Res> get filter {
    return $OutstandingInvoiceFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OutstandingInvoiceFilterStateCopyWith<$Res>
    implements $OutstandingInvoiceFilterStateCopyWith<$Res> {
  factory _$$_OutstandingInvoiceFilterStateCopyWith(
          _$_OutstandingInvoiceFilterState value,
          $Res Function(_$_OutstandingInvoiceFilterState) then) =
      __$$_OutstandingInvoiceFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OutstandingInvoiceFilter filter,
      List<StatusType> statusList,
      bool showErrorMessage});

  @override
  $OutstandingInvoiceFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$_OutstandingInvoiceFilterStateCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterStateCopyWithImpl<$Res,
        _$_OutstandingInvoiceFilterState>
    implements _$$_OutstandingInvoiceFilterStateCopyWith<$Res> {
  __$$_OutstandingInvoiceFilterStateCopyWithImpl(
      _$_OutstandingInvoiceFilterState _value,
      $Res Function(_$_OutstandingInvoiceFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? statusList = null,
    Object? showErrorMessage = null,
  }) {
    return _then(_$_OutstandingInvoiceFilterState(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
      statusList: null == statusList
          ? _value._statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OutstandingInvoiceFilterState extends _OutstandingInvoiceFilterState {
  const _$_OutstandingInvoiceFilterState(
      {required this.filter,
      required final List<StatusType> statusList,
      required this.showErrorMessage})
      : _statusList = statusList,
        super._();

  @override
  final OutstandingInvoiceFilter filter;
  final List<StatusType> _statusList;
  @override
  List<StatusType> get statusList {
    if (_statusList is EqualUnmodifiableListView) return _statusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusList);
  }

  @override
  final bool showErrorMessage;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterState(filter: $filter, statusList: $statusList, showErrorMessage: $showErrorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OutstandingInvoiceFilterState &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality()
                .equals(other._statusList, _statusList) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                other.showErrorMessage == showErrorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter,
      const DeepCollectionEquality().hash(_statusList), showErrorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OutstandingInvoiceFilterStateCopyWith<_$_OutstandingInvoiceFilterState>
      get copyWith => __$$_OutstandingInvoiceFilterStateCopyWithImpl<
          _$_OutstandingInvoiceFilterState>(this, _$identity);
}

abstract class _OutstandingInvoiceFilterState
    extends OutstandingInvoiceFilterState {
  const factory _OutstandingInvoiceFilterState(
      {required final OutstandingInvoiceFilter filter,
      required final List<StatusType> statusList,
      required final bool showErrorMessage}) = _$_OutstandingInvoiceFilterState;
  const _OutstandingInvoiceFilterState._() : super._();

  @override
  OutstandingInvoiceFilter get filter;
  @override
  List<StatusType> get statusList;
  @override
  bool get showErrorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_OutstandingInvoiceFilterStateCopyWith<_$_OutstandingInvoiceFilterState>
      get copyWith => throw _privateConstructorUsedError;
}
