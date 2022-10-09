// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ship_to_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShipToCodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ShipToInfo shipToInfo) selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ShipToInfo shipToInfo)? selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ShipToInfo shipToInfo)? selected,
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
abstract class $ShipToCodeEventCopyWith<$Res> {
  factory $ShipToCodeEventCopyWith(
          ShipToCodeEvent value, $Res Function(ShipToCodeEvent) then) =
      _$ShipToCodeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShipToCodeEventCopyWithImpl<$Res>
    implements $ShipToCodeEventCopyWith<$Res> {
  _$ShipToCodeEventCopyWithImpl(this._value, this._then);

  final ShipToCodeEvent _value;
  // ignore: unused_field
  final $Res Function(ShipToCodeEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$ShipToCodeEventCopyWithImpl<$Res>
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
    return 'ShipToCodeEvent.initialized()';
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
    required TResult Function(ShipToInfo shipToInfo) selected,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ShipToInfo shipToInfo)? selected,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ShipToInfo shipToInfo)? selected,
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

abstract class _Initialized implements ShipToCodeEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_SelectedCopyWith<$Res> {
  factory _$$_SelectedCopyWith(
          _$_Selected value, $Res Function(_$_Selected) then) =
      __$$_SelectedCopyWithImpl<$Res>;
  $Res call({ShipToInfo shipToInfo});

  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_SelectedCopyWithImpl<$Res>
    extends _$ShipToCodeEventCopyWithImpl<$Res>
    implements _$$_SelectedCopyWith<$Res> {
  __$$_SelectedCopyWithImpl(
      _$_Selected _value, $Res Function(_$_Selected) _then)
      : super(_value, (v) => _then(v as _$_Selected));

  @override
  _$_Selected get _value => super._value as _$_Selected;

  @override
  $Res call({
    Object? shipToInfo = freezed,
  }) {
    return _then(_$_Selected(
      shipToInfo: shipToInfo == freezed
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$_Selected implements _Selected {
  const _$_Selected({required this.shipToInfo});

  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ShipToCodeEvent.selected(shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Selected &&
            const DeepCollectionEquality()
                .equals(other.shipToInfo, shipToInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(shipToInfo));

  @JsonKey(ignore: true)
  @override
  _$$_SelectedCopyWith<_$_Selected> get copyWith =>
      __$$_SelectedCopyWithImpl<_$_Selected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ShipToInfo shipToInfo) selected,
  }) {
    return selected(shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ShipToInfo shipToInfo)? selected,
  }) {
    return selected?.call(shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ShipToInfo shipToInfo)? selected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(shipToInfo);
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

abstract class _Selected implements ShipToCodeEvent {
  const factory _Selected({required final ShipToInfo shipToInfo}) = _$_Selected;

  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$_SelectedCopyWith<_$_Selected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShipToCodeState {
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShipToCodeStateCopyWith<ShipToCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipToCodeStateCopyWith<$Res> {
  factory $ShipToCodeStateCopyWith(
          ShipToCodeState value, $Res Function(ShipToCodeState) then) =
      _$ShipToCodeStateCopyWithImpl<$Res>;
  $Res call({ShipToInfo shipToInfo});

  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class _$ShipToCodeStateCopyWithImpl<$Res>
    implements $ShipToCodeStateCopyWith<$Res> {
  _$ShipToCodeStateCopyWithImpl(this._value, this._then);

  final ShipToCodeState _value;
  // ignore: unused_field
  final $Res Function(ShipToCodeState) _then;

  @override
  $Res call({
    Object? shipToInfo = freezed,
  }) {
    return _then(_value.copyWith(
      shipToInfo: shipToInfo == freezed
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_ShipToCodeStateCopyWith<$Res>
    implements $ShipToCodeStateCopyWith<$Res> {
  factory _$$_ShipToCodeStateCopyWith(
          _$_ShipToCodeState value, $Res Function(_$_ShipToCodeState) then) =
      __$$_ShipToCodeStateCopyWithImpl<$Res>;
  @override
  $Res call({ShipToInfo shipToInfo});

  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$_ShipToCodeStateCopyWithImpl<$Res>
    extends _$ShipToCodeStateCopyWithImpl<$Res>
    implements _$$_ShipToCodeStateCopyWith<$Res> {
  __$$_ShipToCodeStateCopyWithImpl(
      _$_ShipToCodeState _value, $Res Function(_$_ShipToCodeState) _then)
      : super(_value, (v) => _then(v as _$_ShipToCodeState));

  @override
  _$_ShipToCodeState get _value => super._value as _$_ShipToCodeState;

  @override
  $Res call({
    Object? shipToInfo = freezed,
  }) {
    return _then(_$_ShipToCodeState(
      shipToInfo: shipToInfo == freezed
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }
}

/// @nodoc

class _$_ShipToCodeState extends _ShipToCodeState {
  const _$_ShipToCodeState({required this.shipToInfo}) : super._();

  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'ShipToCodeState(shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShipToCodeState &&
            const DeepCollectionEquality()
                .equals(other.shipToInfo, shipToInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(shipToInfo));

  @JsonKey(ignore: true)
  @override
  _$$_ShipToCodeStateCopyWith<_$_ShipToCodeState> get copyWith =>
      __$$_ShipToCodeStateCopyWithImpl<_$_ShipToCodeState>(this, _$identity);
}

abstract class _ShipToCodeState extends ShipToCodeState {
  const factory _ShipToCodeState({required final ShipToInfo shipToInfo}) =
      _$_ShipToCodeState;
  const _ShipToCodeState._() : super._();

  @override
  ShipToInfo get shipToInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ShipToCodeStateCopyWith<_$_ShipToCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}
