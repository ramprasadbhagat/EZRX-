// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deep_linking_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeepLinkingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() stopConsumeLink,
    required TResult Function(Uri link) addPendingLink,
    required TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)
        consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? stopConsumeLink,
    TResult? Function(Uri link)? addPendingLink,
    TResult? Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? stopConsumeLink,
    TResult Function(Uri link)? addPendingLink,
    TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_StopConsumeLink value) stopConsumeLink,
    required TResult Function(_AddPendingLink value) addPendingLink,
    required TResult Function(_ConsumePendingLink value) consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StopConsumeLink value)? stopConsumeLink,
    TResult? Function(_AddPendingLink value)? addPendingLink,
    TResult? Function(_ConsumePendingLink value)? consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StopConsumeLink value)? stopConsumeLink,
    TResult Function(_AddPendingLink value)? addPendingLink,
    TResult Function(_ConsumePendingLink value)? consumePendingLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeepLinkingEventCopyWith<$Res> {
  factory $DeepLinkingEventCopyWith(
          DeepLinkingEvent value, $Res Function(DeepLinkingEvent) then) =
      _$DeepLinkingEventCopyWithImpl<$Res, DeepLinkingEvent>;
}

/// @nodoc
class _$DeepLinkingEventCopyWithImpl<$Res, $Val extends DeepLinkingEvent>
    implements $DeepLinkingEventCopyWith<$Res> {
  _$DeepLinkingEventCopyWithImpl(this._value, this._then);

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
    extends _$DeepLinkingEventCopyWithImpl<$Res, _$_Initialize>
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
    return 'DeepLinkingEvent.initialize()';
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
    required TResult Function() stopConsumeLink,
    required TResult Function(Uri link) addPendingLink,
    required TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)
        consumePendingLink,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? stopConsumeLink,
    TResult? Function(Uri link)? addPendingLink,
    TResult? Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? stopConsumeLink,
    TResult Function(Uri link)? addPendingLink,
    TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
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
    required TResult Function(_StopConsumeLink value) stopConsumeLink,
    required TResult Function(_AddPendingLink value) addPendingLink,
    required TResult Function(_ConsumePendingLink value) consumePendingLink,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StopConsumeLink value)? stopConsumeLink,
    TResult? Function(_AddPendingLink value)? addPendingLink,
    TResult? Function(_ConsumePendingLink value)? consumePendingLink,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StopConsumeLink value)? stopConsumeLink,
    TResult Function(_AddPendingLink value)? addPendingLink,
    TResult Function(_ConsumePendingLink value)? consumePendingLink,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements DeepLinkingEvent {
  const factory _Initialize() = _$_Initialize;
}

/// @nodoc
abstract class _$$_StopConsumeLinkCopyWith<$Res> {
  factory _$$_StopConsumeLinkCopyWith(
          _$_StopConsumeLink value, $Res Function(_$_StopConsumeLink) then) =
      __$$_StopConsumeLinkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StopConsumeLinkCopyWithImpl<$Res>
    extends _$DeepLinkingEventCopyWithImpl<$Res, _$_StopConsumeLink>
    implements _$$_StopConsumeLinkCopyWith<$Res> {
  __$$_StopConsumeLinkCopyWithImpl(
      _$_StopConsumeLink _value, $Res Function(_$_StopConsumeLink) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StopConsumeLink implements _StopConsumeLink {
  const _$_StopConsumeLink();

  @override
  String toString() {
    return 'DeepLinkingEvent.stopConsumeLink()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StopConsumeLink);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() stopConsumeLink,
    required TResult Function(Uri link) addPendingLink,
    required TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)
        consumePendingLink,
  }) {
    return stopConsumeLink();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? stopConsumeLink,
    TResult? Function(Uri link)? addPendingLink,
    TResult? Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
  }) {
    return stopConsumeLink?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? stopConsumeLink,
    TResult Function(Uri link)? addPendingLink,
    TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
    required TResult orElse(),
  }) {
    if (stopConsumeLink != null) {
      return stopConsumeLink();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_StopConsumeLink value) stopConsumeLink,
    required TResult Function(_AddPendingLink value) addPendingLink,
    required TResult Function(_ConsumePendingLink value) consumePendingLink,
  }) {
    return stopConsumeLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StopConsumeLink value)? stopConsumeLink,
    TResult? Function(_AddPendingLink value)? addPendingLink,
    TResult? Function(_ConsumePendingLink value)? consumePendingLink,
  }) {
    return stopConsumeLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StopConsumeLink value)? stopConsumeLink,
    TResult Function(_AddPendingLink value)? addPendingLink,
    TResult Function(_ConsumePendingLink value)? consumePendingLink,
    required TResult orElse(),
  }) {
    if (stopConsumeLink != null) {
      return stopConsumeLink(this);
    }
    return orElse();
  }
}

abstract class _StopConsumeLink implements DeepLinkingEvent {
  const factory _StopConsumeLink() = _$_StopConsumeLink;
}

/// @nodoc
abstract class _$$_AddPendingLinkCopyWith<$Res> {
  factory _$$_AddPendingLinkCopyWith(
          _$_AddPendingLink value, $Res Function(_$_AddPendingLink) then) =
      __$$_AddPendingLinkCopyWithImpl<$Res>;
  @useResult
  $Res call({Uri link});
}

/// @nodoc
class __$$_AddPendingLinkCopyWithImpl<$Res>
    extends _$DeepLinkingEventCopyWithImpl<$Res, _$_AddPendingLink>
    implements _$$_AddPendingLinkCopyWith<$Res> {
  __$$_AddPendingLinkCopyWithImpl(
      _$_AddPendingLink _value, $Res Function(_$_AddPendingLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
  }) {
    return _then(_$_AddPendingLink(
      null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_AddPendingLink implements _AddPendingLink {
  const _$_AddPendingLink(this.link);

  @override
  final Uri link;

  @override
  String toString() {
    return 'DeepLinkingEvent.addPendingLink(link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPendingLink &&
            (identical(other.link, link) || other.link == link));
  }

  @override
  int get hashCode => Object.hash(runtimeType, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPendingLinkCopyWith<_$_AddPendingLink> get copyWith =>
      __$$_AddPendingLinkCopyWithImpl<_$_AddPendingLink>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() stopConsumeLink,
    required TResult Function(Uri link) addPendingLink,
    required TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)
        consumePendingLink,
  }) {
    return addPendingLink(link);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? stopConsumeLink,
    TResult? Function(Uri link)? addPendingLink,
    TResult? Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
  }) {
    return addPendingLink?.call(link);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? stopConsumeLink,
    TResult Function(Uri link)? addPendingLink,
    TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
    required TResult orElse(),
  }) {
    if (addPendingLink != null) {
      return addPendingLink(link);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_StopConsumeLink value) stopConsumeLink,
    required TResult Function(_AddPendingLink value) addPendingLink,
    required TResult Function(_ConsumePendingLink value) consumePendingLink,
  }) {
    return addPendingLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StopConsumeLink value)? stopConsumeLink,
    TResult? Function(_AddPendingLink value)? addPendingLink,
    TResult? Function(_ConsumePendingLink value)? consumePendingLink,
  }) {
    return addPendingLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StopConsumeLink value)? stopConsumeLink,
    TResult Function(_AddPendingLink value)? addPendingLink,
    TResult Function(_ConsumePendingLink value)? consumePendingLink,
    required TResult orElse(),
  }) {
    if (addPendingLink != null) {
      return addPendingLink(this);
    }
    return orElse();
  }
}

abstract class _AddPendingLink implements DeepLinkingEvent {
  const factory _AddPendingLink(final Uri link) = _$_AddPendingLink;

  Uri get link;
  @JsonKey(ignore: true)
  _$$_AddPendingLinkCopyWith<_$_AddPendingLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConsumePendingLinkCopyWith<$Res> {
  factory _$$_ConsumePendingLinkCopyWith(_$_ConsumePendingLink value,
          $Res Function(_$_ConsumePendingLink) then) =
      __$$_ConsumePendingLinkCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo});

  $CustomerCodeInfoCopyWith<$Res> get selectedCustomerCode;
  $ShipToInfoCopyWith<$Res> get selectedShipTo;
}

/// @nodoc
class __$$_ConsumePendingLinkCopyWithImpl<$Res>
    extends _$DeepLinkingEventCopyWithImpl<$Res, _$_ConsumePendingLink>
    implements _$$_ConsumePendingLinkCopyWith<$Res> {
  __$$_ConsumePendingLinkCopyWithImpl(
      _$_ConsumePendingLink _value, $Res Function(_$_ConsumePendingLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCustomerCode = null,
    Object? selectedShipTo = null,
  }) {
    return _then(_$_ConsumePendingLink(
      selectedCustomerCode: null == selectedCustomerCode
          ? _value.selectedCustomerCode
          : selectedCustomerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      selectedShipTo: null == selectedShipTo
          ? _value.selectedShipTo
          : selectedShipTo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get selectedCustomerCode {
    return $CustomerCodeInfoCopyWith<$Res>(_value.selectedCustomerCode,
        (value) {
      return _then(_value.copyWith(selectedCustomerCode: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get selectedShipTo {
    return $ShipToInfoCopyWith<$Res>(_value.selectedShipTo, (value) {
      return _then(_value.copyWith(selectedShipTo: value));
    });
  }
}

/// @nodoc

class _$_ConsumePendingLink implements _ConsumePendingLink {
  const _$_ConsumePendingLink(
      {required this.selectedCustomerCode, required this.selectedShipTo});

  @override
  final CustomerCodeInfo selectedCustomerCode;
  @override
  final ShipToInfo selectedShipTo;

  @override
  String toString() {
    return 'DeepLinkingEvent.consumePendingLink(selectedCustomerCode: $selectedCustomerCode, selectedShipTo: $selectedShipTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConsumePendingLink &&
            (identical(other.selectedCustomerCode, selectedCustomerCode) ||
                other.selectedCustomerCode == selectedCustomerCode) &&
            (identical(other.selectedShipTo, selectedShipTo) ||
                other.selectedShipTo == selectedShipTo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedCustomerCode, selectedShipTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConsumePendingLinkCopyWith<_$_ConsumePendingLink> get copyWith =>
      __$$_ConsumePendingLinkCopyWithImpl<_$_ConsumePendingLink>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() stopConsumeLink,
    required TResult Function(Uri link) addPendingLink,
    required TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)
        consumePendingLink,
  }) {
    return consumePendingLink(selectedCustomerCode, selectedShipTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function()? stopConsumeLink,
    TResult? Function(Uri link)? addPendingLink,
    TResult? Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
  }) {
    return consumePendingLink?.call(selectedCustomerCode, selectedShipTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? stopConsumeLink,
    TResult Function(Uri link)? addPendingLink,
    TResult Function(
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
    required TResult orElse(),
  }) {
    if (consumePendingLink != null) {
      return consumePendingLink(selectedCustomerCode, selectedShipTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_StopConsumeLink value) stopConsumeLink,
    required TResult Function(_AddPendingLink value) addPendingLink,
    required TResult Function(_ConsumePendingLink value) consumePendingLink,
  }) {
    return consumePendingLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_StopConsumeLink value)? stopConsumeLink,
    TResult? Function(_AddPendingLink value)? addPendingLink,
    TResult? Function(_ConsumePendingLink value)? consumePendingLink,
  }) {
    return consumePendingLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_StopConsumeLink value)? stopConsumeLink,
    TResult Function(_AddPendingLink value)? addPendingLink,
    TResult Function(_ConsumePendingLink value)? consumePendingLink,
    required TResult orElse(),
  }) {
    if (consumePendingLink != null) {
      return consumePendingLink(this);
    }
    return orElse();
  }
}

abstract class _ConsumePendingLink implements DeepLinkingEvent {
  const factory _ConsumePendingLink(
      {required final CustomerCodeInfo selectedCustomerCode,
      required final ShipToInfo selectedShipTo}) = _$_ConsumePendingLink;

  CustomerCodeInfo get selectedCustomerCode;
  ShipToInfo get selectedShipTo;
  @JsonKey(ignore: true)
  _$$_ConsumePendingLinkCopyWith<_$_ConsumePendingLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeepLinkingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeepLinkingStateCopyWith<$Res> {
  factory $DeepLinkingStateCopyWith(
          DeepLinkingState value, $Res Function(DeepLinkingState) then) =
      _$DeepLinkingStateCopyWithImpl<$Res, DeepLinkingState>;
}

/// @nodoc
class _$DeepLinkingStateCopyWithImpl<$Res, $Val extends DeepLinkingState>
    implements $DeepLinkingStateCopyWith<$Res> {
  _$DeepLinkingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'DeepLinkingState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DeepLinkingState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LinkPendingCopyWith<$Res> {
  factory _$$_LinkPendingCopyWith(
          _$_LinkPending value, $Res Function(_$_LinkPending) then) =
      __$$_LinkPendingCopyWithImpl<$Res>;
  @useResult
  $Res call({Uri link});
}

/// @nodoc
class __$$_LinkPendingCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_LinkPending>
    implements _$$_LinkPendingCopyWith<$Res> {
  __$$_LinkPendingCopyWithImpl(
      _$_LinkPending _value, $Res Function(_$_LinkPending) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
  }) {
    return _then(_$_LinkPending(
      null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_LinkPending implements _LinkPending {
  const _$_LinkPending(this.link);

  @override
  final Uri link;

  @override
  String toString() {
    return 'DeepLinkingState.linkPending(link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LinkPending &&
            (identical(other.link, link) || other.link == link));
  }

  @override
  int get hashCode => Object.hash(runtimeType, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinkPendingCopyWith<_$_LinkPending> get copyWith =>
      __$$_LinkPendingCopyWithImpl<_$_LinkPending>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return linkPending(link);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return linkPending?.call(link);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (linkPending != null) {
      return linkPending(link);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return linkPending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return linkPending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (linkPending != null) {
      return linkPending(this);
    }
    return orElse();
  }
}

abstract class _LinkPending implements DeepLinkingState {
  const factory _LinkPending(final Uri link) = _$_LinkPending;

  Uri get link;
  @JsonKey(ignore: true)
  _$$_LinkPendingCopyWith<_$_LinkPending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RedirectBundleDetailCopyWith<$Res> {
  factory _$$_RedirectBundleDetailCopyWith(_$_RedirectBundleDetail value,
          $Res Function(_$_RedirectBundleDetail) then) =
      __$$_RedirectBundleDetailCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber materialNumber});
}

/// @nodoc
class __$$_RedirectBundleDetailCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_RedirectBundleDetail>
    implements _$$_RedirectBundleDetailCopyWith<$Res> {
  __$$_RedirectBundleDetailCopyWithImpl(_$_RedirectBundleDetail _value,
      $Res Function(_$_RedirectBundleDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
  }) {
    return _then(_$_RedirectBundleDetail(
      null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$_RedirectBundleDetail implements _RedirectBundleDetail {
  const _$_RedirectBundleDetail(this.materialNumber);

  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'DeepLinkingState.redirectBundleDetail(materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedirectBundleDetail &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedirectBundleDetailCopyWith<_$_RedirectBundleDetail> get copyWith =>
      __$$_RedirectBundleDetailCopyWithImpl<_$_RedirectBundleDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return redirectBundleDetail(materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return redirectBundleDetail?.call(materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (redirectBundleDetail != null) {
      return redirectBundleDetail(materialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return redirectBundleDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return redirectBundleDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redirectBundleDetail != null) {
      return redirectBundleDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectBundleDetail implements DeepLinkingState {
  const factory _RedirectBundleDetail(final MaterialNumber materialNumber) =
      _$_RedirectBundleDetail;

  MaterialNumber get materialNumber;
  @JsonKey(ignore: true)
  _$$_RedirectBundleDetailCopyWith<_$_RedirectBundleDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RedirectProductDetailCopyWith<$Res> {
  factory _$$_RedirectProductDetailCopyWith(_$_RedirectProductDetail value,
          $Res Function(_$_RedirectProductDetail) then) =
      __$$_RedirectProductDetailCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber materialNumber});
}

/// @nodoc
class __$$_RedirectProductDetailCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_RedirectProductDetail>
    implements _$$_RedirectProductDetailCopyWith<$Res> {
  __$$_RedirectProductDetailCopyWithImpl(_$_RedirectProductDetail _value,
      $Res Function(_$_RedirectProductDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
  }) {
    return _then(_$_RedirectProductDetail(
      null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$_RedirectProductDetail implements _RedirectProductDetail {
  const _$_RedirectProductDetail(this.materialNumber);

  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'DeepLinkingState.redirectProductDetail(materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedirectProductDetail &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedirectProductDetailCopyWith<_$_RedirectProductDetail> get copyWith =>
      __$$_RedirectProductDetailCopyWithImpl<_$_RedirectProductDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return redirectProductDetail(materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return redirectProductDetail?.call(materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (redirectProductDetail != null) {
      return redirectProductDetail(materialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return redirectProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return redirectProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redirectProductDetail != null) {
      return redirectProductDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectProductDetail implements DeepLinkingState {
  const factory _RedirectProductDetail(final MaterialNumber materialNumber) =
      _$_RedirectProductDetail;

  MaterialNumber get materialNumber;
  @JsonKey(ignore: true)
  _$$_RedirectProductDetailCopyWith<_$_RedirectProductDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RedirectProductSuggestionCopyWith<$Res> {
  factory _$$_RedirectProductSuggestionCopyWith(
          _$_RedirectProductSuggestion value,
          $Res Function(_$_RedirectProductSuggestion) then) =
      __$$_RedirectProductSuggestionCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$_RedirectProductSuggestionCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_RedirectProductSuggestion>
    implements _$$_RedirectProductSuggestionCopyWith<$Res> {
  __$$_RedirectProductSuggestionCopyWithImpl(
      _$_RedirectProductSuggestion _value,
      $Res Function(_$_RedirectProductSuggestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$_RedirectProductSuggestion(
      null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$_RedirectProductSuggestion implements _RedirectProductSuggestion {
  const _$_RedirectProductSuggestion(this.searchKey);

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'DeepLinkingState.redirectProductSuggestion(searchKey: $searchKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedirectProductSuggestion &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedirectProductSuggestionCopyWith<_$_RedirectProductSuggestion>
      get copyWith => __$$_RedirectProductSuggestionCopyWithImpl<
          _$_RedirectProductSuggestion>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return redirectProductSuggestion(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return redirectProductSuggestion?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (redirectProductSuggestion != null) {
      return redirectProductSuggestion(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return redirectProductSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return redirectProductSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redirectProductSuggestion != null) {
      return redirectProductSuggestion(this);
    }
    return orElse();
  }
}

abstract class _RedirectProductSuggestion implements DeepLinkingState {
  const factory _RedirectProductSuggestion(final SearchKey searchKey) =
      _$_RedirectProductSuggestion;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$_RedirectProductSuggestionCopyWith<_$_RedirectProductSuggestion>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RedirectOrderDetailCopyWith<$Res> {
  factory _$$_RedirectOrderDetailCopyWith(_$_RedirectOrderDetail value,
          $Res Function(_$_RedirectOrderDetail) then) =
      __$$_RedirectOrderDetailCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderNumber orderNumber});
}

/// @nodoc
class __$$_RedirectOrderDetailCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_RedirectOrderDetail>
    implements _$$_RedirectOrderDetailCopyWith<$Res> {
  __$$_RedirectOrderDetailCopyWithImpl(_$_RedirectOrderDetail _value,
      $Res Function(_$_RedirectOrderDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
  }) {
    return _then(_$_RedirectOrderDetail(
      null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
    ));
  }
}

/// @nodoc

class _$_RedirectOrderDetail implements _RedirectOrderDetail {
  const _$_RedirectOrderDetail(this.orderNumber);

  @override
  final OrderNumber orderNumber;

  @override
  String toString() {
    return 'DeepLinkingState.redirectOrderDetail(orderNumber: $orderNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedirectOrderDetail &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedirectOrderDetailCopyWith<_$_RedirectOrderDetail> get copyWith =>
      __$$_RedirectOrderDetailCopyWithImpl<_$_RedirectOrderDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return redirectOrderDetail(orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return redirectOrderDetail?.call(orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (redirectOrderDetail != null) {
      return redirectOrderDetail(orderNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return redirectOrderDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return redirectOrderDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redirectOrderDetail != null) {
      return redirectOrderDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectOrderDetail implements DeepLinkingState {
  const factory _RedirectOrderDetail(final OrderNumber orderNumber) =
      _$_RedirectOrderDetail;

  OrderNumber get orderNumber;
  @JsonKey(ignore: true)
  _$$_RedirectOrderDetailCopyWith<_$_RedirectOrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RedirectReturnDetailCopyWith<$Res> {
  factory _$$_RedirectReturnDetailCopyWith(_$_RedirectReturnDetail value,
          $Res Function(_$_RedirectReturnDetail) then) =
      __$$_RedirectReturnDetailCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnRequestsId returnId});

  $ReturnRequestsIdCopyWith<$Res> get returnId;
}

/// @nodoc
class __$$_RedirectReturnDetailCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_RedirectReturnDetail>
    implements _$$_RedirectReturnDetailCopyWith<$Res> {
  __$$_RedirectReturnDetailCopyWithImpl(_$_RedirectReturnDetail _value,
      $Res Function(_$_RedirectReturnDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnId = null,
  }) {
    return _then(_$_RedirectReturnDetail(
      null == returnId
          ? _value.returnId
          : returnId // ignore: cast_nullable_to_non_nullable
              as ReturnRequestsId,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestsIdCopyWith<$Res> get returnId {
    return $ReturnRequestsIdCopyWith<$Res>(_value.returnId, (value) {
      return _then(_value.copyWith(returnId: value));
    });
  }
}

/// @nodoc

class _$_RedirectReturnDetail implements _RedirectReturnDetail {
  const _$_RedirectReturnDetail(this.returnId);

  @override
  final ReturnRequestsId returnId;

  @override
  String toString() {
    return 'DeepLinkingState.redirectReturnDetail(returnId: $returnId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedirectReturnDetail &&
            (identical(other.returnId, returnId) ||
                other.returnId == returnId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedirectReturnDetailCopyWith<_$_RedirectReturnDetail> get copyWith =>
      __$$_RedirectReturnDetailCopyWithImpl<_$_RedirectReturnDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return redirectReturnDetail(returnId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return redirectReturnDetail?.call(returnId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (redirectReturnDetail != null) {
      return redirectReturnDetail(returnId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return redirectReturnDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return redirectReturnDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redirectReturnDetail != null) {
      return redirectReturnDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectReturnDetail implements DeepLinkingState {
  const factory _RedirectReturnDetail(final ReturnRequestsId returnId) =
      _$_RedirectReturnDetail;

  ReturnRequestsId get returnId;
  @JsonKey(ignore: true)
  _$$_RedirectReturnDetailCopyWith<_$_RedirectReturnDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RedirectPaymentDetailCopyWith<$Res> {
  factory _$$_RedirectPaymentDetailCopyWith(_$_RedirectPaymentDetail value,
          $Res Function(_$_RedirectPaymentDetail) then) =
      __$$_RedirectPaymentDetailCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentSummaryDetails paymentIdentifierInfo});

  $PaymentSummaryDetailsCopyWith<$Res> get paymentIdentifierInfo;
}

/// @nodoc
class __$$_RedirectPaymentDetailCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_RedirectPaymentDetail>
    implements _$$_RedirectPaymentDetailCopyWith<$Res> {
  __$$_RedirectPaymentDetailCopyWithImpl(_$_RedirectPaymentDetail _value,
      $Res Function(_$_RedirectPaymentDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentIdentifierInfo = null,
  }) {
    return _then(_$_RedirectPaymentDetail(
      null == paymentIdentifierInfo
          ? _value.paymentIdentifierInfo
          : paymentIdentifierInfo // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryDetailsCopyWith<$Res> get paymentIdentifierInfo {
    return $PaymentSummaryDetailsCopyWith<$Res>(_value.paymentIdentifierInfo,
        (value) {
      return _then(_value.copyWith(paymentIdentifierInfo: value));
    });
  }
}

/// @nodoc

class _$_RedirectPaymentDetail implements _RedirectPaymentDetail {
  const _$_RedirectPaymentDetail(this.paymentIdentifierInfo);

  @override
  final PaymentSummaryDetails paymentIdentifierInfo;

  @override
  String toString() {
    return 'DeepLinkingState.redirectPaymentDetail(paymentIdentifierInfo: $paymentIdentifierInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedirectPaymentDetail &&
            (identical(other.paymentIdentifierInfo, paymentIdentifierInfo) ||
                other.paymentIdentifierInfo == paymentIdentifierInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentIdentifierInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedirectPaymentDetailCopyWith<_$_RedirectPaymentDetail> get copyWith =>
      __$$_RedirectPaymentDetailCopyWithImpl<_$_RedirectPaymentDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return redirectPaymentDetail(paymentIdentifierInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return redirectPaymentDetail?.call(paymentIdentifierInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (redirectPaymentDetail != null) {
      return redirectPaymentDetail(paymentIdentifierInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return redirectPaymentDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return redirectPaymentDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redirectPaymentDetail != null) {
      return redirectPaymentDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectPaymentDetail implements DeepLinkingState {
  const factory _RedirectPaymentDetail(
          final PaymentSummaryDetails paymentIdentifierInfo) =
      _$_RedirectPaymentDetail;

  PaymentSummaryDetails get paymentIdentifierInfo;
  @JsonKey(ignore: true)
  _$$_RedirectPaymentDetailCopyWith<_$_RedirectPaymentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RedirectPaymentHomeCopyWith<$Res> {
  factory _$$_RedirectPaymentHomeCopyWith(_$_RedirectPaymentHome value,
          $Res Function(_$_RedirectPaymentHome) then) =
      __$$_RedirectPaymentHomeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RedirectPaymentHomeCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_RedirectPaymentHome>
    implements _$$_RedirectPaymentHomeCopyWith<$Res> {
  __$$_RedirectPaymentHomeCopyWithImpl(_$_RedirectPaymentHome _value,
      $Res Function(_$_RedirectPaymentHome) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RedirectPaymentHome implements _RedirectPaymentHome {
  const _$_RedirectPaymentHome();

  @override
  String toString() {
    return 'DeepLinkingState.redirectPaymentHome()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RedirectPaymentHome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return redirectPaymentHome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return redirectPaymentHome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (redirectPaymentHome != null) {
      return redirectPaymentHome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return redirectPaymentHome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return redirectPaymentHome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redirectPaymentHome != null) {
      return redirectPaymentHome(this);
    }
    return orElse();
  }
}

abstract class _RedirectPaymentHome implements DeepLinkingState {
  const factory _RedirectPaymentHome() = _$_RedirectPaymentHome;
}

/// @nodoc
abstract class _$$_RedirectInvoiceDetailCopyWith<$Res> {
  factory _$$_RedirectInvoiceDetailCopyWith(_$_RedirectInvoiceDetail value,
          $Res Function(_$_RedirectInvoiceDetail) then) =
      __$$_RedirectInvoiceDetailCopyWithImpl<$Res>;
  @useResult
  $Res call({String invoiceNumber});
}

/// @nodoc
class __$$_RedirectInvoiceDetailCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_RedirectInvoiceDetail>
    implements _$$_RedirectInvoiceDetailCopyWith<$Res> {
  __$$_RedirectInvoiceDetailCopyWithImpl(_$_RedirectInvoiceDetail _value,
      $Res Function(_$_RedirectInvoiceDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
  }) {
    return _then(_$_RedirectInvoiceDetail(
      null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RedirectInvoiceDetail implements _RedirectInvoiceDetail {
  const _$_RedirectInvoiceDetail(this.invoiceNumber);

  @override
  final String invoiceNumber;

  @override
  String toString() {
    return 'DeepLinkingState.redirectInvoiceDetail(invoiceNumber: $invoiceNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedirectInvoiceDetail &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedirectInvoiceDetailCopyWith<_$_RedirectInvoiceDetail> get copyWith =>
      __$$_RedirectInvoiceDetailCopyWithImpl<_$_RedirectInvoiceDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return redirectInvoiceDetail(invoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return redirectInvoiceDetail?.call(invoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (redirectInvoiceDetail != null) {
      return redirectInvoiceDetail(invoiceNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return redirectInvoiceDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return redirectInvoiceDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redirectInvoiceDetail != null) {
      return redirectInvoiceDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectInvoiceDetail implements DeepLinkingState {
  const factory _RedirectInvoiceDetail(final String invoiceNumber) =
      _$_RedirectInvoiceDetail;

  String get invoiceNumber;
  @JsonKey(ignore: true)
  _$$_RedirectInvoiceDetailCopyWith<_$_RedirectInvoiceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiFailure failure});

  $ApiFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$_Error(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ApiFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiFailureCopyWith<$Res> get failure {
    return $ApiFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.failure);

  @override
  final ApiFailure failure;

  @override
  String toString() {
    return 'DeepLinkingState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(MaterialNumber materialNumber)
        redirectBundleDetail,
    required TResult Function(MaterialNumber materialNumber)
        redirectProductDetail,
    required TResult Function(SearchKey searchKey) redirectProductSuggestion,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(PaymentSummaryDetails paymentIdentifierInfo)
        redirectPaymentDetail,
    required TResult Function() redirectPaymentHome,
    required TResult Function(String invoiceNumber) redirectInvoiceDetail,
    required TResult Function(ApiFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult? Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult? Function()? redirectPaymentHome,
    TResult? Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult? Function(ApiFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(MaterialNumber materialNumber)? redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber)? redirectProductDetail,
    TResult Function(SearchKey searchKey)? redirectProductSuggestion,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(PaymentSummaryDetails paymentIdentifierInfo)?
        redirectPaymentDetail,
    TResult Function()? redirectPaymentHome,
    TResult Function(String invoiceNumber)? redirectInvoiceDetail,
    TResult Function(ApiFailure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectBundleDetail value) redirectBundleDetail,
    required TResult Function(_RedirectProductDetail value)
        redirectProductDetail,
    required TResult Function(_RedirectProductSuggestion value)
        redirectProductSuggestion,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectPaymentHome value) redirectPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductSuggestion value)?
        redirectProductSuggestion,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectPaymentHome value)? redirectPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DeepLinkingState {
  const factory _Error(final ApiFailure failure) = _$_Error;

  ApiFailure get failure;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
