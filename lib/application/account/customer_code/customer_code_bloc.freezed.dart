// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerCodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo) selected,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? selected,
    TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? selected,
    TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCodeEventCopyWith<$Res> {
  factory $CustomerCodeEventCopyWith(
          CustomerCodeEvent value, $Res Function(CustomerCodeEvent) then) =
      _$CustomerCodeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CustomerCodeEventCopyWithImpl<$Res>
    implements $CustomerCodeEventCopyWith<$Res> {
  _$CustomerCodeEventCopyWithImpl(this._value, this._then);

  final CustomerCodeEvent _value;
  // ignore: unused_field
  final $Res Function(CustomerCodeEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res>
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
    return 'CustomerCodeEvent.initialized()';
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
    required TResult Function(CustomerCodeInfo customerCodeInfo) selected,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? selected,
    TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? selected,
    TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)?
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
    required TResult Function(_Selected value) selected,
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CustomerCodeEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_SelectedCopyWith<$Res> {
  factory _$$_SelectedCopyWith(
          _$_Selected value, $Res Function(_$_Selected) then) =
      __$$_SelectedCopyWithImpl<$Res>;
  $Res call({CustomerCodeInfo customerCodeInfo});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_SelectedCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res>
    implements _$$_SelectedCopyWith<$Res> {
  __$$_SelectedCopyWithImpl(
      _$_Selected _value, $Res Function(_$_Selected) _then)
      : super(_value, (v) => _then(v as _$_Selected));

  @override
  _$_Selected get _value => super._value as _$_Selected;

  @override
  $Res call({
    Object? customerCodeInfo = freezed,
  }) {
    return _then(_$_Selected(
      customerCodeInfo: customerCodeInfo == freezed
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }
}

/// @nodoc

class _$_Selected implements _Selected {
  const _$_Selected({required this.customerCodeInfo});

  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'CustomerCodeEvent.selected(customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Selected &&
            const DeepCollectionEquality()
                .equals(other.customerCodeInfo, customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(customerCodeInfo));

  @JsonKey(ignore: true)
  @override
  _$$_SelectedCopyWith<_$_Selected> get copyWith =>
      __$$_SelectedCopyWithImpl<_$_Selected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo) selected,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)
        fetch,
  }) {
    return selected(customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? selected,
    TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)?
        fetch,
  }) {
    return selected?.call(customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? selected,
    TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)?
        fetch,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_Fetch value) fetch,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_Fetch value)? fetch,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class _Selected implements CustomerCodeEvent {
  const factory _Selected({required final CustomerCodeInfo customerCodeInfo}) =
      _$_Selected;

  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_SelectedCopyWith<_$_Selected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  $Res call(
      {SalesOrganisation salesOrganisation,
      List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
      int pageIndex,
      bool hidecustomer,
      String userRoleType,
      String userName});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res> extends _$CustomerCodeEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;

  @override
  $Res call({
    Object? salesOrganisation = freezed,
    Object? salesOrgCustomerInfo = freezed,
    Object? pageIndex = freezed,
    Object? hidecustomer = freezed,
    Object? userRoleType = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$_Fetch(
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgCustomerInfo: salesOrgCustomerInfo == freezed
          ? _value._salesOrgCustomerInfo
          : salesOrgCustomerInfo // ignore: cast_nullable_to_non_nullable
              as List<SalesOrgCustomerInfo>,
      pageIndex: pageIndex == freezed
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      hidecustomer: hidecustomer == freezed
          ? _value.hidecustomer
          : hidecustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      userRoleType: userRoleType == freezed
          ? _value.userRoleType
          : userRoleType // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganisation,
      required final List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
      required this.pageIndex,
      required this.hidecustomer,
      required this.userRoleType,
      required this.userName})
      : _salesOrgCustomerInfo = salesOrgCustomerInfo;

  @override
  final SalesOrganisation salesOrganisation;
  final List<SalesOrgCustomerInfo> _salesOrgCustomerInfo;
  @override
  List<SalesOrgCustomerInfo> get salesOrgCustomerInfo {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesOrgCustomerInfo);
  }

  @override
  final int pageIndex;
  @override
  final bool hidecustomer;
  @override
  final String userRoleType;
  @override
  final String userName;

  @override
  String toString() {
    return 'CustomerCodeEvent.fetch(salesOrganisation: $salesOrganisation, salesOrgCustomerInfo: $salesOrgCustomerInfo, pageIndex: $pageIndex, hidecustomer: $hidecustomer, userRoleType: $userRoleType, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation) &&
            const DeepCollectionEquality()
                .equals(other._salesOrgCustomerInfo, _salesOrgCustomerInfo) &&
            const DeepCollectionEquality().equals(other.pageIndex, pageIndex) &&
            const DeepCollectionEquality()
                .equals(other.hidecustomer, hidecustomer) &&
            const DeepCollectionEquality()
                .equals(other.userRoleType, userRoleType) &&
            const DeepCollectionEquality().equals(other.userName, userName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(salesOrganisation),
      const DeepCollectionEquality().hash(_salesOrgCustomerInfo),
      const DeepCollectionEquality().hash(pageIndex),
      const DeepCollectionEquality().hash(hidecustomer),
      const DeepCollectionEquality().hash(userRoleType),
      const DeepCollectionEquality().hash(userName));

  @JsonKey(ignore: true)
  @override
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo) selected,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)
        fetch,
  }) {
    return fetch(salesOrganisation, salesOrgCustomerInfo, pageIndex,
        hidecustomer, userRoleType, userName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? selected,
    TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)?
        fetch,
  }) {
    return fetch?.call(salesOrganisation, salesOrgCustomerInfo, pageIndex,
        hidecustomer, userRoleType, userName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? selected,
    TResult Function(
            SalesOrganisation salesOrganisation,
            List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
            int pageIndex,
            bool hidecustomer,
            String userRoleType,
            String userName)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, salesOrgCustomerInfo, pageIndex,
          hidecustomer, userRoleType, userName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements CustomerCodeEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
      required final int pageIndex,
      required final bool hidecustomer,
      required final String userRoleType,
      required final String userName}) = _$_Fetch;

  SalesOrganisation get salesOrganisation;
  List<SalesOrgCustomerInfo> get salesOrgCustomerInfo;
  int get pageIndex;
  bool get hidecustomer;
  String get userRoleType;
  String get userName;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerCodeState {
  CustomerCodeInfo get customeCodeInfo => throw _privateConstructorUsedError;
  List<CustomerCodeInfo> get customerCodeList =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoadMore => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerCodeStateCopyWith<CustomerCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCodeStateCopyWith<$Res> {
  factory $CustomerCodeStateCopyWith(
          CustomerCodeState value, $Res Function(CustomerCodeState) then) =
      _$CustomerCodeStateCopyWithImpl<$Res>;
  $Res call(
      {CustomerCodeInfo customeCodeInfo,
      List<CustomerCodeInfo> customerCodeList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isLoadMore,
      bool isFetching});

  $CustomerCodeInfoCopyWith<$Res> get customeCodeInfo;
}

/// @nodoc
class _$CustomerCodeStateCopyWithImpl<$Res>
    implements $CustomerCodeStateCopyWith<$Res> {
  _$CustomerCodeStateCopyWithImpl(this._value, this._then);

  final CustomerCodeState _value;
  // ignore: unused_field
  final $Res Function(CustomerCodeState) _then;

  @override
  $Res call({
    Object? customeCodeInfo = freezed,
    Object? customerCodeList = freezed,
    Object? apiFailureOrSuccessOption = freezed,
    Object? isLoadMore = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_value.copyWith(
      customeCodeInfo: customeCodeInfo == freezed
          ? _value.customeCodeInfo
          : customeCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      customerCodeList: customerCodeList == freezed
          ? _value.customerCodeList
          : customerCodeList // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeInfo>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoadMore: isLoadMore == freezed
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get customeCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customeCodeInfo, (value) {
      return _then(_value.copyWith(customeCodeInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_CustomerCodeStateCopyWith<$Res>
    implements $CustomerCodeStateCopyWith<$Res> {
  factory _$$_CustomerCodeStateCopyWith(_$_CustomerCodeState value,
          $Res Function(_$_CustomerCodeState) then) =
      __$$_CustomerCodeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CustomerCodeInfo customeCodeInfo,
      List<CustomerCodeInfo> customerCodeList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isLoadMore,
      bool isFetching});

  @override
  $CustomerCodeInfoCopyWith<$Res> get customeCodeInfo;
}

/// @nodoc
class __$$_CustomerCodeStateCopyWithImpl<$Res>
    extends _$CustomerCodeStateCopyWithImpl<$Res>
    implements _$$_CustomerCodeStateCopyWith<$Res> {
  __$$_CustomerCodeStateCopyWithImpl(
      _$_CustomerCodeState _value, $Res Function(_$_CustomerCodeState) _then)
      : super(_value, (v) => _then(v as _$_CustomerCodeState));

  @override
  _$_CustomerCodeState get _value => super._value as _$_CustomerCodeState;

  @override
  $Res call({
    Object? customeCodeInfo = freezed,
    Object? customerCodeList = freezed,
    Object? apiFailureOrSuccessOption = freezed,
    Object? isLoadMore = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_$_CustomerCodeState(
      customeCodeInfo: customeCodeInfo == freezed
          ? _value.customeCodeInfo
          : customeCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      customerCodeList: customerCodeList == freezed
          ? _value._customerCodeList
          : customerCodeList // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeInfo>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoadMore: isLoadMore == freezed
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CustomerCodeState implements _CustomerCodeState {
  const _$_CustomerCodeState(
      {required this.customeCodeInfo,
      required final List<CustomerCodeInfo> customerCodeList,
      required this.apiFailureOrSuccessOption,
      required this.isLoadMore,
      required this.isFetching})
      : _customerCodeList = customerCodeList;

  @override
  final CustomerCodeInfo customeCodeInfo;
  final List<CustomerCodeInfo> _customerCodeList;
  @override
  List<CustomerCodeInfo> get customerCodeList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerCodeList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isLoadMore;
  @override
  final bool isFetching;

  @override
  String toString() {
    return 'CustomerCodeState(customeCodeInfo: $customeCodeInfo, customerCodeList: $customerCodeList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isLoadMore: $isLoadMore, isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerCodeState &&
            const DeepCollectionEquality()
                .equals(other.customeCodeInfo, customeCodeInfo) &&
            const DeepCollectionEquality()
                .equals(other._customerCodeList, _customerCodeList) &&
            const DeepCollectionEquality().equals(
                other.apiFailureOrSuccessOption, apiFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isLoadMore, isLoadMore) &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customeCodeInfo),
      const DeepCollectionEquality().hash(_customerCodeList),
      const DeepCollectionEquality().hash(apiFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isLoadMore),
      const DeepCollectionEquality().hash(isFetching));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerCodeStateCopyWith<_$_CustomerCodeState> get copyWith =>
      __$$_CustomerCodeStateCopyWithImpl<_$_CustomerCodeState>(
          this, _$identity);
}

abstract class _CustomerCodeState implements CustomerCodeState {
  const factory _CustomerCodeState(
      {required final CustomerCodeInfo customeCodeInfo,
      required final List<CustomerCodeInfo> customerCodeList,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isLoadMore,
      required final bool isFetching}) = _$_CustomerCodeState;

  @override
  CustomerCodeInfo get customeCodeInfo;
  @override
  List<CustomerCodeInfo> get customerCodeList;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isLoadMore;
  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerCodeStateCopyWith<_$_CustomerCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
