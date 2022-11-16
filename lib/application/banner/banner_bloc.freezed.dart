// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
            bool isPreSalesOrg, SalesOrganisation salesOrganisation)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation)?
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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
      _$BannerEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BannerEventCopyWithImpl<$Res> implements $BannerEventCopyWith<$Res> {
  _$BannerEventCopyWithImpl(this._value, this._then);

  final BannerEvent _value;
  // ignore: unused_field
  final $Res Function(BannerEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res> extends _$BannerEventCopyWithImpl<$Res>
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
            bool isPreSalesOrg, SalesOrganisation salesOrganisation)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation)?
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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
  $Res call({bool isPreSalesOrg, SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res> extends _$BannerEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;

  @override
  $Res call({
    Object? isPreSalesOrg = freezed,
    Object? salesOrganisation = freezed,
  }) {
    return _then(_$_Fetch(
      isPreSalesOrg: isPreSalesOrg == freezed
          ? _value.isPreSalesOrg
          : isPreSalesOrg // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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
      {required this.isPreSalesOrg, required this.salesOrganisation});

  @override
  final bool isPreSalesOrg;
  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'BannerEvent.fetch(isPreSalesOrg: $isPreSalesOrg, salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality()
                .equals(other.isPreSalesOrg, isPreSalesOrg) &&
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isPreSalesOrg),
      const DeepCollectionEquality().hash(salesOrganisation));

  @JsonKey(ignore: true)
  @override
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            bool isPreSalesOrg, SalesOrganisation salesOrganisation)
        fetch,
  }) {
    return fetch(isPreSalesOrg, salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation)?
        fetch,
  }) {
    return fetch?.call(isPreSalesOrg, salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(bool isPreSalesOrg, SalesOrganisation salesOrganisation)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(isPreSalesOrg, salesOrganisation);
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
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
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
      required final SalesOrganisation salesOrganisation}) = _$_Fetch;

  bool get isPreSalesOrg;
  SalesOrganisation get salesOrganisation;
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
      _$BannerStateCopyWithImpl<$Res>;
  $Res call(
      {List<BannerItem> banner,
      Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption});
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res> implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  final BannerState _value;
  // ignore: unused_field
  final $Res Function(BannerState) _then;

  @override
  $Res call({
    Object? banner = freezed,
    Object? bannerFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      banner: banner == freezed
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<BannerItem>,
      bannerFailureOrSuccessOption: bannerFailureOrSuccessOption == freezed
          ? _value.bannerFailureOrSuccessOption
          : bannerFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_BannerStateCopyWith<$Res>
    implements $BannerStateCopyWith<$Res> {
  factory _$$_BannerStateCopyWith(
          _$_BannerState value, $Res Function(_$_BannerState) then) =
      __$$_BannerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<BannerItem> banner,
      Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption});
}

/// @nodoc
class __$$_BannerStateCopyWithImpl<$Res> extends _$BannerStateCopyWithImpl<$Res>
    implements _$$_BannerStateCopyWith<$Res> {
  __$$_BannerStateCopyWithImpl(
      _$_BannerState _value, $Res Function(_$_BannerState) _then)
      : super(_value, (v) => _then(v as _$_BannerState));

  @override
  _$_BannerState get _value => super._value as _$_BannerState;

  @override
  $Res call({
    Object? banner = freezed,
    Object? bannerFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_BannerState(
      banner: banner == freezed
          ? _value._banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<BannerItem>,
      bannerFailureOrSuccessOption: bannerFailureOrSuccessOption == freezed
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
            const DeepCollectionEquality().equals(
                other.bannerFailureOrSuccessOption,
                bannerFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_banner),
      const DeepCollectionEquality().hash(bannerFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
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
