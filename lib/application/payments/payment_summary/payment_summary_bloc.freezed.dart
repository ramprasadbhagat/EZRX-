// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentSummaryEvent {
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetchPaymentSummaryList,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        loadMorePaymentSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryList,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        loadMorePaymentSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryList,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        loadMorePaymentSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentSummaryList value)
        fetchPaymentSummaryList,
    required TResult Function(_LoadMorePaymentSummary value)
        loadMorePaymentSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentSummaryList value)? fetchPaymentSummaryList,
    TResult? Function(_LoadMorePaymentSummary value)? loadMorePaymentSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentSummaryList value)? fetchPaymentSummaryList,
    TResult Function(_LoadMorePaymentSummary value)? loadMorePaymentSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryEventCopyWith<PaymentSummaryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryEventCopyWith<$Res> {
  factory $PaymentSummaryEventCopyWith(
          PaymentSummaryEvent value, $Res Function(PaymentSummaryEvent) then) =
      _$PaymentSummaryEventCopyWithImpl<$Res, PaymentSummaryEvent>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class _$PaymentSummaryEventCopyWithImpl<$Res, $Val extends PaymentSummaryEvent>
    implements $PaymentSummaryEventCopyWith<$Res> {
  _$PaymentSummaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_value.copyWith(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value) as $Val);
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
abstract class _$$_FetchPaymentSummaryListCopyWith<$Res>
    implements $PaymentSummaryEventCopyWith<$Res> {
  factory _$$_FetchPaymentSummaryListCopyWith(_$_FetchPaymentSummaryList value,
          $Res Function(_$_FetchPaymentSummaryList) then) =
      __$$_FetchPaymentSummaryListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization, CustomerCodeInfo customerCodeInfo});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_FetchPaymentSummaryListCopyWithImpl<$Res>
    extends _$PaymentSummaryEventCopyWithImpl<$Res, _$_FetchPaymentSummaryList>
    implements _$$_FetchPaymentSummaryListCopyWith<$Res> {
  __$$_FetchPaymentSummaryListCopyWithImpl(_$_FetchPaymentSummaryList _value,
      $Res Function(_$_FetchPaymentSummaryList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_FetchPaymentSummaryList(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }
}

/// @nodoc

class _$_FetchPaymentSummaryList implements _FetchPaymentSummaryList {
  const _$_FetchPaymentSummaryList(
      {required this.salesOrganization, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'PaymentSummaryEvent.fetchPaymentSummaryList(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPaymentSummaryList &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganization, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchPaymentSummaryListCopyWith<_$_FetchPaymentSummaryList>
      get copyWith =>
          __$$_FetchPaymentSummaryListCopyWithImpl<_$_FetchPaymentSummaryList>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetchPaymentSummaryList,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        loadMorePaymentSummary,
  }) {
    return fetchPaymentSummaryList(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryList,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        loadMorePaymentSummary,
  }) {
    return fetchPaymentSummaryList?.call(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryList,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        loadMorePaymentSummary,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryList != null) {
      return fetchPaymentSummaryList(salesOrganization, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentSummaryList value)
        fetchPaymentSummaryList,
    required TResult Function(_LoadMorePaymentSummary value)
        loadMorePaymentSummary,
  }) {
    return fetchPaymentSummaryList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentSummaryList value)? fetchPaymentSummaryList,
    TResult? Function(_LoadMorePaymentSummary value)? loadMorePaymentSummary,
  }) {
    return fetchPaymentSummaryList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentSummaryList value)? fetchPaymentSummaryList,
    TResult Function(_LoadMorePaymentSummary value)? loadMorePaymentSummary,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryList != null) {
      return fetchPaymentSummaryList(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentSummaryList implements PaymentSummaryEvent {
  const factory _FetchPaymentSummaryList(
          {required final SalesOrganisation salesOrganization,
          required final CustomerCodeInfo customerCodeInfo}) =
      _$_FetchPaymentSummaryList;

  @override
  SalesOrganisation get salesOrganization;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  @JsonKey(ignore: true)
  _$$_FetchPaymentSummaryListCopyWith<_$_FetchPaymentSummaryList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMorePaymentSummaryCopyWith<$Res>
    implements $PaymentSummaryEventCopyWith<$Res> {
  factory _$$_LoadMorePaymentSummaryCopyWith(_$_LoadMorePaymentSummary value,
          $Res Function(_$_LoadMorePaymentSummary) then) =
      __$$_LoadMorePaymentSummaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization, CustomerCodeInfo customerCodeInfo});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_LoadMorePaymentSummaryCopyWithImpl<$Res>
    extends _$PaymentSummaryEventCopyWithImpl<$Res, _$_LoadMorePaymentSummary>
    implements _$$_LoadMorePaymentSummaryCopyWith<$Res> {
  __$$_LoadMorePaymentSummaryCopyWithImpl(_$_LoadMorePaymentSummary _value,
      $Res Function(_$_LoadMorePaymentSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_LoadMorePaymentSummary(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }
}

/// @nodoc

class _$_LoadMorePaymentSummary implements _LoadMorePaymentSummary {
  const _$_LoadMorePaymentSummary(
      {required this.salesOrganization, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'PaymentSummaryEvent.loadMorePaymentSummary(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMorePaymentSummary &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganization, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMorePaymentSummaryCopyWith<_$_LoadMorePaymentSummary> get copyWith =>
      __$$_LoadMorePaymentSummaryCopyWithImpl<_$_LoadMorePaymentSummary>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetchPaymentSummaryList,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        loadMorePaymentSummary,
  }) {
    return loadMorePaymentSummary(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryList,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        loadMorePaymentSummary,
  }) {
    return loadMorePaymentSummary?.call(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryList,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        loadMorePaymentSummary,
    required TResult orElse(),
  }) {
    if (loadMorePaymentSummary != null) {
      return loadMorePaymentSummary(salesOrganization, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentSummaryList value)
        fetchPaymentSummaryList,
    required TResult Function(_LoadMorePaymentSummary value)
        loadMorePaymentSummary,
  }) {
    return loadMorePaymentSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentSummaryList value)? fetchPaymentSummaryList,
    TResult? Function(_LoadMorePaymentSummary value)? loadMorePaymentSummary,
  }) {
    return loadMorePaymentSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentSummaryList value)? fetchPaymentSummaryList,
    TResult Function(_LoadMorePaymentSummary value)? loadMorePaymentSummary,
    required TResult orElse(),
  }) {
    if (loadMorePaymentSummary != null) {
      return loadMorePaymentSummary(this);
    }
    return orElse();
  }
}

abstract class _LoadMorePaymentSummary implements PaymentSummaryEvent {
  const factory _LoadMorePaymentSummary(
          {required final SalesOrganisation salesOrganization,
          required final CustomerCodeInfo customerCodeInfo}) =
      _$_LoadMorePaymentSummary;

  @override
  SalesOrganisation get salesOrganization;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  @JsonKey(ignore: true)
  _$$_LoadMorePaymentSummaryCopyWith<_$_LoadMorePaymentSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentSummaryState {
  List<PaymentSummaryDetails> get paymentSummaryList =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMorePaymentSummary => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryStateCopyWith<PaymentSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryStateCopyWith<$Res> {
  factory $PaymentSummaryStateCopyWith(
          PaymentSummaryState value, $Res Function(PaymentSummaryState) then) =
      _$PaymentSummaryStateCopyWithImpl<$Res, PaymentSummaryState>;
  @useResult
  $Res call(
      {List<PaymentSummaryDetails> paymentSummaryList,
      bool isFetching,
      bool canLoadMorePaymentSummary,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$PaymentSummaryStateCopyWithImpl<$Res, $Val extends PaymentSummaryState>
    implements $PaymentSummaryStateCopyWith<$Res> {
  _$PaymentSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentSummaryList = null,
    Object? isFetching = null,
    Object? canLoadMorePaymentSummary = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      paymentSummaryList: null == paymentSummaryList
          ? _value.paymentSummaryList
          : paymentSummaryList // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMorePaymentSummary: null == canLoadMorePaymentSummary
          ? _value.canLoadMorePaymentSummary
          : canLoadMorePaymentSummary // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentSummaryStateCopyWith<$Res>
    implements $PaymentSummaryStateCopyWith<$Res> {
  factory _$$_PaymentSummaryStateCopyWith(_$_PaymentSummaryState value,
          $Res Function(_$_PaymentSummaryState) then) =
      __$$_PaymentSummaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PaymentSummaryDetails> paymentSummaryList,
      bool isFetching,
      bool canLoadMorePaymentSummary,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$_PaymentSummaryStateCopyWithImpl<$Res>
    extends _$PaymentSummaryStateCopyWithImpl<$Res, _$_PaymentSummaryState>
    implements _$$_PaymentSummaryStateCopyWith<$Res> {
  __$$_PaymentSummaryStateCopyWithImpl(_$_PaymentSummaryState _value,
      $Res Function(_$_PaymentSummaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentSummaryList = null,
    Object? isFetching = null,
    Object? canLoadMorePaymentSummary = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_PaymentSummaryState(
      paymentSummaryList: null == paymentSummaryList
          ? _value._paymentSummaryList
          : paymentSummaryList // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMorePaymentSummary: null == canLoadMorePaymentSummary
          ? _value.canLoadMorePaymentSummary
          : canLoadMorePaymentSummary // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_PaymentSummaryState extends _PaymentSummaryState {
  const _$_PaymentSummaryState(
      {required final List<PaymentSummaryDetails> paymentSummaryList,
      required this.isFetching,
      required this.canLoadMorePaymentSummary,
      required this.failureOrSuccessOption})
      : _paymentSummaryList = paymentSummaryList,
        super._();

  final List<PaymentSummaryDetails> _paymentSummaryList;
  @override
  List<PaymentSummaryDetails> get paymentSummaryList {
    if (_paymentSummaryList is EqualUnmodifiableListView)
      return _paymentSummaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentSummaryList);
  }

  @override
  final bool isFetching;
  @override
  final bool canLoadMorePaymentSummary;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentSummaryState(paymentSummaryList: $paymentSummaryList, isFetching: $isFetching, canLoadMorePaymentSummary: $canLoadMorePaymentSummary, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentSummaryState &&
            const DeepCollectionEquality()
                .equals(other._paymentSummaryList, _paymentSummaryList) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMorePaymentSummary,
                    canLoadMorePaymentSummary) ||
                other.canLoadMorePaymentSummary == canLoadMorePaymentSummary) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_paymentSummaryList),
      isFetching,
      canLoadMorePaymentSummary,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentSummaryStateCopyWith<_$_PaymentSummaryState> get copyWith =>
      __$$_PaymentSummaryStateCopyWithImpl<_$_PaymentSummaryState>(
          this, _$identity);
}

abstract class _PaymentSummaryState extends PaymentSummaryState {
  const factory _PaymentSummaryState(
      {required final List<PaymentSummaryDetails> paymentSummaryList,
      required final bool isFetching,
      required final bool canLoadMorePaymentSummary,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_PaymentSummaryState;
  const _PaymentSummaryState._() : super._();

  @override
  List<PaymentSummaryDetails> get paymentSummaryList;
  @override
  bool get isFetching;
  @override
  bool get canLoadMorePaymentSummary;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentSummaryStateCopyWith<_$_PaymentSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
