// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'policy_configuration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PolicyConfigurationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function(PolicyConfiguration policyConfigurationItem)
        delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function(PolicyConfiguration policyConfigurationItem)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function(PolicyConfiguration policyConfigurationItem)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolicyConfigurationEventCopyWith<$Res> {
  factory $PolicyConfigurationEventCopyWith(PolicyConfigurationEvent value,
          $Res Function(PolicyConfigurationEvent) then) =
      _$PolicyConfigurationEventCopyWithImpl<$Res, PolicyConfigurationEvent>;
}

/// @nodoc
class _$PolicyConfigurationEventCopyWithImpl<$Res,
        $Val extends PolicyConfigurationEvent>
    implements $PolicyConfigurationEventCopyWith<$Res> {
  _$PolicyConfigurationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_initializedCopyWith<$Res> {
  factory _$$_initializedCopyWith(
          _$_initialized value, $Res Function(_$_initialized) then) =
      __$$_initializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_initializedCopyWithImpl<$Res>
    extends _$PolicyConfigurationEventCopyWithImpl<$Res, _$_initialized>
    implements _$$_initializedCopyWith<$Res> {
  __$$_initializedCopyWithImpl(
      _$_initialized _value, $Res Function(_$_initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_initialized implements _initialized {
  const _$_initialized();

  @override
  String toString() {
    return 'PolicyConfigurationEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function(PolicyConfiguration policyConfigurationItem)
        delete,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function(PolicyConfiguration policyConfigurationItem)? delete,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function(PolicyConfiguration policyConfigurationItem)? delete,
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
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Delete value) delete,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Delete value)? delete,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements PolicyConfigurationEvent {
  const factory _initialized() = _$_initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$PolicyConfigurationEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$_Fetch(
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

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'PolicyConfigurationEvent.fetch(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function(PolicyConfiguration policyConfigurationItem)
        delete,
  }) {
    return fetch(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function(PolicyConfiguration policyConfigurationItem)? delete,
  }) {
    return fetch?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function(PolicyConfiguration policyConfigurationItem)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Delete value) delete,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Delete value)? delete,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PolicyConfigurationEvent {
  const factory _Fetch({required final SalesOrganisation salesOrganisation}) =
      _$_Fetch;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteCopyWith<$Res> {
  factory _$$_DeleteCopyWith(_$_Delete value, $Res Function(_$_Delete) then) =
      __$$_DeleteCopyWithImpl<$Res>;
  @useResult
  $Res call({PolicyConfiguration policyConfigurationItem});

  $PolicyConfigurationCopyWith<$Res> get policyConfigurationItem;
}

/// @nodoc
class __$$_DeleteCopyWithImpl<$Res>
    extends _$PolicyConfigurationEventCopyWithImpl<$Res, _$_Delete>
    implements _$$_DeleteCopyWith<$Res> {
  __$$_DeleteCopyWithImpl(_$_Delete _value, $Res Function(_$_Delete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? policyConfigurationItem = null,
  }) {
    return _then(_$_Delete(
      policyConfigurationItem: null == policyConfigurationItem
          ? _value.policyConfigurationItem
          : policyConfigurationItem // ignore: cast_nullable_to_non_nullable
              as PolicyConfiguration,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PolicyConfigurationCopyWith<$Res> get policyConfigurationItem {
    return $PolicyConfigurationCopyWith<$Res>(_value.policyConfigurationItem,
        (value) {
      return _then(_value.copyWith(policyConfigurationItem: value));
    });
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete({required this.policyConfigurationItem});

  @override
  final PolicyConfiguration policyConfigurationItem;

  @override
  String toString() {
    return 'PolicyConfigurationEvent.delete(policyConfigurationItem: $policyConfigurationItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delete &&
            (identical(
                    other.policyConfigurationItem, policyConfigurationItem) ||
                other.policyConfigurationItem == policyConfigurationItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, policyConfigurationItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      __$$_DeleteCopyWithImpl<_$_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
    required TResult Function(PolicyConfiguration policyConfigurationItem)
        delete,
  }) {
    return delete(policyConfigurationItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
    TResult? Function(PolicyConfiguration policyConfigurationItem)? delete,
  }) {
    return delete?.call(policyConfigurationItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    TResult Function(PolicyConfiguration policyConfigurationItem)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(policyConfigurationItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements PolicyConfigurationEvent {
  const factory _Delete(
      {required final PolicyConfiguration policyConfigurationItem}) = _$_Delete;

  PolicyConfiguration get policyConfigurationItem;
  @JsonKey(ignore: true)
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PolicyConfigurationState {
  List<PolicyConfiguration> get policyConfigurationList =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PolicyConfigurationStateCopyWith<PolicyConfigurationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolicyConfigurationStateCopyWith<$Res> {
  factory $PolicyConfigurationStateCopyWith(PolicyConfigurationState value,
          $Res Function(PolicyConfigurationState) then) =
      _$PolicyConfigurationStateCopyWithImpl<$Res, PolicyConfigurationState>;
  @useResult
  $Res call(
      {List<PolicyConfiguration> policyConfigurationList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class _$PolicyConfigurationStateCopyWithImpl<$Res,
        $Val extends PolicyConfigurationState>
    implements $PolicyConfigurationStateCopyWith<$Res> {
  _$PolicyConfigurationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? policyConfigurationList = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      policyConfigurationList: null == policyConfigurationList
          ? _value.policyConfigurationList
          : policyConfigurationList // ignore: cast_nullable_to_non_nullable
              as List<PolicyConfiguration>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PolicyConfigurationStateCopyWith<$Res>
    implements $PolicyConfigurationStateCopyWith<$Res> {
  factory _$$_PolicyConfigurationStateCopyWith(
          _$_PolicyConfigurationState value,
          $Res Function(_$_PolicyConfigurationState) then) =
      __$$_PolicyConfigurationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PolicyConfiguration> policyConfigurationList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class __$$_PolicyConfigurationStateCopyWithImpl<$Res>
    extends _$PolicyConfigurationStateCopyWithImpl<$Res,
        _$_PolicyConfigurationState>
    implements _$$_PolicyConfigurationStateCopyWith<$Res> {
  __$$_PolicyConfigurationStateCopyWithImpl(_$_PolicyConfigurationState _value,
      $Res Function(_$_PolicyConfigurationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? policyConfigurationList = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_$_PolicyConfigurationState(
      policyConfigurationList: null == policyConfigurationList
          ? _value._policyConfigurationList
          : policyConfigurationList // ignore: cast_nullable_to_non_nullable
              as List<PolicyConfiguration>,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PolicyConfigurationState implements _PolicyConfigurationState {
  const _$_PolicyConfigurationState(
      {required final List<PolicyConfiguration> policyConfigurationList,
      required this.failureOrSuccessOption,
      required this.isLoading})
      : _policyConfigurationList = policyConfigurationList;

  final List<PolicyConfiguration> _policyConfigurationList;
  @override
  List<PolicyConfiguration> get policyConfigurationList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_policyConfigurationList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PolicyConfigurationState(policyConfigurationList: $policyConfigurationList, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PolicyConfigurationState &&
            const DeepCollectionEquality().equals(
                other._policyConfigurationList, _policyConfigurationList) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_policyConfigurationList),
      failureOrSuccessOption,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PolicyConfigurationStateCopyWith<_$_PolicyConfigurationState>
      get copyWith => __$$_PolicyConfigurationStateCopyWithImpl<
          _$_PolicyConfigurationState>(this, _$identity);
}

abstract class _PolicyConfigurationState implements PolicyConfigurationState {
  const factory _PolicyConfigurationState(
      {required final List<PolicyConfiguration> policyConfigurationList,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading}) = _$_PolicyConfigurationState;

  @override
  List<PolicyConfiguration> get policyConfigurationList;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_PolicyConfigurationStateCopyWith<_$_PolicyConfigurationState>
      get copyWith => throw _privateConstructorUsedError;
}
