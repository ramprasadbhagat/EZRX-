// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRequestEventCopyWith<$Res> {
  factory $NewRequestEventCopyWith(
          NewRequestEvent value, $Res Function(NewRequestEvent) then) =
      _$NewRequestEventCopyWithImpl<$Res, NewRequestEvent>;
}

/// @nodoc
class _$NewRequestEventCopyWithImpl<$Res, $Val extends NewRequestEvent>
    implements $NewRequestEventCopyWith<$Res> {
  _$NewRequestEventCopyWithImpl(this._value, this._then);

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
    extends _$NewRequestEventCopyWithImpl<$Res, _$_initialized>
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
    return 'NewRequestEvent.initialized()';
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
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
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
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements NewRequestEvent {
  const factory _initialized() = _$_initialized;
}

/// @nodoc
abstract class _$$_ToggleReturnItemCopyWith<$Res> {
  factory _$$_ToggleReturnItemCopyWith(
          _$_ToggleReturnItem value, $Res Function(_$_ToggleReturnItem) then) =
      __$$_ToggleReturnItemCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnMaterial item, bool selected});

  $ReturnMaterialCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ToggleReturnItemCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$_ToggleReturnItem>
    implements _$$_ToggleReturnItemCopyWith<$Res> {
  __$$_ToggleReturnItemCopyWithImpl(
      _$_ToggleReturnItem _value, $Res Function(_$_ToggleReturnItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? selected = null,
  }) {
    return _then(_$_ToggleReturnItem(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ReturnMaterial,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnMaterialCopyWith<$Res> get item {
    return $ReturnMaterialCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_ToggleReturnItem implements _ToggleReturnItem {
  const _$_ToggleReturnItem({required this.item, required this.selected});

  @override
  final ReturnMaterial item;
  @override
  final bool selected;

  @override
  String toString() {
    return 'NewRequestEvent.toggleReturnItem(item: $item, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleReturnItem &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleReturnItemCopyWith<_$_ToggleReturnItem> get copyWith =>
      __$$_ToggleReturnItemCopyWithImpl<_$_ToggleReturnItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
  }) {
    return toggleReturnItem(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
  }) {
    return toggleReturnItem?.call(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    required TResult orElse(),
  }) {
    if (toggleReturnItem != null) {
      return toggleReturnItem(item, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
  }) {
    return toggleReturnItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
  }) {
    return toggleReturnItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    required TResult orElse(),
  }) {
    if (toggleReturnItem != null) {
      return toggleReturnItem(this);
    }
    return orElse();
  }
}

abstract class _ToggleReturnItem implements NewRequestEvent {
  const factory _ToggleReturnItem(
      {required final ReturnMaterial item,
      required final bool selected}) = _$_ToggleReturnItem;

  ReturnMaterial get item;
  bool get selected;
  @JsonKey(ignore: true)
  _$$_ToggleReturnItemCopyWith<_$_ToggleReturnItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewRequestState {
  List<ReturnMaterial> get selectedItems => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewRequestStateCopyWith<NewRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRequestStateCopyWith<$Res> {
  factory $NewRequestStateCopyWith(
          NewRequestState value, $Res Function(NewRequestState) then) =
      _$NewRequestStateCopyWithImpl<$Res, NewRequestState>;
  @useResult
  $Res call({List<ReturnMaterial> selectedItems});
}

/// @nodoc
class _$NewRequestStateCopyWithImpl<$Res, $Val extends NewRequestState>
    implements $NewRequestStateCopyWith<$Res> {
  _$NewRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
  }) {
    return _then(_value.copyWith(
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewRequestStateCopyWith<$Res>
    implements $NewRequestStateCopyWith<$Res> {
  factory _$$_NewRequestStateCopyWith(
          _$_NewRequestState value, $Res Function(_$_NewRequestState) then) =
      __$$_NewRequestStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReturnMaterial> selectedItems});
}

/// @nodoc
class __$$_NewRequestStateCopyWithImpl<$Res>
    extends _$NewRequestStateCopyWithImpl<$Res, _$_NewRequestState>
    implements _$$_NewRequestStateCopyWith<$Res> {
  __$$_NewRequestStateCopyWithImpl(
      _$_NewRequestState _value, $Res Function(_$_NewRequestState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
  }) {
    return _then(_$_NewRequestState(
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
    ));
  }
}

/// @nodoc

class _$_NewRequestState extends _NewRequestState {
  const _$_NewRequestState({required final List<ReturnMaterial> selectedItems})
      : _selectedItems = selectedItems,
        super._();

  final List<ReturnMaterial> _selectedItems;
  @override
  List<ReturnMaterial> get selectedItems {
    if (_selectedItems is EqualUnmodifiableListView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItems);
  }

  @override
  String toString() {
    return 'NewRequestState(selectedItems: $selectedItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewRequestState &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewRequestStateCopyWith<_$_NewRequestState> get copyWith =>
      __$$_NewRequestStateCopyWithImpl<_$_NewRequestState>(this, _$identity);
}

abstract class _NewRequestState extends NewRequestState {
  const factory _NewRequestState(
      {required final List<ReturnMaterial> selectedItems}) = _$_NewRequestState;
  const _NewRequestState._() : super._();

  @override
  List<ReturnMaterial> get selectedItems;
  @override
  @JsonKey(ignore: true)
  _$$_NewRequestStateCopyWith<_$_NewRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}
