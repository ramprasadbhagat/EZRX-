// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentNotificationEvent {
  PaymentNotification get paymentNotification =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentNotification paymentNotification)
        updatePaymentNotification,
    required TResult Function(PaymentNotification paymentNotification,
            String day, bool updatedValue)
        updateAdviceExpiryReminder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentNotification paymentNotification)?
        updatePaymentNotification,
    TResult? Function(PaymentNotification paymentNotification, String day,
            bool updatedValue)?
        updateAdviceExpiryReminder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentNotification paymentNotification)?
        updatePaymentNotification,
    TResult Function(PaymentNotification paymentNotification, String day,
            bool updatedValue)?
        updateAdviceExpiryReminder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaymentNotificationEvent value)
        updatePaymentNotification,
    required TResult Function(_UpdateAdviceExpiryReminder value)
        updateAdviceExpiryReminder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaymentNotificationEvent value)?
        updatePaymentNotification,
    TResult? Function(_UpdateAdviceExpiryReminder value)?
        updateAdviceExpiryReminder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaymentNotificationEvent value)?
        updatePaymentNotification,
    TResult Function(_UpdateAdviceExpiryReminder value)?
        updateAdviceExpiryReminder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentNotificationEventCopyWith<PaymentNotificationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentNotificationEventCopyWith<$Res> {
  factory $PaymentNotificationEventCopyWith(PaymentNotificationEvent value,
          $Res Function(PaymentNotificationEvent) then) =
      _$PaymentNotificationEventCopyWithImpl<$Res, PaymentNotificationEvent>;
  @useResult
  $Res call({PaymentNotification paymentNotification});

  $PaymentNotificationCopyWith<$Res> get paymentNotification;
}

/// @nodoc
class _$PaymentNotificationEventCopyWithImpl<$Res,
        $Val extends PaymentNotificationEvent>
    implements $PaymentNotificationEventCopyWith<$Res> {
  _$PaymentNotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentNotification = null,
  }) {
    return _then(_value.copyWith(
      paymentNotification: null == paymentNotification
          ? _value.paymentNotification
          : paymentNotification // ignore: cast_nullable_to_non_nullable
              as PaymentNotification,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentNotificationCopyWith<$Res> get paymentNotification {
    return $PaymentNotificationCopyWith<$Res>(_value.paymentNotification,
        (value) {
      return _then(_value.copyWith(paymentNotification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentNotificationEventCopyWith<$Res>
    implements $PaymentNotificationEventCopyWith<$Res> {
  factory _$$_PaymentNotificationEventCopyWith(
          _$_PaymentNotificationEvent value,
          $Res Function(_$_PaymentNotificationEvent) then) =
      __$$_PaymentNotificationEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentNotification paymentNotification});

  @override
  $PaymentNotificationCopyWith<$Res> get paymentNotification;
}

/// @nodoc
class __$$_PaymentNotificationEventCopyWithImpl<$Res>
    extends _$PaymentNotificationEventCopyWithImpl<$Res,
        _$_PaymentNotificationEvent>
    implements _$$_PaymentNotificationEventCopyWith<$Res> {
  __$$_PaymentNotificationEventCopyWithImpl(_$_PaymentNotificationEvent _value,
      $Res Function(_$_PaymentNotificationEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentNotification = null,
  }) {
    return _then(_$_PaymentNotificationEvent(
      paymentNotification: null == paymentNotification
          ? _value.paymentNotification
          : paymentNotification // ignore: cast_nullable_to_non_nullable
              as PaymentNotification,
    ));
  }
}

/// @nodoc

class _$_PaymentNotificationEvent implements _PaymentNotificationEvent {
  const _$_PaymentNotificationEvent({required this.paymentNotification});

  @override
  final PaymentNotification paymentNotification;

  @override
  String toString() {
    return 'PaymentNotificationEvent.updatePaymentNotification(paymentNotification: $paymentNotification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentNotificationEvent &&
            (identical(other.paymentNotification, paymentNotification) ||
                other.paymentNotification == paymentNotification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentNotification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentNotificationEventCopyWith<_$_PaymentNotificationEvent>
      get copyWith => __$$_PaymentNotificationEventCopyWithImpl<
          _$_PaymentNotificationEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentNotification paymentNotification)
        updatePaymentNotification,
    required TResult Function(PaymentNotification paymentNotification,
            String day, bool updatedValue)
        updateAdviceExpiryReminder,
  }) {
    return updatePaymentNotification(paymentNotification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentNotification paymentNotification)?
        updatePaymentNotification,
    TResult? Function(PaymentNotification paymentNotification, String day,
            bool updatedValue)?
        updateAdviceExpiryReminder,
  }) {
    return updatePaymentNotification?.call(paymentNotification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentNotification paymentNotification)?
        updatePaymentNotification,
    TResult Function(PaymentNotification paymentNotification, String day,
            bool updatedValue)?
        updateAdviceExpiryReminder,
    required TResult orElse(),
  }) {
    if (updatePaymentNotification != null) {
      return updatePaymentNotification(paymentNotification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaymentNotificationEvent value)
        updatePaymentNotification,
    required TResult Function(_UpdateAdviceExpiryReminder value)
        updateAdviceExpiryReminder,
  }) {
    return updatePaymentNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaymentNotificationEvent value)?
        updatePaymentNotification,
    TResult? Function(_UpdateAdviceExpiryReminder value)?
        updateAdviceExpiryReminder,
  }) {
    return updatePaymentNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaymentNotificationEvent value)?
        updatePaymentNotification,
    TResult Function(_UpdateAdviceExpiryReminder value)?
        updateAdviceExpiryReminder,
    required TResult orElse(),
  }) {
    if (updatePaymentNotification != null) {
      return updatePaymentNotification(this);
    }
    return orElse();
  }
}

abstract class _PaymentNotificationEvent implements PaymentNotificationEvent {
  const factory _PaymentNotificationEvent(
          {required final PaymentNotification paymentNotification}) =
      _$_PaymentNotificationEvent;

  @override
  PaymentNotification get paymentNotification;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentNotificationEventCopyWith<_$_PaymentNotificationEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateAdviceExpiryReminderCopyWith<$Res>
    implements $PaymentNotificationEventCopyWith<$Res> {
  factory _$$_UpdateAdviceExpiryReminderCopyWith(
          _$_UpdateAdviceExpiryReminder value,
          $Res Function(_$_UpdateAdviceExpiryReminder) then) =
      __$$_UpdateAdviceExpiryReminderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentNotification paymentNotification, String day, bool updatedValue});

  @override
  $PaymentNotificationCopyWith<$Res> get paymentNotification;
}

/// @nodoc
class __$$_UpdateAdviceExpiryReminderCopyWithImpl<$Res>
    extends _$PaymentNotificationEventCopyWithImpl<$Res,
        _$_UpdateAdviceExpiryReminder>
    implements _$$_UpdateAdviceExpiryReminderCopyWith<$Res> {
  __$$_UpdateAdviceExpiryReminderCopyWithImpl(
      _$_UpdateAdviceExpiryReminder _value,
      $Res Function(_$_UpdateAdviceExpiryReminder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentNotification = null,
    Object? day = null,
    Object? updatedValue = null,
  }) {
    return _then(_$_UpdateAdviceExpiryReminder(
      paymentNotification: null == paymentNotification
          ? _value.paymentNotification
          : paymentNotification // ignore: cast_nullable_to_non_nullable
              as PaymentNotification,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      updatedValue: null == updatedValue
          ? _value.updatedValue
          : updatedValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpdateAdviceExpiryReminder implements _UpdateAdviceExpiryReminder {
  const _$_UpdateAdviceExpiryReminder(
      {required this.paymentNotification,
      required this.day,
      required this.updatedValue});

  @override
  final PaymentNotification paymentNotification;
  @override
  final String day;
  @override
  final bool updatedValue;

  @override
  String toString() {
    return 'PaymentNotificationEvent.updateAdviceExpiryReminder(paymentNotification: $paymentNotification, day: $day, updatedValue: $updatedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateAdviceExpiryReminder &&
            (identical(other.paymentNotification, paymentNotification) ||
                other.paymentNotification == paymentNotification) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.updatedValue, updatedValue) ||
                other.updatedValue == updatedValue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentNotification, day, updatedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateAdviceExpiryReminderCopyWith<_$_UpdateAdviceExpiryReminder>
      get copyWith => __$$_UpdateAdviceExpiryReminderCopyWithImpl<
          _$_UpdateAdviceExpiryReminder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PaymentNotification paymentNotification)
        updatePaymentNotification,
    required TResult Function(PaymentNotification paymentNotification,
            String day, bool updatedValue)
        updateAdviceExpiryReminder,
  }) {
    return updateAdviceExpiryReminder(paymentNotification, day, updatedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PaymentNotification paymentNotification)?
        updatePaymentNotification,
    TResult? Function(PaymentNotification paymentNotification, String day,
            bool updatedValue)?
        updateAdviceExpiryReminder,
  }) {
    return updateAdviceExpiryReminder?.call(
        paymentNotification, day, updatedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PaymentNotification paymentNotification)?
        updatePaymentNotification,
    TResult Function(PaymentNotification paymentNotification, String day,
            bool updatedValue)?
        updateAdviceExpiryReminder,
    required TResult orElse(),
  }) {
    if (updateAdviceExpiryReminder != null) {
      return updateAdviceExpiryReminder(paymentNotification, day, updatedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PaymentNotificationEvent value)
        updatePaymentNotification,
    required TResult Function(_UpdateAdviceExpiryReminder value)
        updateAdviceExpiryReminder,
  }) {
    return updateAdviceExpiryReminder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PaymentNotificationEvent value)?
        updatePaymentNotification,
    TResult? Function(_UpdateAdviceExpiryReminder value)?
        updateAdviceExpiryReminder,
  }) {
    return updateAdviceExpiryReminder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PaymentNotificationEvent value)?
        updatePaymentNotification,
    TResult Function(_UpdateAdviceExpiryReminder value)?
        updateAdviceExpiryReminder,
    required TResult orElse(),
  }) {
    if (updateAdviceExpiryReminder != null) {
      return updateAdviceExpiryReminder(this);
    }
    return orElse();
  }
}

abstract class _UpdateAdviceExpiryReminder implements PaymentNotificationEvent {
  const factory _UpdateAdviceExpiryReminder(
      {required final PaymentNotification paymentNotification,
      required final String day,
      required final bool updatedValue}) = _$_UpdateAdviceExpiryReminder;

  @override
  PaymentNotification get paymentNotification;
  String get day;
  bool get updatedValue;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateAdviceExpiryReminderCopyWith<_$_UpdateAdviceExpiryReminder>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentNotificationState {
  String get message => throw _privateConstructorUsedError;
  PaymentNotification get paymentNotification =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentNotificationStateCopyWith<PaymentNotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentNotificationStateCopyWith<$Res> {
  factory $PaymentNotificationStateCopyWith(PaymentNotificationState value,
          $Res Function(PaymentNotificationState) then) =
      _$PaymentNotificationStateCopyWithImpl<$Res, PaymentNotificationState>;
  @useResult
  $Res call(
      {String message,
      PaymentNotification paymentNotification,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $PaymentNotificationCopyWith<$Res> get paymentNotification;
}

/// @nodoc
class _$PaymentNotificationStateCopyWithImpl<$Res,
        $Val extends PaymentNotificationState>
    implements $PaymentNotificationStateCopyWith<$Res> {
  _$PaymentNotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? paymentNotification = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNotification: null == paymentNotification
          ? _value.paymentNotification
          : paymentNotification // ignore: cast_nullable_to_non_nullable
              as PaymentNotification,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentNotificationCopyWith<$Res> get paymentNotification {
    return $PaymentNotificationCopyWith<$Res>(_value.paymentNotification,
        (value) {
      return _then(_value.copyWith(paymentNotification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentNotificationStateCopyWith<$Res>
    implements $PaymentNotificationStateCopyWith<$Res> {
  factory _$$_PaymentNotificationStateCopyWith(
          _$_PaymentNotificationState value,
          $Res Function(_$_PaymentNotificationState) then) =
      __$$_PaymentNotificationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      PaymentNotification paymentNotification,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $PaymentNotificationCopyWith<$Res> get paymentNotification;
}

/// @nodoc
class __$$_PaymentNotificationStateCopyWithImpl<$Res>
    extends _$PaymentNotificationStateCopyWithImpl<$Res,
        _$_PaymentNotificationState>
    implements _$$_PaymentNotificationStateCopyWith<$Res> {
  __$$_PaymentNotificationStateCopyWithImpl(_$_PaymentNotificationState _value,
      $Res Function(_$_PaymentNotificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? paymentNotification = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_PaymentNotificationState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNotification: null == paymentNotification
          ? _value.paymentNotification
          : paymentNotification // ignore: cast_nullable_to_non_nullable
              as PaymentNotification,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_PaymentNotificationState extends _PaymentNotificationState {
  const _$_PaymentNotificationState(
      {required this.message,
      required this.paymentNotification,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final String message;
  @override
  final PaymentNotification paymentNotification;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentNotificationState(message: $message, paymentNotification: $paymentNotification, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentNotificationState &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.paymentNotification, paymentNotification) ||
                other.paymentNotification == paymentNotification) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, paymentNotification, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentNotificationStateCopyWith<_$_PaymentNotificationState>
      get copyWith => __$$_PaymentNotificationStateCopyWithImpl<
          _$_PaymentNotificationState>(this, _$identity);
}

abstract class _PaymentNotificationState extends PaymentNotificationState {
  const factory _PaymentNotificationState(
      {required final String message,
      required final PaymentNotification paymentNotification,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_PaymentNotificationState;
  const _PaymentNotificationState._() : super._();

  @override
  String get message;
  @override
  PaymentNotification get paymentNotification;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentNotificationStateCopyWith<_$_PaymentNotificationState>
      get copyWith => throw _privateConstructorUsedError;
}
