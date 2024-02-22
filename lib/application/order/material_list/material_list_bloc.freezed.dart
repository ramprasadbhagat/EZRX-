// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialListEventCopyWith<$Res> {
  factory $MaterialListEventCopyWith(
          MaterialListEvent value, $Res Function(MaterialListEvent) then) =
      _$MaterialListEventCopyWithImpl<$Res, MaterialListEvent>;
}

/// @nodoc
class _$MaterialListEventCopyWithImpl<$Res, $Val extends MaterialListEvent>
    implements $MaterialListEventCopyWith<$Res> {
  _$MaterialListEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      MaterialFilter selectedMaterialFilter});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? selectedMaterialFilter = null,
  }) {
    return _then(_$_Initialized(
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
      selectedMaterialFilter: null == selectedMaterialFilter
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
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
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.selectedMaterialFilter,
        (value) {
      return _then(_value.copyWith(selectedMaterialFilter: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.salesOrganisation,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.selectedMaterialFilter});

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
  final MaterialFilter selectedMaterialFilter;

  @override
  String toString() {
    return 'MaterialListEvent.initialized(salesOrganisation: $salesOrganisation, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, selectedMaterialFilter: $selectedMaterialFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.selectedMaterialFilter, selectedMaterialFilter) ||
                other.selectedMaterialFilter == selectedMaterialFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation, configs,
      customerCodeInfo, shipToInfo, user, selectedMaterialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return initialized(salesOrganisation, configs, customerCodeInfo, shipToInfo,
        user, selectedMaterialFilter);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return initialized?.call(salesOrganisation, configs, customerCodeInfo,
        shipToInfo, user, selectedMaterialFilter);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation, configs, customerCodeInfo,
          shipToInfo, user, selectedMaterialFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements MaterialListEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final MaterialFilter selectedMaterialFilter}) = _$_Initialized;

  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  MaterialFilter get selectedMaterialFilter;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_WatchFavoriteStatusCopyWith<$Res> {
  factory _$$_WatchFavoriteStatusCopyWith(_$_WatchFavoriteStatus value,
          $Res Function(_$_WatchFavoriteStatus) then) =
      __$$_WatchFavoriteStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WatchFavoriteStatusCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$_WatchFavoriteStatus>
    implements _$$_WatchFavoriteStatusCopyWith<$Res> {
  __$$_WatchFavoriteStatusCopyWithImpl(_$_WatchFavoriteStatus _value,
      $Res Function(_$_WatchFavoriteStatus) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_WatchFavoriteStatus implements _WatchFavoriteStatus {
  const _$_WatchFavoriteStatus();

  @override
  String toString() {
    return 'MaterialListEvent.watchFavoriteStatus()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_WatchFavoriteStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return watchFavoriteStatus();
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return watchFavoriteStatus?.call();
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (watchFavoriteStatus != null) {
      return watchFavoriteStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return watchFavoriteStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return watchFavoriteStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (watchFavoriteStatus != null) {
      return watchFavoriteStatus(this);
    }
    return orElse();
  }
}

abstract class _WatchFavoriteStatus implements MaterialListEvent {
  const factory _WatchFavoriteStatus() = _$_WatchFavoriteStatus;
}

/// @nodoc
abstract class _$$_UpdateFavoriteStatusCopyWith<$Res> {
  factory _$$_UpdateFavoriteStatusCopyWith(_$_UpdateFavoriteStatus value,
          $Res Function(_$_UpdateFavoriteStatus) then) =
      __$$_UpdateFavoriteStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo updatedMaterial});

  $MaterialInfoCopyWith<$Res> get updatedMaterial;
}

/// @nodoc
class __$$_UpdateFavoriteStatusCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$_UpdateFavoriteStatus>
    implements _$$_UpdateFavoriteStatusCopyWith<$Res> {
  __$$_UpdateFavoriteStatusCopyWithImpl(_$_UpdateFavoriteStatus _value,
      $Res Function(_$_UpdateFavoriteStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedMaterial = null,
  }) {
    return _then(_$_UpdateFavoriteStatus(
      updatedMaterial: null == updatedMaterial
          ? _value.updatedMaterial
          : updatedMaterial // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get updatedMaterial {
    return $MaterialInfoCopyWith<$Res>(_value.updatedMaterial, (value) {
      return _then(_value.copyWith(updatedMaterial: value));
    });
  }
}

/// @nodoc

class _$_UpdateFavoriteStatus implements _UpdateFavoriteStatus {
  const _$_UpdateFavoriteStatus({required this.updatedMaterial});

  @override
  final MaterialInfo updatedMaterial;

  @override
  String toString() {
    return 'MaterialListEvent.updateFavoriteStatus(updatedMaterial: $updatedMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateFavoriteStatus &&
            (identical(other.updatedMaterial, updatedMaterial) ||
                other.updatedMaterial == updatedMaterial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updatedMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateFavoriteStatusCopyWith<_$_UpdateFavoriteStatus> get copyWith =>
      __$$_UpdateFavoriteStatusCopyWithImpl<_$_UpdateFavoriteStatus>(
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
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return updateFavoriteStatus(updatedMaterial);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return updateFavoriteStatus?.call(updatedMaterial);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (updateFavoriteStatus != null) {
      return updateFavoriteStatus(updatedMaterial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return updateFavoriteStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return updateFavoriteStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (updateFavoriteStatus != null) {
      return updateFavoriteStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateFavoriteStatus implements MaterialListEvent {
  const factory _UpdateFavoriteStatus(
      {required final MaterialInfo updatedMaterial}) = _$_UpdateFavoriteStatus;

  MaterialInfo get updatedMaterial;
  @JsonKey(ignore: true)
  _$$_UpdateFavoriteStatusCopyWith<_$_UpdateFavoriteStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialFilter selectedMaterialFilter});

  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMaterialFilter = null,
  }) {
    return _then(_$_Fetch(
      selectedMaterialFilter: null == selectedMaterialFilter
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.selectedMaterialFilter,
        (value) {
      return _then(_value.copyWith(selectedMaterialFilter: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  _$_Fetch({required this.selectedMaterialFilter});

  @override
  final MaterialFilter selectedMaterialFilter;

  @override
  String toString() {
    return 'MaterialListEvent.fetch(selectedMaterialFilter: $selectedMaterialFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.selectedMaterialFilter, selectedMaterialFilter) ||
                other.selectedMaterialFilter == selectedMaterialFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMaterialFilter);

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
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return fetch(selectedMaterialFilter);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return fetch?.call(selectedMaterialFilter);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(selectedMaterialFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements MaterialListEvent {
  factory _Fetch({required final MaterialFilter selectedMaterialFilter}) =
      _$_Fetch;

  MaterialFilter get selectedMaterialFilter;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchStockCopyWith<$Res> {
  factory _$$_FetchStockCopyWith(
          _$_FetchStock value, $Res Function(_$_FetchStock) then) =
      __$$_FetchStockCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialInfo> materials});
}

/// @nodoc
class __$$_FetchStockCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$_FetchStock>
    implements _$$_FetchStockCopyWith<$Res> {
  __$$_FetchStockCopyWithImpl(
      _$_FetchStock _value, $Res Function(_$_FetchStock) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
  }) {
    return _then(_$_FetchStock(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ));
  }
}

/// @nodoc

class _$_FetchStock implements _FetchStock {
  _$_FetchStock({required final List<MaterialInfo> materials})
      : _materials = materials;

  final List<MaterialInfo> _materials;
  @override
  List<MaterialInfo> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'MaterialListEvent.fetchStock(materials: $materials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchStock &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchStockCopyWith<_$_FetchStock> get copyWith =>
      __$$_FetchStockCopyWithImpl<_$_FetchStock>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return fetchStock(materials);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return fetchStock?.call(materials);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchStock != null) {
      return fetchStock(materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return fetchStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return fetchStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchStock != null) {
      return fetchStock(this);
    }
    return orElse();
  }
}

abstract class _FetchStock implements MaterialListEvent {
  factory _FetchStock({required final List<MaterialInfo> materials}) =
      _$_FetchStock;

  List<MaterialInfo> get materials;
  @JsonKey(ignore: true)
  _$$_FetchStockCopyWith<_$_FetchStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateSearchKeyCopyWith<$Res> {
  factory _$$_UpdateSearchKeyCopyWith(
          _$_UpdateSearchKey value, $Res Function(_$_UpdateSearchKey) then) =
      __$$_UpdateSearchKeyCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchKey});
}

/// @nodoc
class __$$_UpdateSearchKeyCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$_UpdateSearchKey>
    implements _$$_UpdateSearchKeyCopyWith<$Res> {
  __$$_UpdateSearchKeyCopyWithImpl(
      _$_UpdateSearchKey _value, $Res Function(_$_UpdateSearchKey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_UpdateSearchKey(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateSearchKey implements _UpdateSearchKey {
  const _$_UpdateSearchKey({required this.searchKey});

  @override
  final String searchKey;

  @override
  String toString() {
    return 'MaterialListEvent.updateSearchKey(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateSearchKey &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateSearchKeyCopyWith<_$_UpdateSearchKey> get copyWith =>
      __$$_UpdateSearchKeyCopyWithImpl<_$_UpdateSearchKey>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return updateSearchKey(searchKey);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return updateSearchKey?.call(searchKey);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return updateSearchKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return updateSearchKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(this);
    }
    return orElse();
  }
}

abstract class _UpdateSearchKey implements MaterialListEvent {
  const factory _UpdateSearchKey({required final String searchKey}) =
      _$_UpdateSearchKey;

  String get searchKey;
  @JsonKey(ignore: true)
  _$$_UpdateSearchKeyCopyWith<_$_UpdateSearchKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore();

  @override
  String toString() {
    return 'MaterialListEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return loadMore();
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return loadMore?.call();
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements MaterialListEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
abstract class _$$_AddFavouriteCopyWith<$Res> {
  factory _$$_AddFavouriteCopyWith(
          _$_AddFavourite value, $Res Function(_$_AddFavourite) then) =
      __$$_AddFavouriteCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo item});

  $MaterialInfoCopyWith<$Res> get item;
}

/// @nodoc
class __$$_AddFavouriteCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$_AddFavourite>
    implements _$$_AddFavouriteCopyWith<$Res> {
  __$$_AddFavouriteCopyWithImpl(
      _$_AddFavourite _value, $Res Function(_$_AddFavourite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_AddFavourite(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get item {
    return $MaterialInfoCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_AddFavourite implements _AddFavourite {
  _$_AddFavourite({required this.item});

  @override
  final MaterialInfo item;

  @override
  String toString() {
    return 'MaterialListEvent.addFavourite(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddFavourite &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFavouriteCopyWith<_$_AddFavourite> get copyWith =>
      __$$_AddFavouriteCopyWithImpl<_$_AddFavourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return addFavourite(item);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return addFavourite?.call(item);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return addFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return addFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(this);
    }
    return orElse();
  }
}

abstract class _AddFavourite implements MaterialListEvent {
  factory _AddFavourite({required final MaterialInfo item}) = _$_AddFavourite;

  MaterialInfo get item;
  @JsonKey(ignore: true)
  _$$_AddFavouriteCopyWith<_$_AddFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteFavouriteCopyWith<$Res> {
  factory _$$_DeleteFavouriteCopyWith(
          _$_DeleteFavourite value, $Res Function(_$_DeleteFavourite) then) =
      __$$_DeleteFavouriteCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo item});

  $MaterialInfoCopyWith<$Res> get item;
}

/// @nodoc
class __$$_DeleteFavouriteCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$_DeleteFavourite>
    implements _$$_DeleteFavouriteCopyWith<$Res> {
  __$$_DeleteFavouriteCopyWithImpl(
      _$_DeleteFavourite _value, $Res Function(_$_DeleteFavourite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_DeleteFavourite(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get item {
    return $MaterialInfoCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_DeleteFavourite implements _DeleteFavourite {
  _$_DeleteFavourite({required this.item});

  @override
  final MaterialInfo item;

  @override
  String toString() {
    return 'MaterialListEvent.deleteFavourite(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteFavourite &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteFavouriteCopyWith<_$_DeleteFavourite> get copyWith =>
      __$$_DeleteFavouriteCopyWithImpl<_$_DeleteFavourite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return deleteFavourite(item);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return deleteFavourite?.call(item);
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
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return deleteFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return deleteFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(this);
    }
    return orElse();
  }
}

abstract class _DeleteFavourite implements MaterialListEvent {
  factory _DeleteFavourite({required final MaterialInfo item}) =
      _$_DeleteFavourite;

  MaterialInfo get item;
  @JsonKey(ignore: true)
  _$$_DeleteFavouriteCopyWith<_$_DeleteFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialListState {
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get configs => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  int get materialCount => throw _privateConstructorUsedError;
  List<MaterialInfo> get materialList => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get isScanFromBarcode => throw _privateConstructorUsedError;
  int get nextPageIndex => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  MaterialFilter get selectedMaterialFilter =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialListStateCopyWith<MaterialListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialListStateCopyWith<$Res> {
  factory $MaterialListStateCopyWith(
          MaterialListState value, $Res Function(MaterialListState) then) =
      _$MaterialListStateCopyWithImpl<$Res, MaterialListState>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      int materialCount,
      List<MaterialInfo> materialList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool canLoadMore,
      bool isFetching,
      bool isScanFromBarcode,
      int nextPageIndex,
      SearchKey searchKey,
      MaterialFilter selectedMaterialFilter});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class _$MaterialListStateCopyWithImpl<$Res, $Val extends MaterialListState>
    implements $MaterialListStateCopyWith<$Res> {
  _$MaterialListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? materialCount = null,
    Object? materialList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? isScanFromBarcode = null,
    Object? nextPageIndex = null,
    Object? searchKey = null,
    Object? selectedMaterialFilter = null,
  }) {
    return _then(_value.copyWith(
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
      materialCount: null == materialCount
          ? _value.materialCount
          : materialCount // ignore: cast_nullable_to_non_nullable
              as int,
      materialList: null == materialList
          ? _value.materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isScanFromBarcode: null == isScanFromBarcode
          ? _value.isScanFromBarcode
          : isScanFromBarcode // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      selectedMaterialFilter: null == selectedMaterialFilter
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ) as $Val);
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
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
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.selectedMaterialFilter,
        (value) {
      return _then(_value.copyWith(selectedMaterialFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MaterialListStateCopyWith<$Res>
    implements $MaterialListStateCopyWith<$Res> {
  factory _$$_MaterialListStateCopyWith(_$_MaterialListState value,
          $Res Function(_$_MaterialListState) then) =
      __$$_MaterialListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      int materialCount,
      List<MaterialInfo> materialList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool canLoadMore,
      bool isFetching,
      bool isScanFromBarcode,
      int nextPageIndex,
      SearchKey searchKey,
      MaterialFilter selectedMaterialFilter});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class __$$_MaterialListStateCopyWithImpl<$Res>
    extends _$MaterialListStateCopyWithImpl<$Res, _$_MaterialListState>
    implements _$$_MaterialListStateCopyWith<$Res> {
  __$$_MaterialListStateCopyWithImpl(
      _$_MaterialListState _value, $Res Function(_$_MaterialListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? materialCount = null,
    Object? materialList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? isScanFromBarcode = null,
    Object? nextPageIndex = null,
    Object? searchKey = null,
    Object? selectedMaterialFilter = null,
  }) {
    return _then(_$_MaterialListState(
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
      materialCount: null == materialCount
          ? _value.materialCount
          : materialCount // ignore: cast_nullable_to_non_nullable
              as int,
      materialList: null == materialList
          ? _value._materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isScanFromBarcode: null == isScanFromBarcode
          ? _value.isScanFromBarcode
          : isScanFromBarcode // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      selectedMaterialFilter: null == selectedMaterialFilter
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ));
  }
}

/// @nodoc

class _$_MaterialListState extends _MaterialListState {
  const _$_MaterialListState(
      {required this.salesOrganisation,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.materialCount,
      required final List<MaterialInfo> materialList,
      required this.apiFailureOrSuccessOption,
      required this.canLoadMore,
      required this.isFetching,
      required this.isScanFromBarcode,
      required this.nextPageIndex,
      required this.searchKey,
      required this.selectedMaterialFilter})
      : _materialList = materialList,
        super._();

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
  final int materialCount;
  final List<MaterialInfo> _materialList;
  @override
  List<MaterialInfo> get materialList {
    if (_materialList is EqualUnmodifiableListView) return _materialList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool canLoadMore;
  @override
  final bool isFetching;
  @override
  final bool isScanFromBarcode;
  @override
  final int nextPageIndex;
  @override
  final SearchKey searchKey;
  @override
  final MaterialFilter selectedMaterialFilter;

  @override
  String toString() {
    return 'MaterialListState(salesOrganisation: $salesOrganisation, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, materialCount: $materialCount, materialList: $materialList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, canLoadMore: $canLoadMore, isFetching: $isFetching, isScanFromBarcode: $isScanFromBarcode, nextPageIndex: $nextPageIndex, searchKey: $searchKey, selectedMaterialFilter: $selectedMaterialFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialListState &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.materialCount, materialCount) ||
                other.materialCount == materialCount) &&
            const DeepCollectionEquality()
                .equals(other._materialList, _materialList) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.isScanFromBarcode, isScanFromBarcode) ||
                other.isScanFromBarcode == isScanFromBarcode) &&
            (identical(other.nextPageIndex, nextPageIndex) ||
                other.nextPageIndex == nextPageIndex) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.selectedMaterialFilter, selectedMaterialFilter) ||
                other.selectedMaterialFilter == selectedMaterialFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      configs,
      customerCodeInfo,
      shipToInfo,
      user,
      materialCount,
      const DeepCollectionEquality().hash(_materialList),
      apiFailureOrSuccessOption,
      canLoadMore,
      isFetching,
      isScanFromBarcode,
      nextPageIndex,
      searchKey,
      selectedMaterialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialListStateCopyWith<_$_MaterialListState> get copyWith =>
      __$$_MaterialListStateCopyWithImpl<_$_MaterialListState>(
          this, _$identity);
}

abstract class _MaterialListState extends MaterialListState {
  const factory _MaterialListState(
          {required final SalesOrganisation salesOrganisation,
          required final SalesOrganisationConfigs configs,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipToInfo,
          required final User user,
          required final int materialCount,
          required final List<MaterialInfo> materialList,
          required final Option<Either<ApiFailure, dynamic>>
              apiFailureOrSuccessOption,
          required final bool canLoadMore,
          required final bool isFetching,
          required final bool isScanFromBarcode,
          required final int nextPageIndex,
          required final SearchKey searchKey,
          required final MaterialFilter selectedMaterialFilter}) =
      _$_MaterialListState;
  const _MaterialListState._() : super._();

  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get configs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  User get user;
  @override
  int get materialCount;
  @override
  List<MaterialInfo> get materialList;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get canLoadMore;
  @override
  bool get isFetching;
  @override
  bool get isScanFromBarcode;
  @override
  int get nextPageIndex;
  @override
  SearchKey get searchKey;
  @override
  MaterialFilter get selectedMaterialFilter;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialListStateCopyWith<_$_MaterialListState> get copyWith =>
      throw _privateConstructorUsedError;
}
