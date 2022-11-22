// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_StepContinue value) stepContinue,
    required TResult Function(_StepCancel value) stepCancel,
    required TResult Function(_StepTapped value) stepTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_StepContinue value)? stepContinue,
    TResult? Function(_StepCancel value)? stepCancel,
    TResult? Function(_StepTapped value)? stepTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_StepContinue value)? stepContinue,
    TResult Function(_StepCancel value)? stepCancel,
    TResult Function(_StepTapped value)? stepTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryEventCopyWith<$Res> {
  factory $OrderSummaryEventCopyWith(
          OrderSummaryEvent value, $Res Function(OrderSummaryEvent) then) =
      _$OrderSummaryEventCopyWithImpl<$Res, OrderSummaryEvent>;
}

/// @nodoc
class _$OrderSummaryEventCopyWithImpl<$Res, $Val extends OrderSummaryEvent>
    implements $OrderSummaryEventCopyWith<$Res> {
  _$OrderSummaryEventCopyWithImpl(this._value, this._then);

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
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_Initialized>
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
    return 'OrderSummaryEvent.initialized()';
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
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
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
    required TResult Function(_StepContinue value) stepContinue,
    required TResult Function(_StepCancel value) stepCancel,
    required TResult Function(_StepTapped value) stepTapped,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_StepContinue value)? stepContinue,
    TResult? Function(_StepCancel value)? stepCancel,
    TResult? Function(_StepTapped value)? stepTapped,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_StepContinue value)? stepContinue,
    TResult Function(_StepCancel value)? stepCancel,
    TResult Function(_StepTapped value)? stepTapped,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OrderSummaryEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_StepContinueCopyWith<$Res> {
  factory _$$_StepContinueCopyWith(
          _$_StepContinue value, $Res Function(_$_StepContinue) then) =
      __$$_StepContinueCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StepContinueCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_StepContinue>
    implements _$$_StepContinueCopyWith<$Res> {
  __$$_StepContinueCopyWithImpl(
      _$_StepContinue _value, $Res Function(_$_StepContinue) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StepContinue implements _StepContinue {
  const _$_StepContinue();

  @override
  String toString() {
    return 'OrderSummaryEvent.stepContinue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StepContinue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
  }) {
    return stepContinue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
  }) {
    return stepContinue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    required TResult orElse(),
  }) {
    if (stepContinue != null) {
      return stepContinue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_StepContinue value) stepContinue,
    required TResult Function(_StepCancel value) stepCancel,
    required TResult Function(_StepTapped value) stepTapped,
  }) {
    return stepContinue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_StepContinue value)? stepContinue,
    TResult? Function(_StepCancel value)? stepCancel,
    TResult? Function(_StepTapped value)? stepTapped,
  }) {
    return stepContinue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_StepContinue value)? stepContinue,
    TResult Function(_StepCancel value)? stepCancel,
    TResult Function(_StepTapped value)? stepTapped,
    required TResult orElse(),
  }) {
    if (stepContinue != null) {
      return stepContinue(this);
    }
    return orElse();
  }
}

abstract class _StepContinue implements OrderSummaryEvent {
  const factory _StepContinue() = _$_StepContinue;
}

/// @nodoc
abstract class _$$_StepCancelCopyWith<$Res> {
  factory _$$_StepCancelCopyWith(
          _$_StepCancel value, $Res Function(_$_StepCancel) then) =
      __$$_StepCancelCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StepCancelCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_StepCancel>
    implements _$$_StepCancelCopyWith<$Res> {
  __$$_StepCancelCopyWithImpl(
      _$_StepCancel _value, $Res Function(_$_StepCancel) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StepCancel implements _StepCancel {
  const _$_StepCancel();

  @override
  String toString() {
    return 'OrderSummaryEvent.stepCancel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StepCancel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
  }) {
    return stepCancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
  }) {
    return stepCancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    required TResult orElse(),
  }) {
    if (stepCancel != null) {
      return stepCancel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_StepContinue value) stepContinue,
    required TResult Function(_StepCancel value) stepCancel,
    required TResult Function(_StepTapped value) stepTapped,
  }) {
    return stepCancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_StepContinue value)? stepContinue,
    TResult? Function(_StepCancel value)? stepCancel,
    TResult? Function(_StepTapped value)? stepTapped,
  }) {
    return stepCancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_StepContinue value)? stepContinue,
    TResult Function(_StepCancel value)? stepCancel,
    TResult Function(_StepTapped value)? stepTapped,
    required TResult orElse(),
  }) {
    if (stepCancel != null) {
      return stepCancel(this);
    }
    return orElse();
  }
}

abstract class _StepCancel implements OrderSummaryEvent {
  const factory _StepCancel() = _$_StepCancel;
}

/// @nodoc
abstract class _$$_StepTappedCopyWith<$Res> {
  factory _$$_StepTappedCopyWith(
          _$_StepTapped value, $Res Function(_$_StepTapped) then) =
      __$$_StepTappedCopyWithImpl<$Res>;
  @useResult
  $Res call({int step});
}

/// @nodoc
class __$$_StepTappedCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_StepTapped>
    implements _$$_StepTappedCopyWith<$Res> {
  __$$_StepTappedCopyWithImpl(
      _$_StepTapped _value, $Res Function(_$_StepTapped) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
  }) {
    return _then(_$_StepTapped(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_StepTapped implements _StepTapped {
  const _$_StepTapped({required this.step});

  @override
  final int step;

  @override
  String toString() {
    return 'OrderSummaryEvent.stepTapped(step: $step)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepTapped &&
            (identical(other.step, step) || other.step == step));
  }

  @override
  int get hashCode => Object.hash(runtimeType, step);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StepTappedCopyWith<_$_StepTapped> get copyWith =>
      __$$_StepTappedCopyWithImpl<_$_StepTapped>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
  }) {
    return stepTapped(step);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
  }) {
    return stepTapped?.call(step);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    required TResult orElse(),
  }) {
    if (stepTapped != null) {
      return stepTapped(step);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_StepContinue value) stepContinue,
    required TResult Function(_StepCancel value) stepCancel,
    required TResult Function(_StepTapped value) stepTapped,
  }) {
    return stepTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_StepContinue value)? stepContinue,
    TResult? Function(_StepCancel value)? stepCancel,
    TResult? Function(_StepTapped value)? stepTapped,
  }) {
    return stepTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_StepContinue value)? stepContinue,
    TResult Function(_StepCancel value)? stepCancel,
    TResult Function(_StepTapped value)? stepTapped,
    required TResult orElse(),
  }) {
    if (stepTapped != null) {
      return stepTapped(this);
    }
    return orElse();
  }
}

abstract class _StepTapped implements OrderSummaryEvent {
  const factory _StepTapped({required final int step}) = _$_StepTapped;

  int get step;
  @JsonKey(ignore: true)
  _$$_StepTappedCopyWith<_$_StepTapped> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderSummaryState {
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  int get maxSteps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderSummaryStateCopyWith<OrderSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryStateCopyWith<$Res> {
  factory $OrderSummaryStateCopyWith(
          OrderSummaryState value, $Res Function(OrderSummaryState) then) =
      _$OrderSummaryStateCopyWithImpl<$Res, OrderSummaryState>;
  @useResult
  $Res call(
      {Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      int step,
      int maxSteps});
}

/// @nodoc
class _$OrderSummaryStateCopyWithImpl<$Res, $Val extends OrderSummaryState>
    implements $OrderSummaryStateCopyWith<$Res> {
  _$OrderSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiFailureOrSuccessOption = null,
    Object? step = null,
    Object? maxSteps = null,
  }) {
    return _then(_value.copyWith(
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      maxSteps: null == maxSteps
          ? _value.maxSteps
          : maxSteps // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderSummaryStateCopyWith<$Res>
    implements $OrderSummaryStateCopyWith<$Res> {
  factory _$$_OrderSummaryStateCopyWith(_$_OrderSummaryState value,
          $Res Function(_$_OrderSummaryState) then) =
      __$$_OrderSummaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      int step,
      int maxSteps});
}

/// @nodoc
class __$$_OrderSummaryStateCopyWithImpl<$Res>
    extends _$OrderSummaryStateCopyWithImpl<$Res, _$_OrderSummaryState>
    implements _$$_OrderSummaryStateCopyWith<$Res> {
  __$$_OrderSummaryStateCopyWithImpl(
      _$_OrderSummaryState _value, $Res Function(_$_OrderSummaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiFailureOrSuccessOption = null,
    Object? step = null,
    Object? maxSteps = null,
  }) {
    return _then(_$_OrderSummaryState(
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      maxSteps: null == maxSteps
          ? _value.maxSteps
          : maxSteps // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OrderSummaryState extends _OrderSummaryState {
  const _$_OrderSummaryState(
      {required this.apiFailureOrSuccessOption,
      required this.step,
      required this.maxSteps})
      : super._();

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final int step;
  @override
  final int maxSteps;

  @override
  String toString() {
    return 'OrderSummaryState(apiFailureOrSuccessOption: $apiFailureOrSuccessOption, step: $step, maxSteps: $maxSteps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderSummaryState &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.maxSteps, maxSteps) ||
                other.maxSteps == maxSteps));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, apiFailureOrSuccessOption, step, maxSteps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderSummaryStateCopyWith<_$_OrderSummaryState> get copyWith =>
      __$$_OrderSummaryStateCopyWithImpl<_$_OrderSummaryState>(
          this, _$identity);
}

abstract class _OrderSummaryState extends OrderSummaryState {
  const factory _OrderSummaryState(
      {required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final int step,
      required final int maxSteps}) = _$_OrderSummaryState;
  const _OrderSummaryState._() : super._();

  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  int get step;
  @override
  int get maxSteps;
  @override
  @JsonKey(ignore: true)
  _$$_OrderSummaryStateCopyWith<_$_OrderSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
