// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_item_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByItemDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)
        fetch,
    required TResult Function(StatusType status) fetchZyllemStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)?
        fetch,
    TResult? Function(StatusType status)? fetchZyllemStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)?
        fetch,
    TResult Function(StatusType status)? fetchZyllemStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemDetailsEventCopyWith<$Res> {
  factory $ViewByItemDetailsEventCopyWith(ViewByItemDetailsEvent value,
          $Res Function(ViewByItemDetailsEvent) then) =
      _$ViewByItemDetailsEventCopyWithImpl<$Res, ViewByItemDetailsEvent>;
}

/// @nodoc
class _$ViewByItemDetailsEventCopyWithImpl<$Res,
        $Val extends ViewByItemDetailsEvent>
    implements $ViewByItemDetailsEventCopyWith<$Res> {
  _$ViewByItemDetailsEventCopyWithImpl(this._value, this._then);

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
    extends _$ViewByItemDetailsEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'ViewByItemDetailsEvent.initialized()';
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
    required TResult Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)
        fetch,
    required TResult Function(StatusType status) fetchZyllemStatus,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)?
        fetch,
    TResult? Function(StatusType status)? fetchZyllemStatus,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)?
        fetch,
    TResult Function(StatusType status)? fetchZyllemStatus,
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
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByItemDetailsEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      OrderHistoryItem orderHistoryItem,
      CustomerCodeInfo soldTo,
      bool disableDeliveryDateForZyllemStatus});

  $UserCopyWith<$Res> get user;
  $OrderHistoryItemCopyWith<$Res> get orderHistoryItem;
  $CustomerCodeInfoCopyWith<$Res> get soldTo;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ViewByItemDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? orderHistoryItem = null,
    Object? soldTo = null,
    Object? disableDeliveryDateForZyllemStatus = null,
  }) {
    return _then(_$_Fetch(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      orderHistoryItem: null == orderHistoryItem
          ? _value.orderHistoryItem
          : orderHistoryItem // ignore: cast_nullable_to_non_nullable
              as OrderHistoryItem,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      disableDeliveryDateForZyllemStatus: null ==
              disableDeliveryDateForZyllemStatus
          ? _value.disableDeliveryDateForZyllemStatus
          : disableDeliveryDateForZyllemStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
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
  $OrderHistoryItemCopyWith<$Res> get orderHistoryItem {
    return $OrderHistoryItemCopyWith<$Res>(_value.orderHistoryItem, (value) {
      return _then(_value.copyWith(orderHistoryItem: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get soldTo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.soldTo, (value) {
      return _then(_value.copyWith(soldTo: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.user,
      required this.orderHistoryItem,
      required this.soldTo,
      required this.disableDeliveryDateForZyllemStatus});

  @override
  final User user;
  @override
  final OrderHistoryItem orderHistoryItem;
  @override
  final CustomerCodeInfo soldTo;
  @override
  final bool disableDeliveryDateForZyllemStatus;

  @override
  String toString() {
    return 'ViewByItemDetailsEvent.fetch(user: $user, orderHistoryItem: $orderHistoryItem, soldTo: $soldTo, disableDeliveryDateForZyllemStatus: $disableDeliveryDateForZyllemStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.orderHistoryItem, orderHistoryItem) ||
                other.orderHistoryItem == orderHistoryItem) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.disableDeliveryDateForZyllemStatus,
                    disableDeliveryDateForZyllemStatus) ||
                other.disableDeliveryDateForZyllemStatus ==
                    disableDeliveryDateForZyllemStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, orderHistoryItem, soldTo,
      disableDeliveryDateForZyllemStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)
        fetch,
    required TResult Function(StatusType status) fetchZyllemStatus,
  }) {
    return fetch(
        user, orderHistoryItem, soldTo, disableDeliveryDateForZyllemStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)?
        fetch,
    TResult? Function(StatusType status)? fetchZyllemStatus,
  }) {
    return fetch?.call(
        user, orderHistoryItem, soldTo, disableDeliveryDateForZyllemStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)?
        fetch,
    TResult Function(StatusType status)? fetchZyllemStatus,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(
          user, orderHistoryItem, soldTo, disableDeliveryDateForZyllemStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ViewByItemDetailsEvent {
  const factory _Fetch(
      {required final User user,
      required final OrderHistoryItem orderHistoryItem,
      required final CustomerCodeInfo soldTo,
      required final bool disableDeliveryDateForZyllemStatus}) = _$_Fetch;

  User get user;
  OrderHistoryItem get orderHistoryItem;
  CustomerCodeInfo get soldTo;
  bool get disableDeliveryDateForZyllemStatus;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchZyllemStatusCopyWith<$Res> {
  factory _$$_FetchZyllemStatusCopyWith(_$_FetchZyllemStatus value,
          $Res Function(_$_FetchZyllemStatus) then) =
      __$$_FetchZyllemStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({StatusType status});
}

/// @nodoc
class __$$_FetchZyllemStatusCopyWithImpl<$Res>
    extends _$ViewByItemDetailsEventCopyWithImpl<$Res, _$_FetchZyllemStatus>
    implements _$$_FetchZyllemStatusCopyWith<$Res> {
  __$$_FetchZyllemStatusCopyWithImpl(
      _$_FetchZyllemStatus _value, $Res Function(_$_FetchZyllemStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_FetchZyllemStatus(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
    ));
  }
}

/// @nodoc

class _$_FetchZyllemStatus implements _FetchZyllemStatus {
  const _$_FetchZyllemStatus({required this.status});

  @override
  final StatusType status;

  @override
  String toString() {
    return 'ViewByItemDetailsEvent.fetchZyllemStatus(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchZyllemStatus &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchZyllemStatusCopyWith<_$_FetchZyllemStatus> get copyWith =>
      __$$_FetchZyllemStatusCopyWithImpl<_$_FetchZyllemStatus>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)
        fetch,
    required TResult Function(StatusType status) fetchZyllemStatus,
  }) {
    return fetchZyllemStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)?
        fetch,
    TResult? Function(StatusType status)? fetchZyllemStatus,
  }) {
    return fetchZyllemStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem,
            CustomerCodeInfo soldTo, bool disableDeliveryDateForZyllemStatus)?
        fetch,
    TResult Function(StatusType status)? fetchZyllemStatus,
    required TResult orElse(),
  }) {
    if (fetchZyllemStatus != null) {
      return fetchZyllemStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchZyllemStatus value) fetchZyllemStatus,
  }) {
    return fetchZyllemStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchZyllemStatus value)? fetchZyllemStatus,
  }) {
    return fetchZyllemStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchZyllemStatus value)? fetchZyllemStatus,
    required TResult orElse(),
  }) {
    if (fetchZyllemStatus != null) {
      return fetchZyllemStatus(this);
    }
    return orElse();
  }
}

abstract class _FetchZyllemStatus implements ViewByItemDetailsEvent {
  const factory _FetchZyllemStatus({required final StatusType status}) =
      _$_FetchZyllemStatus;

  StatusType get status;
  @JsonKey(ignore: true)
  _$$_FetchZyllemStatusCopyWith<_$_FetchZyllemStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ViewByItemDetailsState {
  OrderHistory get viewByItemDetails => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByItemDetailsStateCopyWith<ViewByItemDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByItemDetailsStateCopyWith<$Res> {
  factory $ViewByItemDetailsStateCopyWith(ViewByItemDetailsState value,
          $Res Function(ViewByItemDetailsState) then) =
      _$ViewByItemDetailsStateCopyWithImpl<$Res, ViewByItemDetailsState>;
  @useResult
  $Res call(
      {OrderHistory viewByItemDetails,
      bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $OrderHistoryCopyWith<$Res> get viewByItemDetails;
}

/// @nodoc
class _$ViewByItemDetailsStateCopyWithImpl<$Res,
        $Val extends ViewByItemDetailsState>
    implements $ViewByItemDetailsStateCopyWith<$Res> {
  _$ViewByItemDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewByItemDetails = null,
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      viewByItemDetails: null == viewByItemDetails
          ? _value.viewByItemDetails
          : viewByItemDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistory,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryCopyWith<$Res> get viewByItemDetails {
    return $OrderHistoryCopyWith<$Res>(_value.viewByItemDetails, (value) {
      return _then(_value.copyWith(viewByItemDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViewByItemDetailsStateCopyWith<$Res>
    implements $ViewByItemDetailsStateCopyWith<$Res> {
  factory _$$_ViewByItemDetailsStateCopyWith(_$_ViewByItemDetailsState value,
          $Res Function(_$_ViewByItemDetailsState) then) =
      __$$_ViewByItemDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderHistory viewByItemDetails,
      bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $OrderHistoryCopyWith<$Res> get viewByItemDetails;
}

/// @nodoc
class __$$_ViewByItemDetailsStateCopyWithImpl<$Res>
    extends _$ViewByItemDetailsStateCopyWithImpl<$Res,
        _$_ViewByItemDetailsState>
    implements _$$_ViewByItemDetailsStateCopyWith<$Res> {
  __$$_ViewByItemDetailsStateCopyWithImpl(_$_ViewByItemDetailsState _value,
      $Res Function(_$_ViewByItemDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewByItemDetails = null,
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_ViewByItemDetailsState(
      viewByItemDetails: null == viewByItemDetails
          ? _value.viewByItemDetails
          : viewByItemDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistory,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_ViewByItemDetailsState extends _ViewByItemDetailsState {
  const _$_ViewByItemDetailsState(
      {required this.viewByItemDetails,
      required this.isLoading,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final OrderHistory viewByItemDetails;
  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ViewByItemDetailsState(viewByItemDetails: $viewByItemDetails, isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByItemDetailsState &&
            (identical(other.viewByItemDetails, viewByItemDetails) ||
                other.viewByItemDetails == viewByItemDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, viewByItemDetails, isLoading, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByItemDetailsStateCopyWith<_$_ViewByItemDetailsState> get copyWith =>
      __$$_ViewByItemDetailsStateCopyWithImpl<_$_ViewByItemDetailsState>(
          this, _$identity);
}

abstract class _ViewByItemDetailsState extends ViewByItemDetailsState {
  const factory _ViewByItemDetailsState(
      {required final OrderHistory viewByItemDetails,
      required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_ViewByItemDetailsState;
  const _ViewByItemDetailsState._() : super._();

  @override
  OrderHistory get viewByItemDetails;
  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByItemDetailsStateCopyWith<_$_ViewByItemDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
