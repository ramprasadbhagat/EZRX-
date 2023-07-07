// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)
        initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_StepContinue value) stepContinue,
    required TResult Function(_StepCancel value) stepCancel,
    required TResult Function(_StepTapped value) stepTapped,
    required TResult Function(_SubmitOrder value) submitOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_StepContinue value)? stepContinue,
    TResult? Function(_StepCancel value)? stepCancel,
    TResult? Function(_StepTapped value)? stepTapped,
    TResult? Function(_SubmitOrder value)? submitOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_StepContinue value)? stepContinue,
    TResult Function(_StepCancel value)? stepCancel,
    TResult Function(_StepTapped value)? stepTapped,
    TResult Function(_SubmitOrder value)? submitOrder,
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
  @useResult
  $Res call(
      {int step,
      int maxSteps,
      int additionalDetailsStep,
      SalesOrganisationConfigs config});

  $SalesOrganisationConfigsCopyWith<$Res> get config;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? maxSteps = null,
    Object? additionalDetailsStep = null,
    Object? config = null,
  }) {
    return _then(_$_Initialized(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      maxSteps: null == maxSteps
          ? _value.maxSteps
          : maxSteps // ignore: cast_nullable_to_non_nullable
              as int,
      additionalDetailsStep: null == additionalDetailsStep
          ? _value.additionalDetailsStep
          : additionalDetailsStep // ignore: cast_nullable_to_non_nullable
              as int,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get config {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.step,
      required this.maxSteps,
      required this.additionalDetailsStep,
      required this.config});

  @override
  final int step;
  @override
  final int maxSteps;
  @override
  final int additionalDetailsStep;
  @override
  final SalesOrganisationConfigs config;

  @override
  String toString() {
    return 'OrderSummaryEvent.initialized(step: $step, maxSteps: $maxSteps, additionalDetailsStep: $additionalDetailsStep, config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.maxSteps, maxSteps) ||
                other.maxSteps == maxSteps) &&
            (identical(other.additionalDetailsStep, additionalDetailsStep) ||
                other.additionalDetailsStep == additionalDetailsStep) &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, step, maxSteps, additionalDetailsStep, config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)
        initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
  }) {
    return initialized(step, maxSteps, additionalDetailsStep, config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
  }) {
    return initialized?.call(step, maxSteps, additionalDetailsStep, config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(step, maxSteps, additionalDetailsStep, config);
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
    required TResult Function(_SubmitOrder value) submitOrder,
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
    TResult? Function(_SubmitOrder value)? submitOrder,
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
    TResult Function(_SubmitOrder value)? submitOrder,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OrderSummaryEvent {
  const factory _Initialized(
      {required final int step,
      required final int maxSteps,
      required final int additionalDetailsStep,
      required final SalesOrganisationConfigs config}) = _$_Initialized;

  int get step;
  int get maxSteps;
  int get additionalDetailsStep;
  SalesOrganisationConfigs get config;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)
        initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
  }) {
    return stepContinue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
  }) {
    return stepContinue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
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
    required TResult Function(_SubmitOrder value) submitOrder,
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
    TResult? Function(_SubmitOrder value)? submitOrder,
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
    TResult Function(_SubmitOrder value)? submitOrder,
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
    required TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)
        initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
  }) {
    return stepCancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
  }) {
    return stepCancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
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
    required TResult Function(_SubmitOrder value) submitOrder,
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
    TResult? Function(_SubmitOrder value)? submitOrder,
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
    TResult Function(_SubmitOrder value)? submitOrder,
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
    required TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)
        initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
  }) {
    return stepTapped(step);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
  }) {
    return stepTapped?.call(step);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
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
    required TResult Function(_SubmitOrder value) submitOrder,
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
    TResult? Function(_SubmitOrder value)? submitOrder,
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
    TResult Function(_SubmitOrder value)? submitOrder,
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
abstract class _$$_SubmitOrderCopyWith<$Res> {
  factory _$$_SubmitOrderCopyWith(
          _$_SubmitOrder value, $Res Function(_$_SubmitOrder) then) =
      __$$_SubmitOrderCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ShipToInfo shipToInfo,
      User user,
      List<PriceAggregate> cartItems,
      double grandTotal,
      CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      DeliveryInfoData data,
      OrderDocumentType orderDocumentType,
      SalesOrganisationConfigs config});

  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $DeliveryInfoDataCopyWith<$Res> get data;
  $OrderDocumentTypeCopyWith<$Res> get orderDocumentType;
  $SalesOrganisationConfigsCopyWith<$Res> get config;
}

/// @nodoc
class __$$_SubmitOrderCopyWithImpl<$Res>
    extends _$OrderSummaryEventCopyWithImpl<$Res, _$_SubmitOrder>
    implements _$$_SubmitOrderCopyWith<$Res> {
  __$$_SubmitOrderCopyWithImpl(
      _$_SubmitOrder _value, $Res Function(_$_SubmitOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shipToInfo = null,
    Object? user = null,
    Object? cartItems = null,
    Object? grandTotal = null,
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? data = null,
    Object? orderDocumentType = null,
    Object? config = null,
  }) {
    return _then(_$_SubmitOrder(
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DeliveryInfoData,
      orderDocumentType: null == orderDocumentType
          ? _value.orderDocumentType
          : orderDocumentType // ignore: cast_nullable_to_non_nullable
              as OrderDocumentType,
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryInfoDataCopyWith<$Res> get data {
    return $DeliveryInfoDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDocumentTypeCopyWith<$Res> get orderDocumentType {
    return $OrderDocumentTypeCopyWith<$Res>(_value.orderDocumentType, (value) {
      return _then(_value.copyWith(orderDocumentType: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get config {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc

class _$_SubmitOrder implements _SubmitOrder {
  const _$_SubmitOrder(
      {required this.shipToInfo,
      required this.user,
      required final List<PriceAggregate> cartItems,
      required this.grandTotal,
      required this.customerCodeInfo,
      required this.salesOrganisation,
      required this.data,
      required this.orderDocumentType,
      required this.config})
      : _cartItems = cartItems;

  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  final List<PriceAggregate> _cartItems;
  @override
  List<PriceAggregate> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final double grandTotal;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final DeliveryInfoData data;
  @override
  final OrderDocumentType orderDocumentType;
  @override
  final SalesOrganisationConfigs config;

  @override
  String toString() {
    return 'OrderSummaryEvent.submitOrder(shipToInfo: $shipToInfo, user: $user, cartItems: $cartItems, grandTotal: $grandTotal, customerCodeInfo: $customerCodeInfo, salesOrganisation: $salesOrganisation, data: $data, orderDocumentType: $orderDocumentType, config: $config)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitOrder &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.orderDocumentType, orderDocumentType) ||
                other.orderDocumentType == orderDocumentType) &&
            (identical(other.config, config) || other.config == config));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      shipToInfo,
      user,
      const DeepCollectionEquality().hash(_cartItems),
      grandTotal,
      customerCodeInfo,
      salesOrganisation,
      data,
      orderDocumentType,
      config);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitOrderCopyWith<_$_SubmitOrder> get copyWith =>
      __$$_SubmitOrderCopyWithImpl<_$_SubmitOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)
        initialized,
    required TResult Function() stepContinue,
    required TResult Function() stepCancel,
    required TResult Function(int step) stepTapped,
    required TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)
        submitOrder,
  }) {
    return submitOrder(shipToInfo, user, cartItems, grandTotal,
        customerCodeInfo, salesOrganisation, data, orderDocumentType, config);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult? Function()? stepContinue,
    TResult? Function()? stepCancel,
    TResult? Function(int step)? stepTapped,
    TResult? Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
  }) {
    return submitOrder?.call(shipToInfo, user, cartItems, grandTotal,
        customerCodeInfo, salesOrganisation, data, orderDocumentType, config);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int step, int maxSteps, int additionalDetailsStep,
            SalesOrganisationConfigs config)?
        initialized,
    TResult Function()? stepContinue,
    TResult Function()? stepCancel,
    TResult Function(int step)? stepTapped,
    TResult Function(
            ShipToInfo shipToInfo,
            User user,
            List<PriceAggregate> cartItems,
            double grandTotal,
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            DeliveryInfoData data,
            OrderDocumentType orderDocumentType,
            SalesOrganisationConfigs config)?
        submitOrder,
    required TResult orElse(),
  }) {
    if (submitOrder != null) {
      return submitOrder(shipToInfo, user, cartItems, grandTotal,
          customerCodeInfo, salesOrganisation, data, orderDocumentType, config);
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
    required TResult Function(_SubmitOrder value) submitOrder,
  }) {
    return submitOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_StepContinue value)? stepContinue,
    TResult? Function(_StepCancel value)? stepCancel,
    TResult? Function(_StepTapped value)? stepTapped,
    TResult? Function(_SubmitOrder value)? submitOrder,
  }) {
    return submitOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_StepContinue value)? stepContinue,
    TResult Function(_StepCancel value)? stepCancel,
    TResult Function(_StepTapped value)? stepTapped,
    TResult Function(_SubmitOrder value)? submitOrder,
    required TResult orElse(),
  }) {
    if (submitOrder != null) {
      return submitOrder(this);
    }
    return orElse();
  }
}

abstract class _SubmitOrder implements OrderSummaryEvent {
  const factory _SubmitOrder(
      {required final ShipToInfo shipToInfo,
      required final User user,
      required final List<PriceAggregate> cartItems,
      required final double grandTotal,
      required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganisation,
      required final DeliveryInfoData data,
      required final OrderDocumentType orderDocumentType,
      required final SalesOrganisationConfigs config}) = _$_SubmitOrder;

  ShipToInfo get shipToInfo;
  User get user;
  List<PriceAggregate> get cartItems;
  double get grandTotal;
  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisation get salesOrganisation;
  DeliveryInfoData get data;
  OrderDocumentType get orderDocumentType;
  SalesOrganisationConfigs get config;
  @JsonKey(ignore: true)
  _$$_SubmitOrderCopyWith<_$_SubmitOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderSummaryState {
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  int get maxSteps => throw _privateConstructorUsedError;
  int get additionalDetailsStep => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isSubmitSuccess => throw _privateConstructorUsedError;
  SubmitOrderResponse get submitOrderResponse =>
      throw _privateConstructorUsedError;

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
      int maxSteps,
      int additionalDetailsStep,
      bool isSubmitting,
      bool isSubmitSuccess,
      SubmitOrderResponse submitOrderResponse});

  $SubmitOrderResponseCopyWith<$Res> get submitOrderResponse;
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
    Object? additionalDetailsStep = null,
    Object? isSubmitting = null,
    Object? isSubmitSuccess = null,
    Object? submitOrderResponse = null,
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
      additionalDetailsStep: null == additionalDetailsStep
          ? _value.additionalDetailsStep
          : additionalDetailsStep // ignore: cast_nullable_to_non_nullable
              as int,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitSuccess: null == isSubmitSuccess
          ? _value.isSubmitSuccess
          : isSubmitSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      submitOrderResponse: null == submitOrderResponse
          ? _value.submitOrderResponse
          : submitOrderResponse // ignore: cast_nullable_to_non_nullable
              as SubmitOrderResponse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubmitOrderResponseCopyWith<$Res> get submitOrderResponse {
    return $SubmitOrderResponseCopyWith<$Res>(_value.submitOrderResponse,
        (value) {
      return _then(_value.copyWith(submitOrderResponse: value) as $Val);
    });
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
      int maxSteps,
      int additionalDetailsStep,
      bool isSubmitting,
      bool isSubmitSuccess,
      SubmitOrderResponse submitOrderResponse});

  @override
  $SubmitOrderResponseCopyWith<$Res> get submitOrderResponse;
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
    Object? additionalDetailsStep = null,
    Object? isSubmitting = null,
    Object? isSubmitSuccess = null,
    Object? submitOrderResponse = null,
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
      additionalDetailsStep: null == additionalDetailsStep
          ? _value.additionalDetailsStep
          : additionalDetailsStep // ignore: cast_nullable_to_non_nullable
              as int,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitSuccess: null == isSubmitSuccess
          ? _value.isSubmitSuccess
          : isSubmitSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      submitOrderResponse: null == submitOrderResponse
          ? _value.submitOrderResponse
          : submitOrderResponse // ignore: cast_nullable_to_non_nullable
              as SubmitOrderResponse,
    ));
  }
}

/// @nodoc

class _$_OrderSummaryState extends _OrderSummaryState {
  const _$_OrderSummaryState(
      {required this.apiFailureOrSuccessOption,
      required this.step,
      required this.maxSteps,
      required this.additionalDetailsStep,
      required this.isSubmitting,
      required this.isSubmitSuccess,
      required this.submitOrderResponse})
      : super._();

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final int step;
  @override
  final int maxSteps;
  @override
  final int additionalDetailsStep;
  @override
  final bool isSubmitting;
  @override
  final bool isSubmitSuccess;
  @override
  final SubmitOrderResponse submitOrderResponse;

  @override
  String toString() {
    return 'OrderSummaryState(apiFailureOrSuccessOption: $apiFailureOrSuccessOption, step: $step, maxSteps: $maxSteps, additionalDetailsStep: $additionalDetailsStep, isSubmitting: $isSubmitting, isSubmitSuccess: $isSubmitSuccess, submitOrderResponse: $submitOrderResponse)';
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
                other.maxSteps == maxSteps) &&
            (identical(other.additionalDetailsStep, additionalDetailsStep) ||
                other.additionalDetailsStep == additionalDetailsStep) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSubmitSuccess, isSubmitSuccess) ||
                other.isSubmitSuccess == isSubmitSuccess) &&
            (identical(other.submitOrderResponse, submitOrderResponse) ||
                other.submitOrderResponse == submitOrderResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      apiFailureOrSuccessOption,
      step,
      maxSteps,
      additionalDetailsStep,
      isSubmitting,
      isSubmitSuccess,
      submitOrderResponse);

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
          required final int maxSteps,
          required final int additionalDetailsStep,
          required final bool isSubmitting,
          required final bool isSubmitSuccess,
          required final SubmitOrderResponse submitOrderResponse}) =
      _$_OrderSummaryState;
  const _OrderSummaryState._() : super._();

  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  int get step;
  @override
  int get maxSteps;
  @override
  int get additionalDetailsStep;
  @override
  bool get isSubmitting;
  @override
  bool get isSubmitSuccess;
  @override
  SubmitOrderResponse get submitOrderResponse;
  @override
  @JsonKey(ignore: true)
  _$$_OrderSummaryStateCopyWith<_$_OrderSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
