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
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(AllInvoicesFilter queryObject) fetchAllInvoiceUrl,
    required TResult Function(AllCreditsFilter queryObject) fetchAllCreditUrl,
    required TResult Function(FullSummaryFilter queryObject)
        fetchFullSummaryUrl,
    required TResult Function() fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
    required TResult Function(SoaData soaData) downloadSOA,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult? Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult? Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult? Function()? fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult? Function(SoaData soaData)? downloadSOA,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult Function()? fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult Function(SoaData soaData)? downloadSOA,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchFullSummaryUrl value) fetchFullSummaryUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
    required TResult Function(_DownloadSOA value) downloadSOA,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult? Function(_DownloadSOA value)? downloadSOA,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult Function(_DownloadSOA value)? downloadSOA,
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
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo, SalesOrganisation salesOrganization});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganization = null,
  }) {
    return _then(_$_Initialized(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
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
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value));
    });
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(
      {required this.customerCodeInfo, required this.salesOrganization});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganization;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.initialized(customerCodeInfo: $customerCodeInfo, salesOrganization: $salesOrganization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, customerCodeInfo, salesOrganization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(AllInvoicesFilter queryObject) fetchAllInvoiceUrl,
    required TResult Function(AllCreditsFilter queryObject) fetchAllCreditUrl,
    required TResult Function(FullSummaryFilter queryObject)
        fetchFullSummaryUrl,
    required TResult Function() fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
    required TResult Function(SoaData soaData) downloadSOA,
  }) {
    return initialized(customerCodeInfo, salesOrganization);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult? Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult? Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult? Function()? fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult? Function(SoaData soaData)? downloadSOA,
  }) {
    return initialized?.call(customerCodeInfo, salesOrganization);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult Function()? fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult Function(SoaData soaData)? downloadSOA,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(customerCodeInfo, salesOrganization);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchFullSummaryUrl value) fetchFullSummaryUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
    required TResult Function(_DownloadSOA value) downloadSOA,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult? Function(_DownloadSOA value)? downloadSOA,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult Function(_DownloadSOA value)? downloadSOA,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements DownloadPaymentAttachmentEvent {
  const factory _Initialized(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganization}) = _$_Initialized;

  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisation get salesOrganization;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchAllInvoiceUrlCopyWith<$Res> {
  factory _$$_FetchAllInvoiceUrlCopyWith(_$_FetchAllInvoiceUrl value,
          $Res Function(_$_FetchAllInvoiceUrl) then) =
      __$$_FetchAllInvoiceUrlCopyWithImpl<$Res>;
  @useResult
  $Res call({AllInvoicesFilter queryObject});

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
    Object? queryObject = null,
  }) {
    return _then(_$_FetchAllInvoiceUrl(
      queryObject: null == queryObject
          ? _value.queryObject
          : queryObject // ignore: cast_nullable_to_non_nullable
              as AllInvoicesFilter,
    ));
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
  const _$_FetchAllInvoiceUrl({required this.queryObject});

  @override
  final AllInvoicesFilter queryObject;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(queryObject: $queryObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAllInvoiceUrl &&
            (identical(other.queryObject, queryObject) ||
                other.queryObject == queryObject));
  }

  @override
  int get hashCode => Object.hash(runtimeType, queryObject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchAllInvoiceUrlCopyWith<_$_FetchAllInvoiceUrl> get copyWith =>
      __$$_FetchAllInvoiceUrlCopyWithImpl<_$_FetchAllInvoiceUrl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(AllInvoicesFilter queryObject) fetchAllInvoiceUrl,
    required TResult Function(AllCreditsFilter queryObject) fetchAllCreditUrl,
    required TResult Function(FullSummaryFilter queryObject)
        fetchFullSummaryUrl,
    required TResult Function() fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
    required TResult Function(SoaData soaData) downloadSOA,
  }) {
    return fetchAllInvoiceUrl(queryObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult? Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult? Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult? Function()? fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult? Function(SoaData soaData)? downloadSOA,
  }) {
    return fetchAllInvoiceUrl?.call(queryObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult Function()? fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult Function(SoaData soaData)? downloadSOA,
    required TResult orElse(),
  }) {
    if (fetchAllInvoiceUrl != null) {
      return fetchAllInvoiceUrl(queryObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchFullSummaryUrl value) fetchFullSummaryUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
    required TResult Function(_DownloadSOA value) downloadSOA,
  }) {
    return fetchAllInvoiceUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult? Function(_DownloadSOA value)? downloadSOA,
  }) {
    return fetchAllInvoiceUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult Function(_DownloadSOA value)? downloadSOA,
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
      {required final AllInvoicesFilter queryObject}) = _$_FetchAllInvoiceUrl;

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
  $Res call({AllCreditsFilter queryObject});

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
    Object? queryObject = null,
  }) {
    return _then(_$_FetchAllCreditUrl(
      queryObject: null == queryObject
          ? _value.queryObject
          : queryObject // ignore: cast_nullable_to_non_nullable
              as AllCreditsFilter,
    ));
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
  const _$_FetchAllCreditUrl({required this.queryObject});

  @override
  final AllCreditsFilter queryObject;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.fetchAllCreditUrl(queryObject: $queryObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAllCreditUrl &&
            (identical(other.queryObject, queryObject) ||
                other.queryObject == queryObject));
  }

  @override
  int get hashCode => Object.hash(runtimeType, queryObject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchAllCreditUrlCopyWith<_$_FetchAllCreditUrl> get copyWith =>
      __$$_FetchAllCreditUrlCopyWithImpl<_$_FetchAllCreditUrl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(AllInvoicesFilter queryObject) fetchAllInvoiceUrl,
    required TResult Function(AllCreditsFilter queryObject) fetchAllCreditUrl,
    required TResult Function(FullSummaryFilter queryObject)
        fetchFullSummaryUrl,
    required TResult Function() fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
    required TResult Function(SoaData soaData) downloadSOA,
  }) {
    return fetchAllCreditUrl(queryObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult? Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult? Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult? Function()? fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult? Function(SoaData soaData)? downloadSOA,
  }) {
    return fetchAllCreditUrl?.call(queryObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult Function()? fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult Function(SoaData soaData)? downloadSOA,
    required TResult orElse(),
  }) {
    if (fetchAllCreditUrl != null) {
      return fetchAllCreditUrl(queryObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchFullSummaryUrl value) fetchFullSummaryUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
    required TResult Function(_DownloadSOA value) downloadSOA,
  }) {
    return fetchAllCreditUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult? Function(_DownloadSOA value)? downloadSOA,
  }) {
    return fetchAllCreditUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult Function(_DownloadSOA value)? downloadSOA,
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
      {required final AllCreditsFilter queryObject}) = _$_FetchAllCreditUrl;

  AllCreditsFilter get queryObject;
  @JsonKey(ignore: true)
  _$$_FetchAllCreditUrlCopyWith<_$_FetchAllCreditUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchFullSummaryUrlCopyWith<$Res> {
  factory _$$_FetchFullSummaryUrlCopyWith(_$_FetchFullSummaryUrl value,
          $Res Function(_$_FetchFullSummaryUrl) then) =
      __$$_FetchFullSummaryUrlCopyWithImpl<$Res>;
  @useResult
  $Res call({FullSummaryFilter queryObject});

  $FullSummaryFilterCopyWith<$Res> get queryObject;
}

/// @nodoc
class __$$_FetchFullSummaryUrlCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentEventCopyWithImpl<$Res,
        _$_FetchFullSummaryUrl>
    implements _$$_FetchFullSummaryUrlCopyWith<$Res> {
  __$$_FetchFullSummaryUrlCopyWithImpl(_$_FetchFullSummaryUrl _value,
      $Res Function(_$_FetchFullSummaryUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryObject = null,
  }) {
    return _then(_$_FetchFullSummaryUrl(
      queryObject: null == queryObject
          ? _value.queryObject
          : queryObject // ignore: cast_nullable_to_non_nullable
              as FullSummaryFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FullSummaryFilterCopyWith<$Res> get queryObject {
    return $FullSummaryFilterCopyWith<$Res>(_value.queryObject, (value) {
      return _then(_value.copyWith(queryObject: value));
    });
  }
}

/// @nodoc

class _$_FetchFullSummaryUrl implements _FetchFullSummaryUrl {
  const _$_FetchFullSummaryUrl({required this.queryObject});

  @override
  final FullSummaryFilter queryObject;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.fetchFullSummaryUrl(queryObject: $queryObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchFullSummaryUrl &&
            (identical(other.queryObject, queryObject) ||
                other.queryObject == queryObject));
  }

  @override
  int get hashCode => Object.hash(runtimeType, queryObject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchFullSummaryUrlCopyWith<_$_FetchFullSummaryUrl> get copyWith =>
      __$$_FetchFullSummaryUrlCopyWithImpl<_$_FetchFullSummaryUrl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(AllInvoicesFilter queryObject) fetchAllInvoiceUrl,
    required TResult Function(AllCreditsFilter queryObject) fetchAllCreditUrl,
    required TResult Function(FullSummaryFilter queryObject)
        fetchFullSummaryUrl,
    required TResult Function() fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
    required TResult Function(SoaData soaData) downloadSOA,
  }) {
    return fetchFullSummaryUrl(queryObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult? Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult? Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult? Function()? fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult? Function(SoaData soaData)? downloadSOA,
  }) {
    return fetchFullSummaryUrl?.call(queryObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult Function()? fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult Function(SoaData soaData)? downloadSOA,
    required TResult orElse(),
  }) {
    if (fetchFullSummaryUrl != null) {
      return fetchFullSummaryUrl(queryObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchFullSummaryUrl value) fetchFullSummaryUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
    required TResult Function(_DownloadSOA value) downloadSOA,
  }) {
    return fetchFullSummaryUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult? Function(_DownloadSOA value)? downloadSOA,
  }) {
    return fetchFullSummaryUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult Function(_DownloadSOA value)? downloadSOA,
    required TResult orElse(),
  }) {
    if (fetchFullSummaryUrl != null) {
      return fetchFullSummaryUrl(this);
    }
    return orElse();
  }
}

abstract class _FetchFullSummaryUrl implements DownloadPaymentAttachmentEvent {
  const factory _FetchFullSummaryUrl(
      {required final FullSummaryFilter queryObject}) = _$_FetchFullSummaryUrl;

  FullSummaryFilter get queryObject;
  @JsonKey(ignore: true)
  _$$_FetchFullSummaryUrlCopyWith<_$_FetchFullSummaryUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchPaymentSummaryUrlCopyWith<$Res> {
  factory _$$_FetchPaymentSummaryUrlCopyWith(_$_FetchPaymentSummaryUrl value,
          $Res Function(_$_FetchPaymentSummaryUrl) then) =
      __$$_FetchPaymentSummaryUrlCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchPaymentSummaryUrlCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentEventCopyWithImpl<$Res,
        _$_FetchPaymentSummaryUrl>
    implements _$$_FetchPaymentSummaryUrlCopyWith<$Res> {
  __$$_FetchPaymentSummaryUrlCopyWithImpl(_$_FetchPaymentSummaryUrl _value,
      $Res Function(_$_FetchPaymentSummaryUrl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchPaymentSummaryUrl implements _FetchPaymentSummaryUrl {
  const _$_FetchPaymentSummaryUrl();

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchPaymentSummaryUrl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(AllInvoicesFilter queryObject) fetchAllInvoiceUrl,
    required TResult Function(AllCreditsFilter queryObject) fetchAllCreditUrl,
    required TResult Function(FullSummaryFilter queryObject)
        fetchFullSummaryUrl,
    required TResult Function() fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
    required TResult Function(SoaData soaData) downloadSOA,
  }) {
    return fetchPaymentSummaryUrl();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult? Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult? Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult? Function()? fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult? Function(SoaData soaData)? downloadSOA,
  }) {
    return fetchPaymentSummaryUrl?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult Function()? fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult Function(SoaData soaData)? downloadSOA,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryUrl != null) {
      return fetchPaymentSummaryUrl();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchFullSummaryUrl value) fetchFullSummaryUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
    required TResult Function(_DownloadSOA value) downloadSOA,
  }) {
    return fetchPaymentSummaryUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult? Function(_DownloadSOA value)? downloadSOA,
  }) {
    return fetchPaymentSummaryUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult Function(_DownloadSOA value)? downloadSOA,
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
  const factory _FetchPaymentSummaryUrl() = _$_FetchPaymentSummaryUrl;
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
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(AllInvoicesFilter queryObject) fetchAllInvoiceUrl,
    required TResult Function(AllCreditsFilter queryObject) fetchAllCreditUrl,
    required TResult Function(FullSummaryFilter queryObject)
        fetchFullSummaryUrl,
    required TResult Function() fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
    required TResult Function(SoaData soaData) downloadSOA,
  }) {
    return downloadPaymentAttachment(files);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult? Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult? Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult? Function()? fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult? Function(SoaData soaData)? downloadSOA,
  }) {
    return downloadPaymentAttachment?.call(files);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult Function()? fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult Function(SoaData soaData)? downloadSOA,
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
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchFullSummaryUrl value) fetchFullSummaryUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
    required TResult Function(_DownloadSOA value) downloadSOA,
  }) {
    return downloadPaymentAttachment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult? Function(_DownloadSOA value)? downloadSOA,
  }) {
    return downloadPaymentAttachment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult Function(_DownloadSOA value)? downloadSOA,
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
abstract class _$$_DownloadSOACopyWith<$Res> {
  factory _$$_DownloadSOACopyWith(
          _$_DownloadSOA value, $Res Function(_$_DownloadSOA) then) =
      __$$_DownloadSOACopyWithImpl<$Res>;
  @useResult
  $Res call({SoaData soaData});
}

/// @nodoc
class __$$_DownloadSOACopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentEventCopyWithImpl<$Res, _$_DownloadSOA>
    implements _$$_DownloadSOACopyWith<$Res> {
  __$$_DownloadSOACopyWithImpl(
      _$_DownloadSOA _value, $Res Function(_$_DownloadSOA) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soaData = null,
  }) {
    return _then(_$_DownloadSOA(
      soaData: null == soaData
          ? _value.soaData
          : soaData // ignore: cast_nullable_to_non_nullable
              as SoaData,
    ));
  }
}

/// @nodoc

class _$_DownloadSOA implements _DownloadSOA {
  const _$_DownloadSOA({required this.soaData});

  @override
  final SoaData soaData;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentEvent.downloadSOA(soaData: $soaData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadSOA &&
            (identical(other.soaData, soaData) || other.soaData == soaData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, soaData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DownloadSOACopyWith<_$_DownloadSOA> get copyWith =>
      __$$_DownloadSOACopyWithImpl<_$_DownloadSOA>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(AllInvoicesFilter queryObject) fetchAllInvoiceUrl,
    required TResult Function(AllCreditsFilter queryObject) fetchAllCreditUrl,
    required TResult Function(FullSummaryFilter queryObject)
        fetchFullSummaryUrl,
    required TResult Function() fetchPaymentSummaryUrl,
    required TResult Function(DownloadPaymentAttachment files)
        downloadPaymentAttachment,
    required TResult Function(SoaData soaData) downloadSOA,
  }) {
    return downloadSOA(soaData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult? Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult? Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult? Function()? fetchPaymentSummaryUrl,
    TResult? Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult? Function(SoaData soaData)? downloadSOA,
  }) {
    return downloadSOA?.call(soaData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(AllInvoicesFilter queryObject)? fetchAllInvoiceUrl,
    TResult Function(AllCreditsFilter queryObject)? fetchAllCreditUrl,
    TResult Function(FullSummaryFilter queryObject)? fetchFullSummaryUrl,
    TResult Function()? fetchPaymentSummaryUrl,
    TResult Function(DownloadPaymentAttachment files)?
        downloadPaymentAttachment,
    TResult Function(SoaData soaData)? downloadSOA,
    required TResult orElse(),
  }) {
    if (downloadSOA != null) {
      return downloadSOA(soaData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchAllInvoiceUrl value) fetchAllInvoiceUrl,
    required TResult Function(_FetchAllCreditUrl value) fetchAllCreditUrl,
    required TResult Function(_FetchFullSummaryUrl value) fetchFullSummaryUrl,
    required TResult Function(_FetchPaymentSummaryUrl value)
        fetchPaymentSummaryUrl,
    required TResult Function(_DownloadPaymentAttachment value)
        downloadPaymentAttachment,
    required TResult Function(_DownloadSOA value) downloadSOA,
  }) {
    return downloadSOA(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult? Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult? Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult? Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult? Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult? Function(_DownloadSOA value)? downloadSOA,
  }) {
    return downloadSOA?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchAllInvoiceUrl value)? fetchAllInvoiceUrl,
    TResult Function(_FetchAllCreditUrl value)? fetchAllCreditUrl,
    TResult Function(_FetchFullSummaryUrl value)? fetchFullSummaryUrl,
    TResult Function(_FetchPaymentSummaryUrl value)? fetchPaymentSummaryUrl,
    TResult Function(_DownloadPaymentAttachment value)?
        downloadPaymentAttachment,
    TResult Function(_DownloadSOA value)? downloadSOA,
    required TResult orElse(),
  }) {
    if (downloadSOA != null) {
      return downloadSOA(this);
    }
    return orElse();
  }
}

abstract class _DownloadSOA implements DownloadPaymentAttachmentEvent {
  const factory _DownloadSOA({required final SoaData soaData}) = _$_DownloadSOA;

  SoaData get soaData;
  @JsonKey(ignore: true)
  _$$_DownloadSOACopyWith<_$_DownloadSOA> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DownloadPaymentAttachmentsState {
  DownloadPaymentAttachment get fileUrl => throw _privateConstructorUsedError;
  bool get isDownloadInProgress => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
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
      SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $DownloadPaymentAttachmentCopyWith<$Res> get fileUrl;
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
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
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
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
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
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

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
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
      SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $DownloadPaymentAttachmentCopyWith<$Res> get fileUrl;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
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
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
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
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
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
      required this.salesOrganization,
      required this.customerCodeInfo,
      required this.failureOrSuccessOption});

  @override
  final DownloadPaymentAttachment fileUrl;
  @override
  final bool isDownloadInProgress;
  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'DownloadPaymentAttachmentsState(fileUrl: $fileUrl, isDownloadInProgress: $isDownloadInProgress, salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadPaymentAttachmentsState &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.isDownloadInProgress, isDownloadInProgress) ||
                other.isDownloadInProgress == isDownloadInProgress) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileUrl, isDownloadInProgress,
      salesOrganization, customerCodeInfo, failureOrSuccessOption);

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
      required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$_DownloadPaymentAttachmentsState;

  @override
  DownloadPaymentAttachment get fileUrl;
  @override
  bool get isDownloadInProgress;
  @override
  SalesOrganisation get salesOrganization;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadPaymentAttachmentsStateCopyWith<
          _$_DownloadPaymentAttachmentsState>
      get copyWith => throw _privateConstructorUsedError;
}
