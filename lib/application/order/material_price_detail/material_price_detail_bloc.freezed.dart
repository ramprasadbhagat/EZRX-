// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_price_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialPriceDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)
        initialized,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        refresh,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        fetch,
    required TResult Function(List<MaterialNumber> materialInfoList)
        comboDealFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult? Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ComboDealFetch value) comboDealFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ComboDealFetch value)? comboDealFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_ComboDealFetch value)? comboDealFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceDetailEventCopyWith<$Res> {
  factory $MaterialPriceDetailEventCopyWith(MaterialPriceDetailEvent value,
          $Res Function(MaterialPriceDetailEvent) then) =
      _$MaterialPriceDetailEventCopyWithImpl<$Res, MaterialPriceDetailEvent>;
}

/// @nodoc
class _$MaterialPriceDetailEventCopyWithImpl<$Res,
        $Val extends MaterialPriceDetailEvent>
    implements $MaterialPriceDetailEventCopyWith<$Res> {
  _$MaterialPriceDetailEventCopyWithImpl(this._value, this._then);

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
      CustomerCodeInfo customerCode,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrganisationConfigs,
      ShipToInfo shipToCode});

  $UserCopyWith<$Res> get user;
  $CustomerCodeInfoCopyWith<$Res> get customerCode;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $ShipToInfoCopyWith<$Res> get shipToCode;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$MaterialPriceDetailEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? customerCode = null,
    Object? salesOrganisation = null,
    Object? salesOrganisationConfigs = null,
    Object? shipToCode = null,
  }) {
    return _then(_$_Initialized(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToCode: null == shipToCode
          ? _value.shipToCode
          : shipToCode // ignore: cast_nullable_to_non_nullable
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
  $CustomerCodeInfoCopyWith<$Res> get customerCode {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCode, (value) {
      return _then(_value.copyWith(customerCode: value));
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToCode {
    return $ShipToInfoCopyWith<$Res>(_value.shipToCode, (value) {
      return _then(_value.copyWith(shipToCode: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.user,
      required this.customerCode,
      required this.salesOrganisation,
      required this.salesOrganisationConfigs,
      required this.shipToCode});

  @override
  final User user;
  @override
  final CustomerCodeInfo customerCode;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final ShipToInfo shipToCode;

  @override
  String toString() {
    return 'MaterialPriceDetailEvent.initialized(user: $user, customerCode: $customerCode, salesOrganisation: $salesOrganisation, salesOrganisationConfigs: $salesOrganisationConfigs, shipToCode: $shipToCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.shipToCode, shipToCode) ||
                other.shipToCode == shipToCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, customerCode,
      salesOrganisation, salesOrganisationConfigs, shipToCode);

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
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)
        initialized,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        refresh,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        fetch,
    required TResult Function(List<MaterialNumber> materialInfoList)
        comboDealFetch,
  }) {
    return initialized(user, customerCode, salesOrganisation,
        salesOrganisationConfigs, shipToCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult? Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
  }) {
    return initialized?.call(user, customerCode, salesOrganisation,
        salesOrganisationConfigs, shipToCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(user, customerCode, salesOrganisation,
          salesOrganisationConfigs, shipToCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ComboDealFetch value) comboDealFetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ComboDealFetch value)? comboDealFetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_ComboDealFetch value)? comboDealFetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements MaterialPriceDetailEvent {
  const factory _Initialized(
      {required final User user,
      required final CustomerCodeInfo customerCode,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final ShipToInfo shipToCode}) = _$_Initialized;

  User get user;
  CustomerCodeInfo get customerCode;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  ShipToInfo get shipToCode;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshCopyWith<$Res> {
  factory _$$_RefreshCopyWith(
          _$_Refresh value, $Res Function(_$_Refresh) then) =
      __$$_RefreshCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<MaterialQueryInfo> materialInfoList,
      String pickAndPack,
      bool skipFOCCheck});
}

/// @nodoc
class __$$_RefreshCopyWithImpl<$Res>
    extends _$MaterialPriceDetailEventCopyWithImpl<$Res, _$_Refresh>
    implements _$$_RefreshCopyWith<$Res> {
  __$$_RefreshCopyWithImpl(_$_Refresh _value, $Res Function(_$_Refresh) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialInfoList = null,
    Object? pickAndPack = null,
    Object? skipFOCCheck = null,
  }) {
    return _then(_$_Refresh(
      materialInfoList: null == materialInfoList
          ? _value._materialInfoList
          : materialInfoList // ignore: cast_nullable_to_non_nullable
              as List<MaterialQueryInfo>,
      pickAndPack: null == pickAndPack
          ? _value.pickAndPack
          : pickAndPack // ignore: cast_nullable_to_non_nullable
              as String,
      skipFOCCheck: null == skipFOCCheck
          ? _value.skipFOCCheck
          : skipFOCCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Refresh implements _Refresh {
  const _$_Refresh(
      {required final List<MaterialQueryInfo> materialInfoList,
      required this.pickAndPack,
      this.skipFOCCheck = false})
      : _materialInfoList = materialInfoList;

  final List<MaterialQueryInfo> _materialInfoList;
  @override
  List<MaterialQueryInfo> get materialInfoList {
    if (_materialInfoList is EqualUnmodifiableListView)
      return _materialInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialInfoList);
  }

  @override
  final String pickAndPack;
  @override
  @JsonKey()
  final bool skipFOCCheck;

  @override
  String toString() {
    return 'MaterialPriceDetailEvent.refresh(materialInfoList: $materialInfoList, pickAndPack: $pickAndPack, skipFOCCheck: $skipFOCCheck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Refresh &&
            const DeepCollectionEquality()
                .equals(other._materialInfoList, _materialInfoList) &&
            (identical(other.pickAndPack, pickAndPack) ||
                other.pickAndPack == pickAndPack) &&
            (identical(other.skipFOCCheck, skipFOCCheck) ||
                other.skipFOCCheck == skipFOCCheck));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_materialInfoList),
      pickAndPack,
      skipFOCCheck);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshCopyWith<_$_Refresh> get copyWith =>
      __$$_RefreshCopyWithImpl<_$_Refresh>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)
        initialized,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        refresh,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        fetch,
    required TResult Function(List<MaterialNumber> materialInfoList)
        comboDealFetch,
  }) {
    return refresh(materialInfoList, pickAndPack, skipFOCCheck);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult? Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
  }) {
    return refresh?.call(materialInfoList, pickAndPack, skipFOCCheck);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(materialInfoList, pickAndPack, skipFOCCheck);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ComboDealFetch value) comboDealFetch,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ComboDealFetch value)? comboDealFetch,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_ComboDealFetch value)? comboDealFetch,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements MaterialPriceDetailEvent {
  const factory _Refresh(
      {required final List<MaterialQueryInfo> materialInfoList,
      required final String pickAndPack,
      final bool skipFOCCheck}) = _$_Refresh;

  List<MaterialQueryInfo> get materialInfoList;
  String get pickAndPack;
  bool get skipFOCCheck;
  @JsonKey(ignore: true)
  _$$_RefreshCopyWith<_$_Refresh> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<MaterialQueryInfo> materialInfoList,
      String pickAndPack,
      bool skipFOCCheck});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$MaterialPriceDetailEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialInfoList = null,
    Object? pickAndPack = null,
    Object? skipFOCCheck = null,
  }) {
    return _then(_$_Fetch(
      materialInfoList: null == materialInfoList
          ? _value._materialInfoList
          : materialInfoList // ignore: cast_nullable_to_non_nullable
              as List<MaterialQueryInfo>,
      pickAndPack: null == pickAndPack
          ? _value.pickAndPack
          : pickAndPack // ignore: cast_nullable_to_non_nullable
              as String,
      skipFOCCheck: null == skipFOCCheck
          ? _value.skipFOCCheck
          : skipFOCCheck // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required final List<MaterialQueryInfo> materialInfoList,
      required this.pickAndPack,
      this.skipFOCCheck = false})
      : _materialInfoList = materialInfoList;

  final List<MaterialQueryInfo> _materialInfoList;
  @override
  List<MaterialQueryInfo> get materialInfoList {
    if (_materialInfoList is EqualUnmodifiableListView)
      return _materialInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialInfoList);
  }

  @override
  final String pickAndPack;
  @override
  @JsonKey()
  final bool skipFOCCheck;

  @override
  String toString() {
    return 'MaterialPriceDetailEvent.fetch(materialInfoList: $materialInfoList, pickAndPack: $pickAndPack, skipFOCCheck: $skipFOCCheck)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality()
                .equals(other._materialInfoList, _materialInfoList) &&
            (identical(other.pickAndPack, pickAndPack) ||
                other.pickAndPack == pickAndPack) &&
            (identical(other.skipFOCCheck, skipFOCCheck) ||
                other.skipFOCCheck == skipFOCCheck));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_materialInfoList),
      pickAndPack,
      skipFOCCheck);

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
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)
        initialized,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        refresh,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        fetch,
    required TResult Function(List<MaterialNumber> materialInfoList)
        comboDealFetch,
  }) {
    return fetch(materialInfoList, pickAndPack, skipFOCCheck);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult? Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
  }) {
    return fetch?.call(materialInfoList, pickAndPack, skipFOCCheck);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(materialInfoList, pickAndPack, skipFOCCheck);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ComboDealFetch value) comboDealFetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ComboDealFetch value)? comboDealFetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_ComboDealFetch value)? comboDealFetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements MaterialPriceDetailEvent {
  const factory _Fetch(
      {required final List<MaterialQueryInfo> materialInfoList,
      required final String pickAndPack,
      final bool skipFOCCheck}) = _$_Fetch;

  List<MaterialQueryInfo> get materialInfoList;
  String get pickAndPack;
  bool get skipFOCCheck;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ComboDealFetchCopyWith<$Res> {
  factory _$$_ComboDealFetchCopyWith(
          _$_ComboDealFetch value, $Res Function(_$_ComboDealFetch) then) =
      __$$_ComboDealFetchCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialNumber> materialInfoList});
}

/// @nodoc
class __$$_ComboDealFetchCopyWithImpl<$Res>
    extends _$MaterialPriceDetailEventCopyWithImpl<$Res, _$_ComboDealFetch>
    implements _$$_ComboDealFetchCopyWith<$Res> {
  __$$_ComboDealFetchCopyWithImpl(
      _$_ComboDealFetch _value, $Res Function(_$_ComboDealFetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialInfoList = null,
  }) {
    return _then(_$_ComboDealFetch(
      materialInfoList: null == materialInfoList
          ? _value._materialInfoList
          : materialInfoList // ignore: cast_nullable_to_non_nullable
              as List<MaterialNumber>,
    ));
  }
}

/// @nodoc

class _$_ComboDealFetch implements _ComboDealFetch {
  const _$_ComboDealFetch(
      {required final List<MaterialNumber> materialInfoList})
      : _materialInfoList = materialInfoList;

  final List<MaterialNumber> _materialInfoList;
  @override
  List<MaterialNumber> get materialInfoList {
    if (_materialInfoList is EqualUnmodifiableListView)
      return _materialInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialInfoList);
  }

  @override
  String toString() {
    return 'MaterialPriceDetailEvent.comboDealFetch(materialInfoList: $materialInfoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComboDealFetch &&
            const DeepCollectionEquality()
                .equals(other._materialInfoList, _materialInfoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_materialInfoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComboDealFetchCopyWith<_$_ComboDealFetch> get copyWith =>
      __$$_ComboDealFetchCopyWithImpl<_$_ComboDealFetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)
        initialized,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        refresh,
    required TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)
        fetch,
    required TResult Function(List<MaterialNumber> materialInfoList)
        comboDealFetch,
  }) {
    return comboDealFetch(materialInfoList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult? Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult? Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
  }) {
    return comboDealFetch?.call(materialInfoList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            CustomerCodeInfo customerCode,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrganisationConfigs,
            ShipToInfo shipToCode)?
        initialized,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        refresh,
    TResult Function(List<MaterialQueryInfo> materialInfoList,
            String pickAndPack, bool skipFOCCheck)?
        fetch,
    TResult Function(List<MaterialNumber> materialInfoList)? comboDealFetch,
    required TResult orElse(),
  }) {
    if (comboDealFetch != null) {
      return comboDealFetch(materialInfoList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ComboDealFetch value) comboDealFetch,
  }) {
    return comboDealFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ComboDealFetch value)? comboDealFetch,
  }) {
    return comboDealFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_ComboDealFetch value)? comboDealFetch,
    required TResult orElse(),
  }) {
    if (comboDealFetch != null) {
      return comboDealFetch(this);
    }
    return orElse();
  }
}

abstract class _ComboDealFetch implements MaterialPriceDetailEvent {
  const factory _ComboDealFetch(
          {required final List<MaterialNumber> materialInfoList}) =
      _$_ComboDealFetch;

  List<MaterialNumber> get materialInfoList;
  @JsonKey(ignore: true)
  _$$_ComboDealFetchCopyWith<_$_ComboDealFetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialPriceDetailState {
  User get user => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCode => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesOrganisationConfigs =>
      throw _privateConstructorUsedError;
  ShipToInfo get shipToCode => throw _privateConstructorUsedError;
  Map<MaterialQueryInfo, MaterialPriceDetail> get materialDetails =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get isValidating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialPriceDetailStateCopyWith<MaterialPriceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceDetailStateCopyWith<$Res> {
  factory $MaterialPriceDetailStateCopyWith(MaterialPriceDetailState value,
          $Res Function(MaterialPriceDetailState) then) =
      _$MaterialPriceDetailStateCopyWithImpl<$Res, MaterialPriceDetailState>;
  @useResult
  $Res call(
      {User user,
      CustomerCodeInfo customerCode,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrganisationConfigs,
      ShipToInfo shipToCode,
      Map<MaterialQueryInfo, MaterialPriceDetail> materialDetails,
      bool isFetching,
      bool isValidating});

  $UserCopyWith<$Res> get user;
  $CustomerCodeInfoCopyWith<$Res> get customerCode;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $ShipToInfoCopyWith<$Res> get shipToCode;
}

/// @nodoc
class _$MaterialPriceDetailStateCopyWithImpl<$Res,
        $Val extends MaterialPriceDetailState>
    implements $MaterialPriceDetailStateCopyWith<$Res> {
  _$MaterialPriceDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? customerCode = null,
    Object? salesOrganisation = null,
    Object? salesOrganisationConfigs = null,
    Object? shipToCode = null,
    Object? materialDetails = null,
    Object? isFetching = null,
    Object? isValidating = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToCode: null == shipToCode
          ? _value.shipToCode
          : shipToCode // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialDetails: null == materialDetails
          ? _value.materialDetails
          : materialDetails // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, MaterialPriceDetail>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidating: null == isValidating
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
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
  $CustomerCodeInfoCopyWith<$Res> get customerCode {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCode, (value) {
      return _then(_value.copyWith(customerCode: value) as $Val);
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToCode {
    return $ShipToInfoCopyWith<$Res>(_value.shipToCode, (value) {
      return _then(_value.copyWith(shipToCode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MaterialPriceDetailStateCopyWith<$Res>
    implements $MaterialPriceDetailStateCopyWith<$Res> {
  factory _$$_MaterialPriceDetailStateCopyWith(
          _$_MaterialPriceDetailState value,
          $Res Function(_$_MaterialPriceDetailState) then) =
      __$$_MaterialPriceDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      CustomerCodeInfo customerCode,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrganisationConfigs,
      ShipToInfo shipToCode,
      Map<MaterialQueryInfo, MaterialPriceDetail> materialDetails,
      bool isFetching,
      bool isValidating});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCode;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  @override
  $ShipToInfoCopyWith<$Res> get shipToCode;
}

/// @nodoc
class __$$_MaterialPriceDetailStateCopyWithImpl<$Res>
    extends _$MaterialPriceDetailStateCopyWithImpl<$Res,
        _$_MaterialPriceDetailState>
    implements _$$_MaterialPriceDetailStateCopyWith<$Res> {
  __$$_MaterialPriceDetailStateCopyWithImpl(_$_MaterialPriceDetailState _value,
      $Res Function(_$_MaterialPriceDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? customerCode = null,
    Object? salesOrganisation = null,
    Object? salesOrganisationConfigs = null,
    Object? shipToCode = null,
    Object? materialDetails = null,
    Object? isFetching = null,
    Object? isValidating = null,
  }) {
    return _then(_$_MaterialPriceDetailState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToCode: null == shipToCode
          ? _value.shipToCode
          : shipToCode // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialDetails: null == materialDetails
          ? _value._materialDetails
          : materialDetails // ignore: cast_nullable_to_non_nullable
              as Map<MaterialQueryInfo, MaterialPriceDetail>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidating: null == isValidating
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MaterialPriceDetailState extends _MaterialPriceDetailState {
  const _$_MaterialPriceDetailState(
      {required this.user,
      required this.customerCode,
      required this.salesOrganisation,
      required this.salesOrganisationConfigs,
      required this.shipToCode,
      required final Map<MaterialQueryInfo, MaterialPriceDetail>
          materialDetails,
      required this.isFetching,
      required this.isValidating})
      : _materialDetails = materialDetails,
        super._();

  @override
  final User user;
  @override
  final CustomerCodeInfo customerCode;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final ShipToInfo shipToCode;
  final Map<MaterialQueryInfo, MaterialPriceDetail> _materialDetails;
  @override
  Map<MaterialQueryInfo, MaterialPriceDetail> get materialDetails {
    if (_materialDetails is EqualUnmodifiableMapView) return _materialDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materialDetails);
  }

  @override
  final bool isFetching;
  @override
  final bool isValidating;

  @override
  String toString() {
    return 'MaterialPriceDetailState(user: $user, customerCode: $customerCode, salesOrganisation: $salesOrganisation, salesOrganisationConfigs: $salesOrganisationConfigs, shipToCode: $shipToCode, materialDetails: $materialDetails, isFetching: $isFetching, isValidating: $isValidating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialPriceDetailState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.shipToCode, shipToCode) ||
                other.shipToCode == shipToCode) &&
            const DeepCollectionEquality()
                .equals(other._materialDetails, _materialDetails) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.isValidating, isValidating) ||
                other.isValidating == isValidating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      customerCode,
      salesOrganisation,
      salesOrganisationConfigs,
      shipToCode,
      const DeepCollectionEquality().hash(_materialDetails),
      isFetching,
      isValidating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialPriceDetailStateCopyWith<_$_MaterialPriceDetailState>
      get copyWith => __$$_MaterialPriceDetailStateCopyWithImpl<
          _$_MaterialPriceDetailState>(this, _$identity);
}

abstract class _MaterialPriceDetailState extends MaterialPriceDetailState {
  const factory _MaterialPriceDetailState(
      {required final User user,
      required final CustomerCodeInfo customerCode,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final ShipToInfo shipToCode,
      required final Map<MaterialQueryInfo, MaterialPriceDetail>
          materialDetails,
      required final bool isFetching,
      required final bool isValidating}) = _$_MaterialPriceDetailState;
  const _MaterialPriceDetailState._() : super._();

  @override
  User get user;
  @override
  CustomerCodeInfo get customerCode;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get salesOrganisationConfigs;
  @override
  ShipToInfo get shipToCode;
  @override
  Map<MaterialQueryInfo, MaterialPriceDetail> get materialDetails;
  @override
  bool get isFetching;
  @override
  bool get isValidating;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialPriceDetailStateCopyWith<_$_MaterialPriceDetailState>
      get copyWith => throw _privateConstructorUsedError;
}
