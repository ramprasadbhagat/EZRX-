// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, OrderHistoryItem orderHistoryItem)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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
abstract class $OrderDetailsEventCopyWith<$Res> {
  factory $OrderDetailsEventCopyWith(
          OrderDetailsEvent value, $Res Function(OrderDetailsEvent) then) =
      _$OrderDetailsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$OrderDetailsEventCopyWithImpl<$Res>
    implements $OrderDetailsEventCopyWith<$Res> {
  _$OrderDetailsEventCopyWithImpl(this._value, this._then);

  final OrderDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(OrderDetailsEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$OrderDetailsEventCopyWithImpl<$Res>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, (v) => _then(v as _$_Initialized));

  @override
  _$_Initialized get _value => super._value as _$_Initialized;
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'OrderDetailsEvent.initialized()';
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
    required TResult Function(User user, OrderHistoryItem orderHistoryItem)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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

abstract class _Initialized implements OrderDetailsEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  $Res call({User user, OrderHistoryItem orderHistoryItem});

  $UserCopyWith<$Res> get user;
  $OrderHistoryItemCopyWith<$Res> get orderHistoryItem;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res> extends _$OrderDetailsEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;

  @override
  $Res call({
    Object? user = freezed,
    Object? orderHistoryItem = freezed,
  }) {
    return _then(_$_Fetch(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      orderHistoryItem: orderHistoryItem == freezed
          ? _value.orderHistoryItem
          : orderHistoryItem // ignore: cast_nullable_to_non_nullable
              as OrderHistoryItem,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $OrderHistoryItemCopyWith<$Res> get orderHistoryItem {
    return $OrderHistoryItemCopyWith<$Res>(_value.orderHistoryItem, (value) {
      return _then(_value.copyWith(orderHistoryItem: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.user, required this.orderHistoryItem});

  @override
  final User user;
  @override
  final OrderHistoryItem orderHistoryItem;

  @override
  String toString() {
    return 'OrderDetailsEvent.fetch(user: $user, orderHistoryItem: $orderHistoryItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.orderHistoryItem, orderHistoryItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(orderHistoryItem));

  @JsonKey(ignore: true)
  @override
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, OrderHistoryItem orderHistoryItem)
        fetch,
  }) {
    return fetch(user, orderHistoryItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
  }) {
    return fetch?.call(user, orderHistoryItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(user, orderHistoryItem);
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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

abstract class _Fetch implements OrderDetailsEvent {
  const factory _Fetch(
      {required final User user,
      required final OrderHistoryItem orderHistoryItem}) = _$_Fetch;

  User get user;
  OrderHistoryItem get orderHistoryItem;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderDetailsState {
  OrderDetails get orderDetails => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailsStateCopyWith<OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateCopyWith(
          OrderDetailsState value, $Res Function(OrderDetailsState) then) =
      _$OrderDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {OrderDetails orderDetails,
      bool isLoading,
      bool showErrorMessage,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $OrderDetailsCopyWith<$Res> get orderDetails;
}

/// @nodoc
class _$OrderDetailsStateCopyWithImpl<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  _$OrderDetailsStateCopyWithImpl(this._value, this._then);

  final OrderDetailsState _value;
  // ignore: unused_field
  final $Res Function(OrderDetailsState) _then;

  @override
  $Res call({
    Object? orderDetails = freezed,
    Object? isLoading = freezed,
    Object? showErrorMessage = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      orderDetails: orderDetails == freezed
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as OrderDetails,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }

  @override
  $OrderDetailsCopyWith<$Res> get orderDetails {
    return $OrderDetailsCopyWith<$Res>(_value.orderDetails, (value) {
      return _then(_value.copyWith(orderDetails: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderDetailsStateCopyWith<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  factory _$$_OrderDetailsStateCopyWith(_$_OrderDetailsState value,
          $Res Function(_$_OrderDetailsState) then) =
      __$$_OrderDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {OrderDetails orderDetails,
      bool isLoading,
      bool showErrorMessage,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $OrderDetailsCopyWith<$Res> get orderDetails;
}

/// @nodoc
class __$$_OrderDetailsStateCopyWithImpl<$Res>
    extends _$OrderDetailsStateCopyWithImpl<$Res>
    implements _$$_OrderDetailsStateCopyWith<$Res> {
  __$$_OrderDetailsStateCopyWithImpl(
      _$_OrderDetailsState _value, $Res Function(_$_OrderDetailsState) _then)
      : super(_value, (v) => _then(v as _$_OrderDetailsState));

  @override
  _$_OrderDetailsState get _value => super._value as _$_OrderDetailsState;

  @override
  $Res call({
    Object? orderDetails = freezed,
    Object? isLoading = freezed,
    Object? showErrorMessage = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_$_OrderDetailsState(
      orderDetails: orderDetails == freezed
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as OrderDetails,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_OrderDetailsState implements _OrderDetailsState {
  const _$_OrderDetailsState(
      {required this.orderDetails,
      required this.isLoading,
      required this.showErrorMessage,
      required this.failureOrSuccessOption});

  @override
  final OrderDetails orderDetails;
  @override
  final bool isLoading;
  @override
  final bool showErrorMessage;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'OrderDetailsState(orderDetails: $orderDetails, isLoading: $isLoading, showErrorMessage: $showErrorMessage, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetailsState &&
            const DeepCollectionEquality()
                .equals(other.orderDetails, orderDetails) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessage, showErrorMessage) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccessOption, failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderDetails),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(showErrorMessage),
      const DeepCollectionEquality().hash(failureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_OrderDetailsStateCopyWith<_$_OrderDetailsState> get copyWith =>
      __$$_OrderDetailsStateCopyWithImpl<_$_OrderDetailsState>(
          this, _$identity);
}

abstract class _OrderDetailsState implements OrderDetailsState {
  const factory _OrderDetailsState(
      {required final OrderDetails orderDetails,
      required final bool isLoading,
      required final bool showErrorMessage,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_OrderDetailsState;

  @override
  OrderDetails get orderDetails;
  @override
  bool get isLoading;
  @override
  bool get showErrorMessage;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailsStateCopyWith<_$_OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
