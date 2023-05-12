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
    required TResult Function(bool isPreSalesOrg,
            SalesOrganisation salesOrganisation, String country, String role)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation,
            String country, String role)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation,
            String country, String role)?
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
    required TResult Function(bool isPreSalesOrg,
            SalesOrganisation salesOrganisation, String country, String role)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation,
            String country, String role)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation,
            String country, String role)?
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
      String role});

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
      required this.role});

  @override
  final bool isPreSalesOrg;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final String country;
  @override
  final String role;

  @override
  String toString() {
    return 'BannerEvent.fetch(isPreSalesOrg: $isPreSalesOrg, salesOrganisation: $salesOrganisation, country: $country, role: $role)';
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
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isPreSalesOrg, salesOrganisation, country, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(bool isPreSalesOrg,
            SalesOrganisation salesOrganisation, String country, String role)
        fetch,
  }) {
    return fetch(isPreSalesOrg, salesOrganisation, country, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation,
            String country, String role)?
        fetch,
  }) {
    return fetch?.call(isPreSalesOrg, salesOrganisation, country, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation,
            String country, String role)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(isPreSalesOrg, salesOrganisation, country, role);
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
      required final String role}) = _$_Fetch;

  bool get isPreSalesOrg;
  SalesOrganisation get salesOrganisation;
  String get country;
  String get role;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BannerState {
  List<BannerItem> get banner => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get bannerFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

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
      {List<BannerItem> banner,
      Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption});
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
  }) {
    return _then(_value.copyWith(
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<BannerItem>,
      bannerFailureOrSuccessOption: null == bannerFailureOrSuccessOption
          ? _value.bannerFailureOrSuccessOption
          : bannerFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
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
      {List<BannerItem> banner,
      Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption});
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
  }) {
    return _then(_$_BannerState(
      banner: null == banner
          ? _value._banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<BannerItem>,
      bannerFailureOrSuccessOption: null == bannerFailureOrSuccessOption
          ? _value.bannerFailureOrSuccessOption
          : bannerFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_BannerState implements _BannerState {
  const _$_BannerState(
      {required final List<BannerItem> banner,
      required this.bannerFailureOrSuccessOption})
      : _banner = banner;

  final List<BannerItem> _banner;
  @override
  List<BannerItem> get banner {
    if (_banner is EqualUnmodifiableListView) return _banner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banner);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption;

  @override
  String toString() {
    return 'BannerState(banner: $banner, bannerFailureOrSuccessOption: $bannerFailureOrSuccessOption)';
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
                    bannerFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_banner),
      bannerFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BannerStateCopyWith<_$_BannerState> get copyWith =>
      __$$_BannerStateCopyWithImpl<_$_BannerState>(this, _$identity);
}

abstract class _BannerState implements BannerState {
  const factory _BannerState(
      {required final List<BannerItem> banner,
      required final Option<Either<ApiFailure, dynamic>>
          bannerFailureOrSuccessOption}) = _$_BannerState;

  @override
  List<BannerItem> get banner;
  @override
  Option<Either<ApiFailure, dynamic>> get bannerFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_BannerStateCopyWith<_$_BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}
