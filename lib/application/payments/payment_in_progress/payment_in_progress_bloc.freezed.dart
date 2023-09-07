// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_in_progress_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentInProgressEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInProgressEventCopyWith<$Res> {
  factory $PaymentInProgressEventCopyWith(PaymentInProgressEvent value,
          $Res Function(PaymentInProgressEvent) then) =
      _$PaymentInProgressEventCopyWithImpl<$Res, PaymentInProgressEvent>;
}

/// @nodoc
class _$PaymentInProgressEventCopyWithImpl<$Res,
        $Val extends PaymentInProgressEvent>
    implements $PaymentInProgressEventCopyWith<$Res> {
  _$PaymentInProgressEventCopyWithImpl(this._value, this._then);

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
    extends _$PaymentInProgressEventCopyWithImpl<$Res, _$_initialized>
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
    return 'PaymentInProgressEvent.initialized()';
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
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
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
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements PaymentInProgressEvent {
  const factory _initialized() = _$_initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$PaymentInProgressEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_Fetch(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(
      {required this.salesOrganization, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'PaymentInProgressEvent.fetch(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganization, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return fetch(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return fetch?.call(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganization, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PaymentInProgressEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo}) = _$_Fetch;

  SalesOrganisation get salesOrganization;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentInProgressState {
  StringValue get amount => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentInProgressStateCopyWith<PaymentInProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInProgressStateCopyWith<$Res> {
  factory $PaymentInProgressStateCopyWith(PaymentInProgressState value,
          $Res Function(PaymentInProgressState) then) =
      _$PaymentInProgressStateCopyWithImpl<$Res, PaymentInProgressState>;
  @useResult
  $Res call(
      {StringValue amount,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$PaymentInProgressStateCopyWithImpl<$Res,
        $Val extends PaymentInProgressState>
    implements $PaymentInProgressStateCopyWith<$Res> {
  _$PaymentInProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as StringValue,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentSummaryStateCopyWith<$Res>
    implements $PaymentInProgressStateCopyWith<$Res> {
  factory _$$_PaymentSummaryStateCopyWith(_$_PaymentSummaryState value,
          $Res Function(_$_PaymentSummaryState) then) =
      __$$_PaymentSummaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringValue amount,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$_PaymentSummaryStateCopyWithImpl<$Res>
    extends _$PaymentInProgressStateCopyWithImpl<$Res, _$_PaymentSummaryState>
    implements _$$_PaymentSummaryStateCopyWith<$Res> {
  __$$_PaymentSummaryStateCopyWithImpl(_$_PaymentSummaryState _value,
      $Res Function(_$_PaymentSummaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_PaymentSummaryState(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as StringValue,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_PaymentSummaryState extends _PaymentSummaryState {
  const _$_PaymentSummaryState(
      {required this.amount,
      required this.isFetching,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final StringValue amount;
  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentInProgressState(amount: $amount, isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentSummaryState &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, isFetching, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentSummaryStateCopyWith<_$_PaymentSummaryState> get copyWith =>
      __$$_PaymentSummaryStateCopyWithImpl<_$_PaymentSummaryState>(
          this, _$identity);
}

abstract class _PaymentSummaryState extends PaymentInProgressState {
  const factory _PaymentSummaryState(
      {required final StringValue amount,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_PaymentSummaryState;
  const _PaymentSummaryState._() : super._();

  @override
  StringValue get amount;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentSummaryStateCopyWith<_$_PaymentSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
