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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IntroEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialIndex,
    required TResult Function(int index) setIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialIndex,
    TResult? Function(int index)? setIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialIndex,
    TResult Function(int index)? setIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialIndex value) initialIndex,
    required TResult Function(_SetIndex value) setIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialIndex value)? initialIndex,
    TResult? Function(_SetIndex value)? setIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialIndex value)? initialIndex,
    TResult Function(_SetIndex value)? setIndex,
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
abstract class _$$_InitialIndexCopyWith<$Res> {
  factory _$$_InitialIndexCopyWith(
          _$_InitialIndex value, $Res Function(_$_InitialIndex) then) =
      __$$_InitialIndexCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialIndexCopyWithImpl<$Res>
    extends _$IntroEventCopyWithImpl<$Res, _$_InitialIndex>
    implements _$$_InitialIndexCopyWith<$Res> {
  __$$_InitialIndexCopyWithImpl(
      _$_InitialIndex _value, $Res Function(_$_InitialIndex) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialIndex implements _InitialIndex {
  const _$_InitialIndex();

  @override
  String toString() {
    return 'IntroEvent.initialIndex()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialIndex);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialIndex,
    required TResult Function(int index) setIndex,
  }) {
    return initialIndex();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialIndex,
    TResult? Function(int index)? setIndex,
  }) {
    return initialIndex?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialIndex,
    TResult Function(int index)? setIndex,
    required TResult orElse(),
  }) {
    if (initialIndex != null) {
      return initialIndex();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialIndex value) initialIndex,
    required TResult Function(_SetIndex value) setIndex,
  }) {
    return initialIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialIndex value)? initialIndex,
    TResult? Function(_SetIndex value)? setIndex,
  }) {
    return initialIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialIndex value)? initialIndex,
    TResult Function(_SetIndex value)? setIndex,
    required TResult orElse(),
  }) {
    if (initialIndex != null) {
      return initialIndex(this);
    }
    return orElse();
  }
}

abstract class _InitialIndex implements IntroEvent {
  const factory _InitialIndex() = _$_InitialIndex;
}

/// @nodoc
abstract class _$$_SetIndexCopyWith<$Res> {
  factory _$$_SetIndexCopyWith(
          _$_SetIndex value, $Res Function(_$_SetIndex) then) =
      __$$_SetIndexCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_SetIndexCopyWithImpl<$Res>
    extends _$IntroEventCopyWithImpl<$Res, _$_SetIndex>
    implements _$$_SetIndexCopyWith<$Res> {
  __$$_SetIndexCopyWithImpl(
      _$_SetIndex _value, $Res Function(_$_SetIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_SetIndex(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SetIndex implements _SetIndex {
  const _$_SetIndex({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'IntroEvent.setIndex(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetIndex &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetIndexCopyWith<_$_SetIndex> get copyWith =>
      __$$_SetIndexCopyWithImpl<_$_SetIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialIndex,
    required TResult Function(int index) setIndex,
  }) {
    return setIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialIndex,
    TResult? Function(int index)? setIndex,
  }) {
    return setIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialIndex,
    TResult Function(int index)? setIndex,
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
    required TResult Function(_InitialIndex value) initialIndex,
    required TResult Function(_SetIndex value) setIndex,
  }) {
    return setIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialIndex value)? initialIndex,
    TResult? Function(_SetIndex value)? setIndex,
  }) {
    return setIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialIndex value)? initialIndex,
    TResult Function(_SetIndex value)? setIndex,
    required TResult orElse(),
  }) {
    if (setIndex != null) {
      return setIndex(this);
    }
    return orElse();
  }
}

abstract class _SetIndex implements IntroEvent {
  const factory _SetIndex({required final int index}) = _$_SetIndex;

  int get index;
  @JsonKey(ignore: true)
  _$$_SetIndexCopyWith<_$_SetIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IntroState {
  int get index => throw _privateConstructorUsedError;

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
  $Res call({int index});
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
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IntroStateCopyWith<$Res>
    implements $IntroStateCopyWith<$Res> {
  factory _$$_IntroStateCopyWith(
          _$_IntroState value, $Res Function(_$_IntroState) then) =
      __$$_IntroStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_IntroStateCopyWithImpl<$Res>
    extends _$IntroStateCopyWithImpl<$Res, _$_IntroState>
    implements _$$_IntroStateCopyWith<$Res> {
  __$$_IntroStateCopyWithImpl(
      _$_IntroState _value, $Res Function(_$_IntroState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_IntroState(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_IntroState extends _IntroState {
  const _$_IntroState({required this.index}) : super._();

  @override
  final int index;

  @override
  String toString() {
    return 'IntroState(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IntroState &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IntroStateCopyWith<_$_IntroState> get copyWith =>
      __$$_IntroStateCopyWithImpl<_$_IntroState>(this, _$identity);
}

abstract class _IntroState extends IntroState {
  const factory _IntroState({required final int index}) = _$_IntroState;
  const _IntroState._() : super._();

  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_IntroStateCopyWith<_$_IntroState> get copyWith =>
      throw _privateConstructorUsedError;
}
