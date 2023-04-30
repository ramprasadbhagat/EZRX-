// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_filter_by_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryFilterByStatusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(StatusType statusName, bool isChecked)
        checkedStatusFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(StatusType statusName, bool isChecked)?
        checkedStatusFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(StatusType statusName, bool isChecked)?
        checkedStatusFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CheckedStatusFilter value) checkedStatusFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CheckedStatusFilter value)? checkedStatusFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CheckedStatusFilter value)? checkedStatusFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryFilterByStatusEventCopyWith<$Res> {
  factory $OrderHistoryFilterByStatusEventCopyWith(
          OrderHistoryFilterByStatusEvent value,
          $Res Function(OrderHistoryFilterByStatusEvent) then) =
      _$OrderHistoryFilterByStatusEventCopyWithImpl<$Res,
          OrderHistoryFilterByStatusEvent>;
}

/// @nodoc
class _$OrderHistoryFilterByStatusEventCopyWithImpl<$Res,
        $Val extends OrderHistoryFilterByStatusEvent>
    implements $OrderHistoryFilterByStatusEventCopyWith<$Res> {
  _$OrderHistoryFilterByStatusEventCopyWithImpl(this._value, this._then);

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
    extends _$OrderHistoryFilterByStatusEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'OrderHistoryFilterByStatusEvent.initialized()';
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
    required TResult Function(StatusType statusName, bool isChecked)
        checkedStatusFilter,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(StatusType statusName, bool isChecked)?
        checkedStatusFilter,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(StatusType statusName, bool isChecked)?
        checkedStatusFilter,
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
    required TResult Function(_CheckedStatusFilter value) checkedStatusFilter,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CheckedStatusFilter value)? checkedStatusFilter,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CheckedStatusFilter value)? checkedStatusFilter,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OrderHistoryFilterByStatusEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_CheckedStatusFilterCopyWith<$Res> {
  factory _$$_CheckedStatusFilterCopyWith(_$_CheckedStatusFilter value,
          $Res Function(_$_CheckedStatusFilter) then) =
      __$$_CheckedStatusFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({StatusType statusName, bool isChecked});
}

/// @nodoc
class __$$_CheckedStatusFilterCopyWithImpl<$Res>
    extends _$OrderHistoryFilterByStatusEventCopyWithImpl<$Res,
        _$_CheckedStatusFilter>
    implements _$$_CheckedStatusFilterCopyWith<$Res> {
  __$$_CheckedStatusFilterCopyWithImpl(_$_CheckedStatusFilter _value,
      $Res Function(_$_CheckedStatusFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusName = null,
    Object? isChecked = null,
  }) {
    return _then(_$_CheckedStatusFilter(
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as StatusType,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CheckedStatusFilter implements _CheckedStatusFilter {
  const _$_CheckedStatusFilter(
      {required this.statusName, required this.isChecked});

  @override
  final StatusType statusName;
  @override
  final bool isChecked;

  @override
  String toString() {
    return 'OrderHistoryFilterByStatusEvent.checkedStatusFilter(statusName: $statusName, isChecked: $isChecked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckedStatusFilter &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusName, isChecked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckedStatusFilterCopyWith<_$_CheckedStatusFilter> get copyWith =>
      __$$_CheckedStatusFilterCopyWithImpl<_$_CheckedStatusFilter>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(StatusType statusName, bool isChecked)
        checkedStatusFilter,
  }) {
    return checkedStatusFilter(statusName, isChecked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(StatusType statusName, bool isChecked)?
        checkedStatusFilter,
  }) {
    return checkedStatusFilter?.call(statusName, isChecked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(StatusType statusName, bool isChecked)?
        checkedStatusFilter,
    required TResult orElse(),
  }) {
    if (checkedStatusFilter != null) {
      return checkedStatusFilter(statusName, isChecked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CheckedStatusFilter value) checkedStatusFilter,
  }) {
    return checkedStatusFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CheckedStatusFilter value)? checkedStatusFilter,
  }) {
    return checkedStatusFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CheckedStatusFilter value)? checkedStatusFilter,
    required TResult orElse(),
  }) {
    if (checkedStatusFilter != null) {
      return checkedStatusFilter(this);
    }
    return orElse();
  }
}

abstract class _CheckedStatusFilter implements OrderHistoryFilterByStatusEvent {
  const factory _CheckedStatusFilter(
      {required final StatusType statusName,
      required final bool isChecked}) = _$_CheckedStatusFilter;

  StatusType get statusName;
  bool get isChecked;
  @JsonKey(ignore: true)
  _$$_CheckedStatusFilterCopyWith<_$_CheckedStatusFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderHistoryFilterByStatusState {
  List<StatusType> get filterByStatusName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryFilterByStatusStateCopyWith<OrderHistoryFilterByStatusState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryFilterByStatusStateCopyWith<$Res> {
  factory $OrderHistoryFilterByStatusStateCopyWith(
          OrderHistoryFilterByStatusState value,
          $Res Function(OrderHistoryFilterByStatusState) then) =
      _$OrderHistoryFilterByStatusStateCopyWithImpl<$Res,
          OrderHistoryFilterByStatusState>;
  @useResult
  $Res call({List<StatusType> filterByStatusName});
}

/// @nodoc
class _$OrderHistoryFilterByStatusStateCopyWithImpl<$Res,
        $Val extends OrderHistoryFilterByStatusState>
    implements $OrderHistoryFilterByStatusStateCopyWith<$Res> {
  _$OrderHistoryFilterByStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterByStatusName = null,
  }) {
    return _then(_value.copyWith(
      filterByStatusName: null == filterByStatusName
          ? _value.filterByStatusName
          : filterByStatusName // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderHistoryFilterByStatusStateCopyWith<$Res>
    implements $OrderHistoryFilterByStatusStateCopyWith<$Res> {
  factory _$$_OrderHistoryFilterByStatusStateCopyWith(
          _$_OrderHistoryFilterByStatusState value,
          $Res Function(_$_OrderHistoryFilterByStatusState) then) =
      __$$_OrderHistoryFilterByStatusStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StatusType> filterByStatusName});
}

/// @nodoc
class __$$_OrderHistoryFilterByStatusStateCopyWithImpl<$Res>
    extends _$OrderHistoryFilterByStatusStateCopyWithImpl<$Res,
        _$_OrderHistoryFilterByStatusState>
    implements _$$_OrderHistoryFilterByStatusStateCopyWith<$Res> {
  __$$_OrderHistoryFilterByStatusStateCopyWithImpl(
      _$_OrderHistoryFilterByStatusState _value,
      $Res Function(_$_OrderHistoryFilterByStatusState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterByStatusName = null,
  }) {
    return _then(_$_OrderHistoryFilterByStatusState(
      filterByStatusName: null == filterByStatusName
          ? _value._filterByStatusName
          : filterByStatusName // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryFilterByStatusState
    extends _OrderHistoryFilterByStatusState {
  const _$_OrderHistoryFilterByStatusState(
      {required final List<StatusType> filterByStatusName})
      : _filterByStatusName = filterByStatusName,
        super._();

  final List<StatusType> _filterByStatusName;
  @override
  List<StatusType> get filterByStatusName {
    if (_filterByStatusName is EqualUnmodifiableListView)
      return _filterByStatusName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterByStatusName);
  }

  @override
  String toString() {
    return 'OrderHistoryFilterByStatusState(filterByStatusName: $filterByStatusName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryFilterByStatusState &&
            const DeepCollectionEquality()
                .equals(other._filterByStatusName, _filterByStatusName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filterByStatusName));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryFilterByStatusStateCopyWith<
          _$_OrderHistoryFilterByStatusState>
      get copyWith => __$$_OrderHistoryFilterByStatusStateCopyWithImpl<
          _$_OrderHistoryFilterByStatusState>(this, _$identity);
}

abstract class _OrderHistoryFilterByStatusState
    extends OrderHistoryFilterByStatusState {
  const factory _OrderHistoryFilterByStatusState(
          {required final List<StatusType> filterByStatusName}) =
      _$_OrderHistoryFilterByStatusState;
  const _OrderHistoryFilterByStatusState._() : super._();

  @override
  List<StatusType> get filterByStatusName;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryFilterByStatusStateCopyWith<
          _$_OrderHistoryFilterByStatusState>
      get copyWith => throw _privateConstructorUsedError;
}
