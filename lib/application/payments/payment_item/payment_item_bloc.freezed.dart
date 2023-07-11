// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentItemEvent {
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  String get paymentID => throw _privateConstructorUsedError;
  String get paymentBatchAdditionalInfo => throw _privateConstructorUsedError;
  String get accountingDocExternalReference =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            String paymentID,
            String paymentBatchAdditionalInfo,
            String accountingDocExternalReference)
        fetchPaymentItemList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            String paymentID,
            String paymentBatchAdditionalInfo,
            String accountingDocExternalReference)?
        fetchPaymentItemList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            String paymentID,
            String paymentBatchAdditionalInfo,
            String accountingDocExternalReference)?
        fetchPaymentItemList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentItemList value) fetchPaymentItemList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentItemList value)? fetchPaymentItemList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentItemList value)? fetchPaymentItemList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentItemEventCopyWith<PaymentItemEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentItemEventCopyWith<$Res> {
  factory $PaymentItemEventCopyWith(
          PaymentItemEvent value, $Res Function(PaymentItemEvent) then) =
      _$PaymentItemEventCopyWithImpl<$Res, PaymentItemEvent>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      String paymentID,
      String paymentBatchAdditionalInfo,
      String accountingDocExternalReference});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class _$PaymentItemEventCopyWithImpl<$Res, $Val extends PaymentItemEvent>
    implements $PaymentItemEventCopyWith<$Res> {
  _$PaymentItemEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? paymentID = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? accountingDocExternalReference = null,
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
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocExternalReference: null == accountingDocExternalReference
          ? _value.accountingDocExternalReference
          : accountingDocExternalReference // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_FetchPaymentItemListCopyWith<$Res>
    implements $PaymentItemEventCopyWith<$Res> {
  factory _$$_FetchPaymentItemListCopyWith(_$_FetchPaymentItemList value,
          $Res Function(_$_FetchPaymentItemList) then) =
      __$$_FetchPaymentItemListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      String paymentID,
      String paymentBatchAdditionalInfo,
      String accountingDocExternalReference});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_FetchPaymentItemListCopyWithImpl<$Res>
    extends _$PaymentItemEventCopyWithImpl<$Res, _$_FetchPaymentItemList>
    implements _$$_FetchPaymentItemListCopyWith<$Res> {
  __$$_FetchPaymentItemListCopyWithImpl(_$_FetchPaymentItemList _value,
      $Res Function(_$_FetchPaymentItemList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? paymentID = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? accountingDocExternalReference = null,
  }) {
    return _then(_$_FetchPaymentItemList(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocExternalReference: null == accountingDocExternalReference
          ? _value.accountingDocExternalReference
          : accountingDocExternalReference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchPaymentItemList implements _FetchPaymentItemList {
  const _$_FetchPaymentItemList(
      {required this.salesOrganization,
      required this.customerCodeInfo,
      required this.paymentID,
      required this.paymentBatchAdditionalInfo,
      required this.accountingDocExternalReference});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final String paymentID;
  @override
  final String paymentBatchAdditionalInfo;
  @override
  final String accountingDocExternalReference;

  @override
  String toString() {
    return 'PaymentItemEvent.fetchPaymentItemList(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, paymentID: $paymentID, paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo, accountingDocExternalReference: $accountingDocExternalReference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPaymentItemList &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.paymentID, paymentID) ||
                other.paymentID == paymentID) &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo) &&
            (identical(other.accountingDocExternalReference,
                    accountingDocExternalReference) ||
                other.accountingDocExternalReference ==
                    accountingDocExternalReference));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganization,
      customerCodeInfo,
      paymentID,
      paymentBatchAdditionalInfo,
      accountingDocExternalReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchPaymentItemListCopyWith<_$_FetchPaymentItemList> get copyWith =>
      __$$_FetchPaymentItemListCopyWithImpl<_$_FetchPaymentItemList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            String paymentID,
            String paymentBatchAdditionalInfo,
            String accountingDocExternalReference)
        fetchPaymentItemList,
  }) {
    return fetchPaymentItemList(salesOrganization, customerCodeInfo, paymentID,
        paymentBatchAdditionalInfo, accountingDocExternalReference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            String paymentID,
            String paymentBatchAdditionalInfo,
            String accountingDocExternalReference)?
        fetchPaymentItemList,
  }) {
    return fetchPaymentItemList?.call(salesOrganization, customerCodeInfo,
        paymentID, paymentBatchAdditionalInfo, accountingDocExternalReference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            String paymentID,
            String paymentBatchAdditionalInfo,
            String accountingDocExternalReference)?
        fetchPaymentItemList,
    required TResult orElse(),
  }) {
    if (fetchPaymentItemList != null) {
      return fetchPaymentItemList(
          salesOrganization,
          customerCodeInfo,
          paymentID,
          paymentBatchAdditionalInfo,
          accountingDocExternalReference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchPaymentItemList value) fetchPaymentItemList,
  }) {
    return fetchPaymentItemList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchPaymentItemList value)? fetchPaymentItemList,
  }) {
    return fetchPaymentItemList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchPaymentItemList value)? fetchPaymentItemList,
    required TResult orElse(),
  }) {
    if (fetchPaymentItemList != null) {
      return fetchPaymentItemList(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentItemList implements PaymentItemEvent {
  const factory _FetchPaymentItemList(
          {required final SalesOrganisation salesOrganization,
          required final CustomerCodeInfo customerCodeInfo,
          required final String paymentID,
          required final String paymentBatchAdditionalInfo,
          required final String accountingDocExternalReference}) =
      _$_FetchPaymentItemList;

  @override
  SalesOrganisation get salesOrganization;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  String get paymentID;
  @override
  String get paymentBatchAdditionalInfo;
  @override
  String get accountingDocExternalReference;
  @override
  @JsonKey(ignore: true)
  _$$_FetchPaymentItemListCopyWith<_$_FetchPaymentItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentItemState {
  List<PaymentItem> get paymentItemList => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentItemStateCopyWith<PaymentItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentItemStateCopyWith<$Res> {
  factory $PaymentItemStateCopyWith(
          PaymentItemState value, $Res Function(PaymentItemState) then) =
      _$PaymentItemStateCopyWithImpl<$Res, PaymentItemState>;
  @useResult
  $Res call(
      {List<PaymentItem> paymentItemList,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$PaymentItemStateCopyWithImpl<$Res, $Val extends PaymentItemState>
    implements $PaymentItemStateCopyWith<$Res> {
  _$PaymentItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentItemList = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      paymentItemList: null == paymentItemList
          ? _value.paymentItemList
          : paymentItemList // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentItemStateCopyWith<$Res>
    implements $PaymentItemStateCopyWith<$Res> {
  factory _$$_PaymentItemStateCopyWith(
          _$_PaymentItemState value, $Res Function(_$_PaymentItemState) then) =
      __$$_PaymentItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PaymentItem> paymentItemList,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$_PaymentItemStateCopyWithImpl<$Res>
    extends _$PaymentItemStateCopyWithImpl<$Res, _$_PaymentItemState>
    implements _$$_PaymentItemStateCopyWith<$Res> {
  __$$_PaymentItemStateCopyWithImpl(
      _$_PaymentItemState _value, $Res Function(_$_PaymentItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentItemList = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_PaymentItemState(
      paymentItemList: null == paymentItemList
          ? _value._paymentItemList
          : paymentItemList // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_PaymentItemState implements _PaymentItemState {
  const _$_PaymentItemState(
      {required final List<PaymentItem> paymentItemList,
      required this.isFetching,
      required this.failureOrSuccessOption})
      : _paymentItemList = paymentItemList;

  final List<PaymentItem> _paymentItemList;
  @override
  List<PaymentItem> get paymentItemList {
    if (_paymentItemList is EqualUnmodifiableListView) return _paymentItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentItemList);
  }

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentItemState(paymentItemList: $paymentItemList, isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentItemState &&
            const DeepCollectionEquality()
                .equals(other._paymentItemList, _paymentItemList) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_paymentItemList),
      isFetching,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentItemStateCopyWith<_$_PaymentItemState> get copyWith =>
      __$$_PaymentItemStateCopyWithImpl<_$_PaymentItemState>(this, _$identity);
}

abstract class _PaymentItemState implements PaymentItemState {
  const factory _PaymentItemState(
      {required final List<PaymentItem> paymentItemList,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_PaymentItemState;

  @override
  List<PaymentItem> get paymentItemList;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentItemStateCopyWith<_$_PaymentItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
