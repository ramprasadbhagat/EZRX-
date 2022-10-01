// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favourite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavouriteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(Favourite item, bool isPackAndPick) add,
    required TResult Function(Favourite item) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteEventCopyWith<$Res> {
  factory $FavouriteEventCopyWith(
          FavouriteEvent value, $Res Function(FavouriteEvent) then) =
      _$FavouriteEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavouriteEventCopyWithImpl<$Res>
    implements $FavouriteEventCopyWith<$Res> {
  _$FavouriteEventCopyWithImpl(this._value, this._then);

  final FavouriteEvent _value;
  // ignore: unused_field
  final $Res Function(FavouriteEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$FavouriteEventCopyWithImpl<$Res>
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
    return 'FavouriteEvent.initialized()';
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
    required TResult Function() fetch,
    required TResult Function(Favourite item, bool isPackAndPick) add,
    required TResult Function(Favourite item) delete,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
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
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements FavouriteEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res> extends _$FavouriteEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'FavouriteEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(Favourite item, bool isPackAndPick) add,
    required TResult Function(Favourite item) delete,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements FavouriteEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
abstract class _$$_AddCopyWith<$Res> {
  factory _$$_AddCopyWith(_$_Add value, $Res Function(_$_Add) then) =
      __$$_AddCopyWithImpl<$Res>;
  $Res call({Favourite item, bool isPackAndPick});

  $FavouriteCopyWith<$Res> get item;
}

/// @nodoc
class __$$_AddCopyWithImpl<$Res> extends _$FavouriteEventCopyWithImpl<$Res>
    implements _$$_AddCopyWith<$Res> {
  __$$_AddCopyWithImpl(_$_Add _value, $Res Function(_$_Add) _then)
      : super(_value, (v) => _then(v as _$_Add));

  @override
  _$_Add get _value => super._value as _$_Add;

  @override
  $Res call({
    Object? item = freezed,
    Object? isPackAndPick = freezed,
  }) {
    return _then(_$_Add(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Favourite,
      isPackAndPick == freezed
          ? _value.isPackAndPick
          : isPackAndPick // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $FavouriteCopyWith<$Res> get item {
    return $FavouriteCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_Add implements _Add {
  const _$_Add(this.item, this.isPackAndPick);

  @override
  final Favourite item;
  @override
  final bool isPackAndPick;

  @override
  String toString() {
    return 'FavouriteEvent.add(item: $item, isPackAndPick: $isPackAndPick)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Add &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality()
                .equals(other.isPackAndPick, isPackAndPick));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(isPackAndPick));

  @JsonKey(ignore: true)
  @override
  _$$_AddCopyWith<_$_Add> get copyWith =>
      __$$_AddCopyWithImpl<_$_Add>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(Favourite item, bool isPackAndPick) add,
    required TResult Function(Favourite item) delete,
  }) {
    return add(item, isPackAndPick);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
  }) {
    return add?.call(item, isPackAndPick);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(item, isPackAndPick);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements FavouriteEvent {
  const factory _Add(final Favourite item, final bool isPackAndPick) = _$_Add;

  Favourite get item;
  bool get isPackAndPick;
  @JsonKey(ignore: true)
  _$$_AddCopyWith<_$_Add> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteCopyWith<$Res> {
  factory _$$_DeleteCopyWith(_$_Delete value, $Res Function(_$_Delete) then) =
      __$$_DeleteCopyWithImpl<$Res>;
  $Res call({Favourite item});

  $FavouriteCopyWith<$Res> get item;
}

/// @nodoc
class __$$_DeleteCopyWithImpl<$Res> extends _$FavouriteEventCopyWithImpl<$Res>
    implements _$$_DeleteCopyWith<$Res> {
  __$$_DeleteCopyWithImpl(_$_Delete _value, $Res Function(_$_Delete) _then)
      : super(_value, (v) => _then(v as _$_Delete));

  @override
  _$_Delete get _value => super._value as _$_Delete;

  @override
  $Res call({
    Object? item = freezed,
  }) {
    return _then(_$_Delete(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Favourite,
    ));
  }

  @override
  $FavouriteCopyWith<$Res> get item {
    return $FavouriteCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete(this.item);

  @override
  final Favourite item;

  @override
  String toString() {
    return 'FavouriteEvent.delete(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delete &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      __$$_DeleteCopyWithImpl<_$_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() fetch,
    required TResult Function(Favourite item, bool isPackAndPick) add,
    required TResult Function(Favourite item) delete,
  }) {
    return delete(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
  }) {
    return delete?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? fetch,
    TResult Function(Favourite item, bool isPackAndPick)? add,
    TResult Function(Favourite item)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements FavouriteEvent {
  const factory _Delete(final Favourite item) = _$_Delete;

  Favourite get item;
  @JsonKey(ignore: true)
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavouriteState {
  List<Favourite> get favouriteItems => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouriteStateCopyWith<FavouriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteStateCopyWith<$Res> {
  factory $FavouriteStateCopyWith(
          FavouriteState value, $Res Function(FavouriteState) then) =
      _$FavouriteStateCopyWithImpl<$Res>;
  $Res call(
      {List<Favourite> favouriteItems,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class _$FavouriteStateCopyWithImpl<$Res>
    implements $FavouriteStateCopyWith<$Res> {
  _$FavouriteStateCopyWithImpl(this._value, this._then);

  final FavouriteState _value;
  // ignore: unused_field
  final $Res Function(FavouriteState) _then;

  @override
  $Res call({
    Object? favouriteItems = freezed,
    Object? failureOrSuccessOption = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      favouriteItems: favouriteItems == freezed
          ? _value.favouriteItems
          : favouriteItems // ignore: cast_nullable_to_non_nullable
              as List<Favourite>,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_FavouriteStateCopyWith<$Res>
    implements $FavouriteStateCopyWith<$Res> {
  factory _$$_FavouriteStateCopyWith(
          _$_FavouriteState value, $Res Function(_$_FavouriteState) then) =
      __$$_FavouriteStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Favourite> favouriteItems,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class __$$_FavouriteStateCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res>
    implements _$$_FavouriteStateCopyWith<$Res> {
  __$$_FavouriteStateCopyWithImpl(
      _$_FavouriteState _value, $Res Function(_$_FavouriteState) _then)
      : super(_value, (v) => _then(v as _$_FavouriteState));

  @override
  _$_FavouriteState get _value => super._value as _$_FavouriteState;

  @override
  $Res call({
    Object? favouriteItems = freezed,
    Object? failureOrSuccessOption = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$_FavouriteState(
      favouriteItems: favouriteItems == freezed
          ? _value._favouriteItems
          : favouriteItems // ignore: cast_nullable_to_non_nullable
              as List<Favourite>,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FavouriteState implements _FavouriteState {
  const _$_FavouriteState(
      {required final List<Favourite> favouriteItems,
      required this.failureOrSuccessOption,
      required this.isLoading})
      : _favouriteItems = favouriteItems;

  final List<Favourite> _favouriteItems;
  @override
  List<Favourite> get favouriteItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favouriteItems);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'FavouriteState(favouriteItems: $favouriteItems, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouriteState &&
            const DeepCollectionEquality()
                .equals(other._favouriteItems, _favouriteItems) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccessOption, failureOrSuccessOption) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favouriteItems),
      const DeepCollectionEquality().hash(failureOrSuccessOption),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$_FavouriteStateCopyWith<_$_FavouriteState> get copyWith =>
      __$$_FavouriteStateCopyWithImpl<_$_FavouriteState>(this, _$identity);
}

abstract class _FavouriteState implements FavouriteState {
  const factory _FavouriteState(
      {required final List<Favourite> favouriteItems,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading}) = _$_FavouriteState;

  @override
  List<Favourite> get favouriteItems;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_FavouriteStateCopyWith<_$_FavouriteState> get copyWith =>
      throw _privateConstructorUsedError;
}
