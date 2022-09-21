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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgEventCopyWith<$Res> {
  factory $SalesOrgEventCopyWith(
          SalesOrgEvent value, $Res Function(SalesOrgEvent) then) =
      _$SalesOrgEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SalesOrgEventCopyWithImpl<$Res>
    implements $SalesOrgEventCopyWith<$Res> {
  _$SalesOrgEventCopyWithImpl(this._value, this._then);

  final SalesOrgEvent _value;
  // ignore: unused_field
  final $Res Function(SalesOrgEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$SalesOrgEventCopyWithImpl<$Res>
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
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
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
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
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
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_SelectedCopyWithImpl<$Res> extends _$SalesOrgEventCopyWithImpl<$Res>
    implements _$$_SelectedCopyWith<$Res> {
  __$$_SelectedCopyWithImpl(
      _$_Selected _value, $Res Function(_$_Selected) _then)
      : super(_value, (v) => _then(v as _$_Selected));

  @override
  _$_Selected get _value => super._value as _$_Selected;

  @override
  $Res call({
    Object? salesOrganisation = freezed,
  }) {
    return _then(_$_Selected(
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
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(salesOrganisation));

  @JsonKey(ignore: true)
  @override
  _$$_SelectedCopyWith<_$_Selected> get copyWith =>
      __$$_SelectedCopyWithImpl<_$_Selected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) selected,
  }) {
    return selected(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
  }) {
    return selected?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
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
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
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
      _$SalesOrgStateCopyWithImpl<$Res>;
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      Option<Either<ApiFailure, dynamic>> salesOrgFailureOrSuccessOption});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
}

/// @nodoc
class _$SalesOrgStateCopyWithImpl<$Res>
    implements $SalesOrgStateCopyWith<$Res> {
  _$SalesOrgStateCopyWithImpl(this._value, this._then);

  final SalesOrgState _value;
  // ignore: unused_field
  final $Res Function(SalesOrgState) _then;

  @override
  $Res call({
    Object? salesOrganisation = freezed,
    Object? configs = freezed,
    Object? salesOrgFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: configs == freezed
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrgFailureOrSuccessOption: salesOrgFailureOrSuccessOption == freezed
          ? _value.salesOrgFailureOrSuccessOption
          : salesOrgFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value));
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
    extends _$SalesOrgStateCopyWithImpl<$Res>
    implements _$$_SalesOrgStateCopyWith<$Res> {
  __$$_SalesOrgStateCopyWithImpl(
      _$_SalesOrgState _value, $Res Function(_$_SalesOrgState) _then)
      : super(_value, (v) => _then(v as _$_SalesOrgState));

  @override
  _$_SalesOrgState get _value => super._value as _$_SalesOrgState;

  @override
  $Res call({
    Object? salesOrganisation = freezed,
    Object? configs = freezed,
    Object? salesOrgFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_SalesOrgState(
      salesOrganisation: salesOrganisation == freezed
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: configs == freezed
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrgFailureOrSuccessOption: salesOrgFailureOrSuccessOption == freezed
          ? _value.salesOrgFailureOrSuccessOption
          : salesOrgFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_SalesOrgState implements _SalesOrgState {
  const _$_SalesOrgState(
      {required this.salesOrganisation,
      required this.configs,
      required this.salesOrgFailureOrSuccessOption});

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
            const DeepCollectionEquality()
                .equals(other.salesOrganisation, salesOrganisation) &&
            const DeepCollectionEquality().equals(other.configs, configs) &&
            const DeepCollectionEquality().equals(
                other.salesOrgFailureOrSuccessOption,
                salesOrgFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(salesOrganisation),
      const DeepCollectionEquality().hash(configs),
      const DeepCollectionEquality().hash(salesOrgFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_SalesOrgStateCopyWith<_$_SalesOrgState> get copyWith =>
      __$$_SalesOrgStateCopyWithImpl<_$_SalesOrgState>(this, _$identity);
}

abstract class _SalesOrgState implements SalesOrgState {
  const factory _SalesOrgState(
      {required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs configs,
      required final Option<Either<ApiFailure, dynamic>>
          salesOrgFailureOrSuccessOption}) = _$_SalesOrgState;

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
