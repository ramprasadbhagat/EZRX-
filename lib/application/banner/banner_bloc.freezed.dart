// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BannerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerEventCopyWith<$Res> {
  factory $BannerEventCopyWith(
          BannerEvent value, $Res Function(BannerEvent) then) =
      _$BannerEventCopyWithImpl<$Res, BannerEvent>;
}

/// @nodoc
class _$BannerEventCopyWithImpl<$Res, $Val extends BannerEvent>
    implements $BannerEventCopyWith<$Res> {
  _$BannerEventCopyWithImpl(this._value, this._then);

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
    extends _$BannerEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'BannerEvent.initialized()';
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
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
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
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements BannerEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool isPreSalesOrg,
      SalesOrganisation salesOrganisation,
      String country,
      String role,
      String bannerType,
      String branchCode,
      String targetCustomerType});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPreSalesOrg = null,
    Object? salesOrganisation = null,
    Object? country = null,
    Object? role = null,
    Object? bannerType = null,
    Object? branchCode = null,
    Object? targetCustomerType = null,
  }) {
    return _then(_$_Fetch(
      isPreSalesOrg: null == isPreSalesOrg
          ? _value.isPreSalesOrg
          : isPreSalesOrg // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      bannerType: null == bannerType
          ? _value.bannerType
          : bannerType // ignore: cast_nullable_to_non_nullable
              as String,
      branchCode: null == branchCode
          ? _value.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String,
      targetCustomerType: null == targetCustomerType
          ? _value.targetCustomerType
          : targetCustomerType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.isPreSalesOrg,
      required this.salesOrganisation,
      required this.country,
      required this.role,
      required this.bannerType,
      required this.branchCode,
      required this.targetCustomerType});

  @override
  final bool isPreSalesOrg;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final String country;
  @override
  final String role;
  @override
  final String bannerType;
  @override
  final String branchCode;
  @override
  final String targetCustomerType;

  @override
  String toString() {
    return 'BannerEvent.fetch(isPreSalesOrg: $isPreSalesOrg, salesOrganisation: $salesOrganisation, country: $country, role: $role, bannerType: $bannerType, branchCode: $branchCode, targetCustomerType: $targetCustomerType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.isPreSalesOrg, isPreSalesOrg) ||
                other.isPreSalesOrg == isPreSalesOrg) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.bannerType, bannerType) ||
                other.bannerType == bannerType) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.targetCustomerType, targetCustomerType) ||
                other.targetCustomerType == targetCustomerType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPreSalesOrg, salesOrganisation,
      country, role, bannerType, branchCode, targetCustomerType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)
        fetch,
  }) {
    return fetch(isPreSalesOrg, salesOrganisation, country, role, bannerType,
        branchCode, targetCustomerType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
  }) {
    return fetch?.call(isPreSalesOrg, salesOrganisation, country, role,
        bannerType, branchCode, targetCustomerType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(isPreSalesOrg, salesOrganisation, country, role, bannerType,
          branchCode, targetCustomerType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements BannerEvent {
  const factory _Fetch(
      {required final bool isPreSalesOrg,
      required final SalesOrganisation salesOrganisation,
      required final String country,
      required final String role,
      required final String bannerType,
      required final String branchCode,
      required final String targetCustomerType}) = _$_Fetch;

  bool get isPreSalesOrg;
  SalesOrganisation get salesOrganisation;
  String get country;
  String get role;
  String get bannerType;
  String get branchCode;
  String get targetCustomerType;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BannerState {
  List<EZReachBanner> get banner => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get bannerFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannerStateCopyWith<BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
          BannerState value, $Res Function(BannerState) then) =
      _$BannerStateCopyWithImpl<$Res, BannerState>;
  @useResult
  $Res call(
      {List<EZReachBanner> banner,
      Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banner = null,
    Object? bannerFailureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<EZReachBanner>,
      bannerFailureOrSuccessOption: null == bannerFailureOrSuccessOption
          ? _value.bannerFailureOrSuccessOption
          : bannerFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BannerStateCopyWith<$Res>
    implements $BannerStateCopyWith<$Res> {
  factory _$$_BannerStateCopyWith(
          _$_BannerState value, $Res Function(_$_BannerState) then) =
      __$$_BannerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EZReachBanner> banner,
      Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class __$$_BannerStateCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$_BannerState>
    implements _$$_BannerStateCopyWith<$Res> {
  __$$_BannerStateCopyWithImpl(
      _$_BannerState _value, $Res Function(_$_BannerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banner = null,
    Object? bannerFailureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_$_BannerState(
      banner: null == banner
          ? _value._banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<EZReachBanner>,
      bannerFailureOrSuccessOption: null == bannerFailureOrSuccessOption
          ? _value.bannerFailureOrSuccessOption
          : bannerFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BannerState implements _BannerState {
  const _$_BannerState(
      {required final List<EZReachBanner> banner,
      required this.bannerFailureOrSuccessOption,
      required this.isLoading})
      : _banner = banner;

  final List<EZReachBanner> _banner;
  @override
  List<EZReachBanner> get banner {
    if (_banner is EqualUnmodifiableListView) return _banner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banner);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'BannerState(banner: $banner, bannerFailureOrSuccessOption: $bannerFailureOrSuccessOption, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BannerState &&
            const DeepCollectionEquality().equals(other._banner, _banner) &&
            (identical(other.bannerFailureOrSuccessOption,
                    bannerFailureOrSuccessOption) ||
                other.bannerFailureOrSuccessOption ==
                    bannerFailureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_banner),
      bannerFailureOrSuccessOption,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BannerStateCopyWith<_$_BannerState> get copyWith =>
      __$$_BannerStateCopyWithImpl<_$_BannerState>(this, _$identity);
}

abstract class _BannerState implements BannerState {
  const factory _BannerState(
      {required final List<EZReachBanner> banner,
      required final Option<Either<ApiFailure, dynamic>>
          bannerFailureOrSuccessOption,
      required final bool isLoading}) = _$_BannerState;

  @override
  List<EZReachBanner> get banner;
  @override
  Option<Either<ApiFailure, dynamic>> get bannerFailureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_BannerStateCopyWith<_$_BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}
