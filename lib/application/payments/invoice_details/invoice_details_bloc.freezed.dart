// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InvoiceDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CreditAndInvoiceItem invoiceItem,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CreditAndInvoiceItem invoiceItem,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CreditAndInvoiceItem invoiceItem,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailsEventCopyWith<$Res> {
  factory $InvoiceDetailsEventCopyWith(
          InvoiceDetailsEvent value, $Res Function(InvoiceDetailsEvent) then) =
      _$InvoiceDetailsEventCopyWithImpl<$Res, InvoiceDetailsEvent>;
}

/// @nodoc
class _$InvoiceDetailsEventCopyWithImpl<$Res, $Val extends InvoiceDetailsEvent>
    implements $InvoiceDetailsEventCopyWith<$Res> {
  _$InvoiceDetailsEventCopyWithImpl(this._value, this._then);

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
    extends _$InvoiceDetailsEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'InvoiceDetailsEvent.initialized()';
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
    required TResult Function(
            CreditAndInvoiceItem invoiceItem,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CreditAndInvoiceItem invoiceItem,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CreditAndInvoiceItem invoiceItem,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
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
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements InvoiceDetailsEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CreditAndInvoiceItem invoiceItem,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo});

  $CreditAndInvoiceItemCopyWith<$Res> get invoiceItem;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$InvoiceDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceItem = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_Fetch(
      invoiceItem: null == invoiceItem
          ? _value.invoiceItem
          : invoiceItem // ignore: cast_nullable_to_non_nullable
              as CreditAndInvoiceItem,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditAndInvoiceItemCopyWith<$Res> get invoiceItem {
    return $CreditAndInvoiceItemCopyWith<$Res>(_value.invoiceItem, (value) {
      return _then(_value.copyWith(invoiceItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.invoiceItem,
      required this.salesOrganisation,
      required this.customerCodeInfo});

  @override
  final CreditAndInvoiceItem invoiceItem;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'InvoiceDetailsEvent.fetch(invoiceItem: $invoiceItem, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.invoiceItem, invoiceItem) ||
                other.invoiceItem == invoiceItem) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, invoiceItem, salesOrganisation, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CreditAndInvoiceItem invoiceItem,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return fetch(invoiceItem, salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            CreditAndInvoiceItem invoiceItem,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return fetch?.call(invoiceItem, salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            CreditAndInvoiceItem invoiceItem,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(invoiceItem, salesOrganisation, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements InvoiceDetailsEvent {
  const factory _Fetch(
      {required final CreditAndInvoiceItem invoiceItem,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$_Fetch;

  CreditAndInvoiceItem get invoiceItem;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InvoiceDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<CustomerDocumentDetail> get details =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceDetailsStateCopyWith<InvoiceDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailsStateCopyWith<$Res> {
  factory $InvoiceDetailsStateCopyWith(
          InvoiceDetailsState value, $Res Function(InvoiceDetailsState) then) =
      _$InvoiceDetailsStateCopyWithImpl<$Res, InvoiceDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<CustomerDocumentDetail> details});
}

/// @nodoc
class _$InvoiceDetailsStateCopyWithImpl<$Res, $Val extends InvoiceDetailsState>
    implements $InvoiceDetailsStateCopyWith<$Res> {
  _$InvoiceDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InvoiceDetailsStateCopyWith<$Res>
    implements $InvoiceDetailsStateCopyWith<$Res> {
  factory _$$_InvoiceDetailsStateCopyWith(_$_InvoiceDetailsState value,
          $Res Function(_$_InvoiceDetailsState) then) =
      __$$_InvoiceDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<CustomerDocumentDetail> details});
}

/// @nodoc
class __$$_InvoiceDetailsStateCopyWithImpl<$Res>
    extends _$InvoiceDetailsStateCopyWithImpl<$Res, _$_InvoiceDetailsState>
    implements _$$_InvoiceDetailsStateCopyWith<$Res> {
  __$$_InvoiceDetailsStateCopyWithImpl(_$_InvoiceDetailsState _value,
      $Res Function(_$_InvoiceDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? details = null,
  }) {
    return _then(_$_InvoiceDetailsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
    ));
  }
}

/// @nodoc

class _$_InvoiceDetailsState extends _InvoiceDetailsState {
  const _$_InvoiceDetailsState(
      {required this.isLoading,
      required this.failureOrSuccessOption,
      required final List<CustomerDocumentDetail> details})
      : _details = details,
        super._();

  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<CustomerDocumentDetail> _details;
  @override
  List<CustomerDocumentDetail> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'InvoiceDetailsState(isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceDetailsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      failureOrSuccessOption, const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceDetailsStateCopyWith<_$_InvoiceDetailsState> get copyWith =>
      __$$_InvoiceDetailsStateCopyWithImpl<_$_InvoiceDetailsState>(
          this, _$identity);
}

abstract class _InvoiceDetailsState extends InvoiceDetailsState {
  const factory _InvoiceDetailsState(
      {required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<CustomerDocumentDetail>
          details}) = _$_InvoiceDetailsState;
  const _InvoiceDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<CustomerDocumentDetail> get details;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceDetailsStateCopyWith<_$_InvoiceDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
