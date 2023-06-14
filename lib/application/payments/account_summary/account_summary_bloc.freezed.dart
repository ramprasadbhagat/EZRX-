// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchInvoiceSummary,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchCreditSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchInvoiceSummary value) fetchInvoiceSummary,
    required TResult Function(_FetchCreditSummary value) fetchCreditSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult? Function(_FetchCreditSummary value)? fetchCreditSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult Function(_FetchCreditSummary value)? fetchCreditSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSummaryEventCopyWith<$Res> {
  factory $AccountSummaryEventCopyWith(
          AccountSummaryEvent value, $Res Function(AccountSummaryEvent) then) =
      _$AccountSummaryEventCopyWithImpl<$Res, AccountSummaryEvent>;
}

/// @nodoc
class _$AccountSummaryEventCopyWithImpl<$Res, $Val extends AccountSummaryEvent>
    implements $AccountSummaryEventCopyWith<$Res> {
  _$AccountSummaryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializeCopyWith<$Res> {
  factory _$$_InitializeCopyWith(
          _$_Initialize value, $Res Function(_$_Initialize) then) =
      __$$_InitializeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializeCopyWithImpl<$Res>
    extends _$AccountSummaryEventCopyWithImpl<$Res, _$_Initialize>
    implements _$$_InitializeCopyWith<$Res> {
  __$$_InitializeCopyWithImpl(
      _$_Initialize _value, $Res Function(_$_Initialize) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialize implements _Initialize {
  const _$_Initialize();

  @override
  String toString() {
    return 'AccountSummaryEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialize);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchInvoiceSummary,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchCreditSummary,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchInvoiceSummary value) fetchInvoiceSummary,
    required TResult Function(_FetchCreditSummary value) fetchCreditSummary,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult? Function(_FetchCreditSummary value)? fetchCreditSummary,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult Function(_FetchCreditSummary value)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AccountSummaryEvent {
  const factory _Initialize() = _$_Initialize;
}

/// @nodoc
abstract class _$$_FetchInvoiceSummaryCopyWith<$Res> {
  factory _$$_FetchInvoiceSummaryCopyWith(_$_FetchInvoiceSummary value,
          $Res Function(_$_FetchInvoiceSummary) then) =
      __$$_FetchInvoiceSummaryCopyWithImpl<$Res>;
  @useResult
  $Res call({String custCode, SalesOrg salesOrg});
}

/// @nodoc
class __$$_FetchInvoiceSummaryCopyWithImpl<$Res>
    extends _$AccountSummaryEventCopyWithImpl<$Res, _$_FetchInvoiceSummary>
    implements _$$_FetchInvoiceSummaryCopyWith<$Res> {
  __$$_FetchInvoiceSummaryCopyWithImpl(_$_FetchInvoiceSummary _value,
      $Res Function(_$_FetchInvoiceSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custCode = null,
    Object? salesOrg = null,
  }) {
    return _then(_$_FetchInvoiceSummary(
      custCode: null == custCode
          ? _value.custCode
          : custCode // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_FetchInvoiceSummary implements _FetchInvoiceSummary {
  const _$_FetchInvoiceSummary(
      {required this.custCode, required this.salesOrg});

  @override
  final String custCode;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AccountSummaryEvent.fetchInvoiceSummary(custCode: $custCode, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchInvoiceSummary &&
            (identical(other.custCode, custCode) ||
                other.custCode == custCode) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, custCode, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchInvoiceSummaryCopyWith<_$_FetchInvoiceSummary> get copyWith =>
      __$$_FetchInvoiceSummaryCopyWithImpl<_$_FetchInvoiceSummary>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchInvoiceSummary,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchCreditSummary,
  }) {
    return fetchInvoiceSummary(custCode, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
  }) {
    return fetchInvoiceSummary?.call(custCode, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (fetchInvoiceSummary != null) {
      return fetchInvoiceSummary(custCode, salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchInvoiceSummary value) fetchInvoiceSummary,
    required TResult Function(_FetchCreditSummary value) fetchCreditSummary,
  }) {
    return fetchInvoiceSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult? Function(_FetchCreditSummary value)? fetchCreditSummary,
  }) {
    return fetchInvoiceSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult Function(_FetchCreditSummary value)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (fetchInvoiceSummary != null) {
      return fetchInvoiceSummary(this);
    }
    return orElse();
  }
}

abstract class _FetchInvoiceSummary implements AccountSummaryEvent {
  const factory _FetchInvoiceSummary(
      {required final String custCode,
      required final SalesOrg salesOrg}) = _$_FetchInvoiceSummary;

  String get custCode;
  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$_FetchInvoiceSummaryCopyWith<_$_FetchInvoiceSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCreditSummaryCopyWith<$Res> {
  factory _$$_FetchCreditSummaryCopyWith(_$_FetchCreditSummary value,
          $Res Function(_$_FetchCreditSummary) then) =
      __$$_FetchCreditSummaryCopyWithImpl<$Res>;
  @useResult
  $Res call({String custCode, SalesOrg salesOrg});
}

/// @nodoc
class __$$_FetchCreditSummaryCopyWithImpl<$Res>
    extends _$AccountSummaryEventCopyWithImpl<$Res, _$_FetchCreditSummary>
    implements _$$_FetchCreditSummaryCopyWith<$Res> {
  __$$_FetchCreditSummaryCopyWithImpl(
      _$_FetchCreditSummary _value, $Res Function(_$_FetchCreditSummary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custCode = null,
    Object? salesOrg = null,
  }) {
    return _then(_$_FetchCreditSummary(
      custCode: null == custCode
          ? _value.custCode
          : custCode // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$_FetchCreditSummary implements _FetchCreditSummary {
  const _$_FetchCreditSummary({required this.custCode, required this.salesOrg});

  @override
  final String custCode;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AccountSummaryEvent.fetchCreditSummary(custCode: $custCode, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchCreditSummary &&
            (identical(other.custCode, custCode) ||
                other.custCode == custCode) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, custCode, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCreditSummaryCopyWith<_$_FetchCreditSummary> get copyWith =>
      __$$_FetchCreditSummaryCopyWithImpl<_$_FetchCreditSummary>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchInvoiceSummary,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchCreditSummary,
  }) {
    return fetchCreditSummary(custCode, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
  }) {
    return fetchCreditSummary?.call(custCode, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (fetchCreditSummary != null) {
      return fetchCreditSummary(custCode, salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchInvoiceSummary value) fetchInvoiceSummary,
    required TResult Function(_FetchCreditSummary value) fetchCreditSummary,
  }) {
    return fetchCreditSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult? Function(_FetchCreditSummary value)? fetchCreditSummary,
  }) {
    return fetchCreditSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult Function(_FetchCreditSummary value)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (fetchCreditSummary != null) {
      return fetchCreditSummary(this);
    }
    return orElse();
  }
}

abstract class _FetchCreditSummary implements AccountSummaryEvent {
  const factory _FetchCreditSummary(
      {required final String custCode,
      required final SalesOrg salesOrg}) = _$_FetchCreditSummary;

  String get custCode;
  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$_FetchCreditSummaryCopyWith<_$_FetchCreditSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountSummaryState {
  OutstandingBalance get outstandingBalance =>
      throw _privateConstructorUsedError;
  CreditLimit get creditLimit => throw _privateConstructorUsedError;
  bool get isFetchingOutstandingBalance => throw _privateConstructorUsedError;
  bool get isFetchingCreditLimit => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountSummaryStateCopyWith<AccountSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSummaryStateCopyWith<$Res> {
  factory $AccountSummaryStateCopyWith(
          AccountSummaryState value, $Res Function(AccountSummaryState) then) =
      _$AccountSummaryStateCopyWithImpl<$Res, AccountSummaryState>;
  @useResult
  $Res call(
      {OutstandingBalance outstandingBalance,
      CreditLimit creditLimit,
      bool isFetchingOutstandingBalance,
      bool isFetchingCreditLimit,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $OutstandingBalanceCopyWith<$Res> get outstandingBalance;
  $CreditLimitCopyWith<$Res> get creditLimit;
}

/// @nodoc
class _$AccountSummaryStateCopyWithImpl<$Res, $Val extends AccountSummaryState>
    implements $AccountSummaryStateCopyWith<$Res> {
  _$AccountSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outstandingBalance = null,
    Object? creditLimit = null,
    Object? isFetchingOutstandingBalance = null,
    Object? isFetchingCreditLimit = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      outstandingBalance: null == outstandingBalance
          ? _value.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as OutstandingBalance,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as CreditLimit,
      isFetchingOutstandingBalance: null == isFetchingOutstandingBalance
          ? _value.isFetchingOutstandingBalance
          : isFetchingOutstandingBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingCreditLimit: null == isFetchingCreditLimit
          ? _value.isFetchingCreditLimit
          : isFetchingCreditLimit // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OutstandingBalanceCopyWith<$Res> get outstandingBalance {
    return $OutstandingBalanceCopyWith<$Res>(_value.outstandingBalance,
        (value) {
      return _then(_value.copyWith(outstandingBalance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditLimitCopyWith<$Res> get creditLimit {
    return $CreditLimitCopyWith<$Res>(_value.creditLimit, (value) {
      return _then(_value.copyWith(creditLimit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountSummaryStateCopyWith<$Res>
    implements $AccountSummaryStateCopyWith<$Res> {
  factory _$$_AccountSummaryStateCopyWith(_$_AccountSummaryState value,
          $Res Function(_$_AccountSummaryState) then) =
      __$$_AccountSummaryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OutstandingBalance outstandingBalance,
      CreditLimit creditLimit,
      bool isFetchingOutstandingBalance,
      bool isFetchingCreditLimit,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $OutstandingBalanceCopyWith<$Res> get outstandingBalance;
  @override
  $CreditLimitCopyWith<$Res> get creditLimit;
}

/// @nodoc
class __$$_AccountSummaryStateCopyWithImpl<$Res>
    extends _$AccountSummaryStateCopyWithImpl<$Res, _$_AccountSummaryState>
    implements _$$_AccountSummaryStateCopyWith<$Res> {
  __$$_AccountSummaryStateCopyWithImpl(_$_AccountSummaryState _value,
      $Res Function(_$_AccountSummaryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outstandingBalance = null,
    Object? creditLimit = null,
    Object? isFetchingOutstandingBalance = null,
    Object? isFetchingCreditLimit = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_AccountSummaryState(
      outstandingBalance: null == outstandingBalance
          ? _value.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as OutstandingBalance,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as CreditLimit,
      isFetchingOutstandingBalance: null == isFetchingOutstandingBalance
          ? _value.isFetchingOutstandingBalance
          : isFetchingOutstandingBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingCreditLimit: null == isFetchingCreditLimit
          ? _value.isFetchingCreditLimit
          : isFetchingCreditLimit // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_AccountSummaryState extends _AccountSummaryState {
  const _$_AccountSummaryState(
      {required this.outstandingBalance,
      required this.creditLimit,
      required this.isFetchingOutstandingBalance,
      required this.isFetchingCreditLimit,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final OutstandingBalance outstandingBalance;
  @override
  final CreditLimit creditLimit;
  @override
  final bool isFetchingOutstandingBalance;
  @override
  final bool isFetchingCreditLimit;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'AccountSummaryState(outstandingBalance: $outstandingBalance, creditLimit: $creditLimit, isFetchingOutstandingBalance: $isFetchingOutstandingBalance, isFetchingCreditLimit: $isFetchingCreditLimit, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountSummaryState &&
            (identical(other.outstandingBalance, outstandingBalance) ||
                other.outstandingBalance == outstandingBalance) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.isFetchingOutstandingBalance,
                    isFetchingOutstandingBalance) ||
                other.isFetchingOutstandingBalance ==
                    isFetchingOutstandingBalance) &&
            (identical(other.isFetchingCreditLimit, isFetchingCreditLimit) ||
                other.isFetchingCreditLimit == isFetchingCreditLimit) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      outstandingBalance,
      creditLimit,
      isFetchingOutstandingBalance,
      isFetchingCreditLimit,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountSummaryStateCopyWith<_$_AccountSummaryState> get copyWith =>
      __$$_AccountSummaryStateCopyWithImpl<_$_AccountSummaryState>(
          this, _$identity);
}

abstract class _AccountSummaryState extends AccountSummaryState {
  const factory _AccountSummaryState(
      {required final OutstandingBalance outstandingBalance,
      required final CreditLimit creditLimit,
      required final bool isFetchingOutstandingBalance,
      required final bool isFetchingCreditLimit,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_AccountSummaryState;
  const _AccountSummaryState._() : super._();

  @override
  OutstandingBalance get outstandingBalance;
  @override
  CreditLimit get creditLimit;
  @override
  bool get isFetchingOutstandingBalance;
  @override
  bool get isFetchingCreditLimit;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AccountSummaryStateCopyWith<_$_AccountSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
