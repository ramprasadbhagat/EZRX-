// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_invoices_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllInvoicesFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllInvoicesFilterEventCopyWith<$Res> {
  factory $AllInvoicesFilterEventCopyWith(AllInvoicesFilterEvent value,
          $Res Function(AllInvoicesFilterEvent) then) =
      _$AllInvoicesFilterEventCopyWithImpl<$Res, AllInvoicesFilterEvent>;
}

/// @nodoc
class _$AllInvoicesFilterEventCopyWithImpl<$Res,
        $Val extends AllInvoicesFilterEvent>
    implements $AllInvoicesFilterEventCopyWith<$Res> {
  _$AllInvoicesFilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$_Fetch(
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

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.fetch(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return fetch(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return fetch?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements AllInvoicesFilterEvent {
  const factory _Fetch({required final SalesOrganisation salesOrganisation}) =
      _$_Fetch;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'AllInvoicesFilterEvent.initialized()';
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
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements AllInvoicesFilterEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_OpenFilterDrawerCopyWith<$Res> {
  factory _$$_OpenFilterDrawerCopyWith(
          _$_OpenFilterDrawer value, $Res Function(_$_OpenFilterDrawer) then) =
      __$$_OpenFilterDrawerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OpenFilterDrawerCopyWithImpl<$Res>
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_OpenFilterDrawer>
    implements _$$_OpenFilterDrawerCopyWith<$Res> {
  __$$_OpenFilterDrawerCopyWithImpl(
      _$_OpenFilterDrawer _value, $Res Function(_$_OpenFilterDrawer) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OpenFilterDrawer implements _OpenFilterDrawer {
  const _$_OpenFilterDrawer();

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.openFilterDrawer()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OpenFilterDrawer);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return openFilterDrawer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return openFilterDrawer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (openFilterDrawer != null) {
      return openFilterDrawer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return openFilterDrawer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return openFilterDrawer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (openFilterDrawer != null) {
      return openFilterDrawer(this);
    }
    return orElse();
  }
}

abstract class _OpenFilterDrawer implements AllInvoicesFilterEvent {
  const factory _OpenFilterDrawer() = _$_OpenFilterDrawer;
}

/// @nodoc
abstract class _$$_ApplyFiltersCopyWith<$Res> {
  factory _$$_ApplyFiltersCopyWith(
          _$_ApplyFilters value, $Res Function(_$_ApplyFilters) then) =
      __$$_ApplyFiltersCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ApplyFiltersCopyWithImpl<$Res>
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_ApplyFilters>
    implements _$$_ApplyFiltersCopyWith<$Res> {
  __$$_ApplyFiltersCopyWithImpl(
      _$_ApplyFilters _value, $Res Function(_$_ApplyFilters) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ApplyFilters implements _ApplyFilters {
  const _$_ApplyFilters();

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.applyFilters()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ApplyFilters);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return applyFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return applyFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (applyFilters != null) {
      return applyFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return applyFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return applyFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (applyFilters != null) {
      return applyFilters(this);
    }
    return orElse();
  }
}

abstract class _ApplyFilters implements AllInvoicesFilterEvent {
  const factory _ApplyFilters() = _$_ApplyFilters;
}

/// @nodoc
abstract class _$$_ClearFiltersCopyWith<$Res> {
  factory _$$_ClearFiltersCopyWith(
          _$_ClearFilters value, $Res Function(_$_ClearFilters) then) =
      __$$_ClearFiltersCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ClearFiltersCopyWithImpl<$Res>
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_ClearFilters>
    implements _$$_ClearFiltersCopyWith<$Res> {
  __$$_ClearFiltersCopyWithImpl(
      _$_ClearFilters _value, $Res Function(_$_ClearFilters) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ClearFilters implements _ClearFilters {
  const _$_ClearFilters();

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.clearFilters()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ClearFilters);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return clearFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return clearFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return clearFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return clearFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters(this);
    }
    return orElse();
  }
}

abstract class _ClearFilters implements AllInvoicesFilterEvent {
  const factory _ClearFilters() = _$_ClearFilters;
}

/// @nodoc
abstract class _$$_DocumentNumberChangedCopyWith<$Res> {
  factory _$$_DocumentNumberChangedCopyWith(_$_DocumentNumberChanged value,
          $Res Function(_$_DocumentNumberChanged) then) =
      __$$_DocumentNumberChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({DocumentNumber documentNumber});
}

/// @nodoc
class __$$_DocumentNumberChangedCopyWithImpl<$Res>
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_DocumentNumberChanged>
    implements _$$_DocumentNumberChangedCopyWith<$Res> {
  __$$_DocumentNumberChangedCopyWithImpl(_$_DocumentNumberChanged _value,
      $Res Function(_$_DocumentNumberChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentNumber = null,
  }) {
    return _then(_$_DocumentNumberChanged(
      null == documentNumber
          ? _value.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as DocumentNumber,
    ));
  }
}

/// @nodoc

class _$_DocumentNumberChanged implements _DocumentNumberChanged {
  const _$_DocumentNumberChanged(this.documentNumber);

  @override
  final DocumentNumber documentNumber;

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.documentNumberChanged(documentNumber: $documentNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentNumberChanged &&
            (identical(other.documentNumber, documentNumber) ||
                other.documentNumber == documentNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentNumberChangedCopyWith<_$_DocumentNumberChanged> get copyWith =>
      __$$_DocumentNumberChangedCopyWithImpl<_$_DocumentNumberChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return documentNumberChanged(documentNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return documentNumberChanged?.call(documentNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (documentNumberChanged != null) {
      return documentNumberChanged(documentNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return documentNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return documentNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (documentNumberChanged != null) {
      return documentNumberChanged(this);
    }
    return orElse();
  }
}

abstract class _DocumentNumberChanged implements AllInvoicesFilterEvent {
  const factory _DocumentNumberChanged(final DocumentNumber documentNumber) =
      _$_DocumentNumberChanged;

  DocumentNumber get documentNumber;
  @JsonKey(ignore: true)
  _$$_DocumentNumberChangedCopyWith<_$_DocumentNumberChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DebitValueFromChangedCopyWith<$Res> {
  factory _$$_DebitValueFromChangedCopyWith(_$_DebitValueFromChanged value,
          $Res Function(_$_DebitValueFromChanged) then) =
      __$$_DebitValueFromChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String debitValueFrom});
}

/// @nodoc
class __$$_DebitValueFromChangedCopyWithImpl<$Res>
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_DebitValueFromChanged>
    implements _$$_DebitValueFromChangedCopyWith<$Res> {
  __$$_DebitValueFromChangedCopyWithImpl(_$_DebitValueFromChanged _value,
      $Res Function(_$_DebitValueFromChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debitValueFrom = null,
  }) {
    return _then(_$_DebitValueFromChanged(
      null == debitValueFrom
          ? _value.debitValueFrom
          : debitValueFrom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DebitValueFromChanged implements _DebitValueFromChanged {
  const _$_DebitValueFromChanged(this.debitValueFrom);

  @override
  final String debitValueFrom;

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.debitValueFromChanged(debitValueFrom: $debitValueFrom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DebitValueFromChanged &&
            (identical(other.debitValueFrom, debitValueFrom) ||
                other.debitValueFrom == debitValueFrom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, debitValueFrom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DebitValueFromChangedCopyWith<_$_DebitValueFromChanged> get copyWith =>
      __$$_DebitValueFromChangedCopyWithImpl<_$_DebitValueFromChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return debitValueFromChanged(debitValueFrom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return debitValueFromChanged?.call(debitValueFrom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (debitValueFromChanged != null) {
      return debitValueFromChanged(debitValueFrom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return debitValueFromChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return debitValueFromChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (debitValueFromChanged != null) {
      return debitValueFromChanged(this);
    }
    return orElse();
  }
}

abstract class _DebitValueFromChanged implements AllInvoicesFilterEvent {
  const factory _DebitValueFromChanged(final String debitValueFrom) =
      _$_DebitValueFromChanged;

  String get debitValueFrom;
  @JsonKey(ignore: true)
  _$$_DebitValueFromChangedCopyWith<_$_DebitValueFromChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DebitValueToChangedCopyWith<$Res> {
  factory _$$_DebitValueToChangedCopyWith(_$_DebitValueToChanged value,
          $Res Function(_$_DebitValueToChanged) then) =
      __$$_DebitValueToChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String debitValueTo});
}

/// @nodoc
class __$$_DebitValueToChangedCopyWithImpl<$Res>
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_DebitValueToChanged>
    implements _$$_DebitValueToChangedCopyWith<$Res> {
  __$$_DebitValueToChangedCopyWithImpl(_$_DebitValueToChanged _value,
      $Res Function(_$_DebitValueToChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? debitValueTo = null,
  }) {
    return _then(_$_DebitValueToChanged(
      null == debitValueTo
          ? _value.debitValueTo
          : debitValueTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DebitValueToChanged implements _DebitValueToChanged {
  const _$_DebitValueToChanged(this.debitValueTo);

  @override
  final String debitValueTo;

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.debitValueToChanged(debitValueTo: $debitValueTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DebitValueToChanged &&
            (identical(other.debitValueTo, debitValueTo) ||
                other.debitValueTo == debitValueTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, debitValueTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DebitValueToChangedCopyWith<_$_DebitValueToChanged> get copyWith =>
      __$$_DebitValueToChangedCopyWithImpl<_$_DebitValueToChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return debitValueToChanged(debitValueTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return debitValueToChanged?.call(debitValueTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (debitValueToChanged != null) {
      return debitValueToChanged(debitValueTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return debitValueToChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return debitValueToChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (debitValueToChanged != null) {
      return debitValueToChanged(this);
    }
    return orElse();
  }
}

abstract class _DebitValueToChanged implements AllInvoicesFilterEvent {
  const factory _DebitValueToChanged(final String debitValueTo) =
      _$_DebitValueToChanged;

  String get debitValueTo;
  @JsonKey(ignore: true)
  _$$_DebitValueToChangedCopyWith<_$_DebitValueToChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StatusChangedCopyWith<$Res> {
  factory _$$_StatusChangedCopyWith(
          _$_StatusChanged value, $Res Function(_$_StatusChanged) then) =
      __$$_StatusChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String filterStatus});
}

/// @nodoc
class __$$_StatusChangedCopyWithImpl<$Res>
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_StatusChanged>
    implements _$$_StatusChangedCopyWith<$Res> {
  __$$_StatusChangedCopyWithImpl(
      _$_StatusChanged _value, $Res Function(_$_StatusChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterStatus = null,
  }) {
    return _then(_$_StatusChanged(
      null == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StatusChanged implements _StatusChanged {
  const _$_StatusChanged(this.filterStatus);

  @override
  final String filterStatus;

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.statusChanged(filterStatus: $filterStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusChanged &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatusChangedCopyWith<_$_StatusChanged> get copyWith =>
      __$$_StatusChangedCopyWithImpl<_$_StatusChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return statusChanged(filterStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return statusChanged?.call(filterStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged(filterStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return statusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return statusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged(this);
    }
    return orElse();
  }
}

abstract class _StatusChanged implements AllInvoicesFilterEvent {
  const factory _StatusChanged(final String filterStatus) = _$_StatusChanged;

  String get filterStatus;
  @JsonKey(ignore: true)
  _$$_StatusChangedCopyWith<_$_StatusChanged> get copyWith =>
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
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_SetDueDate>
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
      null == dueDateRange
          ? _value.dueDateRange
          : dueDateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$_SetDueDate implements _SetDueDate {
  const _$_SetDueDate(this.dueDateRange);

  @override
  final DateTimeRange dueDateRange;

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.setDueDate(dueDateRange: $dueDateRange)';
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
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return setDueDate(dueDateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return setDueDate?.call(dueDateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return setDueDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return setDueDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (setDueDate != null) {
      return setDueDate(this);
    }
    return orElse();
  }
}

abstract class _SetDueDate implements AllInvoicesFilterEvent {
  const factory _SetDueDate(final DateTimeRange dueDateRange) = _$_SetDueDate;

  DateTimeRange get dueDateRange;
  @JsonKey(ignore: true)
  _$$_SetDueDateCopyWith<_$_SetDueDate> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$AllInvoicesFilterEventCopyWithImpl<$Res, _$_SetDocumentDate>
    implements _$$_SetDocumentDateCopyWith<$Res> {
  __$$_SetDocumentDateCopyWithImpl(
      _$_SetDocumentDate _value, $Res Function(_$_SetDocumentDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDateRange = null,
  }) {
    return _then(_$_SetDocumentDate(
      null == documentDateRange
          ? _value.documentDateRange
          : documentDateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$_SetDocumentDate implements _SetDocumentDate {
  const _$_SetDocumentDate(this.documentDateRange);

  @override
  final DateTimeRange documentDateRange;

  @override
  String toString() {
    return 'AllInvoicesFilterEvent.setDocumentDate(documentDateRange: $documentDateRange)';
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
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function() initialized,
    required TResult Function() openFilterDrawer,
    required TResult Function() applyFilters,
    required TResult Function() clearFilters,
    required TResult Function(DocumentNumber documentNumber)
        documentNumberChanged,
    required TResult Function(String debitValueFrom) debitValueFromChanged,
    required TResult Function(String debitValueTo) debitValueToChanged,
    required TResult Function(String filterStatus) statusChanged,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
  }) {
    return setDocumentDate(documentDateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function()? initialized,
    TResult? Function()? openFilterDrawer,
    TResult? Function()? applyFilters,
    TResult? Function()? clearFilters,
    TResult? Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult? Function(String debitValueFrom)? debitValueFromChanged,
    TResult? Function(String debitValueTo)? debitValueToChanged,
    TResult? Function(String filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
  }) {
    return setDocumentDate?.call(documentDateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function()? initialized,
    TResult Function()? openFilterDrawer,
    TResult Function()? applyFilters,
    TResult Function()? clearFilters,
    TResult Function(DocumentNumber documentNumber)? documentNumberChanged,
    TResult Function(String debitValueFrom)? debitValueFromChanged,
    TResult Function(String debitValueTo)? debitValueToChanged,
    TResult Function(String filterStatus)? statusChanged,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterDrawer value) openFilterDrawer,
    required TResult Function(_ApplyFilters value) applyFilters,
    required TResult Function(_ClearFilters value) clearFilters,
    required TResult Function(_DocumentNumberChanged value)
        documentNumberChanged,
    required TResult Function(_DebitValueFromChanged value)
        debitValueFromChanged,
    required TResult Function(_DebitValueToChanged value) debitValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
  }) {
    return setDocumentDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult? Function(_ApplyFilters value)? applyFilters,
    TResult? Function(_ClearFilters value)? clearFilters,
    TResult? Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult? Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult? Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
  }) {
    return setDocumentDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterDrawer value)? openFilterDrawer,
    TResult Function(_ApplyFilters value)? applyFilters,
    TResult Function(_ClearFilters value)? clearFilters,
    TResult Function(_DocumentNumberChanged value)? documentNumberChanged,
    TResult Function(_DebitValueFromChanged value)? debitValueFromChanged,
    TResult Function(_DebitValueToChanged value)? debitValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    required TResult orElse(),
  }) {
    if (setDocumentDate != null) {
      return setDocumentDate(this);
    }
    return orElse();
  }
}

abstract class _SetDocumentDate implements AllInvoicesFilterEvent {
  const factory _SetDocumentDate(final DateTimeRange documentDateRange) =
      _$_SetDocumentDate;

  DateTimeRange get documentDateRange;
  @JsonKey(ignore: true)
  _$$_SetDocumentDateCopyWith<_$_SetDocumentDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AllInvoicesFilterState {
  AllInvoicesFilter get allInvoicesFilter => throw _privateConstructorUsedError;
  List<String> get statuses => throw _privateConstructorUsedError;
  bool get changed => throw _privateConstructorUsedError;
  bool get edited => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllInvoicesFilterStateCopyWith<AllInvoicesFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllInvoicesFilterStateCopyWith<$Res> {
  factory $AllInvoicesFilterStateCopyWith(AllInvoicesFilterState value,
          $Res Function(AllInvoicesFilterState) then) =
      _$AllInvoicesFilterStateCopyWithImpl<$Res, AllInvoicesFilterState>;
  @useResult
  $Res call(
      {AllInvoicesFilter allInvoicesFilter,
      List<String> statuses,
      bool changed,
      bool edited,
      bool isFetching,
      bool showErrorMessages,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $AllInvoicesFilterCopyWith<$Res> get allInvoicesFilter;
}

/// @nodoc
class _$AllInvoicesFilterStateCopyWithImpl<$Res,
        $Val extends AllInvoicesFilterState>
    implements $AllInvoicesFilterStateCopyWith<$Res> {
  _$AllInvoicesFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allInvoicesFilter = null,
    Object? statuses = null,
    Object? changed = null,
    Object? edited = null,
    Object? isFetching = null,
    Object? showErrorMessages = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      allInvoicesFilter: null == allInvoicesFilter
          ? _value.allInvoicesFilter
          : allInvoicesFilter // ignore: cast_nullable_to_non_nullable
              as AllInvoicesFilter,
      statuses: null == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      changed: null == changed
          ? _value.changed
          : changed // ignore: cast_nullable_to_non_nullable
              as bool,
      edited: null == edited
          ? _value.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AllInvoicesFilterCopyWith<$Res> get allInvoicesFilter {
    return $AllInvoicesFilterCopyWith<$Res>(_value.allInvoicesFilter, (value) {
      return _then(_value.copyWith(allInvoicesFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AllInvoicesFilterStateCopyWith<$Res>
    implements $AllInvoicesFilterStateCopyWith<$Res> {
  factory _$$_AllInvoicesFilterStateCopyWith(_$_AllInvoicesFilterState value,
          $Res Function(_$_AllInvoicesFilterState) then) =
      __$$_AllInvoicesFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AllInvoicesFilter allInvoicesFilter,
      List<String> statuses,
      bool changed,
      bool edited,
      bool isFetching,
      bool showErrorMessages,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $AllInvoicesFilterCopyWith<$Res> get allInvoicesFilter;
}

/// @nodoc
class __$$_AllInvoicesFilterStateCopyWithImpl<$Res>
    extends _$AllInvoicesFilterStateCopyWithImpl<$Res,
        _$_AllInvoicesFilterState>
    implements _$$_AllInvoicesFilterStateCopyWith<$Res> {
  __$$_AllInvoicesFilterStateCopyWithImpl(_$_AllInvoicesFilterState _value,
      $Res Function(_$_AllInvoicesFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allInvoicesFilter = null,
    Object? statuses = null,
    Object? changed = null,
    Object? edited = null,
    Object? isFetching = null,
    Object? showErrorMessages = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_AllInvoicesFilterState(
      allInvoicesFilter: null == allInvoicesFilter
          ? _value.allInvoicesFilter
          : allInvoicesFilter // ignore: cast_nullable_to_non_nullable
              as AllInvoicesFilter,
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      changed: null == changed
          ? _value.changed
          : changed // ignore: cast_nullable_to_non_nullable
              as bool,
      edited: null == edited
          ? _value.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_AllInvoicesFilterState extends _AllInvoicesFilterState {
  const _$_AllInvoicesFilterState(
      {required this.allInvoicesFilter,
      required final List<String> statuses,
      required this.changed,
      required this.edited,
      required this.isFetching,
      required this.showErrorMessages,
      required this.failureOrSuccessOption})
      : _statuses = statuses,
        super._();

  @override
  final AllInvoicesFilter allInvoicesFilter;
  final List<String> _statuses;
  @override
  List<String> get statuses {
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  @override
  final bool changed;
  @override
  final bool edited;
  @override
  final bool isFetching;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'AllInvoicesFilterState(allInvoicesFilter: $allInvoicesFilter, statuses: $statuses, changed: $changed, edited: $edited, isFetching: $isFetching, showErrorMessages: $showErrorMessages, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllInvoicesFilterState &&
            (identical(other.allInvoicesFilter, allInvoicesFilter) ||
                other.allInvoicesFilter == allInvoicesFilter) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.changed, changed) || other.changed == changed) &&
            (identical(other.edited, edited) || other.edited == edited) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      allInvoicesFilter,
      const DeepCollectionEquality().hash(_statuses),
      changed,
      edited,
      isFetching,
      showErrorMessages,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllInvoicesFilterStateCopyWith<_$_AllInvoicesFilterState> get copyWith =>
      __$$_AllInvoicesFilterStateCopyWithImpl<_$_AllInvoicesFilterState>(
          this, _$identity);
}

abstract class _AllInvoicesFilterState extends AllInvoicesFilterState {
  const factory _AllInvoicesFilterState(
      {required final AllInvoicesFilter allInvoicesFilter,
      required final List<String> statuses,
      required final bool changed,
      required final bool edited,
      required final bool isFetching,
      required final bool showErrorMessages,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_AllInvoicesFilterState;
  const _AllInvoicesFilterState._() : super._();

  @override
  AllInvoicesFilter get allInvoicesFilter;
  @override
  List<String> get statuses;
  @override
  bool get changed;
  @override
  bool get edited;
  @override
  bool get isFetching;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AllInvoicesFilterStateCopyWith<_$_AllInvoicesFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
