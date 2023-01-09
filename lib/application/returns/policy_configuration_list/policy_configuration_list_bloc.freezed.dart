// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'policy_configuration_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PolicyConfigurationListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolicyConfigurationListEventCopyWith<$Res> {
  factory $PolicyConfigurationListEventCopyWith(
          PolicyConfigurationListEvent value,
          $Res Function(PolicyConfigurationListEvent) then) =
      _$PolicyConfigurationListEventCopyWithImpl<$Res,
          PolicyConfigurationListEvent>;
}

/// @nodoc
class _$PolicyConfigurationListEventCopyWithImpl<$Res,
        $Val extends PolicyConfigurationListEvent>
    implements $PolicyConfigurationListEventCopyWith<$Res> {
  _$PolicyConfigurationListEventCopyWithImpl(this._value, this._then);

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
    extends _$PolicyConfigurationListEventCopyWithImpl<$Res, _$_initialized>
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
    return 'PolicyConfigurationListEvent.initialized()';
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
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
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
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements PolicyConfigurationListEvent {
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
    extends _$PolicyConfigurationListEventCopyWithImpl<$Res, _$_Fetch>
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
    return 'PolicyConfigurationListEvent.fetch(salesOrganisation: $salesOrganisation)';
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
  }) {
    return fetch(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? fetch,
  }) {
    return fetch?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? fetch,
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
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PolicyConfigurationListEvent {
  const factory _Fetch({required final SalesOrganisation salesOrganisation}) =
      _$_Fetch;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PolicyConfigurationListState {
  List<PolicyConfigurationList> get policyConfigurationList =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PolicyConfigurationListStateCopyWith<PolicyConfigurationListState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolicyConfigurationListStateCopyWith<$Res> {
  factory $PolicyConfigurationListStateCopyWith(
          PolicyConfigurationListState value,
          $Res Function(PolicyConfigurationListState) then) =
      _$PolicyConfigurationListStateCopyWithImpl<$Res,
          PolicyConfigurationListState>;
  @useResult
  $Res call(
      {List<PolicyConfigurationList> policyConfigurationList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class _$PolicyConfigurationListStateCopyWithImpl<$Res,
        $Val extends PolicyConfigurationListState>
    implements $PolicyConfigurationListStateCopyWith<$Res> {
  _$PolicyConfigurationListStateCopyWithImpl(this._value, this._then);

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
              as List<PolicyConfigurationList>,
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
abstract class _$$_PolicyConfigurationListStateCopyWith<$Res>
    implements $PolicyConfigurationListStateCopyWith<$Res> {
  factory _$$_PolicyConfigurationListStateCopyWith(
          _$_PolicyConfigurationListState value,
          $Res Function(_$_PolicyConfigurationListState) then) =
      __$$_PolicyConfigurationListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PolicyConfigurationList> policyConfigurationList,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class __$$_PolicyConfigurationListStateCopyWithImpl<$Res>
    extends _$PolicyConfigurationListStateCopyWithImpl<$Res,
        _$_PolicyConfigurationListState>
    implements _$$_PolicyConfigurationListStateCopyWith<$Res> {
  __$$_PolicyConfigurationListStateCopyWithImpl(
      _$_PolicyConfigurationListState _value,
      $Res Function(_$_PolicyConfigurationListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? policyConfigurationList = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_$_PolicyConfigurationListState(
      policyConfigurationList: null == policyConfigurationList
          ? _value._policyConfigurationList
          : policyConfigurationList // ignore: cast_nullable_to_non_nullable
              as List<PolicyConfigurationList>,
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

class _$_PolicyConfigurationListState implements _PolicyConfigurationListState {
  const _$_PolicyConfigurationListState(
      {required final List<PolicyConfigurationList> policyConfigurationList,
      required this.failureOrSuccessOption,
      required this.isLoading})
      : _policyConfigurationList = policyConfigurationList;

  final List<PolicyConfigurationList> _policyConfigurationList;
  @override
  List<PolicyConfigurationList> get policyConfigurationList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_policyConfigurationList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PolicyConfigurationListState(policyConfigurationList: $policyConfigurationList, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PolicyConfigurationListState &&
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
  _$$_PolicyConfigurationListStateCopyWith<_$_PolicyConfigurationListState>
      get copyWith => __$$_PolicyConfigurationListStateCopyWithImpl<
          _$_PolicyConfigurationListState>(this, _$identity);
}

abstract class _PolicyConfigurationListState
    implements PolicyConfigurationListState {
  const factory _PolicyConfigurationListState(
      {required final List<PolicyConfigurationList> policyConfigurationList,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading}) = _$_PolicyConfigurationListState;

  @override
  List<PolicyConfigurationList> get policyConfigurationList;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_PolicyConfigurationListStateCopyWith<_$_PolicyConfigurationListState>
      get copyWith => throw _privateConstructorUsedError;
}
