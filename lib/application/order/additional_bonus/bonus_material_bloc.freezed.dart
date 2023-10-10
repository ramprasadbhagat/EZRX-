// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bonus_material_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BonusMaterialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)
        loadMoreBonusItem,
    required TResult Function(MaterialInfo bonusMaterial) validateBonusQuantity,
    required TResult Function(MaterialInfo updatedBonusItem)
        updateBonusItemQuantity,
    required TResult Function(List<BonusSampleItem> addedBonusItemList)
        updateAddedBonusItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult? Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult? Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult? Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMoreBonusItem value) loadMoreBonusItem,
    required TResult Function(_ValidateBonusQuantity value)
        validateBonusQuantity,
    required TResult Function(_UpdateBonusItemQuantity value)
        updateBonusItemQuantity,
    required TResult Function(_UpdateAddedBonusItems value)
        updateAddedBonusItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult? Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult? Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult? Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusMaterialEventCopyWith<$Res> {
  factory $BonusMaterialEventCopyWith(
          BonusMaterialEvent value, $Res Function(BonusMaterialEvent) then) =
      _$BonusMaterialEventCopyWithImpl<$Res, BonusMaterialEvent>;
}

/// @nodoc
class _$BonusMaterialEventCopyWithImpl<$Res, $Val extends BonusMaterialEvent>
    implements $BonusMaterialEventCopyWith<$Res> {
  _$BonusMaterialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SearchKey searchKey,
      bool isGimmickMaterialEnabled,
      PrincipalData principalData});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $PrincipalDataCopyWith<$Res> get principalData;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$BonusMaterialEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? searchKey = null,
    Object? isGimmickMaterialEnabled = null,
    Object? principalData = null,
  }) {
    return _then(_$_Fetch(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      isGimmickMaterialEnabled: null == isGimmickMaterialEnabled
          ? _value.isGimmickMaterialEnabled
          : isGimmickMaterialEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
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
  $PrincipalDataCopyWith<$Res> get principalData {
    return $PrincipalDataCopyWith<$Res>(_value.principalData, (value) {
      return _then(_value.copyWith(principalData: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganisation,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.searchKey,
      required this.isGimmickMaterialEnabled,
      required this.principalData});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final SearchKey searchKey;
  @override
  final bool isGimmickMaterialEnabled;
  @override
  final PrincipalData principalData;

  @override
  String toString() {
    return 'BonusMaterialEvent.fetch(salesOrganisation: $salesOrganisation, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, searchKey: $searchKey, isGimmickMaterialEnabled: $isGimmickMaterialEnabled, principalData: $principalData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(
                    other.isGimmickMaterialEnabled, isGimmickMaterialEnabled) ||
                other.isGimmickMaterialEnabled == isGimmickMaterialEnabled) &&
            (identical(other.principalData, principalData) ||
                other.principalData == principalData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      configs,
      customerCodeInfo,
      shipToInfo,
      user,
      searchKey,
      isGimmickMaterialEnabled,
      principalData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)
        loadMoreBonusItem,
    required TResult Function(MaterialInfo bonusMaterial) validateBonusQuantity,
    required TResult Function(MaterialInfo updatedBonusItem)
        updateBonusItemQuantity,
    required TResult Function(List<BonusSampleItem> addedBonusItemList)
        updateAddedBonusItems,
  }) {
    return fetch(salesOrganisation, configs, customerCodeInfo, shipToInfo, user,
        searchKey, isGimmickMaterialEnabled, principalData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult? Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult? Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult? Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
  }) {
    return fetch?.call(salesOrganisation, configs, customerCodeInfo, shipToInfo,
        user, searchKey, isGimmickMaterialEnabled, principalData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, configs, customerCodeInfo, shipToInfo,
          user, searchKey, isGimmickMaterialEnabled, principalData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMoreBonusItem value) loadMoreBonusItem,
    required TResult Function(_ValidateBonusQuantity value)
        validateBonusQuantity,
    required TResult Function(_UpdateBonusItemQuantity value)
        updateBonusItemQuantity,
    required TResult Function(_UpdateAddedBonusItems value)
        updateAddedBonusItems,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult? Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult? Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult? Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements BonusMaterialEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final SearchKey searchKey,
      required final bool isGimmickMaterialEnabled,
      required final PrincipalData principalData}) = _$_Fetch;

  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  SearchKey get searchKey;
  bool get isGimmickMaterialEnabled;
  PrincipalData get principalData;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreBonusItemCopyWith<$Res> {
  factory _$$_LoadMoreBonusItemCopyWith(_$_LoadMoreBonusItem value,
          $Res Function(_$_LoadMoreBonusItem) then) =
      __$$_LoadMoreBonusItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      PrincipalData principalData,
      bool isGimmickMaterialEnabled});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $PrincipalDataCopyWith<$Res> get principalData;
}

/// @nodoc
class __$$_LoadMoreBonusItemCopyWithImpl<$Res>
    extends _$BonusMaterialEventCopyWithImpl<$Res, _$_LoadMoreBonusItem>
    implements _$$_LoadMoreBonusItemCopyWith<$Res> {
  __$$_LoadMoreBonusItemCopyWithImpl(
      _$_LoadMoreBonusItem _value, $Res Function(_$_LoadMoreBonusItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? principalData = null,
    Object? isGimmickMaterialEnabled = null,
  }) {
    return _then(_$_LoadMoreBonusItem(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      isGimmickMaterialEnabled: null == isGimmickMaterialEnabled
          ? _value.isGimmickMaterialEnabled
          : isGimmickMaterialEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
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
  $PrincipalDataCopyWith<$Res> get principalData {
    return $PrincipalDataCopyWith<$Res>(_value.principalData, (value) {
      return _then(_value.copyWith(principalData: value));
    });
  }
}

/// @nodoc

class _$_LoadMoreBonusItem implements _LoadMoreBonusItem {
  _$_LoadMoreBonusItem(
      {required this.salesOrganisation,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.principalData,
      required this.isGimmickMaterialEnabled});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final PrincipalData principalData;
  @override
  final bool isGimmickMaterialEnabled;

  @override
  String toString() {
    return 'BonusMaterialEvent.loadMoreBonusItem(salesOrganisation: $salesOrganisation, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, principalData: $principalData, isGimmickMaterialEnabled: $isGimmickMaterialEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadMoreBonusItem &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.principalData, principalData) ||
                other.principalData == principalData) &&
            (identical(
                    other.isGimmickMaterialEnabled, isGimmickMaterialEnabled) ||
                other.isGimmickMaterialEnabled == isGimmickMaterialEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      configs,
      customerCodeInfo,
      shipToInfo,
      user,
      principalData,
      isGimmickMaterialEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadMoreBonusItemCopyWith<_$_LoadMoreBonusItem> get copyWith =>
      __$$_LoadMoreBonusItemCopyWithImpl<_$_LoadMoreBonusItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)
        loadMoreBonusItem,
    required TResult Function(MaterialInfo bonusMaterial) validateBonusQuantity,
    required TResult Function(MaterialInfo updatedBonusItem)
        updateBonusItemQuantity,
    required TResult Function(List<BonusSampleItem> addedBonusItemList)
        updateAddedBonusItems,
  }) {
    return loadMoreBonusItem(salesOrganisation, configs, customerCodeInfo,
        shipToInfo, user, principalData, isGimmickMaterialEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult? Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult? Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult? Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
  }) {
    return loadMoreBonusItem?.call(salesOrganisation, configs, customerCodeInfo,
        shipToInfo, user, principalData, isGimmickMaterialEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (loadMoreBonusItem != null) {
      return loadMoreBonusItem(salesOrganisation, configs, customerCodeInfo,
          shipToInfo, user, principalData, isGimmickMaterialEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMoreBonusItem value) loadMoreBonusItem,
    required TResult Function(_ValidateBonusQuantity value)
        validateBonusQuantity,
    required TResult Function(_UpdateBonusItemQuantity value)
        updateBonusItemQuantity,
    required TResult Function(_UpdateAddedBonusItems value)
        updateAddedBonusItems,
  }) {
    return loadMoreBonusItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult? Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult? Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult? Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
  }) {
    return loadMoreBonusItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (loadMoreBonusItem != null) {
      return loadMoreBonusItem(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreBonusItem implements BonusMaterialEvent {
  factory _LoadMoreBonusItem(
      {required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final PrincipalData principalData,
      required final bool isGimmickMaterialEnabled}) = _$_LoadMoreBonusItem;

  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  PrincipalData get principalData;
  bool get isGimmickMaterialEnabled;
  @JsonKey(ignore: true)
  _$$_LoadMoreBonusItemCopyWith<_$_LoadMoreBonusItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ValidateBonusQuantityCopyWith<$Res> {
  factory _$$_ValidateBonusQuantityCopyWith(_$_ValidateBonusQuantity value,
          $Res Function(_$_ValidateBonusQuantity) then) =
      __$$_ValidateBonusQuantityCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo bonusMaterial});

  $MaterialInfoCopyWith<$Res> get bonusMaterial;
}

/// @nodoc
class __$$_ValidateBonusQuantityCopyWithImpl<$Res>
    extends _$BonusMaterialEventCopyWithImpl<$Res, _$_ValidateBonusQuantity>
    implements _$$_ValidateBonusQuantityCopyWith<$Res> {
  __$$_ValidateBonusQuantityCopyWithImpl(_$_ValidateBonusQuantity _value,
      $Res Function(_$_ValidateBonusQuantity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bonusMaterial = null,
  }) {
    return _then(_$_ValidateBonusQuantity(
      bonusMaterial: null == bonusMaterial
          ? _value.bonusMaterial
          : bonusMaterial // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get bonusMaterial {
    return $MaterialInfoCopyWith<$Res>(_value.bonusMaterial, (value) {
      return _then(_value.copyWith(bonusMaterial: value));
    });
  }
}

/// @nodoc

class _$_ValidateBonusQuantity implements _ValidateBonusQuantity {
  _$_ValidateBonusQuantity({required this.bonusMaterial});

  @override
  final MaterialInfo bonusMaterial;

  @override
  String toString() {
    return 'BonusMaterialEvent.validateBonusQuantity(bonusMaterial: $bonusMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidateBonusQuantity &&
            (identical(other.bonusMaterial, bonusMaterial) ||
                other.bonusMaterial == bonusMaterial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bonusMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidateBonusQuantityCopyWith<_$_ValidateBonusQuantity> get copyWith =>
      __$$_ValidateBonusQuantityCopyWithImpl<_$_ValidateBonusQuantity>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)
        loadMoreBonusItem,
    required TResult Function(MaterialInfo bonusMaterial) validateBonusQuantity,
    required TResult Function(MaterialInfo updatedBonusItem)
        updateBonusItemQuantity,
    required TResult Function(List<BonusSampleItem> addedBonusItemList)
        updateAddedBonusItems,
  }) {
    return validateBonusQuantity(bonusMaterial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult? Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult? Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult? Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
  }) {
    return validateBonusQuantity?.call(bonusMaterial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (validateBonusQuantity != null) {
      return validateBonusQuantity(bonusMaterial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMoreBonusItem value) loadMoreBonusItem,
    required TResult Function(_ValidateBonusQuantity value)
        validateBonusQuantity,
    required TResult Function(_UpdateBonusItemQuantity value)
        updateBonusItemQuantity,
    required TResult Function(_UpdateAddedBonusItems value)
        updateAddedBonusItems,
  }) {
    return validateBonusQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult? Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult? Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult? Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
  }) {
    return validateBonusQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (validateBonusQuantity != null) {
      return validateBonusQuantity(this);
    }
    return orElse();
  }
}

abstract class _ValidateBonusQuantity implements BonusMaterialEvent {
  factory _ValidateBonusQuantity({required final MaterialInfo bonusMaterial}) =
      _$_ValidateBonusQuantity;

  MaterialInfo get bonusMaterial;
  @JsonKey(ignore: true)
  _$$_ValidateBonusQuantityCopyWith<_$_ValidateBonusQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateBonusItemQuantityCopyWith<$Res> {
  factory _$$_UpdateBonusItemQuantityCopyWith(_$_UpdateBonusItemQuantity value,
          $Res Function(_$_UpdateBonusItemQuantity) then) =
      __$$_UpdateBonusItemQuantityCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo updatedBonusItem});

  $MaterialInfoCopyWith<$Res> get updatedBonusItem;
}

/// @nodoc
class __$$_UpdateBonusItemQuantityCopyWithImpl<$Res>
    extends _$BonusMaterialEventCopyWithImpl<$Res, _$_UpdateBonusItemQuantity>
    implements _$$_UpdateBonusItemQuantityCopyWith<$Res> {
  __$$_UpdateBonusItemQuantityCopyWithImpl(_$_UpdateBonusItemQuantity _value,
      $Res Function(_$_UpdateBonusItemQuantity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedBonusItem = null,
  }) {
    return _then(_$_UpdateBonusItemQuantity(
      updatedBonusItem: null == updatedBonusItem
          ? _value.updatedBonusItem
          : updatedBonusItem // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get updatedBonusItem {
    return $MaterialInfoCopyWith<$Res>(_value.updatedBonusItem, (value) {
      return _then(_value.copyWith(updatedBonusItem: value));
    });
  }
}

/// @nodoc

class _$_UpdateBonusItemQuantity implements _UpdateBonusItemQuantity {
  _$_UpdateBonusItemQuantity({required this.updatedBonusItem});

  @override
  final MaterialInfo updatedBonusItem;

  @override
  String toString() {
    return 'BonusMaterialEvent.updateBonusItemQuantity(updatedBonusItem: $updatedBonusItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateBonusItemQuantity &&
            (identical(other.updatedBonusItem, updatedBonusItem) ||
                other.updatedBonusItem == updatedBonusItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updatedBonusItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateBonusItemQuantityCopyWith<_$_UpdateBonusItemQuantity>
      get copyWith =>
          __$$_UpdateBonusItemQuantityCopyWithImpl<_$_UpdateBonusItemQuantity>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)
        loadMoreBonusItem,
    required TResult Function(MaterialInfo bonusMaterial) validateBonusQuantity,
    required TResult Function(MaterialInfo updatedBonusItem)
        updateBonusItemQuantity,
    required TResult Function(List<BonusSampleItem> addedBonusItemList)
        updateAddedBonusItems,
  }) {
    return updateBonusItemQuantity(updatedBonusItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult? Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult? Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult? Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
  }) {
    return updateBonusItemQuantity?.call(updatedBonusItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (updateBonusItemQuantity != null) {
      return updateBonusItemQuantity(updatedBonusItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMoreBonusItem value) loadMoreBonusItem,
    required TResult Function(_ValidateBonusQuantity value)
        validateBonusQuantity,
    required TResult Function(_UpdateBonusItemQuantity value)
        updateBonusItemQuantity,
    required TResult Function(_UpdateAddedBonusItems value)
        updateAddedBonusItems,
  }) {
    return updateBonusItemQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult? Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult? Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult? Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
  }) {
    return updateBonusItemQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (updateBonusItemQuantity != null) {
      return updateBonusItemQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateBonusItemQuantity implements BonusMaterialEvent {
  factory _UpdateBonusItemQuantity(
          {required final MaterialInfo updatedBonusItem}) =
      _$_UpdateBonusItemQuantity;

  MaterialInfo get updatedBonusItem;
  @JsonKey(ignore: true)
  _$$_UpdateBonusItemQuantityCopyWith<_$_UpdateBonusItemQuantity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateAddedBonusItemsCopyWith<$Res> {
  factory _$$_UpdateAddedBonusItemsCopyWith(_$_UpdateAddedBonusItems value,
          $Res Function(_$_UpdateAddedBonusItems) then) =
      __$$_UpdateAddedBonusItemsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BonusSampleItem> addedBonusItemList});
}

/// @nodoc
class __$$_UpdateAddedBonusItemsCopyWithImpl<$Res>
    extends _$BonusMaterialEventCopyWithImpl<$Res, _$_UpdateAddedBonusItems>
    implements _$$_UpdateAddedBonusItemsCopyWith<$Res> {
  __$$_UpdateAddedBonusItemsCopyWithImpl(_$_UpdateAddedBonusItems _value,
      $Res Function(_$_UpdateAddedBonusItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addedBonusItemList = null,
  }) {
    return _then(_$_UpdateAddedBonusItems(
      addedBonusItemList: null == addedBonusItemList
          ? _value._addedBonusItemList
          : addedBonusItemList // ignore: cast_nullable_to_non_nullable
              as List<BonusSampleItem>,
    ));
  }
}

/// @nodoc

class _$_UpdateAddedBonusItems implements _UpdateAddedBonusItems {
  _$_UpdateAddedBonusItems(
      {required final List<BonusSampleItem> addedBonusItemList})
      : _addedBonusItemList = addedBonusItemList;

  final List<BonusSampleItem> _addedBonusItemList;
  @override
  List<BonusSampleItem> get addedBonusItemList {
    if (_addedBonusItemList is EqualUnmodifiableListView)
      return _addedBonusItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addedBonusItemList);
  }

  @override
  String toString() {
    return 'BonusMaterialEvent.updateAddedBonusItems(addedBonusItemList: $addedBonusItemList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateAddedBonusItems &&
            const DeepCollectionEquality()
                .equals(other._addedBonusItemList, _addedBonusItemList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_addedBonusItemList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateAddedBonusItemsCopyWith<_$_UpdateAddedBonusItems> get copyWith =>
      __$$_UpdateAddedBonusItemsCopyWithImpl<_$_UpdateAddedBonusItems>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)
        fetch,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)
        loadMoreBonusItem,
    required TResult Function(MaterialInfo bonusMaterial) validateBonusQuantity,
    required TResult Function(MaterialInfo updatedBonusItem)
        updateBonusItemQuantity,
    required TResult Function(List<BonusSampleItem> addedBonusItemList)
        updateAddedBonusItems,
  }) {
    return updateAddedBonusItems(addedBonusItemList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult? Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult? Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult? Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
  }) {
    return updateAddedBonusItems?.call(addedBonusItemList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SearchKey searchKey,
            bool isGimmickMaterialEnabled,
            PrincipalData principalData)?
        fetch,
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            PrincipalData principalData,
            bool isGimmickMaterialEnabled)?
        loadMoreBonusItem,
    TResult Function(MaterialInfo bonusMaterial)? validateBonusQuantity,
    TResult Function(MaterialInfo updatedBonusItem)? updateBonusItemQuantity,
    TResult Function(List<BonusSampleItem> addedBonusItemList)?
        updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (updateAddedBonusItems != null) {
      return updateAddedBonusItems(addedBonusItemList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMoreBonusItem value) loadMoreBonusItem,
    required TResult Function(_ValidateBonusQuantity value)
        validateBonusQuantity,
    required TResult Function(_UpdateBonusItemQuantity value)
        updateBonusItemQuantity,
    required TResult Function(_UpdateAddedBonusItems value)
        updateAddedBonusItems,
  }) {
    return updateAddedBonusItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult? Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult? Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult? Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
  }) {
    return updateAddedBonusItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMoreBonusItem value)? loadMoreBonusItem,
    TResult Function(_ValidateBonusQuantity value)? validateBonusQuantity,
    TResult Function(_UpdateBonusItemQuantity value)? updateBonusItemQuantity,
    TResult Function(_UpdateAddedBonusItems value)? updateAddedBonusItems,
    required TResult orElse(),
  }) {
    if (updateAddedBonusItems != null) {
      return updateAddedBonusItems(this);
    }
    return orElse();
  }
}

abstract class _UpdateAddedBonusItems implements BonusMaterialEvent {
  factory _UpdateAddedBonusItems(
          {required final List<BonusSampleItem> addedBonusItemList}) =
      _$_UpdateAddedBonusItems;

  List<BonusSampleItem> get addedBonusItemList;
  @JsonKey(ignore: true)
  _$$_UpdateAddedBonusItemsCopyWith<_$_UpdateAddedBonusItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BonusMaterialState {
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<MaterialInfo> get bonusItemList => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isBonusQtyValidated => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  List<BonusSampleItem> get addedBonusItemsList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BonusMaterialStateCopyWith<BonusMaterialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusMaterialStateCopyWith<$Res> {
  factory $BonusMaterialStateCopyWith(
          BonusMaterialState value, $Res Function(BonusMaterialState) then) =
      _$BonusMaterialStateCopyWithImpl<$Res, BonusMaterialState>;
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<MaterialInfo> bonusItemList,
      bool canLoadMore,
      bool isBonusQtyValidated,
      SearchKey searchKey,
      List<BonusSampleItem> addedBonusItemsList});
}

/// @nodoc
class _$BonusMaterialStateCopyWithImpl<$Res, $Val extends BonusMaterialState>
    implements $BonusMaterialStateCopyWith<$Res> {
  _$BonusMaterialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? bonusItemList = null,
    Object? canLoadMore = null,
    Object? isBonusQtyValidated = null,
    Object? searchKey = null,
    Object? addedBonusItemsList = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      bonusItemList: null == bonusItemList
          ? _value.bonusItemList
          : bonusItemList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isBonusQtyValidated: null == isBonusQtyValidated
          ? _value.isBonusQtyValidated
          : isBonusQtyValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      addedBonusItemsList: null == addedBonusItemsList
          ? _value.addedBonusItemsList
          : addedBonusItemsList // ignore: cast_nullable_to_non_nullable
              as List<BonusSampleItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BonusMaterialStateCopyWith<$Res>
    implements $BonusMaterialStateCopyWith<$Res> {
  factory _$$_BonusMaterialStateCopyWith(_$_BonusMaterialState value,
          $Res Function(_$_BonusMaterialState) then) =
      __$$_BonusMaterialStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<MaterialInfo> bonusItemList,
      bool canLoadMore,
      bool isBonusQtyValidated,
      SearchKey searchKey,
      List<BonusSampleItem> addedBonusItemsList});
}

/// @nodoc
class __$$_BonusMaterialStateCopyWithImpl<$Res>
    extends _$BonusMaterialStateCopyWithImpl<$Res, _$_BonusMaterialState>
    implements _$$_BonusMaterialStateCopyWith<$Res> {
  __$$_BonusMaterialStateCopyWithImpl(
      _$_BonusMaterialState _value, $Res Function(_$_BonusMaterialState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? bonusItemList = null,
    Object? canLoadMore = null,
    Object? isBonusQtyValidated = null,
    Object? searchKey = null,
    Object? addedBonusItemsList = null,
  }) {
    return _then(_$_BonusMaterialState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      bonusItemList: null == bonusItemList
          ? _value._bonusItemList
          : bonusItemList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isBonusQtyValidated: null == isBonusQtyValidated
          ? _value.isBonusQtyValidated
          : isBonusQtyValidated // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      addedBonusItemsList: null == addedBonusItemsList
          ? _value._addedBonusItemsList
          : addedBonusItemsList // ignore: cast_nullable_to_non_nullable
              as List<BonusSampleItem>,
    ));
  }
}

/// @nodoc

class _$_BonusMaterialState extends _BonusMaterialState {
  const _$_BonusMaterialState(
      {required this.isFetching,
      required this.failureOrSuccessOption,
      required final List<MaterialInfo> bonusItemList,
      required this.canLoadMore,
      required this.isBonusQtyValidated,
      required this.searchKey,
      required final List<BonusSampleItem> addedBonusItemsList})
      : _bonusItemList = bonusItemList,
        _addedBonusItemsList = addedBonusItemsList,
        super._();

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<MaterialInfo> _bonusItemList;
  @override
  List<MaterialInfo> get bonusItemList {
    if (_bonusItemList is EqualUnmodifiableListView) return _bonusItemList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusItemList);
  }

  @override
  final bool canLoadMore;
  @override
  final bool isBonusQtyValidated;
  @override
  final SearchKey searchKey;
  final List<BonusSampleItem> _addedBonusItemsList;
  @override
  List<BonusSampleItem> get addedBonusItemsList {
    if (_addedBonusItemsList is EqualUnmodifiableListView)
      return _addedBonusItemsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addedBonusItemsList);
  }

  @override
  String toString() {
    return 'BonusMaterialState(isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption, bonusItemList: $bonusItemList, canLoadMore: $canLoadMore, isBonusQtyValidated: $isBonusQtyValidated, searchKey: $searchKey, addedBonusItemsList: $addedBonusItemsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BonusMaterialState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._bonusItemList, _bonusItemList) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isBonusQtyValidated, isBonusQtyValidated) ||
                other.isBonusQtyValidated == isBonusQtyValidated) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            const DeepCollectionEquality()
                .equals(other._addedBonusItemsList, _addedBonusItemsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_bonusItemList),
      canLoadMore,
      isBonusQtyValidated,
      searchKey,
      const DeepCollectionEquality().hash(_addedBonusItemsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BonusMaterialStateCopyWith<_$_BonusMaterialState> get copyWith =>
      __$$_BonusMaterialStateCopyWithImpl<_$_BonusMaterialState>(
          this, _$identity);
}

abstract class _BonusMaterialState extends BonusMaterialState {
  const factory _BonusMaterialState(
      {required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<MaterialInfo> bonusItemList,
      required final bool canLoadMore,
      required final bool isBonusQtyValidated,
      required final SearchKey searchKey,
      required final List<BonusSampleItem>
          addedBonusItemsList}) = _$_BonusMaterialState;
  const _BonusMaterialState._() : super._();

  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<MaterialInfo> get bonusItemList;
  @override
  bool get canLoadMore;
  @override
  bool get isBonusQtyValidated;
  @override
  SearchKey get searchKey;
  @override
  List<BonusSampleItem> get addedBonusItemsList;
  @override
  @JsonKey(ignore: true)
  _$$_BonusMaterialStateCopyWith<_$_BonusMaterialState> get copyWith =>
      throw _privateConstructorUsedError;
}
