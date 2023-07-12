// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bundle_add_to_cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BundleAddToCartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialInfo bundle, List<MaterialInfo> bundleMaterials)
        set,
    required TResult Function(MaterialNumber materialNumber, int quantity)
        updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(MaterialInfo bundle, List<MaterialInfo> bundleMaterials)?
        set,
    TResult? Function(MaterialNumber materialNumber, int quantity)?
        updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(MaterialInfo bundle, List<MaterialInfo> bundleMaterials)?
        set,
    TResult Function(MaterialNumber materialNumber, int quantity)?
        updateQuantity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Set value) set,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Set value)? set,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Set value)? set,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleAddToCartEventCopyWith<$Res> {
  factory $BundleAddToCartEventCopyWith(BundleAddToCartEvent value,
          $Res Function(BundleAddToCartEvent) then) =
      _$BundleAddToCartEventCopyWithImpl<$Res, BundleAddToCartEvent>;
}

/// @nodoc
class _$BundleAddToCartEventCopyWithImpl<$Res,
        $Val extends BundleAddToCartEvent>
    implements $BundleAddToCartEventCopyWith<$Res> {
  _$BundleAddToCartEventCopyWithImpl(this._value, this._then);

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
    extends _$BundleAddToCartEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'BundleAddToCartEvent.initialized()';
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
            MaterialInfo bundle, List<MaterialInfo> bundleMaterials)
        set,
    required TResult Function(MaterialNumber materialNumber, int quantity)
        updateQuantity,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(MaterialInfo bundle, List<MaterialInfo> bundleMaterials)?
        set,
    TResult? Function(MaterialNumber materialNumber, int quantity)?
        updateQuantity,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(MaterialInfo bundle, List<MaterialInfo> bundleMaterials)?
        set,
    TResult Function(MaterialNumber materialNumber, int quantity)?
        updateQuantity,
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
    required TResult Function(_Set value) set,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Set value)? set,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Set value)? set,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements BundleAddToCartEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_SetCopyWith<$Res> {
  factory _$$_SetCopyWith(_$_Set value, $Res Function(_$_Set) then) =
      __$$_SetCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo bundle, List<MaterialInfo> bundleMaterials});

  $MaterialInfoCopyWith<$Res> get bundle;
}

/// @nodoc
class __$$_SetCopyWithImpl<$Res>
    extends _$BundleAddToCartEventCopyWithImpl<$Res, _$_Set>
    implements _$$_SetCopyWith<$Res> {
  __$$_SetCopyWithImpl(_$_Set _value, $Res Function(_$_Set) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundle = null,
    Object? bundleMaterials = null,
  }) {
    return _then(_$_Set(
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      bundleMaterials: null == bundleMaterials
          ? _value._bundleMaterials
          : bundleMaterials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get bundle {
    return $MaterialInfoCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value));
    });
  }
}

/// @nodoc

class _$_Set implements _Set {
  const _$_Set(
      {required this.bundle, required final List<MaterialInfo> bundleMaterials})
      : _bundleMaterials = bundleMaterials;

  @override
  final MaterialInfo bundle;
  final List<MaterialInfo> _bundleMaterials;
  @override
  List<MaterialInfo> get bundleMaterials {
    if (_bundleMaterials is EqualUnmodifiableListView) return _bundleMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleMaterials);
  }

  @override
  String toString() {
    return 'BundleAddToCartEvent.set(bundle: $bundle, bundleMaterials: $bundleMaterials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Set &&
            (identical(other.bundle, bundle) || other.bundle == bundle) &&
            const DeepCollectionEquality()
                .equals(other._bundleMaterials, _bundleMaterials));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bundle,
      const DeepCollectionEquality().hash(_bundleMaterials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetCopyWith<_$_Set> get copyWith =>
      __$$_SetCopyWithImpl<_$_Set>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialInfo bundle, List<MaterialInfo> bundleMaterials)
        set,
    required TResult Function(MaterialNumber materialNumber, int quantity)
        updateQuantity,
  }) {
    return set(bundle, bundleMaterials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(MaterialInfo bundle, List<MaterialInfo> bundleMaterials)?
        set,
    TResult? Function(MaterialNumber materialNumber, int quantity)?
        updateQuantity,
  }) {
    return set?.call(bundle, bundleMaterials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(MaterialInfo bundle, List<MaterialInfo> bundleMaterials)?
        set,
    TResult Function(MaterialNumber materialNumber, int quantity)?
        updateQuantity,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(bundle, bundleMaterials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Set value) set,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Set value)? set,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Set value)? set,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class _Set implements BundleAddToCartEvent {
  const factory _Set(
      {required final MaterialInfo bundle,
      required final List<MaterialInfo> bundleMaterials}) = _$_Set;

  MaterialInfo get bundle;
  List<MaterialInfo> get bundleMaterials;
  @JsonKey(ignore: true)
  _$$_SetCopyWith<_$_Set> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateQuantityCopyWith<$Res> {
  factory _$$_UpdateQuantityCopyWith(
          _$_UpdateQuantity value, $Res Function(_$_UpdateQuantity) then) =
      __$$_UpdateQuantityCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber materialNumber, int quantity});
}

/// @nodoc
class __$$_UpdateQuantityCopyWithImpl<$Res>
    extends _$BundleAddToCartEventCopyWithImpl<$Res, _$_UpdateQuantity>
    implements _$$_UpdateQuantityCopyWith<$Res> {
  __$$_UpdateQuantityCopyWithImpl(
      _$_UpdateQuantity _value, $Res Function(_$_UpdateQuantity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? quantity = null,
  }) {
    return _then(_$_UpdateQuantity(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UpdateQuantity implements _UpdateQuantity {
  const _$_UpdateQuantity(
      {required this.materialNumber, required this.quantity});

  @override
  final MaterialNumber materialNumber;
  @override
  final int quantity;

  @override
  String toString() {
    return 'BundleAddToCartEvent.updateQuantity(materialNumber: $materialNumber, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateQuantity &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      __$$_UpdateQuantityCopyWithImpl<_$_UpdateQuantity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            MaterialInfo bundle, List<MaterialInfo> bundleMaterials)
        set,
    required TResult Function(MaterialNumber materialNumber, int quantity)
        updateQuantity,
  }) {
    return updateQuantity(materialNumber, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(MaterialInfo bundle, List<MaterialInfo> bundleMaterials)?
        set,
    TResult? Function(MaterialNumber materialNumber, int quantity)?
        updateQuantity,
  }) {
    return updateQuantity?.call(materialNumber, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(MaterialInfo bundle, List<MaterialInfo> bundleMaterials)?
        set,
    TResult Function(MaterialNumber materialNumber, int quantity)?
        updateQuantity,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(materialNumber, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Set value) set,
    required TResult Function(_UpdateQuantity value) updateQuantity,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Set value)? set,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Set value)? set,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements BundleAddToCartEvent {
  const factory _UpdateQuantity(
      {required final MaterialNumber materialNumber,
      required final int quantity}) = _$_UpdateQuantity;

  MaterialNumber get materialNumber;
  int get quantity;
  @JsonKey(ignore: true)
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BundleAddToCartState {
  MaterialInfo get bundle => throw _privateConstructorUsedError;
  List<MaterialInfo> get bundleMaterials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BundleAddToCartStateCopyWith<BundleAddToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleAddToCartStateCopyWith<$Res> {
  factory $BundleAddToCartStateCopyWith(BundleAddToCartState value,
          $Res Function(BundleAddToCartState) then) =
      _$BundleAddToCartStateCopyWithImpl<$Res, BundleAddToCartState>;
  @useResult
  $Res call({MaterialInfo bundle, List<MaterialInfo> bundleMaterials});

  $MaterialInfoCopyWith<$Res> get bundle;
}

/// @nodoc
class _$BundleAddToCartStateCopyWithImpl<$Res,
        $Val extends BundleAddToCartState>
    implements $BundleAddToCartStateCopyWith<$Res> {
  _$BundleAddToCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundle = null,
    Object? bundleMaterials = null,
  }) {
    return _then(_value.copyWith(
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      bundleMaterials: null == bundleMaterials
          ? _value.bundleMaterials
          : bundleMaterials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get bundle {
    return $MaterialInfoCopyWith<$Res>(_value.bundle, (value) {
      return _then(_value.copyWith(bundle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BundleAddToCartStateCopyWith<$Res>
    implements $BundleAddToCartStateCopyWith<$Res> {
  factory _$$_BundleAddToCartStateCopyWith(_$_BundleAddToCartState value,
          $Res Function(_$_BundleAddToCartState) then) =
      __$$_BundleAddToCartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MaterialInfo bundle, List<MaterialInfo> bundleMaterials});

  @override
  $MaterialInfoCopyWith<$Res> get bundle;
}

/// @nodoc
class __$$_BundleAddToCartStateCopyWithImpl<$Res>
    extends _$BundleAddToCartStateCopyWithImpl<$Res, _$_BundleAddToCartState>
    implements _$$_BundleAddToCartStateCopyWith<$Res> {
  __$$_BundleAddToCartStateCopyWithImpl(_$_BundleAddToCartState _value,
      $Res Function(_$_BundleAddToCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundle = null,
    Object? bundleMaterials = null,
  }) {
    return _then(_$_BundleAddToCartState(
      bundle: null == bundle
          ? _value.bundle
          : bundle // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      bundleMaterials: null == bundleMaterials
          ? _value._bundleMaterials
          : bundleMaterials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ));
  }
}

/// @nodoc

class _$_BundleAddToCartState extends _BundleAddToCartState {
  const _$_BundleAddToCartState(
      {required this.bundle, required final List<MaterialInfo> bundleMaterials})
      : _bundleMaterials = bundleMaterials,
        super._();

  @override
  final MaterialInfo bundle;
  final List<MaterialInfo> _bundleMaterials;
  @override
  List<MaterialInfo> get bundleMaterials {
    if (_bundleMaterials is EqualUnmodifiableListView) return _bundleMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleMaterials);
  }

  @override
  String toString() {
    return 'BundleAddToCartState(bundle: $bundle, bundleMaterials: $bundleMaterials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BundleAddToCartState &&
            (identical(other.bundle, bundle) || other.bundle == bundle) &&
            const DeepCollectionEquality()
                .equals(other._bundleMaterials, _bundleMaterials));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bundle,
      const DeepCollectionEquality().hash(_bundleMaterials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BundleAddToCartStateCopyWith<_$_BundleAddToCartState> get copyWith =>
      __$$_BundleAddToCartStateCopyWithImpl<_$_BundleAddToCartState>(
          this, _$identity);
}

abstract class _BundleAddToCartState extends BundleAddToCartState {
  const factory _BundleAddToCartState(
          {required final MaterialInfo bundle,
          required final List<MaterialInfo> bundleMaterials}) =
      _$_BundleAddToCartState;
  const _BundleAddToCartState._() : super._();

  @override
  MaterialInfo get bundle;
  @override
  List<MaterialInfo> get bundleMaterials;
  @override
  @JsonKey(ignore: true)
  _$$_BundleAddToCartStateCopyWith<_$_BundleAddToCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
