// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_license_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerLicenseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerLicenseEventCopyWith<$Res> {
  factory $CustomerLicenseEventCopyWith(CustomerLicenseEvent value,
          $Res Function(CustomerLicenseEvent) then) =
      _$CustomerLicenseEventCopyWithImpl<$Res, CustomerLicenseEvent>;
}

/// @nodoc
class _$CustomerLicenseEventCopyWithImpl<$Res,
        $Val extends CustomerLicenseEvent>
    implements $CustomerLicenseEventCopyWith<$Res> {
  _$CustomerLicenseEventCopyWithImpl(this._value, this._then);

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
    extends _$CustomerLicenseEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'CustomerLicenseEvent.initialized()';
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
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)
        loadMore,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        loadMore,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        loadMore,
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
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CustomerLicenseEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerInfo,
      User user});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$CustomerLicenseEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerInfo = null,
    Object? user = null,
  }) {
    return _then(_$_Fetch(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerInfo: null == customerInfo
          ? _value.customerInfo
          : customerInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
  $CustomerCodeInfoCopyWith<$Res> get customerInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerInfo, (value) {
      return _then(_value.copyWith(customerInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganisation,
      required this.customerInfo,
      required this.user});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'CustomerLicenseEvent.fetch(salesOrganisation: $salesOrganisation, customerInfo: $customerInfo, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerInfo, customerInfo) ||
                other.customerInfo == customerInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganisation, customerInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)
        loadMore,
  }) {
    return fetch(salesOrganisation, customerInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        loadMore,
  }) {
    return fetch?.call(salesOrganisation, customerInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, customerInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements CustomerLicenseEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerInfo,
      required final User user}) = _$_Fetch;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerInfo,
      User user});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$CustomerLicenseEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerInfo = null,
    Object? user = null,
  }) {
    return _then(_$_LoadMore(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerInfo: null == customerInfo
          ? _value.customerInfo
          : customerInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
  $CustomerCodeInfoCopyWith<$Res> get customerInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerInfo, (value) {
      return _then(_value.copyWith(customerInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore(
      {required this.salesOrganisation,
      required this.customerInfo,
      required this.user});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'CustomerLicenseEvent.loadMore(salesOrganisation: $salesOrganisation, customerInfo: $customerInfo, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMore &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerInfo, customerInfo) ||
                other.customerInfo == customerInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganisation, customerInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      __$$_LoadMoreCopyWithImpl<_$_LoadMore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)
        fetch,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)
        loadMore,
  }) {
    return loadMore(salesOrganisation, customerInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        fetch,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        loadMore,
  }) {
    return loadMore?.call(salesOrganisation, customerInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        fetch,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerInfo, User user)?
        loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(salesOrganisation, customerInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements CustomerLicenseEvent {
  const factory _LoadMore(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerInfo,
      required final User user}) = _$_LoadMore;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$_LoadMoreCopyWith<_$_LoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerLicenseState {
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<CustomerLicense> get customerLicenses =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerLicenseStateCopyWith<CustomerLicenseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerLicenseStateCopyWith<$Res> {
  factory $CustomerLicenseStateCopyWith(CustomerLicenseState value,
          $Res Function(CustomerLicenseState) then) =
      _$CustomerLicenseStateCopyWithImpl<$Res, CustomerLicenseState>;
  @useResult
  $Res call(
      {bool isFetching,
      bool canLoadMore,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<CustomerLicense> customerLicenses});
}

/// @nodoc
class _$CustomerLicenseStateCopyWithImpl<$Res,
        $Val extends CustomerLicenseState>
    implements $CustomerLicenseStateCopyWith<$Res> {
  _$CustomerLicenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? failureOrSuccessOption = null,
    Object? customerLicenses = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      customerLicenses: null == customerLicenses
          ? _value.customerLicenses
          : customerLicenses // ignore: cast_nullable_to_non_nullable
              as List<CustomerLicense>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerLicenseStateCopyWith<$Res>
    implements $CustomerLicenseStateCopyWith<$Res> {
  factory _$$_CustomerLicenseStateCopyWith(_$_CustomerLicenseState value,
          $Res Function(_$_CustomerLicenseState) then) =
      __$$_CustomerLicenseStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      bool canLoadMore,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<CustomerLicense> customerLicenses});
}

/// @nodoc
class __$$_CustomerLicenseStateCopyWithImpl<$Res>
    extends _$CustomerLicenseStateCopyWithImpl<$Res, _$_CustomerLicenseState>
    implements _$$_CustomerLicenseStateCopyWith<$Res> {
  __$$_CustomerLicenseStateCopyWithImpl(_$_CustomerLicenseState _value,
      $Res Function(_$_CustomerLicenseState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? failureOrSuccessOption = null,
    Object? customerLicenses = null,
  }) {
    return _then(_$_CustomerLicenseState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      customerLicenses: null == customerLicenses
          ? _value._customerLicenses
          : customerLicenses // ignore: cast_nullable_to_non_nullable
              as List<CustomerLicense>,
    ));
  }
}

/// @nodoc

class _$_CustomerLicenseState implements _CustomerLicenseState {
  const _$_CustomerLicenseState(
      {required this.isFetching,
      required this.canLoadMore,
      required this.failureOrSuccessOption,
      required final List<CustomerLicense> customerLicenses})
      : _customerLicenses = customerLicenses;

  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<CustomerLicense> _customerLicenses;
  @override
  List<CustomerLicense> get customerLicenses {
    if (_customerLicenses is EqualUnmodifiableListView)
      return _customerLicenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerLicenses);
  }

  @override
  String toString() {
    return 'CustomerLicenseState(isFetching: $isFetching, canLoadMore: $canLoadMore, failureOrSuccessOption: $failureOrSuccessOption, customerLicenses: $customerLicenses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerLicenseState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._customerLicenses, _customerLicenses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      canLoadMore,
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_customerLicenses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerLicenseStateCopyWith<_$_CustomerLicenseState> get copyWith =>
      __$$_CustomerLicenseStateCopyWithImpl<_$_CustomerLicenseState>(
          this, _$identity);
}

abstract class _CustomerLicenseState implements CustomerLicenseState {
  const factory _CustomerLicenseState(
      {required final bool isFetching,
      required final bool canLoadMore,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<CustomerLicense>
          customerLicenses}) = _$_CustomerLicenseState;

  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<CustomerLicense> get customerLicenses;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerLicenseStateCopyWith<_$_CustomerLicenseState> get copyWith =>
      throw _privateConstructorUsedError;
}
