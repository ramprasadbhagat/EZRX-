// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_e_invoice_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadEInvoiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrg salesOrg, String invoiceNumber)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
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
abstract class $DownloadEInvoiceEventCopyWith<$Res> {
  factory $DownloadEInvoiceEventCopyWith(DownloadEInvoiceEvent value,
          $Res Function(DownloadEInvoiceEvent) then) =
      _$DownloadEInvoiceEventCopyWithImpl<$Res, DownloadEInvoiceEvent>;
}

/// @nodoc
class _$DownloadEInvoiceEventCopyWithImpl<$Res,
        $Val extends DownloadEInvoiceEvent>
    implements $DownloadEInvoiceEventCopyWith<$Res> {
  _$DownloadEInvoiceEventCopyWithImpl(this._value, this._then);

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
    extends _$DownloadEInvoiceEventCopyWithImpl<$Res, _$_initialized>
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
    return 'DownloadEInvoiceEvent.initialized()';
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
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrg salesOrg, String invoiceNumber)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
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

abstract class _initialized implements DownloadEInvoiceEvent {
  const factory _initialized() = _$_initialized;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      SalesOrg salesOrg,
      String invoiceNumber});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$DownloadEInvoiceEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrg = null,
    Object? invoiceNumber = null,
  }) {
    return _then(_$_Fetch(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
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
      {required this.customerCodeInfo,
      required this.salesOrg,
      required this.invoiceNumber});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrg salesOrg;
  @override
  final String invoiceNumber;

  @override
  String toString() {
    return 'DownloadEInvoiceEvent.fetch(customerCodeInfo: $customerCodeInfo, salesOrg: $salesOrg, invoiceNumber: $invoiceNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, customerCodeInfo, salesOrg, invoiceNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrg salesOrg, String invoiceNumber)
        fetch,
  }) {
    return fetch(customerCodeInfo, salesOrg, invoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetch,
  }) {
    return fetch?.call(customerCodeInfo, salesOrg, invoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(customerCodeInfo, salesOrg, invoiceNumber);
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

abstract class _Fetch implements DownloadEInvoiceEvent {
  const factory _Fetch(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrg salesOrg,
      required final String invoiceNumber}) = _$_Fetch;

  CustomerCodeInfo get customerCodeInfo;
  SalesOrg get salesOrg;
  String get invoiceNumber;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DownloadEInvoiceState {
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  DownloadPaymentAttachment get eInvoice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadEInvoiceStateCopyWith<DownloadEInvoiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadEInvoiceStateCopyWith<$Res> {
  factory $DownloadEInvoiceStateCopyWith(DownloadEInvoiceState value,
          $Res Function(DownloadEInvoiceState) then) =
      _$DownloadEInvoiceStateCopyWithImpl<$Res, DownloadEInvoiceState>;
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      DownloadPaymentAttachment eInvoice});

  $DownloadPaymentAttachmentCopyWith<$Res> get eInvoice;
}

/// @nodoc
class _$DownloadEInvoiceStateCopyWithImpl<$Res,
        $Val extends DownloadEInvoiceState>
    implements $DownloadEInvoiceStateCopyWith<$Res> {
  _$DownloadEInvoiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? eInvoice = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      eInvoice: null == eInvoice
          ? _value.eInvoice
          : eInvoice // ignore: cast_nullable_to_non_nullable
              as DownloadPaymentAttachment,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DownloadPaymentAttachmentCopyWith<$Res> get eInvoice {
    return $DownloadPaymentAttachmentCopyWith<$Res>(_value.eInvoice, (value) {
      return _then(_value.copyWith(eInvoice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DownloadEInvoiceStateCopyWith<$Res>
    implements $DownloadEInvoiceStateCopyWith<$Res> {
  factory _$$_DownloadEInvoiceStateCopyWith(_$_DownloadEInvoiceState value,
          $Res Function(_$_DownloadEInvoiceState) then) =
      __$$_DownloadEInvoiceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      DownloadPaymentAttachment eInvoice});

  @override
  $DownloadPaymentAttachmentCopyWith<$Res> get eInvoice;
}

/// @nodoc
class __$$_DownloadEInvoiceStateCopyWithImpl<$Res>
    extends _$DownloadEInvoiceStateCopyWithImpl<$Res, _$_DownloadEInvoiceState>
    implements _$$_DownloadEInvoiceStateCopyWith<$Res> {
  __$$_DownloadEInvoiceStateCopyWithImpl(_$_DownloadEInvoiceState _value,
      $Res Function(_$_DownloadEInvoiceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? eInvoice = null,
  }) {
    return _then(_$_DownloadEInvoiceState(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      eInvoice: null == eInvoice
          ? _value.eInvoice
          : eInvoice // ignore: cast_nullable_to_non_nullable
              as DownloadPaymentAttachment,
    ));
  }
}

/// @nodoc

class _$_DownloadEInvoiceState extends _DownloadEInvoiceState {
  const _$_DownloadEInvoiceState(
      {required this.isFetching,
      required this.failureOrSuccessOption,
      required this.eInvoice})
      : super._();

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final DownloadPaymentAttachment eInvoice;

  @override
  String toString() {
    return 'DownloadEInvoiceState(isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption, eInvoice: $eInvoice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadEInvoiceState &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.eInvoice, eInvoice) ||
                other.eInvoice == eInvoice));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFetching, failureOrSuccessOption, eInvoice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadEInvoiceStateCopyWith<_$_DownloadEInvoiceState> get copyWith =>
      __$$_DownloadEInvoiceStateCopyWithImpl<_$_DownloadEInvoiceState>(
          this, _$identity);
}

abstract class _DownloadEInvoiceState extends DownloadEInvoiceState {
  const factory _DownloadEInvoiceState(
      {required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final DownloadPaymentAttachment
          eInvoice}) = _$_DownloadEInvoiceState;
  const _DownloadEInvoiceState._() : super._();

  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  DownloadPaymentAttachment get eInvoice;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadEInvoiceStateCopyWith<_$_DownloadEInvoiceState> get copyWith =>
      throw _privateConstructorUsedError;
}
