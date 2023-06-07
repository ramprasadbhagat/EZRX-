// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_payment_attachments_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadPaymentAttachmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)
        fetchAllInvoiceUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)
        fetchAllCreditUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadPaymentAttachmentEventCopyWith<$Res> {
  factory $DownloadPaymentAttachmentEventCopyWith(
          DownloadPaymentAttachmentEvent value,
          $Res Function(DownloadPaymentAttachmentEvent) then) =
      _$DownloadPaymentAttachmentEventCopyWithImpl<$Res,
          DownloadPaymentAttachmentEvent>;
}

/// @nodoc
class _$DownloadPaymentAttachmentEventCopyWithImpl<$Res,
        $Val extends DownloadPaymentAttachmentEvent>
    implements $DownloadPaymentAttachmentEventCopyWith<$Res> {
  _$DownloadPaymentAttachmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchAllInvoiceUrlCopyWith<$Res> {
  factory _$$_FetchAllInvoiceUrlCopyWith(_$_FetchAllInvoiceUrl value,
          $Res Function(_$_FetchAllInvoiceUrl) then) =
      __$$_FetchAllInvoiceUrlCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      AllInvoicesFilter queryObject});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $AllInvoicesFilterCopyWith<$Res> get queryObject;
}

/// @nodoc
class __$$_FetchAllInvoiceUrlCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentEventCopyWithImpl<$Res,
        _$_FetchAllInvoiceUrl> implements _$$_FetchAllInvoiceUrlCopyWith<$Res> {
  __$$_FetchAllInvoiceUrlCopyWithImpl(
      _$_FetchAllInvoiceUrl _value, $Res Function(_$_FetchAllInvoiceUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? queryObject = null,
  }) {
    return _then(_$_FetchAllInvoiceUrl(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      queryObject: null == queryObject
          ? _value.queryObject
          : queryObject // ignore: cast_nullable_to_non_nullable
              as AllInvoicesFilter,
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

  @override
  @pragma('vm:prefer-inline')
  $AllInvoicesFilterCopyWith<$Res> get queryObject {
    return $AllInvoicesFilterCopyWith<$Res>(_value.queryObject, (value) {
      return _then(_value.copyWith(queryObject: value));
    });
  }
}

/// @nodoc

class _$_FetchAllInvoiceUrl implements _FetchAllInvoiceUrl {
  const _$_FetchAllInvoiceUrl(
      {required this.salesOrganization,
      required this.customerCodeInfo,
      required this.queryObject});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final AllInvoicesFilter queryObject;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, queryObject: $queryObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAllInvoiceUrl &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.queryObject, queryObject) ||
                other.queryObject == queryObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganization, customerCodeInfo, queryObject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchAllInvoiceUrlCopyWith<_$_FetchAllInvoiceUrl> get copyWith =>
      __$$_FetchAllInvoiceUrlCopyWithImpl<_$_FetchAllInvoiceUrl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)
        fetchAllInvoiceUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)
        fetchAllCreditUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
  }) {
    return fetchAllInvoiceUrl(salesOrganization, customerCodeInfo, queryObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
  }) {
    return fetchAllInvoiceUrl?.call(
        salesOrganization, customerCodeInfo, queryObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) {
    if (fetchAllInvoiceUrl != null) {
      return fetchAllInvoiceUrl(
          salesOrganization, customerCodeInfo, queryObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
  }) {
    return fetchAllInvoiceUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
  }) {
    return fetchAllInvoiceUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) {
    if (fetchAllInvoiceUrl != null) {
      return fetchAllInvoiceUrl(this);
    }
    return orElse();
  }
}

abstract class _FetchAllInvoiceUrl implements DownloadPaymentAttachmentEvent {
  const factory _FetchAllInvoiceUrl(
      {required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final AllInvoicesFilter queryObject}) = _$_FetchAllInvoiceUrl;

  SalesOrganisation get salesOrganization;
  CustomerCodeInfo get customerCodeInfo;
  AllInvoicesFilter get queryObject;
  @JsonKey(ignore: true)
  _$$_FetchAllInvoiceUrlCopyWith<_$_FetchAllInvoiceUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchAllCreditUrlCopyWith<$Res> {
  factory _$$_FetchAllCreditUrlCopyWith(_$_FetchAllCreditUrl value,
          $Res Function(_$_FetchAllCreditUrl) then) =
      __$$_FetchAllCreditUrlCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      AllCreditsFilter queryObject});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $AllCreditsFilterCopyWith<$Res> get queryObject;
}

/// @nodoc
class __$$_FetchAllCreditUrlCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentEventCopyWithImpl<$Res,
        _$_FetchAllCreditUrl> implements _$$_FetchAllCreditUrlCopyWith<$Res> {
  __$$_FetchAllCreditUrlCopyWithImpl(
      _$_FetchAllCreditUrl _value, $Res Function(_$_FetchAllCreditUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? queryObject = null,
  }) {
    return _then(_$_FetchAllCreditUrl(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      queryObject: null == queryObject
          ? _value.queryObject
          : queryObject // ignore: cast_nullable_to_non_nullable
              as AllCreditsFilter,
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

  @override
  @pragma('vm:prefer-inline')
  $AllCreditsFilterCopyWith<$Res> get queryObject {
    return $AllCreditsFilterCopyWith<$Res>(_value.queryObject, (value) {
      return _then(_value.copyWith(queryObject: value));
    });
  }
}

/// @nodoc

class _$_FetchAllCreditUrl implements _FetchAllCreditUrl {
  const _$_FetchAllCreditUrl(
      {required this.salesOrganization,
      required this.customerCodeInfo,
      required this.queryObject});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final AllCreditsFilter queryObject;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.fetchAllCreditUrl(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, queryObject: $queryObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAllCreditUrl &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.queryObject, queryObject) ||
                other.queryObject == queryObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganization, customerCodeInfo, queryObject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchAllCreditUrlCopyWith<_$_FetchAllCreditUrl> get copyWith =>
      __$$_FetchAllCreditUrlCopyWithImpl<_$_FetchAllCreditUrl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)
        fetchAllInvoiceUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)
        fetchAllCreditUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
  }) {
    return fetchAllCreditUrl(salesOrganization, customerCodeInfo, queryObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
  }) {
    return fetchAllCreditUrl?.call(
        salesOrganization, customerCodeInfo, queryObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) {
    if (fetchAllCreditUrl != null) {
      return fetchAllCreditUrl(
          salesOrganization, customerCodeInfo, queryObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
  }) {
    return fetchAllCreditUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
  }) {
    return fetchAllCreditUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) {
    if (fetchAllCreditUrl != null) {
      return fetchAllCreditUrl(this);
    }
    return orElse();
  }
}

abstract class _FetchAllCreditUrl implements DownloadPaymentAttachmentEvent {
  const factory _FetchAllCreditUrl(
      {required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final AllCreditsFilter queryObject}) = _$_FetchAllCreditUrl;

  SalesOrganisation get salesOrganization;
  CustomerCodeInfo get customerCodeInfo;
  AllCreditsFilter get queryObject;
  @JsonKey(ignore: true)
  _$$_FetchAllCreditUrlCopyWith<_$_FetchAllCreditUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchPaymentSummaryUrlCopyWith<$Res> {
  factory _$$_FetchPaymentSummaryUrlCopyWith(_$_FetchPaymentSummaryUrl value,
          $Res Function(_$_FetchPaymentSummaryUrl) then) =
      __$$_FetchPaymentSummaryUrlCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$_FetchPaymentSummaryUrlCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentEventCopyWithImpl<$Res,
        _$_FetchPaymentSummaryUrl>
    implements _$$_FetchPaymentSummaryUrlCopyWith<$Res> {
  __$$_FetchPaymentSummaryUrlCopyWithImpl(_$_FetchPaymentSummaryUrl _value,
      $Res Function(_$_FetchPaymentSummaryUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$_FetchPaymentSummaryUrl(
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

class _$_FetchPaymentSummaryUrl implements _FetchPaymentSummaryUrl {
  const _$_FetchPaymentSummaryUrl(
      {required this.salesOrganization, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPaymentSummaryUrl &&
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
  _$$_FetchPaymentSummaryUrlCopyWith<_$_FetchPaymentSummaryUrl> get copyWith =>
      __$$_FetchPaymentSummaryUrlCopyWithImpl<_$_FetchPaymentSummaryUrl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)
        fetchAllInvoiceUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)
        fetchAllCreditUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
  }) {
    return fetchPaymentSummaryUrl(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
  }) {
    return fetchPaymentSummaryUrl?.call(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryUrl != null) {
      return fetchPaymentSummaryUrl(salesOrganization, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
  }) {
    return fetchPaymentSummaryUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
  }) {
    return fetchPaymentSummaryUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryUrl != null) {
      return fetchPaymentSummaryUrl(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentSummaryUrl
    implements DownloadPaymentAttachmentEvent {
  const factory _FetchPaymentSummaryUrl(
          {required final SalesOrganisation salesOrganization,
          required final CustomerCodeInfo customerCodeInfo}) =
      _$_FetchPaymentSummaryUrl;

  SalesOrganisation get salesOrganization;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$_FetchPaymentSummaryUrlCopyWith<_$_FetchPaymentSummaryUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DownloadPaymentAttachmentCopyWith<$Res> {
  factory _$$_DownloadPaymentAttachmentCopyWith(
          _$_DownloadPaymentAttachment value,
          $Res Function(_$_DownloadPaymentAttachment) then) =
      __$$_DownloadPaymentAttachmentCopyWithImpl<$Res>;
  @useResult
  $Res call({DownloadPaymentAttachment files});

  $DownloadPaymentAttachmentCopyWith<$Res> get files;
}

/// @nodoc
class __$$_DownloadPaymentAttachmentCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentEventCopyWithImpl<$Res,
        _$_DownloadPaymentAttachment>
    implements _$$_DownloadPaymentAttachmentCopyWith<$Res> {
  __$$_DownloadPaymentAttachmentCopyWithImpl(
      _$_DownloadPaymentAttachment _value,
      $Res Function(_$_DownloadPaymentAttachment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? files = null,
  }) {
    return _then(_$_DownloadPaymentAttachment(
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as DownloadPaymentAttachment,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DownloadPaymentAttachmentCopyWith<$Res> get files {
    return $DownloadPaymentAttachmentCopyWith<$Res>(_value.files, (value) {
      return _then(_value.copyWith(files: value));
    });
  }
}

/// @nodoc

class _$_DownloadPaymentAttachment implements _DownloadPaymentAttachment {
  const _$_DownloadPaymentAttachment({required this.files});

  @override
  final DownloadPaymentAttachment files;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.downloadPaymentAttachment(files: $files)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadPaymentAttachment &&
            (identical(other.files, files) || other.files == files));
  }

  @override
  int get hashCode => Object.hash(runtimeType, files);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadPaymentAttachmentCopyWith<_$_DownloadPaymentAttachment>
      get copyWith => __$$_DownloadPaymentAttachmentCopyWithImpl<
          _$_DownloadPaymentAttachment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)
        fetchAllInvoiceUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)
        fetchAllCreditUrl,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
  }) {
    return downloadPaymentAttachment(files);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
  }) {
    return downloadPaymentAttachment?.call(files);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllInvoicesFilter queryObject)?
        fetchAllInvoiceUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, AllCreditsFilter queryObject)?
        fetchAllCreditUrl,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) {
    if (downloadPaymentAttachment != null) {
      return downloadPaymentAttachment(files);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
  }) {
    return downloadPaymentAttachment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
  }) {
    return downloadPaymentAttachment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    required TResult orElse(),
  }) {
    if (downloadPaymentAttachment != null) {
      return downloadPaymentAttachment(this);
    }
    return orElse();
  }
}

abstract class _DownloadPaymentAttachment
    implements DownloadPaymentAttachmentEvent {
  const factory _DownloadPaymentAttachment(
          {required final DownloadPaymentAttachment files}) =
      _$_DownloadPaymentAttachment;

  DownloadPaymentAttachment get files;
  @JsonKey(ignore: true)
  _$$_DownloadPaymentAttachmentCopyWith<_$_DownloadPaymentAttachment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DownloadPaymentAttachmentsState {
  DownloadPaymentAttachment get fileUrl => throw _privateConstructorUsedError;
  bool get isDownloadInProgress => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadPaymentAttachmentsStateCopyWith<DownloadPaymentAttachmentsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadPaymentAttachmentsStateCopyWith<$Res> {
  factory $DownloadPaymentAttachmentsStateCopyWith(
          DownloadPaymentAttachmentsState value,
          $Res Function(DownloadPaymentAttachmentsState) then) =
      _$DownloadPaymentAttachmentsStateCopyWithImpl<$Res,
          DownloadPaymentAttachmentsState>;
  @useResult
  $Res call(
      {DownloadPaymentAttachment fileUrl,
      bool isDownloadInProgress,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $DownloadPaymentAttachmentCopyWith<$Res> get fileUrl;
}

/// @nodoc
class _$DownloadPaymentAttachmentsStateCopyWithImpl<$Res,
        $Val extends DownloadPaymentAttachmentsState>
    implements $DownloadPaymentAttachmentsStateCopyWith<$Res> {
  _$DownloadPaymentAttachmentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = null,
    Object? isDownloadInProgress = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as DownloadPaymentAttachment,
      isDownloadInProgress: null == isDownloadInProgress
          ? _value.isDownloadInProgress
          : isDownloadInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DownloadPaymentAttachmentCopyWith<$Res> get fileUrl {
    return $DownloadPaymentAttachmentCopyWith<$Res>(_value.fileUrl, (value) {
      return _then(_value.copyWith(fileUrl: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DownloadPaymentAttachmentsStateCopyWith<$Res>
    implements $DownloadPaymentAttachmentsStateCopyWith<$Res> {
  factory _$$_DownloadPaymentAttachmentsStateCopyWith(
          _$_DownloadPaymentAttachmentsState value,
          $Res Function(_$_DownloadPaymentAttachmentsState) then) =
      __$$_DownloadPaymentAttachmentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DownloadPaymentAttachment fileUrl,
      bool isDownloadInProgress,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $DownloadPaymentAttachmentCopyWith<$Res> get fileUrl;
}

/// @nodoc
class __$$_DownloadPaymentAttachmentsStateCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentsStateCopyWithImpl<$Res,
        _$_DownloadPaymentAttachmentsState>
    implements _$$_DownloadPaymentAttachmentsStateCopyWith<$Res> {
  __$$_DownloadPaymentAttachmentsStateCopyWithImpl(
      _$_DownloadPaymentAttachmentsState _value,
      $Res Function(_$_DownloadPaymentAttachmentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = null,
    Object? isDownloadInProgress = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$_DownloadPaymentAttachmentsState(
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as DownloadPaymentAttachment,
      isDownloadInProgress: null == isDownloadInProgress
          ? _value.isDownloadInProgress
          : isDownloadInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$_DownloadPaymentAttachmentsState
    implements _DownloadPaymentAttachmentsState {
  const _$_DownloadPaymentAttachmentsState(
      {required this.fileUrl,
      required this.isDownloadInProgress,
      required this.failureOrSuccessOption});

  @override
  final DownloadPaymentAttachment fileUrl;
  @override
  final bool isDownloadInProgress;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentsState(fileUrl: $fileUrl, isDownloadInProgress: $isDownloadInProgress, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadPaymentAttachmentsState &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.isDownloadInProgress, isDownloadInProgress) ||
                other.isDownloadInProgress == isDownloadInProgress) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, fileUrl, isDownloadInProgress, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadPaymentAttachmentsStateCopyWith<
          _$_DownloadPaymentAttachmentsState>
      get copyWith => __$$_DownloadPaymentAttachmentsStateCopyWithImpl<
          _$_DownloadPaymentAttachmentsState>(this, _$identity);
}

abstract class _DownloadPaymentAttachmentsState
    implements DownloadPaymentAttachmentsState {
  const factory _DownloadPaymentAttachmentsState(
      {required final DownloadPaymentAttachment fileUrl,
      required final bool isDownloadInProgress,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_DownloadPaymentAttachmentsState;

  @override
  DownloadPaymentAttachment get fileUrl;
  @override
  bool get isDownloadInProgress;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadPaymentAttachmentsStateCopyWith<
          _$_DownloadPaymentAttachmentsState>
      get copyWith => throw _privateConstructorUsedError;
}
