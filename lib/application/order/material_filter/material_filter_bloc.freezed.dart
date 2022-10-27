// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)
        fetch,
    required TResult Function(
            MaterialFilterType filterType, String selectedFilter)
        updateMaterialSelected,
    required TResult Function(String searchkey) updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)?
        fetch,
    TResult Function(MaterialFilterType filterType, String selectedFilter)?
        updateMaterialSelected,
    TResult Function(String searchkey)? updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)?
        fetch,
    TResult Function(MaterialFilterType filterType, String selectedFilter)?
        updateMaterialSelected,
    TResult Function(String searchkey)? updateSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetch value) fetch,
    required TResult Function(_updateMaterialSelected value)
        updateMaterialSelected,
    required TResult Function(_updateSearchKey value) updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_fetch value)? fetch,
    TResult Function(_updateMaterialSelected value)? updateMaterialSelected,
    TResult Function(_updateSearchKey value)? updateSearchKey,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetch value)? fetch,
    TResult Function(_updateMaterialSelected value)? updateMaterialSelected,
    TResult Function(_updateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialFilterEventCopyWith<$Res> {
  factory $MaterialFilterEventCopyWith(
          MaterialFilterEvent value, $Res Function(MaterialFilterEvent) then) =
      _$MaterialFilterEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MaterialFilterEventCopyWithImpl<$Res>
    implements $MaterialFilterEventCopyWith<$Res> {
  _$MaterialFilterEventCopyWithImpl(this._value, this._then);

  final MaterialFilterEvent _value;
  // ignore: unused_field
  final $Res Function(MaterialFilterEvent) _then;
}

/// @nodoc
abstract class _$$_fetchCopyWith<$Res> {
  factory _$$_fetchCopyWith(_$_fetch value, $Res Function(_$_fetch) then) =
      __$$_fetchCopyWithImpl<$Res>;
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisationConfigs salesOrgConfig});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig;
}

/// @nodoc
class __$$_fetchCopyWithImpl<$Res>
    extends _$MaterialFilterEventCopyWithImpl<$Res>
    implements _$$_fetchCopyWith<$Res> {
  __$$_fetchCopyWithImpl(_$_fetch _value, $Res Function(_$_fetch) _then)
      : super(_value, (v) => _then(v as _$_fetch));

  @override
  _$_fetch get _value => super._value as _$_fetch;

  @override
  $Res call({
    Object? salesOrganisation = freezed,
    Object? customerCodeInfo = freezed,
    Object? shipToInfo = freezed,
    Object? user = freezed,
    Object? salesOrgConfig = freezed,
  }) {
    return _then(_$_fetch(
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: customerCodeInfo == freezed
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: shipToInfo == freezed
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrgConfig: salesOrgConfig == freezed
          ? _value.salesOrgConfig
          : salesOrgConfig // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
  }

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfig {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfig,
        (value) {
      return _then(_value.copyWith(salesOrgConfig: value));
    });
  }
}

/// @nodoc

class _$_fetch implements _fetch {
  const _$_fetch(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.salesOrgConfig});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final SalesOrganisationConfigs salesOrgConfig;

  @override
  String toString() {
    return 'MaterialFilterEvent.fetch(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, salesOrgConfig: $salesOrgConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_fetch &&
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation) &&
            const DeepCollectionEquality()
                .equals(other.customerCodeInfo, customerCodeInfo) &&
            const DeepCollectionEquality()
                .equals(other.shipToInfo, shipToInfo) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.salesOrgConfig, salesOrgConfig));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(salesOrganisation),
      const DeepCollectionEquality().hash(customerCodeInfo),
      const DeepCollectionEquality().hash(shipToInfo),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(salesOrgConfig));

  @JsonKey(ignore: true)
  @override
  _$$_fetchCopyWith<_$_fetch> get copyWith =>
      __$$_fetchCopyWithImpl<_$_fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)
        fetch,
    required TResult Function(
            MaterialFilterType filterType, String selectedFilter)
        updateMaterialSelected,
    required TResult Function(String searchkey) updateSearchKey,
  }) {
    return fetch(
        salesOrganisation, customerCodeInfo, shipToInfo, user, salesOrgConfig);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)?
        fetch,
    TResult Function(MaterialFilterType filterType, String selectedFilter)?
        updateMaterialSelected,
    TResult Function(String searchkey)? updateSearchKey,
  }) {
    return fetch?.call(
        salesOrganisation, customerCodeInfo, shipToInfo, user, salesOrgConfig);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)?
        fetch,
    TResult Function(MaterialFilterType filterType, String selectedFilter)?
        updateMaterialSelected,
    TResult Function(String searchkey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, customerCodeInfo, shipToInfo, user,
          salesOrgConfig);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetch value) fetch,
    required TResult Function(_updateMaterialSelected value)
        updateMaterialSelected,
    required TResult Function(_updateSearchKey value) updateSearchKey,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_fetch value)? fetch,
    TResult Function(_updateMaterialSelected value)? updateMaterialSelected,
    TResult Function(_updateSearchKey value)? updateSearchKey,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetch value)? fetch,
    TResult Function(_updateMaterialSelected value)? updateMaterialSelected,
    TResult Function(_updateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _fetch implements MaterialFilterEvent {
  const factory _fetch(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final SalesOrganisationConfigs salesOrgConfig}) = _$_fetch;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  SalesOrganisationConfigs get salesOrgConfig;
  @JsonKey(ignore: true)
  _$$_fetchCopyWith<_$_fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_updateMaterialSelectedCopyWith<$Res> {
  factory _$$_updateMaterialSelectedCopyWith(_$_updateMaterialSelected value,
          $Res Function(_$_updateMaterialSelected) then) =
      __$$_updateMaterialSelectedCopyWithImpl<$Res>;
  $Res call({MaterialFilterType filterType, String selectedFilter});
}

/// @nodoc
class __$$_updateMaterialSelectedCopyWithImpl<$Res>
    extends _$MaterialFilterEventCopyWithImpl<$Res>
    implements _$$_updateMaterialSelectedCopyWith<$Res> {
  __$$_updateMaterialSelectedCopyWithImpl(_$_updateMaterialSelected _value,
      $Res Function(_$_updateMaterialSelected) _then)
      : super(_value, (v) => _then(v as _$_updateMaterialSelected));

  @override
  _$_updateMaterialSelected get _value =>
      super._value as _$_updateMaterialSelected;

  @override
  $Res call({
    Object? filterType = freezed,
    Object? selectedFilter = freezed,
  }) {
    return _then(_$_updateMaterialSelected(
      filterType == freezed
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as MaterialFilterType,
      selectedFilter == freezed
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_updateMaterialSelected implements _updateMaterialSelected {
  const _$_updateMaterialSelected(this.filterType, this.selectedFilter);

  @override
  final MaterialFilterType filterType;
  @override
  final String selectedFilter;

  @override
  String toString() {
    return 'MaterialFilterEvent.updateMaterialSelected(filterType: $filterType, selectedFilter: $selectedFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateMaterialSelected &&
            const DeepCollectionEquality()
                .equals(other.filterType, filterType) &&
            const DeepCollectionEquality()
                .equals(other.selectedFilter, selectedFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(filterType),
      const DeepCollectionEquality().hash(selectedFilter));

  @JsonKey(ignore: true)
  @override
  _$$_updateMaterialSelectedCopyWith<_$_updateMaterialSelected> get copyWith =>
      __$$_updateMaterialSelectedCopyWithImpl<_$_updateMaterialSelected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)
        fetch,
    required TResult Function(
            MaterialFilterType filterType, String selectedFilter)
        updateMaterialSelected,
    required TResult Function(String searchkey) updateSearchKey,
  }) {
    return updateMaterialSelected(filterType, selectedFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)?
        fetch,
    TResult Function(MaterialFilterType filterType, String selectedFilter)?
        updateMaterialSelected,
    TResult Function(String searchkey)? updateSearchKey,
  }) {
    return updateMaterialSelected?.call(filterType, selectedFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)?
        fetch,
    TResult Function(MaterialFilterType filterType, String selectedFilter)?
        updateMaterialSelected,
    TResult Function(String searchkey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateMaterialSelected != null) {
      return updateMaterialSelected(filterType, selectedFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetch value) fetch,
    required TResult Function(_updateMaterialSelected value)
        updateMaterialSelected,
    required TResult Function(_updateSearchKey value) updateSearchKey,
  }) {
    return updateMaterialSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_fetch value)? fetch,
    TResult Function(_updateMaterialSelected value)? updateMaterialSelected,
    TResult Function(_updateSearchKey value)? updateSearchKey,
  }) {
    return updateMaterialSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetch value)? fetch,
    TResult Function(_updateMaterialSelected value)? updateMaterialSelected,
    TResult Function(_updateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateMaterialSelected != null) {
      return updateMaterialSelected(this);
    }
    return orElse();
  }
}

abstract class _updateMaterialSelected implements MaterialFilterEvent {
  const factory _updateMaterialSelected(
          final MaterialFilterType filterType, final String selectedFilter) =
      _$_updateMaterialSelected;

  MaterialFilterType get filterType;
  String get selectedFilter;
  @JsonKey(ignore: true)
  _$$_updateMaterialSelectedCopyWith<_$_updateMaterialSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_updateSearchKeyCopyWith<$Res> {
  factory _$$_updateSearchKeyCopyWith(
          _$_updateSearchKey value, $Res Function(_$_updateSearchKey) then) =
      __$$_updateSearchKeyCopyWithImpl<$Res>;
  $Res call({String searchkey});
}

/// @nodoc
class __$$_updateSearchKeyCopyWithImpl<$Res>
    extends _$MaterialFilterEventCopyWithImpl<$Res>
    implements _$$_updateSearchKeyCopyWith<$Res> {
  __$$_updateSearchKeyCopyWithImpl(
      _$_updateSearchKey _value, $Res Function(_$_updateSearchKey) _then)
      : super(_value, (v) => _then(v as _$_updateSearchKey));

  @override
  _$_updateSearchKey get _value => super._value as _$_updateSearchKey;

  @override
  $Res call({
    Object? searchkey = freezed,
  }) {
    return _then(_$_updateSearchKey(
      searchkey == freezed
          ? _value.searchkey
          : searchkey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_updateSearchKey implements _updateSearchKey {
  const _$_updateSearchKey(this.searchkey);

  @override
  final String searchkey;

  @override
  String toString() {
    return 'MaterialFilterEvent.updateSearchKey(searchkey: $searchkey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_updateSearchKey &&
            const DeepCollectionEquality().equals(other.searchkey, searchkey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(searchkey));

  @JsonKey(ignore: true)
  @override
  _$$_updateSearchKeyCopyWith<_$_updateSearchKey> get copyWith =>
      __$$_updateSearchKeyCopyWithImpl<_$_updateSearchKey>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)
        fetch,
    required TResult Function(
            MaterialFilterType filterType, String selectedFilter)
        updateMaterialSelected,
    required TResult Function(String searchkey) updateSearchKey,
  }) {
    return updateSearchKey(searchkey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)?
        fetch,
    TResult Function(MaterialFilterType filterType, String selectedFilter)?
        updateMaterialSelected,
    TResult Function(String searchkey)? updateSearchKey,
  }) {
    return updateSearchKey?.call(searchkey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesOrgConfig)?
        fetch,
    TResult Function(MaterialFilterType filterType, String selectedFilter)?
        updateMaterialSelected,
    TResult Function(String searchkey)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(searchkey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_fetch value) fetch,
    required TResult Function(_updateMaterialSelected value)
        updateMaterialSelected,
    required TResult Function(_updateSearchKey value) updateSearchKey,
  }) {
    return updateSearchKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_fetch value)? fetch,
    TResult Function(_updateMaterialSelected value)? updateMaterialSelected,
    TResult Function(_updateSearchKey value)? updateSearchKey,
  }) {
    return updateSearchKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_fetch value)? fetch,
    TResult Function(_updateMaterialSelected value)? updateMaterialSelected,
    TResult Function(_updateSearchKey value)? updateSearchKey,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(this);
    }
    return orElse();
  }
}

abstract class _updateSearchKey implements MaterialFilterEvent {
  const factory _updateSearchKey(final String searchkey) = _$_updateSearchKey;

  String get searchkey;
  @JsonKey(ignore: true)
  _$$_updateSearchKeyCopyWith<_$_updateSearchKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialFilterState {
  MaterialFilter get materialFilter => throw _privateConstructorUsedError;
  MaterialFilter get selectedMaterialFilter =>
      throw _privateConstructorUsedError;
  String get searchKey => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialFilterStateCopyWith<MaterialFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialFilterStateCopyWith<$Res> {
  factory $MaterialFilterStateCopyWith(
          MaterialFilterState value, $Res Function(MaterialFilterState) then) =
      _$MaterialFilterStateCopyWithImpl<$Res>;
  $Res call(
      {MaterialFilter materialFilter,
      MaterialFilter selectedMaterialFilter,
      String searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $MaterialFilterCopyWith<$Res> get materialFilter;
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class _$MaterialFilterStateCopyWithImpl<$Res>
    implements $MaterialFilterStateCopyWith<$Res> {
  _$MaterialFilterStateCopyWithImpl(this._value, this._then);

  final MaterialFilterState _value;
  // ignore: unused_field
  final $Res Function(MaterialFilterState) _then;

  @override
  $Res call({
    Object? materialFilter = freezed,
    Object? selectedMaterialFilter = freezed,
    Object? searchKey = freezed,
    Object? apiFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      materialFilter: materialFilter == freezed
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
      selectedMaterialFilter: selectedMaterialFilter == freezed
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
      searchKey: searchKey == freezed
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }

  @override
  $MaterialFilterCopyWith<$Res> get materialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.materialFilter, (value) {
      return _then(_value.copyWith(materialFilter: value));
    });
  }

  @override
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.selectedMaterialFilter,
        (value) {
      return _then(_value.copyWith(selectedMaterialFilter: value));
    });
  }
}

/// @nodoc
abstract class _$$_MaterialFilterStateCopyWith<$Res>
    implements $MaterialFilterStateCopyWith<$Res> {
  factory _$$_MaterialFilterStateCopyWith(_$_MaterialFilterState value,
          $Res Function(_$_MaterialFilterState) then) =
      __$$_MaterialFilterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {MaterialFilter materialFilter,
      MaterialFilter selectedMaterialFilter,
      String searchKey,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $MaterialFilterCopyWith<$Res> get materialFilter;
  @override
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class __$$_MaterialFilterStateCopyWithImpl<$Res>
    extends _$MaterialFilterStateCopyWithImpl<$Res>
    implements _$$_MaterialFilterStateCopyWith<$Res> {
  __$$_MaterialFilterStateCopyWithImpl(_$_MaterialFilterState _value,
      $Res Function(_$_MaterialFilterState) _then)
      : super(_value, (v) => _then(v as _$_MaterialFilterState));

  @override
  _$_MaterialFilterState get _value => super._value as _$_MaterialFilterState;

  @override
  $Res call({
    Object? materialFilter = freezed,
    Object? selectedMaterialFilter = freezed,
    Object? searchKey = freezed,
    Object? apiFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_MaterialFilterState(
      materialFilter: materialFilter == freezed
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
      selectedMaterialFilter: selectedMaterialFilter == freezed
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
      searchKey: searchKey == freezed
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_MaterialFilterState extends _MaterialFilterState {
  const _$_MaterialFilterState(
      {required this.materialFilter,
      required this.selectedMaterialFilter,
      required this.searchKey,
      required this.apiFailureOrSuccessOption})
      : super._();

  @override
  final MaterialFilter materialFilter;
  @override
  final MaterialFilter selectedMaterialFilter;
  @override
  final String searchKey;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'MaterialFilterState(materialFilter: $materialFilter, selectedMaterialFilter: $selectedMaterialFilter, searchKey: $searchKey, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialFilterState &&
            const DeepCollectionEquality()
                .equals(other.materialFilter, materialFilter) &&
            const DeepCollectionEquality()
                .equals(other.selectedMaterialFilter, selectedMaterialFilter) &&
            const DeepCollectionEquality().equals(other.searchKey, searchKey) &&
            const DeepCollectionEquality().equals(
                other.apiFailureOrSuccessOption, apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialFilter),
      const DeepCollectionEquality().hash(selectedMaterialFilter),
      const DeepCollectionEquality().hash(searchKey),
      const DeepCollectionEquality().hash(apiFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_MaterialFilterStateCopyWith<_$_MaterialFilterState> get copyWith =>
      __$$_MaterialFilterStateCopyWithImpl<_$_MaterialFilterState>(
          this, _$identity);
}

abstract class _MaterialFilterState extends MaterialFilterState {
  const factory _MaterialFilterState(
      {required final MaterialFilter materialFilter,
      required final MaterialFilter selectedMaterialFilter,
      required final String searchKey,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$_MaterialFilterState;
  const _MaterialFilterState._() : super._();

  @override
  MaterialFilter get materialFilter;
  @override
  MaterialFilter get selectedMaterialFilter;
  @override
  String get searchKey;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialFilterStateCopyWith<_$_MaterialFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
