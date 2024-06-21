// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_rep_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesRepEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
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
abstract class $SalesRepEventCopyWith<$Res> {
  factory $SalesRepEventCopyWith(
          SalesRepEvent value, $Res Function(SalesRepEvent) then) =
      _$SalesRepEventCopyWithImpl<$Res, SalesRepEvent>;
}

/// @nodoc
class _$SalesRepEventCopyWithImpl<$Res, $Val extends SalesRepEvent>
    implements $SalesRepEventCopyWith<$Res> {
  _$SalesRepEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$SalesRepEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'SalesRepEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user) fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user)? fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
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

abstract class _Initialized implements SalesRepEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$SalesRepEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$FetchImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'SalesRepEvent.fetch(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user) fetch,
  }) {
    return fetch(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user)? fetch,
  }) {
    return fetch?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(user);
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

abstract class _Fetch implements SalesRepEvent {
  const factory _Fetch({required final User user}) = _$FetchImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesRepState {
  SalesRepresentativeInfo get salesRepInfo =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get salesRepFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesRepStateCopyWith<SalesRepState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesRepStateCopyWith<$Res> {
  factory $SalesRepStateCopyWith(
          SalesRepState value, $Res Function(SalesRepState) then) =
      _$SalesRepStateCopyWithImpl<$Res, SalesRepState>;
  @useResult
  $Res call(
      {SalesRepresentativeInfo salesRepInfo,
      Option<Either<ApiFailure, dynamic>> salesRepFailureOrSuccessOption});

  $SalesRepresentativeInfoCopyWith<$Res> get salesRepInfo;
}

/// @nodoc
class _$SalesRepStateCopyWithImpl<$Res, $Val extends SalesRepState>
    implements $SalesRepStateCopyWith<$Res> {
  _$SalesRepStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesRepInfo = null,
    Object? salesRepFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      salesRepInfo: null == salesRepInfo
          ? _value.salesRepInfo
          : salesRepInfo // ignore: cast_nullable_to_non_nullable
              as SalesRepresentativeInfo,
      salesRepFailureOrSuccessOption: null == salesRepFailureOrSuccessOption
          ? _value.salesRepFailureOrSuccessOption
          : salesRepFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesRepresentativeInfoCopyWith<$Res> get salesRepInfo {
    return $SalesRepresentativeInfoCopyWith<$Res>(_value.salesRepInfo, (value) {
      return _then(_value.copyWith(salesRepInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesRepStateImplCopyWith<$Res>
    implements $SalesRepStateCopyWith<$Res> {
  factory _$$SalesRepStateImplCopyWith(
          _$SalesRepStateImpl value, $Res Function(_$SalesRepStateImpl) then) =
      __$$SalesRepStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesRepresentativeInfo salesRepInfo,
      Option<Either<ApiFailure, dynamic>> salesRepFailureOrSuccessOption});

  @override
  $SalesRepresentativeInfoCopyWith<$Res> get salesRepInfo;
}

/// @nodoc
class __$$SalesRepStateImplCopyWithImpl<$Res>
    extends _$SalesRepStateCopyWithImpl<$Res, _$SalesRepStateImpl>
    implements _$$SalesRepStateImplCopyWith<$Res> {
  __$$SalesRepStateImplCopyWithImpl(
      _$SalesRepStateImpl _value, $Res Function(_$SalesRepStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesRepInfo = null,
    Object? salesRepFailureOrSuccessOption = null,
  }) {
    return _then(_$SalesRepStateImpl(
      salesRepInfo: null == salesRepInfo
          ? _value.salesRepInfo
          : salesRepInfo // ignore: cast_nullable_to_non_nullable
              as SalesRepresentativeInfo,
      salesRepFailureOrSuccessOption: null == salesRepFailureOrSuccessOption
          ? _value.salesRepFailureOrSuccessOption
          : salesRepFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$SalesRepStateImpl implements _SalesRepState {
  const _$SalesRepStateImpl(
      {required this.salesRepInfo,
      required this.salesRepFailureOrSuccessOption});

  @override
  final SalesRepresentativeInfo salesRepInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> salesRepFailureOrSuccessOption;

  @override
  String toString() {
    return 'SalesRepState(salesRepInfo: $salesRepInfo, salesRepFailureOrSuccessOption: $salesRepFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesRepStateImpl &&
            (identical(other.salesRepInfo, salesRepInfo) ||
                other.salesRepInfo == salesRepInfo) &&
            (identical(other.salesRepFailureOrSuccessOption,
                    salesRepFailureOrSuccessOption) ||
                other.salesRepFailureOrSuccessOption ==
                    salesRepFailureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesRepInfo, salesRepFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesRepStateImplCopyWith<_$SalesRepStateImpl> get copyWith =>
      __$$SalesRepStateImplCopyWithImpl<_$SalesRepStateImpl>(this, _$identity);
}

abstract class _SalesRepState implements SalesRepState {
  const factory _SalesRepState(
      {required final SalesRepresentativeInfo salesRepInfo,
      required final Option<Either<ApiFailure, dynamic>>
          salesRepFailureOrSuccessOption}) = _$SalesRepStateImpl;

  @override
  SalesRepresentativeInfo get salesRepInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get salesRepFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$SalesRepStateImplCopyWith<_$SalesRepStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
