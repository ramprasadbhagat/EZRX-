// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_image_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductImageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(List<dynamic> list) fetch,
    required TResult Function(
            Map<MaterialNumber, ProductImages> productImageMap)
        set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<dynamic> list)? fetch,
    TResult? Function(Map<MaterialNumber, ProductImages> productImageMap)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<dynamic> list)? fetch,
    TResult Function(Map<MaterialNumber, ProductImages> productImageMap)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Set value) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Set value)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Set value)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageEventCopyWith<$Res> {
  factory $ProductImageEventCopyWith(
          ProductImageEvent value, $Res Function(ProductImageEvent) then) =
      _$ProductImageEventCopyWithImpl<$Res, ProductImageEvent>;
}

/// @nodoc
class _$ProductImageEventCopyWithImpl<$Res, $Val extends ProductImageEvent>
    implements $ProductImageEventCopyWith<$Res> {
  _$ProductImageEventCopyWithImpl(this._value, this._then);

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
    extends _$ProductImageEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'ProductImageEvent.initialized()';
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
    required TResult Function(List<dynamic> list) fetch,
    required TResult Function(
            Map<MaterialNumber, ProductImages> productImageMap)
        set,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<dynamic> list)? fetch,
    TResult? Function(Map<MaterialNumber, ProductImages> productImageMap)? set,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<dynamic> list)? fetch,
    TResult Function(Map<MaterialNumber, ProductImages> productImageMap)? set,
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
    required TResult Function(_Set value) set,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Set value)? set,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Set value)? set,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ProductImageEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({List<dynamic> list});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ProductImageEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_Fetch(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch({required final List<dynamic> list}) : _list = list;

  final List<dynamic> _list;
  @override
  List<dynamic> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'ProductImageEvent.fetch(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(List<dynamic> list) fetch,
    required TResult Function(
            Map<MaterialNumber, ProductImages> productImageMap)
        set,
  }) {
    return fetch(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<dynamic> list)? fetch,
    TResult? Function(Map<MaterialNumber, ProductImages> productImageMap)? set,
  }) {
    return fetch?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<dynamic> list)? fetch,
    TResult Function(Map<MaterialNumber, ProductImages> productImageMap)? set,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Set value) set,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Set value)? set,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Set value)? set,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ProductImageEvent {
  const factory _Fetch({required final List<dynamic> list}) = _$_Fetch;

  List<dynamic> get list;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetCopyWith<$Res> {
  factory _$$_SetCopyWith(_$_Set value, $Res Function(_$_Set) then) =
      __$$_SetCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<MaterialNumber, ProductImages> productImageMap});
}

/// @nodoc
class __$$_SetCopyWithImpl<$Res>
    extends _$ProductImageEventCopyWithImpl<$Res, _$_Set>
    implements _$$_SetCopyWith<$Res> {
  __$$_SetCopyWithImpl(_$_Set _value, $Res Function(_$_Set) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImageMap = null,
  }) {
    return _then(_$_Set(
      productImageMap: null == productImageMap
          ? _value._productImageMap
          : productImageMap // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, ProductImages>,
    ));
  }
}

/// @nodoc

class _$_Set implements _Set {
  const _$_Set(
      {required final Map<MaterialNumber, ProductImages> productImageMap})
      : _productImageMap = productImageMap;

  final Map<MaterialNumber, ProductImages> _productImageMap;
  @override
  Map<MaterialNumber, ProductImages> get productImageMap {
    if (_productImageMap is EqualUnmodifiableMapView) return _productImageMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_productImageMap);
  }

  @override
  String toString() {
    return 'ProductImageEvent.set(productImageMap: $productImageMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Set &&
            const DeepCollectionEquality()
                .equals(other._productImageMap, _productImageMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productImageMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetCopyWith<_$_Set> get copyWith =>
      __$$_SetCopyWithImpl<_$_Set>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(List<dynamic> list) fetch,
    required TResult Function(
            Map<MaterialNumber, ProductImages> productImageMap)
        set,
  }) {
    return set(productImageMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<dynamic> list)? fetch,
    TResult? Function(Map<MaterialNumber, ProductImages> productImageMap)? set,
  }) {
    return set?.call(productImageMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<dynamic> list)? fetch,
    TResult Function(Map<MaterialNumber, ProductImages> productImageMap)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(productImageMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Set value) set,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Set value)? set,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Set value)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class _Set implements ProductImageEvent {
  const factory _Set(
          {required final Map<MaterialNumber, ProductImages> productImageMap}) =
      _$_Set;

  Map<MaterialNumber, ProductImages> get productImageMap;
  @JsonKey(ignore: true)
  _$$_SetCopyWith<_$_Set> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductImageState {
  Map<MaterialNumber, ProductImages> get productImageMap =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductImageStateCopyWith<ProductImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageStateCopyWith<$Res> {
  factory $ProductImageStateCopyWith(
          ProductImageState value, $Res Function(ProductImageState) then) =
      _$ProductImageStateCopyWithImpl<$Res, ProductImageState>;
  @useResult
  $Res call(
      {Map<MaterialNumber, ProductImages> productImageMap, bool isFetching});
}

/// @nodoc
class _$ProductImageStateCopyWithImpl<$Res, $Val extends ProductImageState>
    implements $ProductImageStateCopyWith<$Res> {
  _$ProductImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImageMap = null,
    Object? isFetching = null,
  }) {
    return _then(_value.copyWith(
      productImageMap: null == productImageMap
          ? _value.productImageMap
          : productImageMap // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, ProductImages>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductImageStateCopyWith<$Res>
    implements $ProductImageStateCopyWith<$Res> {
  factory _$$_ProductImageStateCopyWith(_$_ProductImageState value,
          $Res Function(_$_ProductImageState) then) =
      __$$_ProductImageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<MaterialNumber, ProductImages> productImageMap, bool isFetching});
}

/// @nodoc
class __$$_ProductImageStateCopyWithImpl<$Res>
    extends _$ProductImageStateCopyWithImpl<$Res, _$_ProductImageState>
    implements _$$_ProductImageStateCopyWith<$Res> {
  __$$_ProductImageStateCopyWithImpl(
      _$_ProductImageState _value, $Res Function(_$_ProductImageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImageMap = null,
    Object? isFetching = null,
  }) {
    return _then(_$_ProductImageState(
      productImageMap: null == productImageMap
          ? _value._productImageMap
          : productImageMap // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, ProductImages>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProductImageState extends _ProductImageState {
  const _$_ProductImageState(
      {required final Map<MaterialNumber, ProductImages> productImageMap,
      required this.isFetching})
      : _productImageMap = productImageMap,
        super._();

  final Map<MaterialNumber, ProductImages> _productImageMap;
  @override
  Map<MaterialNumber, ProductImages> get productImageMap {
    if (_productImageMap is EqualUnmodifiableMapView) return _productImageMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_productImageMap);
  }

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'ProductImageState(productImageMap: $productImageMap, isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductImageState &&
            const DeepCollectionEquality()
                .equals(other._productImageMap, _productImageMap) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productImageMap), isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductImageStateCopyWith<_$_ProductImageState> get copyWith =>
      __$$_ProductImageStateCopyWithImpl<_$_ProductImageState>(
          this, _$identity);
}

abstract class _ProductImageState extends ProductImageState {
  const factory _ProductImageState(
      {required final Map<MaterialNumber, ProductImages> productImageMap,
      required final bool isFetching}) = _$_ProductImageState;
  const _ProductImageState._() : super._();

  @override
  Map<MaterialNumber, ProductImages> get productImageMap;
  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$_ProductImageStateCopyWith<_$_ProductImageState> get copyWith =>
      throw _privateConstructorUsedError;
}
