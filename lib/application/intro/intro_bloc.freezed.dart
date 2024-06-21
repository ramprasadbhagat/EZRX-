// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IntroEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) setIndex,
    required TResult Function() checkAppFirstLaunch,
    required TResult Function() setAppFirstLaunch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? setIndex,
    TResult? Function()? checkAppFirstLaunch,
    TResult? Function()? setAppFirstLaunch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? setIndex,
    TResult Function()? checkAppFirstLaunch,
    TResult Function()? setAppFirstLaunch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetIndex value) setIndex,
    required TResult Function(_CheckAppFirstLaunch value) checkAppFirstLaunch,
    required TResult Function(_SetAppFirstLaunch value) setAppFirstLaunch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetIndex value)? setIndex,
    TResult? Function(_CheckAppFirstLaunch value)? checkAppFirstLaunch,
    TResult? Function(_SetAppFirstLaunch value)? setAppFirstLaunch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetIndex value)? setIndex,
    TResult Function(_CheckAppFirstLaunch value)? checkAppFirstLaunch,
    TResult Function(_SetAppFirstLaunch value)? setAppFirstLaunch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroEventCopyWith<$Res> {
  factory $IntroEventCopyWith(
          IntroEvent value, $Res Function(IntroEvent) then) =
      _$IntroEventCopyWithImpl<$Res, IntroEvent>;
}

/// @nodoc
class _$IntroEventCopyWithImpl<$Res, $Val extends IntroEvent>
    implements $IntroEventCopyWith<$Res> {
  _$IntroEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetIndexImplCopyWith<$Res> {
  factory _$$SetIndexImplCopyWith(
          _$SetIndexImpl value, $Res Function(_$SetIndexImpl) then) =
      __$$SetIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SetIndexImplCopyWithImpl<$Res>
    extends _$IntroEventCopyWithImpl<$Res, _$SetIndexImpl>
    implements _$$SetIndexImplCopyWith<$Res> {
  __$$SetIndexImplCopyWithImpl(
      _$SetIndexImpl _value, $Res Function(_$SetIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$SetIndexImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SetIndexImpl implements _SetIndex {
  const _$SetIndexImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'IntroEvent.setIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetIndexImplCopyWith<_$SetIndexImpl> get copyWith =>
      __$$SetIndexImplCopyWithImpl<_$SetIndexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) setIndex,
    required TResult Function() checkAppFirstLaunch,
    required TResult Function() setAppFirstLaunch,
  }) {
    return setIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? setIndex,
    TResult? Function()? checkAppFirstLaunch,
    TResult? Function()? setAppFirstLaunch,
  }) {
    return setIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? setIndex,
    TResult Function()? checkAppFirstLaunch,
    TResult Function()? setAppFirstLaunch,
    required TResult orElse(),
  }) {
    if (setIndex != null) {
      return setIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetIndex value) setIndex,
    required TResult Function(_CheckAppFirstLaunch value) checkAppFirstLaunch,
    required TResult Function(_SetAppFirstLaunch value) setAppFirstLaunch,
  }) {
    return setIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetIndex value)? setIndex,
    TResult? Function(_CheckAppFirstLaunch value)? checkAppFirstLaunch,
    TResult? Function(_SetAppFirstLaunch value)? setAppFirstLaunch,
  }) {
    return setIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetIndex value)? setIndex,
    TResult Function(_CheckAppFirstLaunch value)? checkAppFirstLaunch,
    TResult Function(_SetAppFirstLaunch value)? setAppFirstLaunch,
    required TResult orElse(),
  }) {
    if (setIndex != null) {
      return setIndex(this);
    }
    return orElse();
  }
}

abstract class _SetIndex implements IntroEvent {
  const factory _SetIndex({required final int index}) = _$SetIndexImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$SetIndexImplCopyWith<_$SetIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckAppFirstLaunchImplCopyWith<$Res> {
  factory _$$CheckAppFirstLaunchImplCopyWith(_$CheckAppFirstLaunchImpl value,
          $Res Function(_$CheckAppFirstLaunchImpl) then) =
      __$$CheckAppFirstLaunchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAppFirstLaunchImplCopyWithImpl<$Res>
    extends _$IntroEventCopyWithImpl<$Res, _$CheckAppFirstLaunchImpl>
    implements _$$CheckAppFirstLaunchImplCopyWith<$Res> {
  __$$CheckAppFirstLaunchImplCopyWithImpl(_$CheckAppFirstLaunchImpl _value,
      $Res Function(_$CheckAppFirstLaunchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckAppFirstLaunchImpl implements _CheckAppFirstLaunch {
  const _$CheckAppFirstLaunchImpl();

  @override
  String toString() {
    return 'IntroEvent.checkAppFirstLaunch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckAppFirstLaunchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) setIndex,
    required TResult Function() checkAppFirstLaunch,
    required TResult Function() setAppFirstLaunch,
  }) {
    return checkAppFirstLaunch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? setIndex,
    TResult? Function()? checkAppFirstLaunch,
    TResult? Function()? setAppFirstLaunch,
  }) {
    return checkAppFirstLaunch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? setIndex,
    TResult Function()? checkAppFirstLaunch,
    TResult Function()? setAppFirstLaunch,
    required TResult orElse(),
  }) {
    if (checkAppFirstLaunch != null) {
      return checkAppFirstLaunch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetIndex value) setIndex,
    required TResult Function(_CheckAppFirstLaunch value) checkAppFirstLaunch,
    required TResult Function(_SetAppFirstLaunch value) setAppFirstLaunch,
  }) {
    return checkAppFirstLaunch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetIndex value)? setIndex,
    TResult? Function(_CheckAppFirstLaunch value)? checkAppFirstLaunch,
    TResult? Function(_SetAppFirstLaunch value)? setAppFirstLaunch,
  }) {
    return checkAppFirstLaunch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetIndex value)? setIndex,
    TResult Function(_CheckAppFirstLaunch value)? checkAppFirstLaunch,
    TResult Function(_SetAppFirstLaunch value)? setAppFirstLaunch,
    required TResult orElse(),
  }) {
    if (checkAppFirstLaunch != null) {
      return checkAppFirstLaunch(this);
    }
    return orElse();
  }
}

abstract class _CheckAppFirstLaunch implements IntroEvent {
  const factory _CheckAppFirstLaunch() = _$CheckAppFirstLaunchImpl;
}

/// @nodoc
abstract class _$$SetAppFirstLaunchImplCopyWith<$Res> {
  factory _$$SetAppFirstLaunchImplCopyWith(_$SetAppFirstLaunchImpl value,
          $Res Function(_$SetAppFirstLaunchImpl) then) =
      __$$SetAppFirstLaunchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetAppFirstLaunchImplCopyWithImpl<$Res>
    extends _$IntroEventCopyWithImpl<$Res, _$SetAppFirstLaunchImpl>
    implements _$$SetAppFirstLaunchImplCopyWith<$Res> {
  __$$SetAppFirstLaunchImplCopyWithImpl(_$SetAppFirstLaunchImpl _value,
      $Res Function(_$SetAppFirstLaunchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetAppFirstLaunchImpl implements _SetAppFirstLaunch {
  const _$SetAppFirstLaunchImpl();

  @override
  String toString() {
    return 'IntroEvent.setAppFirstLaunch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetAppFirstLaunchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) setIndex,
    required TResult Function() checkAppFirstLaunch,
    required TResult Function() setAppFirstLaunch,
  }) {
    return setAppFirstLaunch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? setIndex,
    TResult? Function()? checkAppFirstLaunch,
    TResult? Function()? setAppFirstLaunch,
  }) {
    return setAppFirstLaunch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? setIndex,
    TResult Function()? checkAppFirstLaunch,
    TResult Function()? setAppFirstLaunch,
    required TResult orElse(),
  }) {
    if (setAppFirstLaunch != null) {
      return setAppFirstLaunch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetIndex value) setIndex,
    required TResult Function(_CheckAppFirstLaunch value) checkAppFirstLaunch,
    required TResult Function(_SetAppFirstLaunch value) setAppFirstLaunch,
  }) {
    return setAppFirstLaunch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetIndex value)? setIndex,
    TResult? Function(_CheckAppFirstLaunch value)? checkAppFirstLaunch,
    TResult? Function(_SetAppFirstLaunch value)? setAppFirstLaunch,
  }) {
    return setAppFirstLaunch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetIndex value)? setIndex,
    TResult Function(_CheckAppFirstLaunch value)? checkAppFirstLaunch,
    TResult Function(_SetAppFirstLaunch value)? setAppFirstLaunch,
    required TResult orElse(),
  }) {
    if (setAppFirstLaunch != null) {
      return setAppFirstLaunch(this);
    }
    return orElse();
  }
}

abstract class _SetAppFirstLaunch implements IntroEvent {
  const factory _SetAppFirstLaunch() = _$SetAppFirstLaunchImpl;
}

/// @nodoc
mixin _$IntroState {
  int get index => throw _privateConstructorUsedError;
  bool get isAppFirstLaunch => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntroStateCopyWith<IntroState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroStateCopyWith<$Res> {
  factory $IntroStateCopyWith(
          IntroState value, $Res Function(IntroState) then) =
      _$IntroStateCopyWithImpl<$Res, IntroState>;
  @useResult
  $Res call({int index, bool isAppFirstLaunch, bool isLoading});
}

/// @nodoc
class _$IntroStateCopyWithImpl<$Res, $Val extends IntroState>
    implements $IntroStateCopyWith<$Res> {
  _$IntroStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? isAppFirstLaunch = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isAppFirstLaunch: null == isAppFirstLaunch
          ? _value.isAppFirstLaunch
          : isAppFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntroStateImplCopyWith<$Res>
    implements $IntroStateCopyWith<$Res> {
  factory _$$IntroStateImplCopyWith(
          _$IntroStateImpl value, $Res Function(_$IntroStateImpl) then) =
      __$$IntroStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, bool isAppFirstLaunch, bool isLoading});
}

/// @nodoc
class __$$IntroStateImplCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res, _$IntroStateImpl>
    implements _$$IntroStateImplCopyWith<$Res> {
  __$$IntroStateImplCopyWithImpl(
      _$IntroStateImpl _value, $Res Function(_$IntroStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? isAppFirstLaunch = null,
    Object? isLoading = null,
  }) {
    return _then(_$IntroStateImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isAppFirstLaunch: null == isAppFirstLaunch
          ? _value.isAppFirstLaunch
          : isAppFirstLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IntroStateImpl extends _IntroState {
  const _$IntroStateImpl(
      {required this.index,
      required this.isAppFirstLaunch,
      required this.isLoading})
      : super._();

  @override
  final int index;
  @override
  final bool isAppFirstLaunch;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'IntroState(index: $index, isAppFirstLaunch: $isAppFirstLaunch, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntroStateImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isAppFirstLaunch, isAppFirstLaunch) ||
                other.isAppFirstLaunch == isAppFirstLaunch) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, index, isAppFirstLaunch, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntroStateImplCopyWith<_$IntroStateImpl> get copyWith =>
      __$$IntroStateImplCopyWithImpl<_$IntroStateImpl>(this, _$identity);
}

abstract class _IntroState extends IntroState {
  const factory _IntroState(
      {required final int index,
      required final bool isAppFirstLaunch,
      required final bool isLoading}) = _$IntroStateImpl;
  const _IntroState._() : super._();

  @override
  int get index;
  @override
  bool get isAppFirstLaunch;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$IntroStateImplCopyWith<_$IntroStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
