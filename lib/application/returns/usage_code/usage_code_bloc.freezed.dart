// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'usage_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsageCodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrg salesOrg) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg)? fetch,
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
abstract class $UsageCodeEventCopyWith<$Res> {
  factory $UsageCodeEventCopyWith(
          UsageCodeEvent value, $Res Function(UsageCodeEvent) then) =
      _$UsageCodeEventCopyWithImpl<$Res, UsageCodeEvent>;
}

/// @nodoc
class _$UsageCodeEventCopyWithImpl<$Res, $Val extends UsageCodeEvent>
    implements $UsageCodeEventCopyWith<$Res> {
  _$UsageCodeEventCopyWithImpl(this._value, this._then);

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
    extends _$UsageCodeEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'UsageCodeEvent.initialized()';
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
    required TResult Function(SalesOrg salesOrg) fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg)? fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg)? fetch,
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

abstract class _Initialized implements UsageCodeEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$UsageCodeEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$_Fetch(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'UsageCodeEvent.fetch(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrg salesOrg) fetch,
  }) {
    return fetch(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrg salesOrg)? fetch,
  }) {
    return fetch?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrg salesOrg)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrg);
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

abstract class _Fetch implements UsageCodeEvent {
  const factory _Fetch({required final SalesOrg salesOrg}) = _$_Fetch;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UsageCodeState {
  List<Usage> get usage => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get usageFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsageCodeStateCopyWith<UsageCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCodeStateCopyWith<$Res> {
  factory $UsageCodeStateCopyWith(
          UsageCodeState value, $Res Function(UsageCodeState) then) =
      _$UsageCodeStateCopyWithImpl<$Res, UsageCodeState>;
  @useResult
  $Res call(
      {List<Usage> usage,
      Option<Either<ApiFailure, dynamic>> usageFailureOrSuccessOption});
}

/// @nodoc
class _$UsageCodeStateCopyWithImpl<$Res, $Val extends UsageCodeState>
    implements $UsageCodeStateCopyWith<$Res> {
  _$UsageCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
    Object? usageFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as List<Usage>,
      usageFailureOrSuccessOption: null == usageFailureOrSuccessOption
          ? _value.usageFailureOrSuccessOption
          : usageFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsageCodeStateCopyWith<$Res>
    implements $UsageCodeStateCopyWith<$Res> {
  factory _$$_UsageCodeStateCopyWith(
          _$_UsageCodeState value, $Res Function(_$_UsageCodeState) then) =
      __$$_UsageCodeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Usage> usage,
      Option<Either<ApiFailure, dynamic>> usageFailureOrSuccessOption});
}

/// @nodoc
class __$$_UsageCodeStateCopyWithImpl<$Res>
    extends _$UsageCodeStateCopyWithImpl<$Res, _$_UsageCodeState>
    implements _$$_UsageCodeStateCopyWith<$Res> {
  __$$_UsageCodeStateCopyWithImpl(
      _$_UsageCodeState _value, $Res Function(_$_UsageCodeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
    Object? usageFailureOrSuccessOption = null,
  }) {
    return _then(_$_UsageCodeState(
      usage: null == usage
          ? _value._usage
          : usage // ignore: cast_nullable_to_non_nullable
              as List<Usage>,
      usageFailureOrSuccessOption: null == usageFailureOrSuccessOption
          ? _value.usageFailureOrSuccessOption
          : usageFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_UsageCodeState implements _UsageCodeState {
  const _$_UsageCodeState(
      {required final List<Usage> usage,
      required this.usageFailureOrSuccessOption})
      : _usage = usage;

  final List<Usage> _usage;
  @override
  List<Usage> get usage {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usage);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> usageFailureOrSuccessOption;

  @override
  String toString() {
    return 'UsageCodeState(usage: $usage, usageFailureOrSuccessOption: $usageFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsageCodeState &&
            const DeepCollectionEquality().equals(other._usage, _usage) &&
            (identical(other.usageFailureOrSuccessOption,
                    usageFailureOrSuccessOption) ||
                other.usageFailureOrSuccessOption ==
                    usageFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_usage), usageFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsageCodeStateCopyWith<_$_UsageCodeState> get copyWith =>
      __$$_UsageCodeStateCopyWithImpl<_$_UsageCodeState>(this, _$identity);
}

abstract class _UsageCodeState implements UsageCodeState {
  const factory _UsageCodeState(
      {required final List<Usage> usage,
      required final Option<Either<ApiFailure, dynamic>>
          usageFailureOrSuccessOption}) = _$_UsageCodeState;

  @override
  List<Usage> get usage;
  @override
  Option<Either<ApiFailure, dynamic>> get usageFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_UsageCodeStateCopyWith<_$_UsageCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
