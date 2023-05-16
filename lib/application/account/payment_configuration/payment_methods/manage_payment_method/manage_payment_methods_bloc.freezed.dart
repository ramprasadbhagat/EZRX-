// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_payment_methods_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ManagePaymentMethodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String paymentMethod) newPaymentMethodChanged,
    required TResult Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)
        editPaymentMethod,
    required TResult Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)
        deletePaymentMethod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String paymentMethod)? newPaymentMethodChanged,
    TResult? Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)?
        editPaymentMethod,
    TResult? Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)?
        deletePaymentMethod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String paymentMethod)? newPaymentMethodChanged,
    TResult Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)?
        editPaymentMethod,
    TResult Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)?
        deletePaymentMethod,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewPaymentMethodChanged value)
        newPaymentMethodChanged,
    required TResult Function(_EditPaymentMethod value) editPaymentMethod,
    required TResult Function(_DeletePaymentMethod value) deletePaymentMethod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewPaymentMethodChanged value)? newPaymentMethodChanged,
    TResult? Function(_EditPaymentMethod value)? editPaymentMethod,
    TResult? Function(_DeletePaymentMethod value)? deletePaymentMethod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewPaymentMethodChanged value)? newPaymentMethodChanged,
    TResult Function(_EditPaymentMethod value)? editPaymentMethod,
    TResult Function(_DeletePaymentMethod value)? deletePaymentMethod,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagePaymentMethodsEventCopyWith<$Res> {
  factory $ManagePaymentMethodsEventCopyWith(ManagePaymentMethodsEvent value,
          $Res Function(ManagePaymentMethodsEvent) then) =
      _$ManagePaymentMethodsEventCopyWithImpl<$Res, ManagePaymentMethodsEvent>;
}

/// @nodoc
class _$ManagePaymentMethodsEventCopyWithImpl<$Res,
        $Val extends ManagePaymentMethodsEvent>
    implements $ManagePaymentMethodsEventCopyWith<$Res> {
  _$ManagePaymentMethodsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_NewPaymentMethodChangedCopyWith<$Res> {
  factory _$$_NewPaymentMethodChangedCopyWith(_$_NewPaymentMethodChanged value,
          $Res Function(_$_NewPaymentMethodChanged) then) =
      __$$_NewPaymentMethodChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String paymentMethod});
}

/// @nodoc
class __$$_NewPaymentMethodChangedCopyWithImpl<$Res>
    extends _$ManagePaymentMethodsEventCopyWithImpl<$Res,
        _$_NewPaymentMethodChanged>
    implements _$$_NewPaymentMethodChangedCopyWith<$Res> {
  __$$_NewPaymentMethodChangedCopyWithImpl(_$_NewPaymentMethodChanged _value,
      $Res Function(_$_NewPaymentMethodChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
  }) {
    return _then(_$_NewPaymentMethodChanged(
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NewPaymentMethodChanged implements _NewPaymentMethodChanged {
  const _$_NewPaymentMethodChanged({required this.paymentMethod});

  @override
  final String paymentMethod;

  @override
  String toString() {
    return 'ManagePaymentMethodsEvent.newPaymentMethodChanged(paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewPaymentMethodChanged &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewPaymentMethodChangedCopyWith<_$_NewPaymentMethodChanged>
      get copyWith =>
          __$$_NewPaymentMethodChangedCopyWithImpl<_$_NewPaymentMethodChanged>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String paymentMethod) newPaymentMethodChanged,
    required TResult Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)
        editPaymentMethod,
    required TResult Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)
        deletePaymentMethod,
  }) {
    return newPaymentMethodChanged(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String paymentMethod)? newPaymentMethodChanged,
    TResult? Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)?
        editPaymentMethod,
    TResult? Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)?
        deletePaymentMethod,
  }) {
    return newPaymentMethodChanged?.call(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String paymentMethod)? newPaymentMethodChanged,
    TResult Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)?
        editPaymentMethod,
    TResult Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)?
        deletePaymentMethod,
    required TResult orElse(),
  }) {
    if (newPaymentMethodChanged != null) {
      return newPaymentMethodChanged(paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewPaymentMethodChanged value)
        newPaymentMethodChanged,
    required TResult Function(_EditPaymentMethod value) editPaymentMethod,
    required TResult Function(_DeletePaymentMethod value) deletePaymentMethod,
  }) {
    return newPaymentMethodChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewPaymentMethodChanged value)? newPaymentMethodChanged,
    TResult? Function(_EditPaymentMethod value)? editPaymentMethod,
    TResult? Function(_DeletePaymentMethod value)? deletePaymentMethod,
  }) {
    return newPaymentMethodChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewPaymentMethodChanged value)? newPaymentMethodChanged,
    TResult Function(_EditPaymentMethod value)? editPaymentMethod,
    TResult Function(_DeletePaymentMethod value)? deletePaymentMethod,
    required TResult orElse(),
  }) {
    if (newPaymentMethodChanged != null) {
      return newPaymentMethodChanged(this);
    }
    return orElse();
  }
}

abstract class _NewPaymentMethodChanged implements ManagePaymentMethodsEvent {
  const factory _NewPaymentMethodChanged(
      {required final String paymentMethod}) = _$_NewPaymentMethodChanged;

  String get paymentMethod;
  @JsonKey(ignore: true)
  _$$_NewPaymentMethodChangedCopyWith<_$_NewPaymentMethodChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EditPaymentMethodCopyWith<$Res> {
  factory _$$_EditPaymentMethodCopyWith(_$_EditPaymentMethod value,
          $Res Function(_$_EditPaymentMethod) then) =
      __$$_EditPaymentMethodCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg, PaymentMethod oldPaymentMethod});
}

/// @nodoc
class __$$_EditPaymentMethodCopyWithImpl<$Res>
    extends _$ManagePaymentMethodsEventCopyWithImpl<$Res, _$_EditPaymentMethod>
    implements _$$_EditPaymentMethodCopyWith<$Res> {
  __$$_EditPaymentMethodCopyWithImpl(
      _$_EditPaymentMethod _value, $Res Function(_$_EditPaymentMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? oldPaymentMethod = null,
  }) {
    return _then(_$_EditPaymentMethod(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      oldPaymentMethod: null == oldPaymentMethod
          ? _value.oldPaymentMethod
          : oldPaymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
    ));
  }
}

/// @nodoc

class _$_EditPaymentMethod implements _EditPaymentMethod {
  const _$_EditPaymentMethod(
      {required this.salesOrg, required this.oldPaymentMethod});

  @override
  final SalesOrg salesOrg;
  @override
  final PaymentMethod oldPaymentMethod;

  @override
  String toString() {
    return 'ManagePaymentMethodsEvent.editPaymentMethod(salesOrg: $salesOrg, oldPaymentMethod: $oldPaymentMethod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditPaymentMethod &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.oldPaymentMethod, oldPaymentMethod) ||
                other.oldPaymentMethod == oldPaymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, oldPaymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditPaymentMethodCopyWith<_$_EditPaymentMethod> get copyWith =>
      __$$_EditPaymentMethodCopyWithImpl<_$_EditPaymentMethod>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String paymentMethod) newPaymentMethodChanged,
    required TResult Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)
        editPaymentMethod,
    required TResult Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)
        deletePaymentMethod,
  }) {
    return editPaymentMethod(salesOrg, oldPaymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String paymentMethod)? newPaymentMethodChanged,
    TResult? Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)?
        editPaymentMethod,
    TResult? Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)?
        deletePaymentMethod,
  }) {
    return editPaymentMethod?.call(salesOrg, oldPaymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String paymentMethod)? newPaymentMethodChanged,
    TResult Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)?
        editPaymentMethod,
    TResult Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)?
        deletePaymentMethod,
    required TResult orElse(),
  }) {
    if (editPaymentMethod != null) {
      return editPaymentMethod(salesOrg, oldPaymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewPaymentMethodChanged value)
        newPaymentMethodChanged,
    required TResult Function(_EditPaymentMethod value) editPaymentMethod,
    required TResult Function(_DeletePaymentMethod value) deletePaymentMethod,
  }) {
    return editPaymentMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewPaymentMethodChanged value)? newPaymentMethodChanged,
    TResult? Function(_EditPaymentMethod value)? editPaymentMethod,
    TResult? Function(_DeletePaymentMethod value)? deletePaymentMethod,
  }) {
    return editPaymentMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewPaymentMethodChanged value)? newPaymentMethodChanged,
    TResult Function(_EditPaymentMethod value)? editPaymentMethod,
    TResult Function(_DeletePaymentMethod value)? deletePaymentMethod,
    required TResult orElse(),
  }) {
    if (editPaymentMethod != null) {
      return editPaymentMethod(this);
    }
    return orElse();
  }
}

abstract class _EditPaymentMethod implements ManagePaymentMethodsEvent {
  const factory _EditPaymentMethod(
      {required final SalesOrg salesOrg,
      required final PaymentMethod oldPaymentMethod}) = _$_EditPaymentMethod;

  SalesOrg get salesOrg;
  PaymentMethod get oldPaymentMethod;
  @JsonKey(ignore: true)
  _$$_EditPaymentMethodCopyWith<_$_EditPaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeletePaymentMethodCopyWith<$Res> {
  factory _$$_DeletePaymentMethodCopyWith(_$_DeletePaymentMethod value,
          $Res Function(_$_DeletePaymentMethod) then) =
      __$$_DeletePaymentMethodCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex});
}

/// @nodoc
class __$$_DeletePaymentMethodCopyWithImpl<$Res>
    extends _$ManagePaymentMethodsEventCopyWithImpl<$Res,
        _$_DeletePaymentMethod>
    implements _$$_DeletePaymentMethodCopyWith<$Res> {
  __$$_DeletePaymentMethodCopyWithImpl(_$_DeletePaymentMethod _value,
      $Res Function(_$_DeletePaymentMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? paymentMethod = null,
    Object? deleteIndex = null,
  }) {
    return _then(_$_DeletePaymentMethod(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      deleteIndex: null == deleteIndex
          ? _value.deleteIndex
          : deleteIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeletePaymentMethod implements _DeletePaymentMethod {
  const _$_DeletePaymentMethod(
      {required this.salesOrg,
      required this.paymentMethod,
      required this.deleteIndex});

  @override
  final SalesOrg salesOrg;
  @override
  final PaymentMethod paymentMethod;
  @override
  final int deleteIndex;

  @override
  String toString() {
    return 'ManagePaymentMethodsEvent.deletePaymentMethod(salesOrg: $salesOrg, paymentMethod: $paymentMethod, deleteIndex: $deleteIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeletePaymentMethod &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.deleteIndex, deleteIndex) ||
                other.deleteIndex == deleteIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrg, paymentMethod, deleteIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeletePaymentMethodCopyWith<_$_DeletePaymentMethod> get copyWith =>
      __$$_DeletePaymentMethodCopyWithImpl<_$_DeletePaymentMethod>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String paymentMethod) newPaymentMethodChanged,
    required TResult Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)
        editPaymentMethod,
    required TResult Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)
        deletePaymentMethod,
  }) {
    return deletePaymentMethod(salesOrg, paymentMethod, deleteIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String paymentMethod)? newPaymentMethodChanged,
    TResult? Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)?
        editPaymentMethod,
    TResult? Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)?
        deletePaymentMethod,
  }) {
    return deletePaymentMethod?.call(salesOrg, paymentMethod, deleteIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String paymentMethod)? newPaymentMethodChanged,
    TResult Function(SalesOrg salesOrg, PaymentMethod oldPaymentMethod)?
        editPaymentMethod,
    TResult Function(
            SalesOrg salesOrg, PaymentMethod paymentMethod, int deleteIndex)?
        deletePaymentMethod,
    required TResult orElse(),
  }) {
    if (deletePaymentMethod != null) {
      return deletePaymentMethod(salesOrg, paymentMethod, deleteIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewPaymentMethodChanged value)
        newPaymentMethodChanged,
    required TResult Function(_EditPaymentMethod value) editPaymentMethod,
    required TResult Function(_DeletePaymentMethod value) deletePaymentMethod,
  }) {
    return deletePaymentMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NewPaymentMethodChanged value)? newPaymentMethodChanged,
    TResult? Function(_EditPaymentMethod value)? editPaymentMethod,
    TResult? Function(_DeletePaymentMethod value)? deletePaymentMethod,
  }) {
    return deletePaymentMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewPaymentMethodChanged value)? newPaymentMethodChanged,
    TResult Function(_EditPaymentMethod value)? editPaymentMethod,
    TResult Function(_DeletePaymentMethod value)? deletePaymentMethod,
    required TResult orElse(),
  }) {
    if (deletePaymentMethod != null) {
      return deletePaymentMethod(this);
    }
    return orElse();
  }
}

abstract class _DeletePaymentMethod implements ManagePaymentMethodsEvent {
  const factory _DeletePaymentMethod(
      {required final SalesOrg salesOrg,
      required final PaymentMethod paymentMethod,
      required final int deleteIndex}) = _$_DeletePaymentMethod;

  SalesOrg get salesOrg;
  PaymentMethod get paymentMethod;
  int get deleteIndex;
  @JsonKey(ignore: true)
  _$$_DeletePaymentMethodCopyWith<_$_DeletePaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ManagePaymentMethodsState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  int get deleteIndex => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ManagePaymentMethodsStateCopyWith<ManagePaymentMethodsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagePaymentMethodsStateCopyWith<$Res> {
  factory $ManagePaymentMethodsStateCopyWith(ManagePaymentMethodsState value,
          $Res Function(ManagePaymentMethodsState) then) =
      _$ManagePaymentMethodsStateCopyWithImpl<$Res, ManagePaymentMethodsState>;
  @useResult
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      PaymentMethod paymentMethod,
      int deleteIndex,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$ManagePaymentMethodsStateCopyWithImpl<$Res,
        $Val extends ManagePaymentMethodsState>
    implements $ManagePaymentMethodsStateCopyWith<$Res> {
  _$ManagePaymentMethodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? showErrorMessages = null,
    Object? paymentMethod = null,
    Object? deleteIndex = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      deleteIndex: null == deleteIndex
          ? _value.deleteIndex
          : deleteIndex // ignore: cast_nullable_to_non_nullable
              as int,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ManagePaymentMethodsStateCopyWith<$Res>
    implements $ManagePaymentMethodsStateCopyWith<$Res> {
  factory _$$_ManagePaymentMethodsStateCopyWith(
          _$_ManagePaymentMethodsState value,
          $Res Function(_$_ManagePaymentMethodsState) then) =
      __$$_ManagePaymentMethodsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      PaymentMethod paymentMethod,
      int deleteIndex,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$_ManagePaymentMethodsStateCopyWithImpl<$Res>
    extends _$ManagePaymentMethodsStateCopyWithImpl<$Res,
        _$_ManagePaymentMethodsState>
    implements _$$_ManagePaymentMethodsStateCopyWith<$Res> {
  __$$_ManagePaymentMethodsStateCopyWithImpl(
      _$_ManagePaymentMethodsState _value,
      $Res Function(_$_ManagePaymentMethodsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? showErrorMessages = null,
    Object? paymentMethod = null,
    Object? deleteIndex = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_ManagePaymentMethodsState(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      deleteIndex: null == deleteIndex
          ? _value.deleteIndex
          : deleteIndex // ignore: cast_nullable_to_non_nullable
              as int,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_ManagePaymentMethodsState extends _ManagePaymentMethodsState {
  const _$_ManagePaymentMethodsState(
      {required this.isSubmitting,
      required this.showErrorMessages,
      required this.paymentMethod,
      required this.deleteIndex,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final bool isSubmitting;
  @override
  final bool showErrorMessages;
  @override
  final PaymentMethod paymentMethod;
  @override
  final int deleteIndex;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ManagePaymentMethodsState(isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, paymentMethod: $paymentMethod, deleteIndex: $deleteIndex, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManagePaymentMethodsState &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.deleteIndex, deleteIndex) ||
                other.deleteIndex == deleteIndex) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSubmitting, showErrorMessages,
      paymentMethod, deleteIndex, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManagePaymentMethodsStateCopyWith<_$_ManagePaymentMethodsState>
      get copyWith => __$$_ManagePaymentMethodsStateCopyWithImpl<
          _$_ManagePaymentMethodsState>(this, _$identity);
}

abstract class _ManagePaymentMethodsState extends ManagePaymentMethodsState {
  const factory _ManagePaymentMethodsState(
      {required final bool isSubmitting,
      required final bool showErrorMessages,
      required final PaymentMethod paymentMethod,
      required final int deleteIndex,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_ManagePaymentMethodsState;
  const _ManagePaymentMethodsState._() : super._();

  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  PaymentMethod get paymentMethod;
  @override
  int get deleteIndex;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_ManagePaymentMethodsStateCopyWith<_$_ManagePaymentMethodsState>
      get copyWith => throw _privateConstructorUsedError;
}
