// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentSummaryDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails paymentSummaryDetails)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function() fetchPaymentSummaryList,
    required TResult Function() fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function() deleteAdvice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function()? fetchPaymentSummaryList,
    TResult? Function()? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function()? deleteAdvice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function()? fetchPaymentSummaryList,
    TResult Function()? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function()? deleteAdvice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryDetailsEventCopyWith<$Res> {
  factory $PaymentSummaryDetailsEventCopyWith(PaymentSummaryDetailsEvent value,
          $Res Function(PaymentSummaryDetailsEvent) then) =
      _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
          PaymentSummaryDetailsEvent>;
}

/// @nodoc
class _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
        $Val extends PaymentSummaryDetailsEvent>
    implements $PaymentSummaryDetailsEventCopyWith<$Res> {
  _$PaymentSummaryDetailsEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      User user,
      ShipToInfo shipToInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_Initialized(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.salesOrganization,
      required this.customerCodeInfo,
      required this.user,
      required this.shipToInfo});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.initialized(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, user: $user, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganization, customerCodeInfo, user, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails paymentSummaryDetails)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function() fetchPaymentSummaryList,
    required TResult Function() fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function() deleteAdvice,
  }) {
    return initialized(salesOrganization, customerCodeInfo, user, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function()? fetchPaymentSummaryList,
    TResult? Function()? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function()? deleteAdvice,
  }) {
    return initialized?.call(
        salesOrganization, customerCodeInfo, user, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function()? fetchPaymentSummaryList,
    TResult Function()? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function()? deleteAdvice,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganization, customerCodeInfo, user, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PaymentSummaryDetailsEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user,
      required final ShipToInfo shipToInfo}) = _$_Initialized;

  SalesOrganisation get salesOrganization;
  CustomerCodeInfo get customerCodeInfo;
  User get user;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchPaymentSummaryDetailsEventCopyWith<$Res> {
  factory _$$_FetchPaymentSummaryDetailsEventCopyWith(
          _$_FetchPaymentSummaryDetailsEvent value,
          $Res Function(_$_FetchPaymentSummaryDetailsEvent) then) =
      __$$_FetchPaymentSummaryDetailsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentSummaryDetails paymentSummaryDetails});

  $PaymentSummaryDetailsCopyWith<$Res> get paymentSummaryDetails;
}

/// @nodoc
class __$$_FetchPaymentSummaryDetailsEventCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
        _$_FetchPaymentSummaryDetailsEvent>
    implements _$$_FetchPaymentSummaryDetailsEventCopyWith<$Res> {
  __$$_FetchPaymentSummaryDetailsEventCopyWithImpl(
      _$_FetchPaymentSummaryDetailsEvent _value,
      $Res Function(_$_FetchPaymentSummaryDetailsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentSummaryDetails = null,
  }) {
    return _then(_$_FetchPaymentSummaryDetailsEvent(
      paymentSummaryDetails: null == paymentSummaryDetails
          ? _value.paymentSummaryDetails
          : paymentSummaryDetails // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryDetailsCopyWith<$Res> get paymentSummaryDetails {
    return $PaymentSummaryDetailsCopyWith<$Res>(_value.paymentSummaryDetails,
        (value) {
      return _then(_value.copyWith(paymentSummaryDetails: value));
    });
  }
}

/// @nodoc

class _$_FetchPaymentSummaryDetailsEvent
    implements _FetchPaymentSummaryDetailsEvent {
  const _$_FetchPaymentSummaryDetailsEvent(
      {required this.paymentSummaryDetails});

  @override
  final PaymentSummaryDetails paymentSummaryDetails;

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(paymentSummaryDetails: $paymentSummaryDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPaymentSummaryDetailsEvent &&
            (identical(other.paymentSummaryDetails, paymentSummaryDetails) ||
                other.paymentSummaryDetails == paymentSummaryDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentSummaryDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchPaymentSummaryDetailsEventCopyWith<
          _$_FetchPaymentSummaryDetailsEvent>
      get copyWith => __$$_FetchPaymentSummaryDetailsEventCopyWithImpl<
          _$_FetchPaymentSummaryDetailsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails paymentSummaryDetails)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function() fetchPaymentSummaryList,
    required TResult Function() fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function() deleteAdvice,
  }) {
    return fetchPaymentSummaryDetailsInfo(paymentSummaryDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function()? fetchPaymentSummaryList,
    TResult? Function()? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function()? deleteAdvice,
  }) {
    return fetchPaymentSummaryDetailsInfo?.call(paymentSummaryDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function()? fetchPaymentSummaryList,
    TResult Function()? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function()? deleteAdvice,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryDetailsInfo != null) {
      return fetchPaymentSummaryDetailsInfo(paymentSummaryDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
  }) {
    return fetchPaymentSummaryDetailsInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
  }) {
    return fetchPaymentSummaryDetailsInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryDetailsInfo != null) {
      return fetchPaymentSummaryDetailsInfo(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentSummaryDetailsEvent
    implements PaymentSummaryDetailsEvent {
  const factory _FetchPaymentSummaryDetailsEvent(
          {required final PaymentSummaryDetails paymentSummaryDetails}) =
      _$_FetchPaymentSummaryDetailsEvent;

  PaymentSummaryDetails get paymentSummaryDetails;
  @JsonKey(ignore: true)
  _$$_FetchPaymentSummaryDetailsEventCopyWith<
          _$_FetchPaymentSummaryDetailsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchPaymentSummaryListEventCopyWith<$Res> {
  factory _$$_FetchPaymentSummaryListEventCopyWith(
          _$_FetchPaymentSummaryListEvent value,
          $Res Function(_$_FetchPaymentSummaryListEvent) then) =
      __$$_FetchPaymentSummaryListEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchPaymentSummaryListEventCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
        _$_FetchPaymentSummaryListEvent>
    implements _$$_FetchPaymentSummaryListEventCopyWith<$Res> {
  __$$_FetchPaymentSummaryListEventCopyWithImpl(
      _$_FetchPaymentSummaryListEvent _value,
      $Res Function(_$_FetchPaymentSummaryListEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchPaymentSummaryListEvent implements _FetchPaymentSummaryListEvent {
  const _$_FetchPaymentSummaryListEvent();

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.fetchPaymentSummaryList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPaymentSummaryListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails paymentSummaryDetails)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function() fetchPaymentSummaryList,
    required TResult Function() fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function() deleteAdvice,
  }) {
    return fetchPaymentSummaryList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function()? fetchPaymentSummaryList,
    TResult? Function()? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function()? deleteAdvice,
  }) {
    return fetchPaymentSummaryList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function()? fetchPaymentSummaryList,
    TResult Function()? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function()? deleteAdvice,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryList != null) {
      return fetchPaymentSummaryList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
  }) {
    return fetchPaymentSummaryList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
  }) {
    return fetchPaymentSummaryList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryList != null) {
      return fetchPaymentSummaryList(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentSummaryListEvent
    implements PaymentSummaryDetailsEvent {
  const factory _FetchPaymentSummaryListEvent() =
      _$_FetchPaymentSummaryListEvent;
}

/// @nodoc
abstract class _$$_FetchAdviceCopyWith<$Res> {
  factory _$$_FetchAdviceCopyWith(
          _$_FetchAdvice value, $Res Function(_$_FetchAdvice) then) =
      __$$_FetchAdviceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchAdviceCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res, _$_FetchAdvice>
    implements _$$_FetchAdviceCopyWith<$Res> {
  __$$_FetchAdviceCopyWithImpl(
      _$_FetchAdvice _value, $Res Function(_$_FetchAdvice) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchAdvice implements _FetchAdvice {
  const _$_FetchAdvice();

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.fetchAdvice()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchAdvice);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails paymentSummaryDetails)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function() fetchPaymentSummaryList,
    required TResult Function() fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function() deleteAdvice,
  }) {
    return fetchAdvice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function()? fetchPaymentSummaryList,
    TResult? Function()? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function()? deleteAdvice,
  }) {
    return fetchAdvice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function()? fetchPaymentSummaryList,
    TResult Function()? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function()? deleteAdvice,
    required TResult orElse(),
  }) {
    if (fetchAdvice != null) {
      return fetchAdvice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
  }) {
    return fetchAdvice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
  }) {
    return fetchAdvice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    required TResult orElse(),
  }) {
    if (fetchAdvice != null) {
      return fetchAdvice(this);
    }
    return orElse();
  }
}

abstract class _FetchAdvice implements PaymentSummaryDetailsEvent {
  const factory _FetchAdvice() = _$_FetchAdvice;
}

/// @nodoc
abstract class _$$_SaveAdviceCopyWith<$Res> {
  factory _$$_SaveAdviceCopyWith(
          _$_SaveAdvice value, $Res Function(_$_SaveAdvice) then) =
      __$$_SaveAdviceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SaveAdviceCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res, _$_SaveAdvice>
    implements _$$_SaveAdviceCopyWith<$Res> {
  __$$_SaveAdviceCopyWithImpl(
      _$_SaveAdvice _value, $Res Function(_$_SaveAdvice) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SaveAdvice implements _SaveAdvice {
  const _$_SaveAdvice();

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.saveAdvice()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SaveAdvice);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails paymentSummaryDetails)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function() fetchPaymentSummaryList,
    required TResult Function() fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function() deleteAdvice,
  }) {
    return saveAdvice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function()? fetchPaymentSummaryList,
    TResult? Function()? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function()? deleteAdvice,
  }) {
    return saveAdvice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function()? fetchPaymentSummaryList,
    TResult Function()? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function()? deleteAdvice,
    required TResult orElse(),
  }) {
    if (saveAdvice != null) {
      return saveAdvice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
  }) {
    return saveAdvice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
  }) {
    return saveAdvice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    required TResult orElse(),
  }) {
    if (saveAdvice != null) {
      return saveAdvice(this);
    }
    return orElse();
  }
}

abstract class _SaveAdvice implements PaymentSummaryDetailsEvent {
  const factory _SaveAdvice() = _$_SaveAdvice;
}

/// @nodoc
abstract class _$$_DeleteAdviceCopyWith<$Res> {
  factory _$$_DeleteAdviceCopyWith(
          _$_DeleteAdvice value, $Res Function(_$_DeleteAdvice) then) =
      __$$_DeleteAdviceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteAdviceCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res, _$_DeleteAdvice>
    implements _$$_DeleteAdviceCopyWith<$Res> {
  __$$_DeleteAdviceCopyWithImpl(
      _$_DeleteAdvice _value, $Res Function(_$_DeleteAdvice) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteAdvice implements _DeleteAdvice {
  const _$_DeleteAdvice();

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.deleteAdvice()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeleteAdvice);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails paymentSummaryDetails)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function() fetchPaymentSummaryList,
    required TResult Function() fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function() deleteAdvice,
  }) {
    return deleteAdvice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function()? fetchPaymentSummaryList,
    TResult? Function()? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function()? deleteAdvice,
  }) {
    return deleteAdvice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails paymentSummaryDetails)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function()? fetchPaymentSummaryList,
    TResult Function()? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function()? deleteAdvice,
    required TResult orElse(),
  }) {
    if (deleteAdvice != null) {
      return deleteAdvice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
  }) {
    return deleteAdvice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
  }) {
    return deleteAdvice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    required TResult orElse(),
  }) {
    if (deleteAdvice != null) {
      return deleteAdvice(this);
    }
    return orElse();
  }
}

abstract class _DeleteAdvice implements PaymentSummaryDetailsEvent {
  const factory _DeleteAdvice() = _$_DeleteAdvice;
}

/// @nodoc
mixin _$PaymentSummaryDetailsState {
  PaymentSummaryDetails get paymentSummaryDetails =>
      throw _privateConstructorUsedError;
  List<PaymentItem> get paymentItemList => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  bool get isDetailFetching => throw _privateConstructorUsedError;
  bool get isListLoading => throw _privateConstructorUsedError;
  bool get isFetchingAdvice => throw _privateConstructorUsedError;
  bool get isSavingAdvice => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  PaymentInvoiceInfoPdf get paymentInvoiceInfoPdf =>
      throw _privateConstructorUsedError;
  bool get isDeletingPayment => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryDetailsStateCopyWith<PaymentSummaryDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryDetailsStateCopyWith<$Res> {
  factory $PaymentSummaryDetailsStateCopyWith(PaymentSummaryDetailsState value,
          $Res Function(PaymentSummaryDetailsState) then) =
      _$PaymentSummaryDetailsStateCopyWithImpl<$Res,
          PaymentSummaryDetailsState>;
  @useResult
  $Res call(
      {PaymentSummaryDetails paymentSummaryDetails,
      List<PaymentItem> paymentItemList,
      SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      User user,
      bool isDetailFetching,
      bool isListLoading,
      bool isFetchingAdvice,
      bool isSavingAdvice,
      ShipToInfo shipToInfo,
      PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      bool isDeletingPayment,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $PaymentSummaryDetailsCopyWith<$Res> get paymentSummaryDetails;
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf;
}

/// @nodoc
class _$PaymentSummaryDetailsStateCopyWithImpl<$Res,
        $Val extends PaymentSummaryDetailsState>
    implements $PaymentSummaryDetailsStateCopyWith<$Res> {
  _$PaymentSummaryDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentSummaryDetails = null,
    Object? paymentItemList = null,
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? isDetailFetching = null,
    Object? isListLoading = null,
    Object? isFetchingAdvice = null,
    Object? isSavingAdvice = null,
    Object? shipToInfo = null,
    Object? paymentInvoiceInfoPdf = null,
    Object? isDeletingPayment = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      paymentSummaryDetails: null == paymentSummaryDetails
          ? _value.paymentSummaryDetails
          : paymentSummaryDetails // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryDetails,
      paymentItemList: null == paymentItemList
          ? _value.paymentItemList
          : paymentItemList // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem>,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isDetailFetching: null == isDetailFetching
          ? _value.isDetailFetching
          : isDetailFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isListLoading: null == isListLoading
          ? _value.isListLoading
          : isListLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingAdvice: null == isFetchingAdvice
          ? _value.isFetchingAdvice
          : isFetchingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingAdvice: null == isSavingAdvice
          ? _value.isSavingAdvice
          : isSavingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      paymentInvoiceInfoPdf: null == paymentInvoiceInfoPdf
          ? _value.paymentInvoiceInfoPdf
          : paymentInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as PaymentInvoiceInfoPdf,
      isDeletingPayment: null == isDeletingPayment
          ? _value.isDeletingPayment
          : isDeletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryDetailsCopyWith<$Res> get paymentSummaryDetails {
    return $PaymentSummaryDetailsCopyWith<$Res>(_value.paymentSummaryDetails,
        (value) {
      return _then(_value.copyWith(paymentSummaryDetails: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf {
    return $PaymentInvoiceInfoPdfCopyWith<$Res>(_value.paymentInvoiceInfoPdf,
        (value) {
      return _then(_value.copyWith(paymentInvoiceInfoPdf: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentSummaryDetailsStateCopyWith<$Res>
    implements $PaymentSummaryDetailsStateCopyWith<$Res> {
  factory _$$_PaymentSummaryDetailsStateCopyWith(
          _$_PaymentSummaryDetailsState value,
          $Res Function(_$_PaymentSummaryDetailsState) then) =
      __$$_PaymentSummaryDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentSummaryDetails paymentSummaryDetails,
      List<PaymentItem> paymentItemList,
      SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      User user,
      bool isDetailFetching,
      bool isListLoading,
      bool isFetchingAdvice,
      bool isSavingAdvice,
      ShipToInfo shipToInfo,
      PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      bool isDeletingPayment,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $PaymentSummaryDetailsCopyWith<$Res> get paymentSummaryDetails;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf;
}

/// @nodoc
class __$$_PaymentSummaryDetailsStateCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsStateCopyWithImpl<$Res,
        _$_PaymentSummaryDetailsState>
    implements _$$_PaymentSummaryDetailsStateCopyWith<$Res> {
  __$$_PaymentSummaryDetailsStateCopyWithImpl(
      _$_PaymentSummaryDetailsState _value,
      $Res Function(_$_PaymentSummaryDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentSummaryDetails = null,
    Object? paymentItemList = null,
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? isDetailFetching = null,
    Object? isListLoading = null,
    Object? isFetchingAdvice = null,
    Object? isSavingAdvice = null,
    Object? shipToInfo = null,
    Object? paymentInvoiceInfoPdf = null,
    Object? isDeletingPayment = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_PaymentSummaryDetailsState(
      paymentSummaryDetails: null == paymentSummaryDetails
          ? _value.paymentSummaryDetails
          : paymentSummaryDetails // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryDetails,
      paymentItemList: null == paymentItemList
          ? _value._paymentItemList
          : paymentItemList // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem>,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isDetailFetching: null == isDetailFetching
          ? _value.isDetailFetching
          : isDetailFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isListLoading: null == isListLoading
          ? _value.isListLoading
          : isListLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingAdvice: null == isFetchingAdvice
          ? _value.isFetchingAdvice
          : isFetchingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingAdvice: null == isSavingAdvice
          ? _value.isSavingAdvice
          : isSavingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      paymentInvoiceInfoPdf: null == paymentInvoiceInfoPdf
          ? _value.paymentInvoiceInfoPdf
          : paymentInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as PaymentInvoiceInfoPdf,
      isDeletingPayment: null == isDeletingPayment
          ? _value.isDeletingPayment
          : isDeletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_PaymentSummaryDetailsState extends _PaymentSummaryDetailsState {
  const _$_PaymentSummaryDetailsState(
      {required this.paymentSummaryDetails,
      required final List<PaymentItem> paymentItemList,
      required this.salesOrganization,
      required this.customerCodeInfo,
      required this.user,
      required this.isDetailFetching,
      required this.isListLoading,
      required this.isFetchingAdvice,
      required this.isSavingAdvice,
      required this.shipToInfo,
      required this.paymentInvoiceInfoPdf,
      required this.isDeletingPayment,
      required this.failureOrSuccessOption})
      : _paymentItemList = paymentItemList,
        super._();

  @override
  final PaymentSummaryDetails paymentSummaryDetails;
  final List<PaymentItem> _paymentItemList;
  @override
  List<PaymentItem> get paymentItemList {
    if (_paymentItemList is EqualUnmodifiableListView) return _paymentItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentItemList);
  }

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;
  @override
  final bool isDetailFetching;
  @override
  final bool isListLoading;
  @override
  final bool isFetchingAdvice;
  @override
  final bool isSavingAdvice;
  @override
  final ShipToInfo shipToInfo;
  @override
  final PaymentInvoiceInfoPdf paymentInvoiceInfoPdf;
  @override
  final bool isDeletingPayment;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentSummaryDetailsState(paymentSummaryDetails: $paymentSummaryDetails, paymentItemList: $paymentItemList, salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, user: $user, isDetailFetching: $isDetailFetching, isListLoading: $isListLoading, isFetchingAdvice: $isFetchingAdvice, isSavingAdvice: $isSavingAdvice, shipToInfo: $shipToInfo, paymentInvoiceInfoPdf: $paymentInvoiceInfoPdf, isDeletingPayment: $isDeletingPayment, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentSummaryDetailsState &&
            (identical(other.paymentSummaryDetails, paymentSummaryDetails) ||
                other.paymentSummaryDetails == paymentSummaryDetails) &&
            const DeepCollectionEquality()
                .equals(other._paymentItemList, _paymentItemList) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isDetailFetching, isDetailFetching) ||
                other.isDetailFetching == isDetailFetching) &&
            (identical(other.isListLoading, isListLoading) ||
                other.isListLoading == isListLoading) &&
            (identical(other.isFetchingAdvice, isFetchingAdvice) ||
                other.isFetchingAdvice == isFetchingAdvice) &&
            (identical(other.isSavingAdvice, isSavingAdvice) ||
                other.isSavingAdvice == isSavingAdvice) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.paymentInvoiceInfoPdf, paymentInvoiceInfoPdf) ||
                other.paymentInvoiceInfoPdf == paymentInvoiceInfoPdf) &&
            (identical(other.isDeletingPayment, isDeletingPayment) ||
                other.isDeletingPayment == isDeletingPayment) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentSummaryDetails,
      const DeepCollectionEquality().hash(_paymentItemList),
      salesOrganization,
      customerCodeInfo,
      user,
      isDetailFetching,
      isListLoading,
      isFetchingAdvice,
      isSavingAdvice,
      shipToInfo,
      paymentInvoiceInfoPdf,
      isDeletingPayment,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentSummaryDetailsStateCopyWith<_$_PaymentSummaryDetailsState>
      get copyWith => __$$_PaymentSummaryDetailsStateCopyWithImpl<
          _$_PaymentSummaryDetailsState>(this, _$identity);
}

abstract class _PaymentSummaryDetailsState extends PaymentSummaryDetailsState {
  const factory _PaymentSummaryDetailsState(
      {required final PaymentSummaryDetails paymentSummaryDetails,
      required final List<PaymentItem> paymentItemList,
      required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user,
      required final bool isDetailFetching,
      required final bool isListLoading,
      required final bool isFetchingAdvice,
      required final bool isSavingAdvice,
      required final ShipToInfo shipToInfo,
      required final PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      required final bool isDeletingPayment,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_PaymentSummaryDetailsState;
  const _PaymentSummaryDetailsState._() : super._();

  @override
  PaymentSummaryDetails get paymentSummaryDetails;
  @override
  List<PaymentItem> get paymentItemList;
  @override
  SalesOrganisation get salesOrganization;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  User get user;
  @override
  bool get isDetailFetching;
  @override
  bool get isListLoading;
  @override
  bool get isFetchingAdvice;
  @override
  bool get isSavingAdvice;
  @override
  ShipToInfo get shipToInfo;
  @override
  PaymentInvoiceInfoPdf get paymentInvoiceInfoPdf;
  @override
  bool get isDeletingPayment;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentSummaryDetailsStateCopyWith<_$_PaymentSummaryDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
