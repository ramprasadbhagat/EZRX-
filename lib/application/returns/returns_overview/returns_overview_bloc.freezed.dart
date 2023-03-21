// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'returns_overview_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnsOverviewEvent {
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(SalesOrganisation salesOrganisation, User user,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, User user,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, User user,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchReturnsOverview value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchReturnsOverview value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchReturnsOverview value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnsOverviewEventCopyWith<ReturnsOverviewEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnsOverviewEventCopyWith<$Res> {
  factory $ReturnsOverviewEventCopyWith(ReturnsOverviewEvent value,
          $Res Function(ReturnsOverviewEvent) then) =
      _$ReturnsOverviewEventCopyWithImpl<$Res, ReturnsOverviewEvent>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class _$ReturnsOverviewEventCopyWithImpl<$Res,
        $Val extends ReturnsOverviewEvent>
    implements $ReturnsOverviewEventCopyWith<$Res> {
  _$ReturnsOverviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_value.copyWith(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res>
    implements $ReturnsOverviewEventCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ReturnsOverviewEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$_Initialized(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'ReturnsOverviewEvent.initialized(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(SalesOrganisation salesOrganisation, User user,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return initialized(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, User user,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return initialized?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, User user,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchReturnsOverview value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchReturnsOverview value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchReturnsOverview value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ReturnsOverviewEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganisation}) = _$_Initialized;

  @override
  SalesOrganisation get salesOrganisation;
  @override
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_fetchReturnsOverviewCopyWith<$Res>
    implements $ReturnsOverviewEventCopyWith<$Res> {
  factory _$$_fetchReturnsOverviewCopyWith(_$_fetchReturnsOverview value,
          $Res Function(_$_fetchReturnsOverview) then) =
      __$$_fetchReturnsOverviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      User user,
      ShipToInfo shipToInfo,
      CustomerCodeInfo customerCodeInfo});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_fetchReturnsOverviewCopyWithImpl<$Res>
    extends _$ReturnsOverviewEventCopyWithImpl<$Res, _$_fetchReturnsOverview>
    implements _$$_fetchReturnsOverviewCopyWith<$Res> {
  __$$_fetchReturnsOverviewCopyWithImpl(_$_fetchReturnsOverview _value,
      $Res Function(_$_fetchReturnsOverview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? user = null,
    Object? shipToInfo = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_fetchReturnsOverview(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
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

class _$_fetchReturnsOverview implements _fetchReturnsOverview {
  const _$_fetchReturnsOverview(
      {required this.salesOrganisation,
      required this.user,
      required this.shipToInfo,
      required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final User user;
  @override
  final ShipToInfo shipToInfo;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'ReturnsOverviewEvent.fetch(salesOrganisation: $salesOrganisation, user: $user, shipToInfo: $shipToInfo, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_fetchReturnsOverview &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganisation, user, shipToInfo, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_fetchReturnsOverviewCopyWith<_$_fetchReturnsOverview> get copyWith =>
      __$$_fetchReturnsOverviewCopyWithImpl<_$_fetchReturnsOverview>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(SalesOrganisation salesOrganisation, User user,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return fetch(salesOrganisation, user, shipToInfo, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, User user,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return fetch?.call(salesOrganisation, user, shipToInfo, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(SalesOrganisation salesOrganisation, User user,
            ShipToInfo shipToInfo, CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, user, shipToInfo, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_fetchReturnsOverview value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_fetchReturnsOverview value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_fetchReturnsOverview value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _fetchReturnsOverview implements ReturnsOverviewEvent {
  const factory _fetchReturnsOverview(
          {required final SalesOrganisation salesOrganisation,
          required final User user,
          required final ShipToInfo shipToInfo,
          required final CustomerCodeInfo customerCodeInfo}) =
      _$_fetchReturnsOverview;

  @override
  SalesOrganisation get salesOrganisation;
  User get user;
  ShipToInfo get shipToInfo;
  CustomerCodeInfo get customerCodeInfo;
  @override
  @JsonKey(ignore: true)
  _$$_fetchReturnsOverviewCopyWith<_$_fetchReturnsOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnsOverviewState {
  ReturnsOverview get returnRequestsOverview =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnsOverviewStateCopyWith<ReturnsOverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnsOverviewStateCopyWith<$Res> {
  factory $ReturnsOverviewStateCopyWith(ReturnsOverviewState value,
          $Res Function(ReturnsOverviewState) then) =
      _$ReturnsOverviewStateCopyWithImpl<$Res, ReturnsOverviewState>;
  @useResult
  $Res call(
      {ReturnsOverview returnRequestsOverview,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isLoading});

  $ReturnsOverviewCopyWith<$Res> get returnRequestsOverview;
}

/// @nodoc
class _$ReturnsOverviewStateCopyWithImpl<$Res,
        $Val extends ReturnsOverviewState>
    implements $ReturnsOverviewStateCopyWith<$Res> {
  _$ReturnsOverviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnRequestsOverview = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      returnRequestsOverview: null == returnRequestsOverview
          ? _value.returnRequestsOverview
          : returnRequestsOverview // ignore: cast_nullable_to_non_nullable
              as ReturnsOverview,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnsOverviewCopyWith<$Res> get returnRequestsOverview {
    return $ReturnsOverviewCopyWith<$Res>(_value.returnRequestsOverview,
        (value) {
      return _then(_value.copyWith(returnRequestsOverview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReturnsOverviewStateCopyWith<$Res>
    implements $ReturnsOverviewStateCopyWith<$Res> {
  factory _$$_ReturnsOverviewStateCopyWith(_$_ReturnsOverviewState value,
          $Res Function(_$_ReturnsOverviewState) then) =
      __$$_ReturnsOverviewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReturnsOverview returnRequestsOverview,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isLoading});

  @override
  $ReturnsOverviewCopyWith<$Res> get returnRequestsOverview;
}

/// @nodoc
class __$$_ReturnsOverviewStateCopyWithImpl<$Res>
    extends _$ReturnsOverviewStateCopyWithImpl<$Res, _$_ReturnsOverviewState>
    implements _$$_ReturnsOverviewStateCopyWith<$Res> {
  __$$_ReturnsOverviewStateCopyWithImpl(_$_ReturnsOverviewState _value,
      $Res Function(_$_ReturnsOverviewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnRequestsOverview = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_$_ReturnsOverviewState(
      returnRequestsOverview: null == returnRequestsOverview
          ? _value.returnRequestsOverview
          : returnRequestsOverview // ignore: cast_nullable_to_non_nullable
              as ReturnsOverview,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReturnsOverviewState extends _ReturnsOverviewState {
  _$_ReturnsOverviewState(
      {required this.returnRequestsOverview,
      required this.apiFailureOrSuccessOption,
      required this.isLoading})
      : super._();

  @override
  final ReturnsOverview returnRequestsOverview;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ReturnsOverviewState(returnRequestsOverview: $returnRequestsOverview, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnsOverviewState &&
            (identical(other.returnRequestsOverview, returnRequestsOverview) ||
                other.returnRequestsOverview == returnRequestsOverview) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnRequestsOverview,
      apiFailureOrSuccessOption, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnsOverviewStateCopyWith<_$_ReturnsOverviewState> get copyWith =>
      __$$_ReturnsOverviewStateCopyWithImpl<_$_ReturnsOverviewState>(
          this, _$identity);
}

abstract class _ReturnsOverviewState extends ReturnsOverviewState {
  factory _ReturnsOverviewState(
      {required final ReturnsOverview returnRequestsOverview,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isLoading}) = _$_ReturnsOverviewState;
  _ReturnsOverviewState._() : super._();

  @override
  ReturnsOverview get returnRequestsOverview;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnsOverviewStateCopyWith<_$_ReturnsOverviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
