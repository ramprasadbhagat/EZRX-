// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewByOrderDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(OrderNumber orderNumber) fetch,
    required TResult Function(OrderHistoryDetails orderHistoryDetails)
        setOrderDetails,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
    required TResult Function() updateBundle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(OrderNumber orderNumber)? fetch,
    TResult? Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
    TResult? Function()? updateBundle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(OrderNumber orderNumber)? fetch,
    TResult Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    TResult Function()? updateBundle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetOrderDetails value) setOrderDetails,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
    required TResult Function(_UpdateBundle value) updateBundle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetOrderDetails value)? setOrderDetails,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
    TResult? Function(_UpdateBundle value)? updateBundle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetOrderDetails value)? setOrderDetails,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    TResult Function(_UpdateBundle value)? updateBundle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderDetailsEventCopyWith<$Res> {
  factory $ViewByOrderDetailsEventCopyWith(ViewByOrderDetailsEvent value,
          $Res Function(ViewByOrderDetailsEvent) then) =
      _$ViewByOrderDetailsEventCopyWithImpl<$Res, ViewByOrderDetailsEvent>;
}

/// @nodoc
class _$ViewByOrderDetailsEventCopyWithImpl<$Res,
        $Val extends ViewByOrderDetailsEvent>
    implements $ViewByOrderDetailsEventCopyWith<$Res> {
  _$ViewByOrderDetailsEventCopyWithImpl(this._value, this._then);

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
      {User user,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      ShipToInfo shipToInfo});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$_Initialized(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
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
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value));
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
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
      {required this.user,
      required this.configs,
      required this.customerCodeInfo,
      required this.salesOrganisation,
      required this.shipToInfo});

  @override
  final User user;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ViewByOrderDetailsEvent.initialized(user: $user, configs: $configs, customerCodeInfo: $customerCodeInfo, salesOrganisation: $salesOrganisation, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, configs, customerCodeInfo,
      salesOrganisation, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(OrderNumber orderNumber) fetch,
    required TResult Function(OrderHistoryDetails orderHistoryDetails)
        setOrderDetails,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
    required TResult Function() updateBundle,
  }) {
    return initialized(
        user, configs, customerCodeInfo, salesOrganisation, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(OrderNumber orderNumber)? fetch,
    TResult? Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
    TResult? Function()? updateBundle,
  }) {
    return initialized?.call(
        user, configs, customerCodeInfo, salesOrganisation, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(OrderNumber orderNumber)? fetch,
    TResult Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    TResult Function()? updateBundle,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(
          user, configs, customerCodeInfo, salesOrganisation, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetOrderDetails value) setOrderDetails,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
    required TResult Function(_UpdateBundle value) updateBundle,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetOrderDetails value)? setOrderDetails,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
    TResult? Function(_UpdateBundle value)? updateBundle,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetOrderDetails value)? setOrderDetails,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    TResult Function(_UpdateBundle value)? updateBundle,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByOrderDetailsEvent {
  const factory _Initialized(
      {required final User user,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganisation,
      required final ShipToInfo shipToInfo}) = _$_Initialized;

  User get user;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisation get salesOrganisation;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderNumber orderNumber});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
  }) {
    return _then(_$_Fetch(
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.orderNumber});

  @override
  final OrderNumber orderNumber;

  @override
  String toString() {
    return 'ViewByOrderDetailsEvent.fetch(orderNumber: $orderNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(OrderNumber orderNumber) fetch,
    required TResult Function(OrderHistoryDetails orderHistoryDetails)
        setOrderDetails,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
    required TResult Function() updateBundle,
  }) {
    return fetch(orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(OrderNumber orderNumber)? fetch,
    TResult? Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
    TResult? Function()? updateBundle,
  }) {
    return fetch?.call(orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(OrderNumber orderNumber)? fetch,
    TResult Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    TResult Function()? updateBundle,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(orderNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetOrderDetails value) setOrderDetails,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
    required TResult Function(_UpdateBundle value) updateBundle,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetOrderDetails value)? setOrderDetails,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
    TResult? Function(_UpdateBundle value)? updateBundle,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetOrderDetails value)? setOrderDetails,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    TResult Function(_UpdateBundle value)? updateBundle,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ViewByOrderDetailsEvent {
  const factory _Fetch({required final OrderNumber orderNumber}) = _$_Fetch;

  OrderNumber get orderNumber;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetOrderDetailsCopyWith<$Res> {
  factory _$$_SetOrderDetailsCopyWith(
          _$_SetOrderDetails value, $Res Function(_$_SetOrderDetails) then) =
      __$$_SetOrderDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderHistoryDetails orderHistoryDetails});

  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
}

/// @nodoc
class __$$_SetOrderDetailsCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res, _$_SetOrderDetails>
    implements _$$_SetOrderDetailsCopyWith<$Res> {
  __$$_SetOrderDetailsCopyWithImpl(
      _$_SetOrderDetails _value, $Res Function(_$_SetOrderDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderHistoryDetails = null,
  }) {
    return _then(_$_SetOrderDetails(
      orderHistoryDetails: null == orderHistoryDetails
          ? _value.orderHistoryDetails
          : orderHistoryDetails // ignore: cast_nullable_to_non_nullable
              as OrderHistoryDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails {
    return $OrderHistoryDetailsCopyWith<$Res>(_value.orderHistoryDetails,
        (value) {
      return _then(_value.copyWith(orderHistoryDetails: value));
    });
  }
}

/// @nodoc

class _$_SetOrderDetails implements _SetOrderDetails {
  const _$_SetOrderDetails({required this.orderHistoryDetails});

  @override
  final OrderHistoryDetails orderHistoryDetails;

  @override
  String toString() {
    return 'ViewByOrderDetailsEvent.setOrderDetails(orderHistoryDetails: $orderHistoryDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetOrderDetails &&
            (identical(other.orderHistoryDetails, orderHistoryDetails) ||
                other.orderHistoryDetails == orderHistoryDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderHistoryDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetOrderDetailsCopyWith<_$_SetOrderDetails> get copyWith =>
      __$$_SetOrderDetailsCopyWithImpl<_$_SetOrderDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(OrderNumber orderNumber) fetch,
    required TResult Function(OrderHistoryDetails orderHistoryDetails)
        setOrderDetails,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
    required TResult Function() updateBundle,
  }) {
    return setOrderDetails(orderHistoryDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(OrderNumber orderNumber)? fetch,
    TResult? Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
    TResult? Function()? updateBundle,
  }) {
    return setOrderDetails?.call(orderHistoryDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(OrderNumber orderNumber)? fetch,
    TResult Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    TResult Function()? updateBundle,
    required TResult orElse(),
  }) {
    if (setOrderDetails != null) {
      return setOrderDetails(orderHistoryDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetOrderDetails value) setOrderDetails,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
    required TResult Function(_UpdateBundle value) updateBundle,
  }) {
    return setOrderDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetOrderDetails value)? setOrderDetails,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
    TResult? Function(_UpdateBundle value)? updateBundle,
  }) {
    return setOrderDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetOrderDetails value)? setOrderDetails,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    TResult Function(_UpdateBundle value)? updateBundle,
    required TResult orElse(),
  }) {
    if (setOrderDetails != null) {
      return setOrderDetails(this);
    }
    return orElse();
  }
}

abstract class _SetOrderDetails implements ViewByOrderDetailsEvent {
  const factory _SetOrderDetails(
          {required final OrderHistoryDetails orderHistoryDetails}) =
      _$_SetOrderDetails;

  OrderHistoryDetails get orderHistoryDetails;
  @JsonKey(ignore: true)
  _$$_SetOrderDetailsCopyWith<_$_SetOrderDetails> get copyWith =>
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
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res,
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
    return 'ViewByOrderDetailsEvent.updateMaterialTenderContract(selectedTenderContract: $selectedTenderContract, queryInfo: $queryInfo)';
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
    required TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(OrderNumber orderNumber) fetch,
    required TResult Function(OrderHistoryDetails orderHistoryDetails)
        setOrderDetails,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
    required TResult Function() updateBundle,
  }) {
    return updateMaterialTenderContract(selectedTenderContract, queryInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(OrderNumber orderNumber)? fetch,
    TResult? Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
    TResult? Function()? updateBundle,
  }) {
    return updateMaterialTenderContract?.call(
        selectedTenderContract, queryInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(OrderNumber orderNumber)? fetch,
    TResult Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    TResult Function()? updateBundle,
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
    required TResult Function(_SetOrderDetails value) setOrderDetails,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
    required TResult Function(_UpdateBundle value) updateBundle,
  }) {
    return updateMaterialTenderContract(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetOrderDetails value)? setOrderDetails,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
    TResult? Function(_UpdateBundle value)? updateBundle,
  }) {
    return updateMaterialTenderContract?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetOrderDetails value)? setOrderDetails,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    TResult Function(_UpdateBundle value)? updateBundle,
    required TResult orElse(),
  }) {
    if (updateMaterialTenderContract != null) {
      return updateMaterialTenderContract(this);
    }
    return orElse();
  }
}

abstract class _UpdateMaterialTenderContract
    implements ViewByOrderDetailsEvent {
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
abstract class _$$_ExpandAttachmentsCopyWith<$Res> {
  factory _$$_ExpandAttachmentsCopyWith(_$_ExpandAttachments value,
          $Res Function(_$_ExpandAttachments) then) =
      __$$_ExpandAttachmentsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ExpandAttachmentsCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res, _$_ExpandAttachments>
    implements _$$_ExpandAttachmentsCopyWith<$Res> {
  __$$_ExpandAttachmentsCopyWithImpl(
      _$_ExpandAttachments _value, $Res Function(_$_ExpandAttachments) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ExpandAttachments implements _ExpandAttachments {
  const _$_ExpandAttachments();

  @override
  String toString() {
    return 'ViewByOrderDetailsEvent.expandAttachments()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ExpandAttachments);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(OrderNumber orderNumber) fetch,
    required TResult Function(OrderHistoryDetails orderHistoryDetails)
        setOrderDetails,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
    required TResult Function() updateBundle,
  }) {
    return expandAttachments();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(OrderNumber orderNumber)? fetch,
    TResult? Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
    TResult? Function()? updateBundle,
  }) {
    return expandAttachments?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(OrderNumber orderNumber)? fetch,
    TResult Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    TResult Function()? updateBundle,
    required TResult orElse(),
  }) {
    if (expandAttachments != null) {
      return expandAttachments();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetOrderDetails value) setOrderDetails,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
    required TResult Function(_UpdateBundle value) updateBundle,
  }) {
    return expandAttachments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetOrderDetails value)? setOrderDetails,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
    TResult? Function(_UpdateBundle value)? updateBundle,
  }) {
    return expandAttachments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetOrderDetails value)? setOrderDetails,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    TResult Function(_UpdateBundle value)? updateBundle,
    required TResult orElse(),
  }) {
    if (expandAttachments != null) {
      return expandAttachments(this);
    }
    return orElse();
  }
}

abstract class _ExpandAttachments implements ViewByOrderDetailsEvent {
  const factory _ExpandAttachments() = _$_ExpandAttachments;
}

/// @nodoc
abstract class _$$_UpdateBundleCopyWith<$Res> {
  factory _$$_UpdateBundleCopyWith(
          _$_UpdateBundle value, $Res Function(_$_UpdateBundle) then) =
      __$$_UpdateBundleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UpdateBundleCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsEventCopyWithImpl<$Res, _$_UpdateBundle>
    implements _$$_UpdateBundleCopyWith<$Res> {
  __$$_UpdateBundleCopyWithImpl(
      _$_UpdateBundle _value, $Res Function(_$_UpdateBundle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_UpdateBundle implements _UpdateBundle {
  const _$_UpdateBundle();

  @override
  String toString() {
    return 'ViewByOrderDetailsEvent.updateBundle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_UpdateBundle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(OrderNumber orderNumber) fetch,
    required TResult Function(OrderHistoryDetails orderHistoryDetails)
        setOrderDetails,
    required TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)
        updateMaterialTenderContract,
    required TResult Function() expandAttachments,
    required TResult Function() updateBundle,
  }) {
    return updateBundle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(OrderNumber orderNumber)? fetch,
    TResult? Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult? Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult? Function()? expandAttachments,
    TResult? Function()? updateBundle,
  }) {
    return updateBundle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(OrderNumber orderNumber)? fetch,
    TResult Function(OrderHistoryDetails orderHistoryDetails)? setOrderDetails,
    TResult Function(
            TenderContract selectedTenderContract, MaterialQueryInfo queryInfo)?
        updateMaterialTenderContract,
    TResult Function()? expandAttachments,
    TResult Function()? updateBundle,
    required TResult orElse(),
  }) {
    if (updateBundle != null) {
      return updateBundle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_SetOrderDetails value) setOrderDetails,
    required TResult Function(_UpdateMaterialTenderContract value)
        updateMaterialTenderContract,
    required TResult Function(_ExpandAttachments value) expandAttachments,
    required TResult Function(_UpdateBundle value) updateBundle,
  }) {
    return updateBundle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_SetOrderDetails value)? setOrderDetails,
    TResult? Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult? Function(_ExpandAttachments value)? expandAttachments,
    TResult? Function(_UpdateBundle value)? updateBundle,
  }) {
    return updateBundle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_SetOrderDetails value)? setOrderDetails,
    TResult Function(_UpdateMaterialTenderContract value)?
        updateMaterialTenderContract,
    TResult Function(_ExpandAttachments value)? expandAttachments,
    TResult Function(_UpdateBundle value)? updateBundle,
    required TResult orElse(),
  }) {
    if (updateBundle != null) {
      return updateBundle(this);
    }
    return orElse();
  }
}

abstract class _UpdateBundle implements ViewByOrderDetailsEvent {
  const factory _UpdateBundle() = _$_UpdateBundle;
}

/// @nodoc
mixin _$ViewByOrderDetailsState {
  User get user => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get configs => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  OrderHistoryDetails get orderHistoryDetails =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Map<MaterialQueryInfo, bool> get isLoadingTenderContract =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Map<MaterialQueryInfo, PriceAggregate> get materials =>
      throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;
  List<ProductDetailAggregate> get productDetailAggregateList =>
      throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  bool get isLoadingBundleDetail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrderDetailsStateCopyWith<ViewByOrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderDetailsStateCopyWith<$Res> {
  factory $ViewByOrderDetailsStateCopyWith(ViewByOrderDetailsState value,
          $Res Function(ViewByOrderDetailsState) then) =
      _$ViewByOrderDetailsStateCopyWithImpl<$Res, ViewByOrderDetailsState>;
  @useResult
  $Res call(
      {User user,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      OrderHistoryDetails orderHistoryDetails,
      bool isLoading,
      Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      Map<MaterialQueryInfo, PriceAggregate> materials,
      bool isExpanded,
      List<ProductDetailAggregate> productDetailAggregateList,
      ShipToInfo shipToInfo,
      bool isLoadingBundleDetail});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class _$ViewByOrderDetailsStateCopyWithImpl<$Res,
        $Val extends ViewByOrderDetailsState>
    implements $ViewByOrderDetailsStateCopyWith<$Res> {
  _$ViewByOrderDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? orderHistoryDetails = null,
    Object? isLoading = null,
    Object? isLoadingTenderContract = null,
    Object? failureOrSuccessOption = null,
    Object? materials = null,
    Object? isExpanded = null,
    Object? productDetailAggregateList = null,
    Object? shipToInfo = null,
    Object? isLoadingBundleDetail = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, PriceAggregate>,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetailAggregateList: null == productDetailAggregateList
          ? _value.productDetailAggregateList
          : productDetailAggregateList // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailAggregate>,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      isLoadingBundleDetail: null == isLoadingBundleDetail
          ? _value.isLoadingBundleDetail
          : isLoadingBundleDetail // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
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
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value) as $Val);
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails {
    return $OrderHistoryDetailsCopyWith<$Res>(_value.orderHistoryDetails,
        (value) {
      return _then(_value.copyWith(orderHistoryDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ViewByOrderDetailsStateCopyWith<$Res>
    implements $ViewByOrderDetailsStateCopyWith<$Res> {
  factory _$$_ViewByOrderDetailsStateCopyWith(_$_ViewByOrderDetailsState value,
          $Res Function(_$_ViewByOrderDetailsState) then) =
      __$$_ViewByOrderDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      OrderHistoryDetails orderHistoryDetails,
      bool isLoading,
      Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      Map<MaterialQueryInfo, PriceAggregate> materials,
      bool isExpanded,
      List<ProductDetailAggregate> productDetailAggregateList,
      ShipToInfo shipToInfo,
      bool isLoadingBundleDetail});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $OrderHistoryDetailsCopyWith<$Res> get orderHistoryDetails;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_ViewByOrderDetailsStateCopyWithImpl<$Res>
    extends _$ViewByOrderDetailsStateCopyWithImpl<$Res,
        _$_ViewByOrderDetailsState>
    implements _$$_ViewByOrderDetailsStateCopyWith<$Res> {
  __$$_ViewByOrderDetailsStateCopyWithImpl(_$_ViewByOrderDetailsState _value,
      $Res Function(_$_ViewByOrderDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? orderHistoryDetails = null,
    Object? isLoading = null,
    Object? isLoadingTenderContract = null,
    Object? failureOrSuccessOption = null,
    Object? materials = null,
    Object? isExpanded = null,
    Object? productDetailAggregateList = null,
    Object? shipToInfo = null,
    Object? isLoadingBundleDetail = null,
  }) {
    return _then(_$_ViewByOrderDetailsState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, PriceAggregate>,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      productDetailAggregateList: null == productDetailAggregateList
          ? _value._productDetailAggregateList
          : productDetailAggregateList // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailAggregate>,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      isLoadingBundleDetail: null == isLoadingBundleDetail
          ? _value.isLoadingBundleDetail
          : isLoadingBundleDetail // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ViewByOrderDetailsState extends _ViewByOrderDetailsState {
  const _$_ViewByOrderDetailsState(
      {required this.user,
      required this.configs,
      required this.customerCodeInfo,
      required this.salesOrganisation,
      required this.orderHistoryDetails,
      required this.isLoading,
      required final Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      required this.failureOrSuccessOption,
      required final Map<MaterialQueryInfo, PriceAggregate> materials,
      required this.isExpanded,
      required final List<ProductDetailAggregate> productDetailAggregateList,
      required this.shipToInfo,
      required this.isLoadingBundleDetail})
      : _isLoadingTenderContract = isLoadingTenderContract,
        _materials = materials,
        _productDetailAggregateList = productDetailAggregateList,
        super._();

  @override
  final User user;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final OrderHistoryDetails orderHistoryDetails;
  @override
  final bool isLoading;
  final Map<MaterialQueryInfo, bool> _isLoadingTenderContract;
  @override
  Map<MaterialQueryInfo, bool> get isLoadingTenderContract {
    if (_isLoadingTenderContract is EqualUnmodifiableMapView)
      return _isLoadingTenderContract;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isLoadingTenderContract);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final Map<MaterialQueryInfo, PriceAggregate> _materials;
  @override
  Map<MaterialQueryInfo, PriceAggregate> get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @override
  final bool isExpanded;
  final List<ProductDetailAggregate> _productDetailAggregateList;
  @override
  List<ProductDetailAggregate> get productDetailAggregateList {
    if (_productDetailAggregateList is EqualUnmodifiableListView)
      return _productDetailAggregateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productDetailAggregateList);
  }

  @override
  final ShipToInfo shipToInfo;
  @override
  final bool isLoadingBundleDetail;

  @override
  String toString() {
    return 'ViewByOrderDetailsState(user: $user, configs: $configs, customerCodeInfo: $customerCodeInfo, salesOrganisation: $salesOrganisation, orderHistoryDetails: $orderHistoryDetails, isLoading: $isLoading, isLoadingTenderContract: $isLoadingTenderContract, failureOrSuccessOption: $failureOrSuccessOption, materials: $materials, isExpanded: $isExpanded, productDetailAggregateList: $productDetailAggregateList, shipToInfo: $shipToInfo, isLoadingBundleDetail: $isLoadingBundleDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewByOrderDetailsState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.orderHistoryDetails, orderHistoryDetails) ||
                other.orderHistoryDetails == orderHistoryDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(
                other._isLoadingTenderContract, _isLoadingTenderContract) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            const DeepCollectionEquality().equals(
                other._productDetailAggregateList,
                _productDetailAggregateList) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.isLoadingBundleDetail, isLoadingBundleDetail) ||
                other.isLoadingBundleDetail == isLoadingBundleDetail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      configs,
      customerCodeInfo,
      salesOrganisation,
      orderHistoryDetails,
      isLoading,
      const DeepCollectionEquality().hash(_isLoadingTenderContract),
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_materials),
      isExpanded,
      const DeepCollectionEquality().hash(_productDetailAggregateList),
      shipToInfo,
      isLoadingBundleDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewByOrderDetailsStateCopyWith<_$_ViewByOrderDetailsState>
      get copyWith =>
          __$$_ViewByOrderDetailsStateCopyWithImpl<_$_ViewByOrderDetailsState>(
              this, _$identity);
}

abstract class _ViewByOrderDetailsState extends ViewByOrderDetailsState {
  const factory _ViewByOrderDetailsState(
      {required final User user,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganisation,
      required final OrderHistoryDetails orderHistoryDetails,
      required final bool isLoading,
      required final Map<MaterialQueryInfo, bool> isLoadingTenderContract,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final Map<MaterialQueryInfo, PriceAggregate> materials,
      required final bool isExpanded,
      required final List<ProductDetailAggregate> productDetailAggregateList,
      required final ShipToInfo shipToInfo,
      required final bool isLoadingBundleDetail}) = _$_ViewByOrderDetailsState;
  const _ViewByOrderDetailsState._() : super._();

  @override
  User get user;
  @override
  SalesOrganisationConfigs get configs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  OrderHistoryDetails get orderHistoryDetails;
  @override
  bool get isLoading;
  @override
  Map<MaterialQueryInfo, bool> get isLoadingTenderContract;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  Map<MaterialQueryInfo, PriceAggregate> get materials;
  @override
  bool get isExpanded;
  @override
  List<ProductDetailAggregate> get productDetailAggregateList;
  @override
  ShipToInfo get shipToInfo;
  @override
  bool get isLoadingBundleDetail;
  @override
  @JsonKey(ignore: true)
  _$$_ViewByOrderDetailsStateCopyWith<_$_ViewByOrderDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
