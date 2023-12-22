// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_and_invoice_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreditAndInvoiceDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(CreditAndInvoiceItem creditAndInvoiceItem) fetch,
    required TResult Function(String invoiceId) fetchInvoiceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(CreditAndInvoiceItem creditAndInvoiceItem)? fetch,
    TResult? Function(String invoiceId)? fetchInvoiceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(CreditAndInvoiceItem creditAndInvoiceItem)? fetch,
    TResult Function(String invoiceId)? fetchInvoiceById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchInvoiceById value) fetchInvoiceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchInvoiceById value)? fetchInvoiceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchInvoiceById value)? fetchInvoiceById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditAndInvoiceDetailsEventCopyWith<$Res> {
  factory $CreditAndInvoiceDetailsEventCopyWith(
          CreditAndInvoiceDetailsEvent value,
          $Res Function(CreditAndInvoiceDetailsEvent) then) =
      _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res,
          CreditAndInvoiceDetailsEvent>;
}

/// @nodoc
class _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res,
        $Val extends CreditAndInvoiceDetailsEvent>
    implements $CreditAndInvoiceDetailsEventCopyWith<$Res> {
  _$CreditAndInvoiceDetailsEventCopyWithImpl(this._value, this._then);

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
  $Res call(
      {SalesOrganisation salesOrganisation, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_Initialized(
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

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.salesOrganisation, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'CreditAndInvoiceDetailsEvent.initialized(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganisation, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(CreditAndInvoiceItem creditAndInvoiceItem) fetch,
    required TResult Function(String invoiceId) fetchInvoiceById,
  }) {
    return initialized(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(CreditAndInvoiceItem creditAndInvoiceItem)? fetch,
    TResult? Function(String invoiceId)? fetchInvoiceById,
  }) {
    return initialized?.call(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(CreditAndInvoiceItem creditAndInvoiceItem)? fetch,
    TResult Function(String invoiceId)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchInvoiceById value) fetchInvoiceById,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchInvoiceById value)? fetchInvoiceById,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchInvoiceById value)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CreditAndInvoiceDetailsEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$_Initialized;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({CreditAndInvoiceItem creditAndInvoiceItem});

  $CreditAndInvoiceItemCopyWith<$Res> get creditAndInvoiceItem;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditAndInvoiceItem = null,
  }) {
    return _then(_$_Fetch(
      creditAndInvoiceItem: null == creditAndInvoiceItem
          ? _value.creditAndInvoiceItem
          : creditAndInvoiceItem // ignore: cast_nullable_to_non_nullable
              as CreditAndInvoiceItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditAndInvoiceItemCopyWith<$Res> get creditAndInvoiceItem {
    return $CreditAndInvoiceItemCopyWith<$Res>(_value.creditAndInvoiceItem,
        (value) {
      return _then(_value.copyWith(creditAndInvoiceItem: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.creditAndInvoiceItem});

  @override
  final CreditAndInvoiceItem creditAndInvoiceItem;

  @override
  String toString() {
    return 'CreditAndInvoiceDetailsEvent.fetch(creditAndInvoiceItem: $creditAndInvoiceItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.creditAndInvoiceItem, creditAndInvoiceItem) ||
                other.creditAndInvoiceItem == creditAndInvoiceItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, creditAndInvoiceItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(CreditAndInvoiceItem creditAndInvoiceItem) fetch,
    required TResult Function(String invoiceId) fetchInvoiceById,
  }) {
    return fetch(creditAndInvoiceItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(CreditAndInvoiceItem creditAndInvoiceItem)? fetch,
    TResult? Function(String invoiceId)? fetchInvoiceById,
  }) {
    return fetch?.call(creditAndInvoiceItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(CreditAndInvoiceItem creditAndInvoiceItem)? fetch,
    TResult Function(String invoiceId)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(creditAndInvoiceItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchInvoiceById value) fetchInvoiceById,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchInvoiceById value)? fetchInvoiceById,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchInvoiceById value)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements CreditAndInvoiceDetailsEvent {
  const factory _Fetch(
      {required final CreditAndInvoiceItem creditAndInvoiceItem}) = _$_Fetch;

  CreditAndInvoiceItem get creditAndInvoiceItem;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchInvoiceByIdCopyWith<$Res> {
  factory _$$_FetchInvoiceByIdCopyWith(
          _$_FetchInvoiceById value, $Res Function(_$_FetchInvoiceById) then) =
      __$$_FetchInvoiceByIdCopyWithImpl<$Res>;
  @useResult
  $Res call({String invoiceId});
}

/// @nodoc
class __$$_FetchInvoiceByIdCopyWithImpl<$Res>
    extends _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res,
        _$_FetchInvoiceById> implements _$$_FetchInvoiceByIdCopyWith<$Res> {
  __$$_FetchInvoiceByIdCopyWithImpl(
      _$_FetchInvoiceById _value, $Res Function(_$_FetchInvoiceById) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
  }) {
    return _then(_$_FetchInvoiceById(
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchInvoiceById implements _FetchInvoiceById {
  const _$_FetchInvoiceById({required this.invoiceId});

  @override
  final String invoiceId;

  @override
  String toString() {
    return 'CreditAndInvoiceDetailsEvent.fetchInvoiceById(invoiceId: $invoiceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchInvoiceById &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchInvoiceByIdCopyWith<_$_FetchInvoiceById> get copyWith =>
      __$$_FetchInvoiceByIdCopyWithImpl<_$_FetchInvoiceById>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(CreditAndInvoiceItem creditAndInvoiceItem) fetch,
    required TResult Function(String invoiceId) fetchInvoiceById,
  }) {
    return fetchInvoiceById(invoiceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(CreditAndInvoiceItem creditAndInvoiceItem)? fetch,
    TResult? Function(String invoiceId)? fetchInvoiceById,
  }) {
    return fetchInvoiceById?.call(invoiceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(CreditAndInvoiceItem creditAndInvoiceItem)? fetch,
    TResult Function(String invoiceId)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (fetchInvoiceById != null) {
      return fetchInvoiceById(invoiceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchInvoiceById value) fetchInvoiceById,
  }) {
    return fetchInvoiceById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchInvoiceById value)? fetchInvoiceById,
  }) {
    return fetchInvoiceById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchInvoiceById value)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (fetchInvoiceById != null) {
      return fetchInvoiceById(this);
    }
    return orElse();
  }
}

abstract class _FetchInvoiceById implements CreditAndInvoiceDetailsEvent {
  const factory _FetchInvoiceById({required final String invoiceId}) =
      _$_FetchInvoiceById;

  String get invoiceId;
  @JsonKey(ignore: true)
  _$$_FetchInvoiceByIdCopyWith<_$_FetchInvoiceById> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreditAndInvoiceDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<CustomerDocumentDetail> get itemsInfo =>
      throw _privateConstructorUsedError;
  CreditAndInvoiceItem get basicInfo => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditAndInvoiceDetailsStateCopyWith<CreditAndInvoiceDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditAndInvoiceDetailsStateCopyWith<$Res> {
  factory $CreditAndInvoiceDetailsStateCopyWith(
          CreditAndInvoiceDetailsState value,
          $Res Function(CreditAndInvoiceDetailsState) then) =
      _$CreditAndInvoiceDetailsStateCopyWithImpl<$Res,
          CreditAndInvoiceDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<CustomerDocumentDetail> itemsInfo,
      CreditAndInvoiceItem basicInfo,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo});

  $CreditAndInvoiceItemCopyWith<$Res> get basicInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class _$CreditAndInvoiceDetailsStateCopyWithImpl<$Res,
        $Val extends CreditAndInvoiceDetailsState>
    implements $CreditAndInvoiceDetailsStateCopyWith<$Res> {
  _$CreditAndInvoiceDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? itemsInfo = null,
    Object? basicInfo = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
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
      itemsInfo: null == itemsInfo
          ? _value.itemsInfo
          : itemsInfo // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
      basicInfo: null == basicInfo
          ? _value.basicInfo
          : basicInfo // ignore: cast_nullable_to_non_nullable
              as CreditAndInvoiceItem,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditAndInvoiceItemCopyWith<$Res> get basicInfo {
    return $CreditAndInvoiceItemCopyWith<$Res>(_value.basicInfo, (value) {
      return _then(_value.copyWith(basicInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreditAndInvoiceDetailsStateCopyWith<$Res>
    implements $CreditAndInvoiceDetailsStateCopyWith<$Res> {
  factory _$$_CreditAndInvoiceDetailsStateCopyWith(
          _$_CreditAndInvoiceDetailsState value,
          $Res Function(_$_CreditAndInvoiceDetailsState) then) =
      __$$_CreditAndInvoiceDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<CustomerDocumentDetail> itemsInfo,
      CreditAndInvoiceItem basicInfo,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo});

  @override
  $CreditAndInvoiceItemCopyWith<$Res> get basicInfo;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_CreditAndInvoiceDetailsStateCopyWithImpl<$Res>
    extends _$CreditAndInvoiceDetailsStateCopyWithImpl<$Res,
        _$_CreditAndInvoiceDetailsState>
    implements _$$_CreditAndInvoiceDetailsStateCopyWith<$Res> {
  __$$_CreditAndInvoiceDetailsStateCopyWithImpl(
      _$_CreditAndInvoiceDetailsState _value,
      $Res Function(_$_CreditAndInvoiceDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? itemsInfo = null,
    Object? basicInfo = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_CreditAndInvoiceDetailsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      itemsInfo: null == itemsInfo
          ? _value._itemsInfo
          : itemsInfo // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
      basicInfo: null == basicInfo
          ? _value.basicInfo
          : basicInfo // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc

class _$_CreditAndInvoiceDetailsState extends _CreditAndInvoiceDetailsState {
  const _$_CreditAndInvoiceDetailsState(
      {required this.isLoading,
      required this.failureOrSuccessOption,
      required final List<CustomerDocumentDetail> itemsInfo,
      required this.basicInfo,
      required this.salesOrganisation,
      required this.customerCodeInfo})
      : _itemsInfo = itemsInfo,
        super._();

  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<CustomerDocumentDetail> _itemsInfo;
  @override
  List<CustomerDocumentDetail> get itemsInfo {
    if (_itemsInfo is EqualUnmodifiableListView) return _itemsInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemsInfo);
  }

  @override
  final CreditAndInvoiceItem basicInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'CreditAndInvoiceDetailsState(isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption, itemsInfo: $itemsInfo, basicInfo: $basicInfo, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditAndInvoiceDetailsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._itemsInfo, _itemsInfo) &&
            (identical(other.basicInfo, basicInfo) ||
                other.basicInfo == basicInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_itemsInfo),
      basicInfo,
      salesOrganisation,
      customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditAndInvoiceDetailsStateCopyWith<_$_CreditAndInvoiceDetailsState>
      get copyWith => __$$_CreditAndInvoiceDetailsStateCopyWithImpl<
          _$_CreditAndInvoiceDetailsState>(this, _$identity);
}

abstract class _CreditAndInvoiceDetailsState
    extends CreditAndInvoiceDetailsState {
  const factory _CreditAndInvoiceDetailsState(
      {required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<CustomerDocumentDetail> itemsInfo,
      required final CreditAndInvoiceItem basicInfo,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo
          customerCodeInfo}) = _$_CreditAndInvoiceDetailsState;
  const _CreditAndInvoiceDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<CustomerDocumentDetail> get itemsInfo;
  @override
  CreditAndInvoiceItem get basicInfo;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  @JsonKey(ignore: true)
  _$$_CreditAndInvoiceDetailsStateCopyWith<_$_CreditAndInvoiceDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
