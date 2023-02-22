// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, OrderHistoryItem orderHistoryItem)
        fetch,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsEventCopyWith<$Res> {
  factory $OrderHistoryDetailsEventCopyWith(OrderHistoryDetailsEvent value,
          $Res Function(OrderHistoryDetailsEvent) then) =
      _$OrderHistoryDetailsEventCopyWithImpl<$Res, OrderHistoryDetailsEvent>;
}

/// @nodoc
class _$OrderHistoryDetailsEventCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsEvent>
    implements $OrderHistoryDetailsEventCopyWith<$Res> {
  _$OrderHistoryDetailsEventCopyWithImpl(this._value, this._then);

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
    extends _$OrderHistoryDetailsEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'OrderHistoryDetailsEvent.initialized()';
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
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
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
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OrderHistoryDetailsEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, OrderHistoryItem orderHistoryItem});

  $UserCopyWith<$Res> get user;
  $OrderHistoryItemCopyWith<$Res> get orderHistoryItem;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? orderHistoryItem = null,
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
    return 'OrderHistoryDetailsEvent.fetch(user: $user, orderHistoryItem: $orderHistoryItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.orderHistoryItem, orderHistoryItem) ||
                other.orderHistoryItem == orderHistoryItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, orderHistoryItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, OrderHistoryItem orderHistoryItem)
        fetch,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
  }) {
    return fetch(user, orderHistoryItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
  }) {
    return fetch?.call(user, orderHistoryItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
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
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements OrderHistoryDetailsEvent {
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
abstract class _$$_UpdateMaterialTenderContractCopyWith<$Res> {
  factory _$$_UpdateMaterialTenderContractCopyWith(
          _$_UpdateMaterialTenderContract value,
          $Res Function(_$_UpdateMaterialTenderContract) then) =
      __$$_UpdateMaterialTenderContractCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {TenderContract selectedTenderContract, MaterialQueryInfo queryInfo});

  $TenderContractCopyWith<$Res> get selectedTenderContract;
  $MaterialQueryInfoCopyWith<$Res> get queryInfo;
}

/// @nodoc
class __$$_UpdateMaterialTenderContractCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsEventCopyWithImpl<$Res,
        _$_UpdateMaterialTenderContract>
    implements _$$_UpdateMaterialTenderContractCopyWith<$Res> {
  __$$_UpdateMaterialTenderContractCopyWithImpl(
      _$_UpdateMaterialTenderContract _value,
      $Res Function(_$_UpdateMaterialTenderContract) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTenderContract = null,
    Object? queryInfo = null,
  }) {
    return _then(_$_UpdateMaterialTenderContract(
      selectedTenderContract: null == selectedTenderContract
          ? _value.selectedTenderContract
          : selectedTenderContract // ignore: cast_nullable_to_non_nullable
              as TenderContract,
      queryInfo: null == queryInfo
          ? _value.queryInfo
          : queryInfo // ignore: cast_nullable_to_non_nullable
              as MaterialQueryInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TenderContractCopyWith<$Res> get selectedTenderContract {
    return $TenderContractCopyWith<$Res>(_value.selectedTenderContract,
        (value) {
      return _then(_value.copyWith(selectedTenderContract: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialQueryInfoCopyWith<$Res> get queryInfo {
    return $MaterialQueryInfoCopyWith<$Res>(_value.queryInfo, (value) {
      return _then(_value.copyWith(queryInfo: value));
    });
  }
}

/// @nodoc

class _$_UpdateMaterialTenderContract implements _UpdateMaterialTenderContract {
  const _$_UpdateMaterialTenderContract(
      {required this.selectedTenderContract, required this.queryInfo});

  @override
  final TenderContract selectedTenderContract;
  @override
  final MaterialQueryInfo queryInfo;

  @override
  String toString() {
    return 'OrderHistoryDetailsEvent.updateMaterialTenderContract(selectedTenderContract: $selectedTenderContract, queryInfo: $queryInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateMaterialTenderContract &&
            (identical(other.selectedTenderContract, selectedTenderContract) ||
                other.selectedTenderContract == selectedTenderContract) &&
            (identical(other.queryInfo, queryInfo) ||
                other.queryInfo == queryInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedTenderContract, queryInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateMaterialTenderContractCopyWith<_$_UpdateMaterialTenderContract>
      get copyWith => __$$_UpdateMaterialTenderContractCopyWithImpl<
          _$_UpdateMaterialTenderContract>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, OrderHistoryItem orderHistoryItem)
        fetch,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
  }) {
    return updateMaterialTenderContract(selectedTenderContract, queryInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
  }) {
    return updateMaterialTenderContract?.call(
        selectedTenderContract, queryInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, OrderHistoryItem orderHistoryItem)? fetch,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    required TResult orElse(),
  }) {
    if (updateMaterialTenderContract != null) {
      return updateMaterialTenderContract(selectedTenderContract, queryInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
  }) {
    return updateMaterialTenderContract(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
  }) {
    return updateMaterialTenderContract?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    required TResult orElse(),
  }) {
    if (updateMaterialTenderContract != null) {
      return updateMaterialTenderContract(this);
    }
    return orElse();
  }
}

abstract class _UpdateMaterialTenderContract
    implements OrderHistoryDetailsEvent {
  const factory _UpdateMaterialTenderContract(
          {required final TenderContract selectedTenderContract,
          required final MaterialQueryInfo queryInfo}) =
      _$_UpdateMaterialTenderContract;

  TenderContract get selectedTenderContract;
  MaterialQueryInfo get queryInfo;
  @JsonKey(ignore: true)
  _$$_UpdateMaterialTenderContractCopyWith<_$_UpdateMaterialTenderContract>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderHistoryDetailsState {
  OrderHistoryDetails get orderHistoryDetails =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Map<MaterialQueryInfo, bool> get isLoadingTenderContract =>
      throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Map<MaterialQueryInfo, PriceAggregate> get materials =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsStateCopyWith<OrderHistoryDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsStateCopyWith<$Res> {
  factory $OrderHistoryDetailsStateCopyWith(OrderHistoryDetailsState value,
          $Res Function(OrderHistoryDetailsState) then) =
      _$OrderHistoryDetailsStateCopyWithImpl<$Res, OrderHistoryDetailsState>;
  @useResult
  $Res call(
      {OrderHistoryDetails orderHistoryDetails,
      bool isLoading,
      Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      bool showErrorMessage,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      Map<MaterialQueryInfo, PriceAggregate> materials});

  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
}

/// @nodoc
class _$OrderHistoryDetailsStateCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsState>
    implements $OrderHistoryDetailsStateCopyWith<$Res> {
  _$OrderHistoryDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetails = null,
    Object? isLoading = null,
    Object? isLoadingTenderContract = null,
    Object? showErrorMessage = null,
    Object? failureOrSuccessOption = null,
    Object? materials = null,
  }) {
    return _then(_value.copyWith(
      orderHistoryDetails: null == orderHistoryDetails
          ? _value.orderHistoryDetails
          : orderHistoryDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingTenderContract: null == isLoadingTenderContract
          ? _value.isLoadingTenderContract
          : isLoadingTenderContract // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, bool>,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, PriceAggregate>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails {
    return $OrderHistoryDetailsCopyWith<$Res>(_value.orderHistoryDetails,
        (value) {
      return _then(_value.copyWith(orderHistoryDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsStateCopyWith<$Res>
    implements $OrderHistoryDetailsStateCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsStateCopyWith(
          _$_OrderHistoryDetailsState value,
          $Res Function(_$_OrderHistoryDetailsState) then) =
      __$$_OrderHistoryDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderHistoryDetails orderHistoryDetails,
      bool isLoading,
      Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      bool showErrorMessage,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      Map<MaterialQueryInfo, PriceAggregate> materials});

  @override
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
}

/// @nodoc
class __$$_OrderHistoryDetailsStateCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsStateCopyWithImpl<$Res,
        _$_OrderHistoryDetailsState>
    implements _$$_OrderHistoryDetailsStateCopyWith<$Res> {
  __$$_OrderHistoryDetailsStateCopyWithImpl(_$_OrderHistoryDetailsState _value,
      $Res Function(_$_OrderHistoryDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetails = null,
    Object? isLoading = null,
    Object? isLoadingTenderContract = null,
    Object? showErrorMessage = null,
    Object? failureOrSuccessOption = null,
    Object? materials = null,
  }) {
    return _then(_$_OrderHistoryDetailsState(
      orderHistoryDetails: null == orderHistoryDetails
          ? _value.orderHistoryDetails
          : orderHistoryDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetails,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingTenderContract: null == isLoadingTenderContract
          ? _value._isLoadingTenderContract
          : isLoadingTenderContract // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, bool>,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, PriceAggregate>,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryDetailsState extends _OrderHistoryDetailsState {
  const _$_OrderHistoryDetailsState(
      {required this.orderHistoryDetails,
      required this.isLoading,
      required final Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      required this.showErrorMessage,
      required this.failureOrSuccessOption,
      required final Map<MaterialQueryInfo, PriceAggregate> materials})
      : _isLoadingTenderContract = isLoadingTenderContract,
        _materials = materials,
        super._();

  @override
  final OrderHistoryDetails orderHistoryDetails;
  @override
  final bool isLoading;
  final Map<MaterialQueryInfo, bool> _isLoadingTenderContract;
  @override
  Map<MaterialQueryInfo, bool> get isLoadingTenderContract {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isLoadingTenderContract);
  }

  @override
  final bool showErrorMessage;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final Map<MaterialQueryInfo, PriceAggregate> _materials;
  @override
  Map<MaterialQueryInfo, PriceAggregate> get materials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @override
  String toString() {
    return 'OrderHistoryDetailsState(orderHistoryDetails: $orderHistoryDetails, isLoading: $isLoading, isLoadingTenderContract: $isLoadingTenderContract, showErrorMessage: $showErrorMessage, failureOrSuccessOption: $failureOrSuccessOption, materials: $materials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsState &&
            (identical(other.orderHistoryDetails, orderHistoryDetails) ||
                other.orderHistoryDetails == orderHistoryDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(
                other._isLoadingTenderContract, _isLoadingTenderContract) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                other.showErrorMessage == showErrorMessage) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderHistoryDetails,
      isLoading,
      const DeepCollectionEquality().hash(_isLoadingTenderContract),
      showErrorMessage,
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailsStateCopyWith<_$_OrderHistoryDetailsState>
      get copyWith => __$$_OrderHistoryDetailsStateCopyWithImpl<
          _$_OrderHistoryDetailsState>(this, _$identity);
}

abstract class _OrderHistoryDetailsState extends OrderHistoryDetailsState {
  const factory _OrderHistoryDetailsState(
      {required final OrderHistoryDetails orderHistoryDetails,
      required final bool isLoading,
      required final Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      required final bool showErrorMessage,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final Map<MaterialQueryInfo, PriceAggregate>
          materials}) = _$_OrderHistoryDetailsState;
  const _OrderHistoryDetailsState._() : super._();

  @override
  OrderHistoryDetails get orderHistoryDetails;
  @override
  bool get isLoading;
  @override
  Map<MaterialQueryInfo, bool> get isLoadingTenderContract;
  @override
  bool get showErrorMessage;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  Map<MaterialQueryInfo, PriceAggregate> get materials;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsStateCopyWith<_$_OrderHistoryDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
