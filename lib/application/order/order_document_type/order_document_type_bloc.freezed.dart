// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_document_type_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDocumentTypeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation, bool isEDI)
        fetch,
    required TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)
        selectedOrderType,
    required TResult Function() deleteOrderTypeFromStorage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult? Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult? Function()? deleteOrderTypeFromStorage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult Function()? deleteOrderTypeFromStorage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchOrderDocumentType value) fetch,
    required TResult Function(_SelectedOrderType value) selectedOrderType,
    required TResult Function(_DeleteOrderTypeFromStorage value)
        deleteOrderTypeFromStorage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrderDocumentType value)? fetch,
    TResult? Function(_SelectedOrderType value)? selectedOrderType,
    TResult? Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrderDocumentType value)? fetch,
    TResult Function(_SelectedOrderType value)? selectedOrderType,
    TResult Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDocumentTypeEventCopyWith<$Res> {
  factory $OrderDocumentTypeEventCopyWith(OrderDocumentTypeEvent value,
          $Res Function(OrderDocumentTypeEvent) then) =
      _$OrderDocumentTypeEventCopyWithImpl<$Res, OrderDocumentTypeEvent>;
}

/// @nodoc
class _$OrderDocumentTypeEventCopyWithImpl<$Res,
        $Val extends OrderDocumentTypeEvent>
    implements $OrderDocumentTypeEventCopyWith<$Res> {
  _$OrderDocumentTypeEventCopyWithImpl(this._value, this._then);

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
    extends _$OrderDocumentTypeEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'OrderDocumentTypeEvent.initialized()';
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
    required TResult Function(SalesOrganisation salesOrganisation, bool isEDI)
        fetch,
    required TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)
        selectedOrderType,
    required TResult Function() deleteOrderTypeFromStorage,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult? Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult? Function()? deleteOrderTypeFromStorage,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult Function()? deleteOrderTypeFromStorage,
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
    required TResult Function(_FetchOrderDocumentType value) fetch,
    required TResult Function(_SelectedOrderType value) selectedOrderType,
    required TResult Function(_DeleteOrderTypeFromStorage value)
        deleteOrderTypeFromStorage,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrderDocumentType value)? fetch,
    TResult? Function(_SelectedOrderType value)? selectedOrderType,
    TResult? Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrderDocumentType value)? fetch,
    TResult Function(_SelectedOrderType value)? selectedOrderType,
    TResult Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OrderDocumentTypeEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_FetchOrderDocumentTypeCopyWith<$Res> {
  factory _$$_FetchOrderDocumentTypeCopyWith(_$_FetchOrderDocumentType value,
          $Res Function(_$_FetchOrderDocumentType) then) =
      __$$_FetchOrderDocumentTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation, bool isEDI});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$_FetchOrderDocumentTypeCopyWithImpl<$Res>
    extends _$OrderDocumentTypeEventCopyWithImpl<$Res,
        _$_FetchOrderDocumentType>
    implements _$$_FetchOrderDocumentTypeCopyWith<$Res> {
  __$$_FetchOrderDocumentTypeCopyWithImpl(_$_FetchOrderDocumentType _value,
      $Res Function(_$_FetchOrderDocumentType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? isEDI = null,
  }) {
    return _then(_$_FetchOrderDocumentType(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      isEDI: null == isEDI
          ? _value.isEDI
          : isEDI // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$_FetchOrderDocumentType implements _FetchOrderDocumentType {
  const _$_FetchOrderDocumentType(
      {required this.salesOrganisation, required this.isEDI});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final bool isEDI;

  @override
  String toString() {
    return 'OrderDocumentTypeEvent.fetch(salesOrganisation: $salesOrganisation, isEDI: $isEDI)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchOrderDocumentType &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.isEDI, isEDI) || other.isEDI == isEDI));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation, isEDI);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchOrderDocumentTypeCopyWith<_$_FetchOrderDocumentType> get copyWith =>
      __$$_FetchOrderDocumentTypeCopyWithImpl<_$_FetchOrderDocumentType>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation, bool isEDI)
        fetch,
    required TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)
        selectedOrderType,
    required TResult Function() deleteOrderTypeFromStorage,
  }) {
    return fetch(salesOrganisation, isEDI);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult? Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult? Function()? deleteOrderTypeFromStorage,
  }) {
    return fetch?.call(salesOrganisation, isEDI);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult Function()? deleteOrderTypeFromStorage,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, isEDI);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchOrderDocumentType value) fetch,
    required TResult Function(_SelectedOrderType value) selectedOrderType,
    required TResult Function(_DeleteOrderTypeFromStorage value)
        deleteOrderTypeFromStorage,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrderDocumentType value)? fetch,
    TResult? Function(_SelectedOrderType value)? selectedOrderType,
    TResult? Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrderDocumentType value)? fetch,
    TResult Function(_SelectedOrderType value)? selectedOrderType,
    TResult Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchOrderDocumentType implements OrderDocumentTypeEvent {
  const factory _FetchOrderDocumentType(
      {required final SalesOrganisation salesOrganisation,
      required final bool isEDI}) = _$_FetchOrderDocumentType;

  SalesOrganisation get salesOrganisation;
  bool get isEDI;
  @JsonKey(ignore: true)
  _$$_FetchOrderDocumentTypeCopyWith<_$_FetchOrderDocumentType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectedOrderTypeCopyWith<$Res> {
  factory _$$_SelectedOrderTypeCopyWith(_$_SelectedOrderType value,
          $Res Function(_$_SelectedOrderType) then) =
      __$$_SelectedOrderTypeCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderDocumentType selectedOrderType, bool isReasonSelected});

  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType;
}

/// @nodoc
class __$$_SelectedOrderTypeCopyWithImpl<$Res>
    extends _$OrderDocumentTypeEventCopyWithImpl<$Res, _$_SelectedOrderType>
    implements _$$_SelectedOrderTypeCopyWith<$Res> {
  __$$_SelectedOrderTypeCopyWithImpl(
      _$_SelectedOrderType _value, $Res Function(_$_SelectedOrderType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedOrderType = null,
    Object? isReasonSelected = null,
  }) {
    return _then(_$_SelectedOrderType(
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
      isReasonSelected: null == isReasonSelected
          ? _value.isReasonSelected
          : isReasonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType {
    return $OrderDocumentTypeCopyWith<$Res>(_value.selectedOrderType, (value) {
      return _then(_value.copyWith(selectedOrderType: value));
    });
  }
}

/// @nodoc

class _$_SelectedOrderType implements _SelectedOrderType {
  const _$_SelectedOrderType(
      {required this.selectedOrderType, required this.isReasonSelected});

  @override
  final OrderDocumentType selectedOrderType;
  @override
  final bool isReasonSelected;

  @override
  String toString() {
    return 'OrderDocumentTypeEvent.selectedOrderType(selectedOrderType: $selectedOrderType, isReasonSelected: $isReasonSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectedOrderType &&
            (identical(other.selectedOrderType, selectedOrderType) ||
                other.selectedOrderType == selectedOrderType) &&
            (identical(other.isReasonSelected, isReasonSelected) ||
                other.isReasonSelected == isReasonSelected));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedOrderType, isReasonSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectedOrderTypeCopyWith<_$_SelectedOrderType> get copyWith =>
      __$$_SelectedOrderTypeCopyWithImpl<_$_SelectedOrderType>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation, bool isEDI)
        fetch,
    required TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)
        selectedOrderType,
    required TResult Function() deleteOrderTypeFromStorage,
  }) {
    return selectedOrderType(this.selectedOrderType, isReasonSelected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult? Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult? Function()? deleteOrderTypeFromStorage,
  }) {
    return selectedOrderType?.call(this.selectedOrderType, isReasonSelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult Function()? deleteOrderTypeFromStorage,
    required TResult orElse(),
  }) {
    if (selectedOrderType != null) {
      return selectedOrderType(this.selectedOrderType, isReasonSelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchOrderDocumentType value) fetch,
    required TResult Function(_SelectedOrderType value) selectedOrderType,
    required TResult Function(_DeleteOrderTypeFromStorage value)
        deleteOrderTypeFromStorage,
  }) {
    return selectedOrderType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrderDocumentType value)? fetch,
    TResult? Function(_SelectedOrderType value)? selectedOrderType,
    TResult? Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
  }) {
    return selectedOrderType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrderDocumentType value)? fetch,
    TResult Function(_SelectedOrderType value)? selectedOrderType,
    TResult Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
    required TResult orElse(),
  }) {
    if (selectedOrderType != null) {
      return selectedOrderType(this);
    }
    return orElse();
  }
}

abstract class _SelectedOrderType implements OrderDocumentTypeEvent {
  const factory _SelectedOrderType(
      {required final OrderDocumentType selectedOrderType,
      required final bool isReasonSelected}) = _$_SelectedOrderType;

  OrderDocumentType get selectedOrderType;
  bool get isReasonSelected;
  @JsonKey(ignore: true)
  _$$_SelectedOrderTypeCopyWith<_$_SelectedOrderType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteOrderTypeFromStorageCopyWith<$Res> {
  factory _$$_DeleteOrderTypeFromStorageCopyWith(
          _$_DeleteOrderTypeFromStorage value,
          $Res Function(_$_DeleteOrderTypeFromStorage) then) =
      __$$_DeleteOrderTypeFromStorageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteOrderTypeFromStorageCopyWithImpl<$Res>
    extends _$OrderDocumentTypeEventCopyWithImpl<$Res,
        _$_DeleteOrderTypeFromStorage>
    implements _$$_DeleteOrderTypeFromStorageCopyWith<$Res> {
  __$$_DeleteOrderTypeFromStorageCopyWithImpl(
      _$_DeleteOrderTypeFromStorage _value,
      $Res Function(_$_DeleteOrderTypeFromStorage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteOrderTypeFromStorage implements _DeleteOrderTypeFromStorage {
  const _$_DeleteOrderTypeFromStorage();

  @override
  String toString() {
    return 'OrderDocumentTypeEvent.deleteOrderTypeFromStorage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteOrderTypeFromStorage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation, bool isEDI)
        fetch,
    required TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)
        selectedOrderType,
    required TResult Function() deleteOrderTypeFromStorage,
  }) {
    return deleteOrderTypeFromStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult? Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult? Function()? deleteOrderTypeFromStorage,
  }) {
    return deleteOrderTypeFromStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation, bool isEDI)? fetch,
    TResult Function(
            OrderDocumentType selectedOrderType, bool isReasonSelected)?
        selectedOrderType,
    TResult Function()? deleteOrderTypeFromStorage,
    required TResult orElse(),
  }) {
    if (deleteOrderTypeFromStorage != null) {
      return deleteOrderTypeFromStorage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchOrderDocumentType value) fetch,
    required TResult Function(_SelectedOrderType value) selectedOrderType,
    required TResult Function(_DeleteOrderTypeFromStorage value)
        deleteOrderTypeFromStorage,
  }) {
    return deleteOrderTypeFromStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchOrderDocumentType value)? fetch,
    TResult? Function(_SelectedOrderType value)? selectedOrderType,
    TResult? Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
  }) {
    return deleteOrderTypeFromStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchOrderDocumentType value)? fetch,
    TResult Function(_SelectedOrderType value)? selectedOrderType,
    TResult Function(_DeleteOrderTypeFromStorage value)?
        deleteOrderTypeFromStorage,
    required TResult orElse(),
  }) {
    if (deleteOrderTypeFromStorage != null) {
      return deleteOrderTypeFromStorage(this);
    }
    return orElse();
  }
}

abstract class _DeleteOrderTypeFromStorage implements OrderDocumentTypeEvent {
  const factory _DeleteOrderTypeFromStorage() = _$_DeleteOrderTypeFromStorage;
}

/// @nodoc
mixin _$OrderDocumentTypeState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, List<OrderDocumentType>>>
      get orderDocumentTypeListFailureOrSuccessOption =>
          throw _privateConstructorUsedError;
  List<OrderDocumentType> get orderDocumentTypeList =>
      throw _privateConstructorUsedError;
  bool get isOrderTypeSelected => throw _privateConstructorUsedError;
  OrderDocumentType get selectedOrderType => throw _privateConstructorUsedError;
  bool get isReasonSelected => throw _privateConstructorUsedError;
  OrderDocumentType get selectedReason => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDocumentTypeStateCopyWith<OrderDocumentTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDocumentTypeStateCopyWith<$Res> {
  factory $OrderDocumentTypeStateCopyWith(OrderDocumentTypeState value,
          $Res Function(OrderDocumentTypeState) then) =
      _$OrderDocumentTypeStateCopyWithImpl<$Res, OrderDocumentTypeState>;
  @useResult
  $Res call(
      {bool isSubmitting,
      Option<Either<ApiFailure, List<OrderDocumentType>>>
          orderDocumentTypeListFailureOrSuccessOption,
      List<OrderDocumentType> orderDocumentTypeList,
      bool isOrderTypeSelected,
      OrderDocumentType selectedOrderType,
      bool isReasonSelected,
      OrderDocumentType selectedReason});

  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType;
  $OrderDocumentTypeCopyWith<$Res> get selectedReason;
}

/// @nodoc
class _$OrderDocumentTypeStateCopyWithImpl<$Res,
        $Val extends OrderDocumentTypeState>
    implements $OrderDocumentTypeStateCopyWith<$Res> {
  _$OrderDocumentTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? orderDocumentTypeListFailureOrSuccessOption = null,
    Object? orderDocumentTypeList = null,
    Object? isOrderTypeSelected = null,
    Object? selectedOrderType = null,
    Object? isReasonSelected = null,
    Object? selectedReason = null,
  }) {
    return _then(_value.copyWith(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      orderDocumentTypeListFailureOrSuccessOption: null ==
              orderDocumentTypeListFailureOrSuccessOption
          ? _value.orderDocumentTypeListFailureOrSuccessOption
          : orderDocumentTypeListFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, List<OrderDocumentType>>>,
      orderDocumentTypeList: null == orderDocumentTypeList
          ? _value.orderDocumentTypeList
          : orderDocumentTypeList // ignore: cast_nullable_to_non_nullable
              as List<OrderDocumentType>,
      isOrderTypeSelected: null == isOrderTypeSelected
          ? _value.isOrderTypeSelected
          : isOrderTypeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
      isReasonSelected: null == isReasonSelected
          ? _value.isReasonSelected
          : isReasonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedReason: null == selectedReason
          ? _value.selectedReason
          : selectedReason // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType {
    return $OrderDocumentTypeCopyWith<$Res>(_value.selectedOrderType, (value) {
      return _then(_value.copyWith(selectedOrderType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDocumentTypeCopyWith<$Res> get selectedReason {
    return $OrderDocumentTypeCopyWith<$Res>(_value.selectedReason, (value) {
      return _then(_value.copyWith(selectedReason: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderDocumentTypeStateCopyWith<$Res>
    implements $OrderDocumentTypeStateCopyWith<$Res> {
  factory _$$_OrderDocumentTypeStateCopyWith(_$_OrderDocumentTypeState value,
          $Res Function(_$_OrderDocumentTypeState) then) =
      __$$_OrderDocumentTypeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting,
      Option<Either<ApiFailure, List<OrderDocumentType>>>
          orderDocumentTypeListFailureOrSuccessOption,
      List<OrderDocumentType> orderDocumentTypeList,
      bool isOrderTypeSelected,
      OrderDocumentType selectedOrderType,
      bool isReasonSelected,
      OrderDocumentType selectedReason});

  @override
  $OrderDocumentTypeCopyWith<$Res> get selectedOrderType;
  @override
  $OrderDocumentTypeCopyWith<$Res> get selectedReason;
}

/// @nodoc
class __$$_OrderDocumentTypeStateCopyWithImpl<$Res>
    extends _$OrderDocumentTypeStateCopyWithImpl<$Res,
        _$_OrderDocumentTypeState>
    implements _$$_OrderDocumentTypeStateCopyWith<$Res> {
  __$$_OrderDocumentTypeStateCopyWithImpl(_$_OrderDocumentTypeState _value,
      $Res Function(_$_OrderDocumentTypeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? orderDocumentTypeListFailureOrSuccessOption = null,
    Object? orderDocumentTypeList = null,
    Object? isOrderTypeSelected = null,
    Object? selectedOrderType = null,
    Object? isReasonSelected = null,
    Object? selectedReason = null,
  }) {
    return _then(_$_OrderDocumentTypeState(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      orderDocumentTypeListFailureOrSuccessOption: null ==
              orderDocumentTypeListFailureOrSuccessOption
          ? _value.orderDocumentTypeListFailureOrSuccessOption
          : orderDocumentTypeListFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, List<OrderDocumentType>>>,
      orderDocumentTypeList: null == orderDocumentTypeList
          ? _value._orderDocumentTypeList
          : orderDocumentTypeList // ignore: cast_nullable_to_non_nullable
              as List<OrderDocumentType>,
      isOrderTypeSelected: null == isOrderTypeSelected
          ? _value.isOrderTypeSelected
          : isOrderTypeSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
      isReasonSelected: null == isReasonSelected
          ? _value.isReasonSelected
          : isReasonSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedReason: null == selectedReason
          ? _value.selectedReason
          : selectedReason // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
    ));
  }
}

/// @nodoc

class _$_OrderDocumentTypeState extends _OrderDocumentTypeState {
  const _$_OrderDocumentTypeState(
      {required this.isSubmitting,
      required this.orderDocumentTypeListFailureOrSuccessOption,
      required final List<OrderDocumentType> orderDocumentTypeList,
      required this.isOrderTypeSelected,
      required this.selectedOrderType,
      required this.isReasonSelected,
      required this.selectedReason})
      : _orderDocumentTypeList = orderDocumentTypeList,
        super._();

  @override
  final bool isSubmitting;
  @override
  final Option<Either<ApiFailure, List<OrderDocumentType>>>
      orderDocumentTypeListFailureOrSuccessOption;
  final List<OrderDocumentType> _orderDocumentTypeList;
  @override
  List<OrderDocumentType> get orderDocumentTypeList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderDocumentTypeList);
  }

  @override
  final bool isOrderTypeSelected;
  @override
  final OrderDocumentType selectedOrderType;
  @override
  final bool isReasonSelected;
  @override
  final OrderDocumentType selectedReason;

  @override
  String toString() {
    return 'OrderDocumentTypeState(isSubmitting: $isSubmitting, orderDocumentTypeListFailureOrSuccessOption: $orderDocumentTypeListFailureOrSuccessOption, orderDocumentTypeList: $orderDocumentTypeList, isOrderTypeSelected: $isOrderTypeSelected, selectedOrderType: $selectedOrderType, isReasonSelected: $isReasonSelected, selectedReason: $selectedReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDocumentTypeState &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.orderDocumentTypeListFailureOrSuccessOption,
                    orderDocumentTypeListFailureOrSuccessOption) ||
                other.orderDocumentTypeListFailureOrSuccessOption ==
                    orderDocumentTypeListFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._orderDocumentTypeList, _orderDocumentTypeList) &&
            (identical(other.isOrderTypeSelected, isOrderTypeSelected) ||
                other.isOrderTypeSelected == isOrderTypeSelected) &&
            (identical(other.selectedOrderType, selectedOrderType) ||
                other.selectedOrderType == selectedOrderType) &&
            (identical(other.isReasonSelected, isReasonSelected) ||
                other.isReasonSelected == isReasonSelected) &&
            (identical(other.selectedReason, selectedReason) ||
                other.selectedReason == selectedReason));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSubmitting,
      orderDocumentTypeListFailureOrSuccessOption,
      const DeepCollectionEquality().hash(_orderDocumentTypeList),
      isOrderTypeSelected,
      selectedOrderType,
      isReasonSelected,
      selectedReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDocumentTypeStateCopyWith<_$_OrderDocumentTypeState> get copyWith =>
      __$$_OrderDocumentTypeStateCopyWithImpl<_$_OrderDocumentTypeState>(
          this, _$identity);
}

abstract class _OrderDocumentTypeState extends OrderDocumentTypeState {
  const factory _OrderDocumentTypeState(
          {required final bool isSubmitting,
          required final Option<Either<ApiFailure, List<OrderDocumentType>>>
              orderDocumentTypeListFailureOrSuccessOption,
          required final List<OrderDocumentType> orderDocumentTypeList,
          required final bool isOrderTypeSelected,
          required final OrderDocumentType selectedOrderType,
          required final bool isReasonSelected,
          required final OrderDocumentType selectedReason}) =
      _$_OrderDocumentTypeState;
  const _OrderDocumentTypeState._() : super._();

  @override
  bool get isSubmitting;
  @override
  Option<Either<ApiFailure, List<OrderDocumentType>>>
      get orderDocumentTypeListFailureOrSuccessOption;
  @override
  List<OrderDocumentType> get orderDocumentTypeList;
  @override
  bool get isOrderTypeSelected;
  @override
  OrderDocumentType get selectedOrderType;
  @override
  bool get isReasonSelected;
  @override
  OrderDocumentType get selectedReason;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDocumentTypeStateCopyWith<_$_OrderDocumentTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}
