// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'saved_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedOrderListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        fetch,
    required TResult Function(
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        loadMore,
    required TResult Function(SavedOrder order, User user) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedOrderListEventCopyWith<$Res> {
  factory $SavedOrderListEventCopyWith(
          SavedOrderListEvent value, $Res Function(SavedOrderListEvent) then) =
      _$SavedOrderListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SavedOrderListEventCopyWithImpl<$Res>
    implements $SavedOrderListEventCopyWith<$Res> {
  _$SavedOrderListEventCopyWithImpl(this._value, this._then);

  final SavedOrderListEvent _value;
  // ignore: unused_field
  final $Res Function(SavedOrderListEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$SavedOrderListEventCopyWithImpl<$Res>
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
    return 'SavedOrderListEvent.initialized()';
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
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        fetch,
    required TResult Function(
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        loadMore,
    required TResult Function(SavedOrder order, User user) delete,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
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
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_Delete value) delete,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements SavedOrderListEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  $Res call(
      {User userInfo,
      SalesOrganisation selectedSalesOrganisation,
      CustomerCodeInfo selectedCustomerCode,
      ShipToInfo selectedShipTo});

  $UserCopyWith<$Res> get userInfo;
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get selectedCustomerCode;
  $ShipToInfoCopyWith<$Res> get selectedShipTo;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$SavedOrderListEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;

  @override
  $Res call({
    Object? userInfo = freezed,
    Object? selectedSalesOrganisation = freezed,
    Object? selectedCustomerCode = freezed,
    Object? selectedShipTo = freezed,
  }) {
    return _then(_$_Fetch(
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      selectedSalesOrganisation: selectedSalesOrganisation == freezed
          ? _value.selectedSalesOrganisation
          : selectedSalesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      selectedCustomerCode: selectedCustomerCode == freezed
          ? _value.selectedCustomerCode
          : selectedCustomerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      selectedShipTo: selectedShipTo == freezed
          ? _value.selectedShipTo
          : selectedShipTo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  $UserCopyWith<$Res> get userInfo {
    return $UserCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }

  @override
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.selectedSalesOrganisation,
        (value) {
      return _then(_value.copyWith(selectedSalesOrganisation: value));
    });
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get selectedCustomerCode {
    return $CustomerCodeInfoCopyWith<$Res>(_value.selectedCustomerCode,
        (value) {
      return _then(_value.copyWith(selectedCustomerCode: value));
    });
  }

  @override
  $ShipToInfoCopyWith<$Res> get selectedShipTo {
    return $ShipToInfoCopyWith<$Res>(_value.selectedShipTo, (value) {
      return _then(_value.copyWith(selectedShipTo: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.userInfo,
      required this.selectedSalesOrganisation,
      required this.selectedCustomerCode,
      required this.selectedShipTo});

  @override
  final User userInfo;
  @override
  final SalesOrganisation selectedSalesOrganisation;
  @override
  final CustomerCodeInfo selectedCustomerCode;
  @override
  final ShipToInfo selectedShipTo;

  @override
  String toString() {
    return 'SavedOrderListEvent.fetch(userInfo: $userInfo, selectedSalesOrganisation: $selectedSalesOrganisation, selectedCustomerCode: $selectedCustomerCode, selectedShipTo: $selectedShipTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality().equals(other.userInfo, userInfo) &&
            const DeepCollectionEquality().equals(
                other.selectedSalesOrganisation, selectedSalesOrganisation) &&
            const DeepCollectionEquality()
                .equals(other.selectedCustomerCode, selectedCustomerCode) &&
            const DeepCollectionEquality()
                .equals(other.selectedShipTo, selectedShipTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userInfo),
      const DeepCollectionEquality().hash(selectedSalesOrganisation),
      const DeepCollectionEquality().hash(selectedCustomerCode),
      const DeepCollectionEquality().hash(selectedShipTo));

  @JsonKey(ignore: true)
  @override
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        fetch,
    required TResult Function(
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        loadMore,
    required TResult Function(SavedOrder order, User user) delete,
  }) {
    return fetch(userInfo, selectedSalesOrganisation, selectedCustomerCode,
        selectedShipTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
  }) {
    return fetch?.call(userInfo, selectedSalesOrganisation,
        selectedCustomerCode, selectedShipTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(userInfo, selectedSalesOrganisation, selectedCustomerCode,
          selectedShipTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_Delete value) delete,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements SavedOrderListEvent {
  const factory _Fetch(
      {required final User userInfo,
      required final SalesOrganisation selectedSalesOrganisation,
      required final CustomerCodeInfo selectedCustomerCode,
      required final ShipToInfo selectedShipTo}) = _$_Fetch;

  User get userInfo;
  SalesOrganisation get selectedSalesOrganisation;
  CustomerCodeInfo get selectedCustomerCode;
  ShipToInfo get selectedShipTo;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
  $Res call(
      {User userInfo,
      SalesOrganisation selectedSalesOrganisation,
      CustomerCodeInfo selectedCustomerCode,
      ShipToInfo selectedShipTo});

  $UserCopyWith<$Res> get userInfo;
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get selectedCustomerCode;
  $ShipToInfoCopyWith<$Res> get selectedShipTo;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$SavedOrderListEventCopyWithImpl<$Res>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, (v) => _then(v as _$_LoadMore));

  @override
  _$_LoadMore get _value => super._value as _$_LoadMore;

  @override
  $Res call({
    Object? userInfo = freezed,
    Object? selectedSalesOrganisation = freezed,
    Object? selectedCustomerCode = freezed,
    Object? selectedShipTo = freezed,
  }) {
    return _then(_$_LoadMore(
      userInfo: userInfo == freezed
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      selectedSalesOrganisation: selectedSalesOrganisation == freezed
          ? _value.selectedSalesOrganisation
          : selectedSalesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      selectedCustomerCode: selectedCustomerCode == freezed
          ? _value.selectedCustomerCode
          : selectedCustomerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      selectedShipTo: selectedShipTo == freezed
          ? _value.selectedShipTo
          : selectedShipTo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  $UserCopyWith<$Res> get userInfo {
    return $UserCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }

  @override
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.selectedSalesOrganisation,
        (value) {
      return _then(_value.copyWith(selectedSalesOrganisation: value));
    });
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get selectedCustomerCode {
    return $CustomerCodeInfoCopyWith<$Res>(_value.selectedCustomerCode,
        (value) {
      return _then(_value.copyWith(selectedCustomerCode: value));
    });
  }

  @override
  $ShipToInfoCopyWith<$Res> get selectedShipTo {
    return $ShipToInfoCopyWith<$Res>(_value.selectedShipTo, (value) {
      return _then(_value.copyWith(selectedShipTo: value));
    });
  }
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore(
      {required this.userInfo,
      required this.selectedSalesOrganisation,
      required this.selectedCustomerCode,
      required this.selectedShipTo});

  @override
  final User userInfo;
  @override
  final SalesOrganisation selectedSalesOrganisation;
  @override
  final CustomerCodeInfo selectedCustomerCode;
  @override
  final ShipToInfo selectedShipTo;

  @override
  String toString() {
    return 'SavedOrderListEvent.loadMore(userInfo: $userInfo, selectedSalesOrganisation: $selectedSalesOrganisation, selectedCustomerCode: $selectedCustomerCode, selectedShipTo: $selectedShipTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMore &&
            const DeepCollectionEquality().equals(other.userInfo, userInfo) &&
            const DeepCollectionEquality().equals(
                other.selectedSalesOrganisation, selectedSalesOrganisation) &&
            const DeepCollectionEquality()
                .equals(other.selectedCustomerCode, selectedCustomerCode) &&
            const DeepCollectionEquality()
                .equals(other.selectedShipTo, selectedShipTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userInfo),
      const DeepCollectionEquality().hash(selectedSalesOrganisation),
      const DeepCollectionEquality().hash(selectedCustomerCode),
      const DeepCollectionEquality().hash(selectedShipTo));

  @JsonKey(ignore: true)
  @override
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      __$$_LoadMoreCopyWithImpl<_$_LoadMore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        fetch,
    required TResult Function(
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        loadMore,
    required TResult Function(SavedOrder order, User user) delete,
  }) {
    return loadMore(userInfo, selectedSalesOrganisation, selectedCustomerCode,
        selectedShipTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
  }) {
    return loadMore?.call(userInfo, selectedSalesOrganisation,
        selectedCustomerCode, selectedShipTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(userInfo, selectedSalesOrganisation, selectedCustomerCode,
          selectedShipTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_Delete value) delete,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements SavedOrderListEvent {
  const factory _LoadMore(
      {required final User userInfo,
      required final SalesOrganisation selectedSalesOrganisation,
      required final CustomerCodeInfo selectedCustomerCode,
      required final ShipToInfo selectedShipTo}) = _$_LoadMore;

  User get userInfo;
  SalesOrganisation get selectedSalesOrganisation;
  CustomerCodeInfo get selectedCustomerCode;
  ShipToInfo get selectedShipTo;
  @JsonKey(ignore: true)
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteCopyWith<$Res> {
  factory _$$_DeleteCopyWith(_$_Delete value, $Res Function(_$_Delete) then) =
      __$$_DeleteCopyWithImpl<$Res>;
  $Res call({SavedOrder order, User user});

  $SavedOrderCopyWith<$Res> get order;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_DeleteCopyWithImpl<$Res>
    extends _$SavedOrderListEventCopyWithImpl<$Res>
    implements _$$_DeleteCopyWith<$Res> {
  __$$_DeleteCopyWithImpl(_$_Delete _value, $Res Function(_$_Delete) _then)
      : super(_value, (v) => _then(v as _$_Delete));

  @override
  _$_Delete get _value => super._value as _$_Delete;

  @override
  $Res call({
    Object? order = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_Delete(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as SavedOrder,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $SavedOrderCopyWith<$Res> get order {
    return $SavedOrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value));
    });
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete({required this.order, required this.user});

  @override
  final SavedOrder order;
  @override
  final User user;

  @override
  String toString() {
    return 'SavedOrderListEvent.delete(order: $order, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delete &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      __$$_DeleteCopyWithImpl<_$_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        fetch,
    required TResult Function(
            User userInfo,
            SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo)
        loadMore,
    required TResult Function(SavedOrder order, User user) delete,
  }) {
    return delete(order, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
  }) {
    return delete?.call(order, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        fetch,
    TResult Function(User userInfo, SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        loadMore,
    TResult Function(SavedOrder order, User user)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(order, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements SavedOrderListEvent {
  const factory _Delete(
      {required final SavedOrder order, required final User user}) = _$_Delete;

  SavedOrder get order;
  User get user;
  @JsonKey(ignore: true)
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SavedOrderListState {
  List<SavedOrder> get savedOrders => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  int get nextPageIndex => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedOrderListStateCopyWith<SavedOrderListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedOrderListStateCopyWith<$Res> {
  factory $SavedOrderListStateCopyWith(
          SavedOrderListState value, $Res Function(SavedOrderListState) then) =
      _$SavedOrderListStateCopyWithImpl<$Res>;
  $Res call(
      {List<SavedOrder> savedOrders,
      bool canLoadMore,
      bool isFetching,
      int nextPageIndex,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});
}

/// @nodoc
class _$SavedOrderListStateCopyWithImpl<$Res>
    implements $SavedOrderListStateCopyWith<$Res> {
  _$SavedOrderListStateCopyWithImpl(this._value, this._then);

  final SavedOrderListState _value;
  // ignore: unused_field
  final $Res Function(SavedOrderListState) _then;

  @override
  $Res call({
    Object? savedOrders = freezed,
    Object? canLoadMore = freezed,
    Object? isFetching = freezed,
    Object? nextPageIndex = freezed,
    Object? apiFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      savedOrders: savedOrders == freezed
          ? _value.savedOrders
          : savedOrders // ignore: cast_nullable_to_non_nullable
              as List<SavedOrder>,
      canLoadMore: canLoadMore == freezed
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: nextPageIndex == freezed
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_SavedOrderListStateCopyWith<$Res>
    implements $SavedOrderListStateCopyWith<$Res> {
  factory _$$_SavedOrderListStateCopyWith(_$_SavedOrderListState value,
          $Res Function(_$_SavedOrderListState) then) =
      __$$_SavedOrderListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SavedOrder> savedOrders,
      bool canLoadMore,
      bool isFetching,
      int nextPageIndex,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});
}

/// @nodoc
class __$$_SavedOrderListStateCopyWithImpl<$Res>
    extends _$SavedOrderListStateCopyWithImpl<$Res>
    implements _$$_SavedOrderListStateCopyWith<$Res> {
  __$$_SavedOrderListStateCopyWithImpl(_$_SavedOrderListState _value,
      $Res Function(_$_SavedOrderListState) _then)
      : super(_value, (v) => _then(v as _$_SavedOrderListState));

  @override
  _$_SavedOrderListState get _value => super._value as _$_SavedOrderListState;

  @override
  $Res call({
    Object? savedOrders = freezed,
    Object? canLoadMore = freezed,
    Object? isFetching = freezed,
    Object? nextPageIndex = freezed,
    Object? apiFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_SavedOrderListState(
      savedOrders: savedOrders == freezed
          ? _value._savedOrders
          : savedOrders // ignore: cast_nullable_to_non_nullable
              as List<SavedOrder>,
      canLoadMore: canLoadMore == freezed
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: nextPageIndex == freezed
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_SavedOrderListState extends _SavedOrderListState {
  const _$_SavedOrderListState(
      {required final List<SavedOrder> savedOrders,
      required this.canLoadMore,
      required this.isFetching,
      required this.nextPageIndex,
      required this.apiFailureOrSuccessOption})
      : _savedOrders = savedOrders,
        super._();

  final List<SavedOrder> _savedOrders;
  @override
  List<SavedOrder> get savedOrders {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedOrders);
  }

  @override
  final bool canLoadMore;
  @override
  final bool isFetching;
  @override
  final int nextPageIndex;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'SavedOrderListState(savedOrders: $savedOrders, canLoadMore: $canLoadMore, isFetching: $isFetching, nextPageIndex: $nextPageIndex, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedOrderListState &&
            const DeepCollectionEquality()
                .equals(other._savedOrders, _savedOrders) &&
            const DeepCollectionEquality()
                .equals(other.canLoadMore, canLoadMore) &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching) &&
            const DeepCollectionEquality()
                .equals(other.nextPageIndex, nextPageIndex) &&
            const DeepCollectionEquality().equals(
                other.apiFailureOrSuccessOption, apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_savedOrders),
      const DeepCollectionEquality().hash(canLoadMore),
      const DeepCollectionEquality().hash(isFetching),
      const DeepCollectionEquality().hash(nextPageIndex),
      const DeepCollectionEquality().hash(apiFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_SavedOrderListStateCopyWith<_$_SavedOrderListState> get copyWith =>
      __$$_SavedOrderListStateCopyWithImpl<_$_SavedOrderListState>(
          this, _$identity);
}

abstract class _SavedOrderListState extends SavedOrderListState {
  const factory _SavedOrderListState(
      {required final List<SavedOrder> savedOrders,
      required final bool canLoadMore,
      required final bool isFetching,
      required final int nextPageIndex,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_SavedOrderListState;
  const _SavedOrderListState._() : super._();

  @override
  List<SavedOrder> get savedOrders;
  @override
  bool get canLoadMore;
  @override
  bool get isFetching;
  @override
  int get nextPageIndex;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_SavedOrderListStateCopyWith<_$_SavedOrderListState> get copyWith =>
      throw _privateConstructorUsedError;
}
