// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_template_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderTemplateListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user) fetch,
    required TResult Function(OrderTemplate tempItem) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    TResult Function(OrderTemplate tempItem)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    TResult Function(OrderTemplate tempItem)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DeleteOrderTemplate value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteOrderTemplate value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteOrderTemplate value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTemplateListEventCopyWith<$Res> {
  factory $OrderTemplateListEventCopyWith(OrderTemplateListEvent value,
          $Res Function(OrderTemplateListEvent) then) =
      _$OrderTemplateListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$OrderTemplateListEventCopyWithImpl<$Res>
    implements $OrderTemplateListEventCopyWith<$Res> {
  _$OrderTemplateListEventCopyWithImpl(this._value, this._then);

  final OrderTemplateListEvent _value;
  // ignore: unused_field
  final $Res Function(OrderTemplateListEvent) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$OrderTemplateListEventCopyWithImpl<$Res>
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
    return 'OrderTemplateListEvent.initialized()';
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
    required TResult Function(User user) fetch,
    required TResult Function(OrderTemplate tempItem) delete,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    TResult Function(OrderTemplate tempItem)? delete,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    TResult Function(OrderTemplate tempItem)? delete,
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
    required TResult Function(_DeleteOrderTemplate value) delete,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteOrderTemplate value)? delete,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteOrderTemplate value)? delete,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OrderTemplateListEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$OrderTemplateListEventCopyWithImpl<$Res>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, (v) => _then(v as _$_Fetch));

  @override
  _$_Fetch get _value => super._value as _$_Fetch;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_Fetch(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'OrderTemplateListEvent.fetch(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user) fetch,
    required TResult Function(OrderTemplate tempItem) delete,
  }) {
    return fetch(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    TResult Function(OrderTemplate tempItem)? delete,
  }) {
    return fetch?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    TResult Function(OrderTemplate tempItem)? delete,
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
    required TResult Function(_DeleteOrderTemplate value) delete,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteOrderTemplate value)? delete,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteOrderTemplate value)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements OrderTemplateListEvent {
  const factory _Fetch(final User user) = _$_Fetch;

  User get user;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteOrderTemplateCopyWith<$Res> {
  factory _$$_DeleteOrderTemplateCopyWith(_$_DeleteOrderTemplate value,
          $Res Function(_$_DeleteOrderTemplate) then) =
      __$$_DeleteOrderTemplateCopyWithImpl<$Res>;
  $Res call({OrderTemplate tempItem});

  $OrderTemplateCopyWith<$Res> get tempItem;
}

/// @nodoc
class __$$_DeleteOrderTemplateCopyWithImpl<$Res>
    extends _$OrderTemplateListEventCopyWithImpl<$Res>
    implements _$$_DeleteOrderTemplateCopyWith<$Res> {
  __$$_DeleteOrderTemplateCopyWithImpl(_$_DeleteOrderTemplate _value,
      $Res Function(_$_DeleteOrderTemplate) _then)
      : super(_value, (v) => _then(v as _$_DeleteOrderTemplate));

  @override
  _$_DeleteOrderTemplate get _value => super._value as _$_DeleteOrderTemplate;

  @override
  $Res call({
    Object? tempItem = freezed,
  }) {
    return _then(_$_DeleteOrderTemplate(
      tempItem == freezed
          ? _value.tempItem
          : tempItem // ignore: cast_nullable_to_non_nullable
              as OrderTemplate,
    ));
  }

  @override
  $OrderTemplateCopyWith<$Res> get tempItem {
    return $OrderTemplateCopyWith<$Res>(_value.tempItem, (value) {
      return _then(_value.copyWith(tempItem: value));
    });
  }
}

/// @nodoc

class _$_DeleteOrderTemplate implements _DeleteOrderTemplate {
  const _$_DeleteOrderTemplate(this.tempItem);

  @override
  final OrderTemplate tempItem;

  @override
  String toString() {
    return 'OrderTemplateListEvent.delete(tempItem: $tempItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteOrderTemplate &&
            const DeepCollectionEquality().equals(other.tempItem, tempItem));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tempItem));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteOrderTemplateCopyWith<_$_DeleteOrderTemplate> get copyWith =>
      __$$_DeleteOrderTemplateCopyWithImpl<_$_DeleteOrderTemplate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user) fetch,
    required TResult Function(OrderTemplate tempItem) delete,
  }) {
    return delete(tempItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    TResult Function(OrderTemplate tempItem)? delete,
  }) {
    return delete?.call(tempItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user)? fetch,
    TResult Function(OrderTemplate tempItem)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(tempItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DeleteOrderTemplate value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteOrderTemplate value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DeleteOrderTemplate value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _DeleteOrderTemplate implements OrderTemplateListEvent {
  const factory _DeleteOrderTemplate(final OrderTemplate tempItem) =
      _$_DeleteOrderTemplate;

  OrderTemplate get tempItem;
  @JsonKey(ignore: true)
  _$$_DeleteOrderTemplateCopyWith<_$_DeleteOrderTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderTemplateListState {
  List<OrderTemplate> get orderTemplateList =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderTemplateListStateCopyWith<OrderTemplateListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTemplateListStateCopyWith<$Res> {
  factory $OrderTemplateListStateCopyWith(OrderTemplateListState value,
          $Res Function(OrderTemplateListState) then) =
      _$OrderTemplateListStateCopyWithImpl<$Res>;
  $Res call(
      {List<OrderTemplate> orderTemplateList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching});
}

/// @nodoc
class _$OrderTemplateListStateCopyWithImpl<$Res>
    implements $OrderTemplateListStateCopyWith<$Res> {
  _$OrderTemplateListStateCopyWithImpl(this._value, this._then);

  final OrderTemplateListState _value;
  // ignore: unused_field
  final $Res Function(OrderTemplateListState) _then;

  @override
  $Res call({
    Object? orderTemplateList = freezed,
    Object? apiFailureOrSuccessOption = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_value.copyWith(
      orderTemplateList: orderTemplateList == freezed
          ? _value.orderTemplateList
          : orderTemplateList // ignore: cast_nullable_to_non_nullable
              as List<OrderTemplate>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderTemplateListStateCopyWith<$Res>
    implements $OrderTemplateListStateCopyWith<$Res> {
  factory _$$_OrderTemplateListStateCopyWith(_$_OrderTemplateListState value,
          $Res Function(_$_OrderTemplateListState) then) =
      __$$_OrderTemplateListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<OrderTemplate> orderTemplateList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching});
}

/// @nodoc
class __$$_OrderTemplateListStateCopyWithImpl<$Res>
    extends _$OrderTemplateListStateCopyWithImpl<$Res>
    implements _$$_OrderTemplateListStateCopyWith<$Res> {
  __$$_OrderTemplateListStateCopyWithImpl(_$_OrderTemplateListState _value,
      $Res Function(_$_OrderTemplateListState) _then)
      : super(_value, (v) => _then(v as _$_OrderTemplateListState));

  @override
  _$_OrderTemplateListState get _value =>
      super._value as _$_OrderTemplateListState;

  @override
  $Res call({
    Object? orderTemplateList = freezed,
    Object? apiFailureOrSuccessOption = freezed,
    Object? isFetching = freezed,
  }) {
    return _then(_$_OrderTemplateListState(
      orderTemplateList: orderTemplateList == freezed
          ? _value._orderTemplateList
          : orderTemplateList // ignore: cast_nullable_to_non_nullable
              as List<OrderTemplate>,
      apiFailureOrSuccessOption: apiFailureOrSuccessOption == freezed
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: isFetching == freezed
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OrderTemplateListState implements _OrderTemplateListState {
  const _$_OrderTemplateListState(
      {required final List<OrderTemplate> orderTemplateList,
      required this.apiFailureOrSuccessOption,
      required this.isFetching})
      : _orderTemplateList = orderTemplateList;

  final List<OrderTemplate> _orderTemplateList;
  @override
  List<OrderTemplate> get orderTemplateList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderTemplateList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isFetching;

  @override
  String toString() {
    return 'OrderTemplateListState(orderTemplateList: $orderTemplateList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTemplateListState &&
            const DeepCollectionEquality()
                .equals(other._orderTemplateList, _orderTemplateList) &&
            const DeepCollectionEquality().equals(
                other.apiFailureOrSuccessOption, apiFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isFetching, isFetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_orderTemplateList),
      const DeepCollectionEquality().hash(apiFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isFetching));

  @JsonKey(ignore: true)
  @override
  _$$_OrderTemplateListStateCopyWith<_$_OrderTemplateListState> get copyWith =>
      __$$_OrderTemplateListStateCopyWithImpl<_$_OrderTemplateListState>(
          this, _$identity);
}

abstract class _OrderTemplateListState implements OrderTemplateListState {
  const factory _OrderTemplateListState(
      {required final List<OrderTemplate> orderTemplateList,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isFetching}) = _$_OrderTemplateListState;

  @override
  List<OrderTemplate> get orderTemplateList;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTemplateListStateCopyWith<_$_OrderTemplateListState> get copyWith =>
      throw _privateConstructorUsedError;
}
