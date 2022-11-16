// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sales_org_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesOrgEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgEventCopyWith<$Res> {
  factory $SalesOrgEventCopyWith(
          SalesOrgEvent value, $Res Function(SalesOrgEvent) then) =
      _$SalesOrgEventCopyWithImpl<$Res, SalesOrgEvent>;
}

/// @nodoc
class _$SalesOrgEventCopyWithImpl<$Res, $Val extends SalesOrgEvent>
    implements $SalesOrgEventCopyWith<$Res> {
  _$SalesOrgEventCopyWithImpl(this._value, this._then);

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
    extends _$SalesOrgEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'SalesOrgEvent.initialized()';
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
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
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
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements SalesOrgEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_SelectedCopyWith<$Res> {
  factory _$$_SelectedCopyWith(
          _$_Selected value, $Res Function(_$_Selected) then) =
      __$$_SelectedCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_SelectedCopyWithImpl<$Res>
    extends _$SalesOrgEventCopyWithImpl<$Res, _$_Selected>
    implements _$$_SelectedCopyWith<$Res> {
  __$$_SelectedCopyWithImpl(
      _$_Selected _value, $Res Function(_$_Selected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$_Selected(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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

class _$_Selected implements _Selected {
  const _$_Selected({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'SalesOrgEvent.selected(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Selected &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectedCopyWith<_$_Selected> get copyWith =>
      __$$_SelectedCopyWithImpl<_$_Selected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
  }) {
    return selected(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
  }) {
    return selected?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class _Selected implements SalesOrgEvent {
  const factory _Selected(
      {required final SalesOrganisation salesOrganisation}) = _$_Selected;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$_SelectedCopyWith<_$_Selected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadSavedOrganisationCopyWith<$Res> {
  factory _$$_LoadSavedOrganisationCopyWith(_$_LoadSavedOrganisation value,
          $Res Function(_$_LoadSavedOrganisation) then) =
      __$$_LoadSavedOrganisationCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SalesOrganisation> salesOrganisations});
}

/// @nodoc
class __$$_LoadSavedOrganisationCopyWithImpl<$Res>
    extends _$SalesOrgEventCopyWithImpl<$Res, _$_LoadSavedOrganisation>
    implements _$$_LoadSavedOrganisationCopyWith<$Res> {
  __$$_LoadSavedOrganisationCopyWithImpl(_$_LoadSavedOrganisation _value,
      $Res Function(_$_LoadSavedOrganisation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisations = null,
  }) {
    return _then(_$_LoadSavedOrganisation(
      salesOrganisations: null == salesOrganisations
          ? _value._salesOrganisations
          : salesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
    ));
  }
}

/// @nodoc

class _$_LoadSavedOrganisation implements _LoadSavedOrganisation {
  const _$_LoadSavedOrganisation(
      {required final List<SalesOrganisation> salesOrganisations})
      : _salesOrganisations = salesOrganisations;

  final List<SalesOrganisation> _salesOrganisations;
  @override
  List<SalesOrganisation> get salesOrganisations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesOrganisations);
  }

  @override
  String toString() {
    return 'SalesOrgEvent.loadSavedOrganisation(salesOrganisations: $salesOrganisations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSavedOrganisation &&
            const DeepCollectionEquality()
                .equals(other._salesOrganisations, _salesOrganisations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_salesOrganisations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSavedOrganisationCopyWith<_$_LoadSavedOrganisation> get copyWith =>
      __$$_LoadSavedOrganisationCopyWithImpl<_$_LoadSavedOrganisation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
  }) {
    return loadSavedOrganisation(salesOrganisations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
  }) {
    return loadSavedOrganisation?.call(salesOrganisations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    required TResult orElse(),
  }) {
    if (loadSavedOrganisation != null) {
      return loadSavedOrganisation(salesOrganisations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
  }) {
    return loadSavedOrganisation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
  }) {
    return loadSavedOrganisation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    required TResult orElse(),
  }) {
    if (loadSavedOrganisation != null) {
      return loadSavedOrganisation(this);
    }
    return orElse();
  }
}

abstract class _LoadSavedOrganisation implements SalesOrgEvent {
  const factory _LoadSavedOrganisation(
          {required final List<SalesOrganisation> salesOrganisations}) =
      _$_LoadSavedOrganisation;

  List<SalesOrganisation> get salesOrganisations;
  @JsonKey(ignore: true)
  _$$_LoadSavedOrganisationCopyWith<_$_LoadSavedOrganisation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesOrgState {
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get configs => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get salesOrgFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrgStateCopyWith<SalesOrgState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgStateCopyWith<$Res> {
  factory $SalesOrgStateCopyWith(
          SalesOrgState value, $Res Function(SalesOrgState) then) =
      _$SalesOrgStateCopyWithImpl<$Res, SalesOrgState>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      Option<Either<ApiFailure, dynamic>> salesOrgFailureOrSuccessOption});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
}

/// @nodoc
class _$SalesOrgStateCopyWithImpl<$Res, $Val extends SalesOrgState>
    implements $SalesOrgStateCopyWith<$Res> {
  _$SalesOrgStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? salesOrgFailureOrSuccessOption = null,
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
      salesOrgFailureOrSuccessOption: null == salesOrgFailureOrSuccessOption
          ? _value.salesOrgFailureOrSuccessOption
          : salesOrgFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
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
}

/// @nodoc
abstract class _$$_SalesOrgStateCopyWith<$Res>
    implements $SalesOrgStateCopyWith<$Res> {
  factory _$$_SalesOrgStateCopyWith(
          _$_SalesOrgState value, $Res Function(_$_SalesOrgState) then) =
      __$$_SalesOrgStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      Option<Either<ApiFailure, dynamic>> salesOrgFailureOrSuccessOption});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
}

/// @nodoc
class __$$_SalesOrgStateCopyWithImpl<$Res>
    extends _$SalesOrgStateCopyWithImpl<$Res, _$_SalesOrgState>
    implements _$$_SalesOrgStateCopyWith<$Res> {
  __$$_SalesOrgStateCopyWithImpl(
      _$_SalesOrgState _value, $Res Function(_$_SalesOrgState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? salesOrgFailureOrSuccessOption = null,
  }) {
    return _then(_$_SalesOrgState(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrgFailureOrSuccessOption: null == salesOrgFailureOrSuccessOption
          ? _value.salesOrgFailureOrSuccessOption
          : salesOrgFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_SalesOrgState extends _SalesOrgState {
  const _$_SalesOrgState(
      {required this.salesOrganisation,
      required this.configs,
      required this.salesOrgFailureOrSuccessOption})
      : super._();

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final Option<Either<ApiFailure, dynamic>> salesOrgFailureOrSuccessOption;

  @override
  String toString() {
    return 'SalesOrgState(salesOrganisation: $salesOrganisation, configs: $configs, salesOrgFailureOrSuccessOption: $salesOrgFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrgState &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.salesOrgFailureOrSuccessOption,
                    salesOrgFailureOrSuccessOption) ||
                other.salesOrgFailureOrSuccessOption ==
                    salesOrgFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganisation, configs, salesOrgFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesOrgStateCopyWith<_$_SalesOrgState> get copyWith =>
      __$$_SalesOrgStateCopyWithImpl<_$_SalesOrgState>(this, _$identity);
}

abstract class _SalesOrgState extends SalesOrgState {
  const factory _SalesOrgState(
      {required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs configs,
      required final Option<Either<ApiFailure, dynamic>>
          salesOrgFailureOrSuccessOption}) = _$_SalesOrgState;
  const _SalesOrgState._() : super._();

  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get configs;
  @override
  Option<Either<ApiFailure, dynamic>> get salesOrgFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrgStateCopyWith<_$_SalesOrgState> get copyWith =>
      throw _privateConstructorUsedError;
}
