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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeepLinkingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(EzrxLink link, EZReachBanner? banner)
        addPendingLink,
    required TResult Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)
        consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? addPendingLink,
    TResult? Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)?
        consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(EzrxLink link, EZReachBanner? banner)? addPendingLink,
    TResult Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)?
        consumePendingLink,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_AddPendingLink value) addPendingLink,
    required TResult Function(_ConsumePendingLink value) consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_AddPendingLink value)? addPendingLink,
    TResult? Function(_ConsumePendingLink value)? consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
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
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$DeepLinkingEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'DeepLinkingEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(EzrxLink link, EZReachBanner? banner)
        addPendingLink,
    required TResult Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)
        consumePendingLink,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? addPendingLink,
    TResult? Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)?
        consumePendingLink,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(EzrxLink link, EZReachBanner? banner)? addPendingLink,
    TResult Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)?
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
    required TResult Function(_AddPendingLink value) addPendingLink,
    required TResult Function(_ConsumePendingLink value) consumePendingLink,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_AddPendingLink value)? addPendingLink,
    TResult? Function(_ConsumePendingLink value)? consumePendingLink,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
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
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$AddPendingLinkImplCopyWith<$Res> {
  factory _$$AddPendingLinkImplCopyWith(_$AddPendingLinkImpl value,
          $Res Function(_$AddPendingLinkImpl) then) =
      __$$AddPendingLinkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EzrxLink link, EZReachBanner? banner});

  $EZReachBannerCopyWith<$Res>? get banner;
}

/// @nodoc
class __$$AddPendingLinkImplCopyWithImpl<$Res>
    extends _$DeepLinkingEventCopyWithImpl<$Res, _$AddPendingLinkImpl>
    implements _$$AddPendingLinkImplCopyWith<$Res> {
  __$$AddPendingLinkImplCopyWithImpl(
      _$AddPendingLinkImpl _value, $Res Function(_$AddPendingLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? banner = freezed,
  }) {
    return _then(_$AddPendingLinkImpl(
      null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as EzrxLink,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as EZReachBanner?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EZReachBannerCopyWith<$Res>? get banner {
    if (_value.banner == null) {
      return null;
    }

    return $EZReachBannerCopyWith<$Res>(_value.banner!, (value) {
      return _then(_value.copyWith(banner: value));
    });
  }
}

/// @nodoc

class _$AddPendingLinkImpl implements _AddPendingLink {
  const _$AddPendingLinkImpl(this.link, {this.banner});

  @override
  final EzrxLink link;
  @override
  final EZReachBanner? banner;

  @override
  String toString() {
    return 'DeepLinkingEvent.addPendingLink(link: $link, banner: $banner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPendingLinkImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.banner, banner) || other.banner == banner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, link, banner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPendingLinkImplCopyWith<_$AddPendingLinkImpl> get copyWith =>
      __$$AddPendingLinkImplCopyWithImpl<_$AddPendingLinkImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(EzrxLink link, EZReachBanner? banner)
        addPendingLink,
    required TResult Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)
        consumePendingLink,
  }) {
    return addPendingLink(link, banner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? addPendingLink,
    TResult? Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)?
        consumePendingLink,
  }) {
    return addPendingLink?.call(link, banner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(EzrxLink link, EZReachBanner? banner)? addPendingLink,
    TResult Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)?
        consumePendingLink,
    required TResult orElse(),
  }) {
    if (addPendingLink != null) {
      return addPendingLink(link, banner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_AddPendingLink value) addPendingLink,
    required TResult Function(_ConsumePendingLink value) consumePendingLink,
  }) {
    return addPendingLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_AddPendingLink value)? addPendingLink,
    TResult? Function(_ConsumePendingLink value)? consumePendingLink,
  }) {
    return addPendingLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
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
  const factory _AddPendingLink(final EzrxLink link,
      {final EZReachBanner? banner}) = _$AddPendingLinkImpl;

  EzrxLink get link;
  EZReachBanner? get banner;
  @JsonKey(ignore: true)
  _$$AddPendingLinkImplCopyWith<_$AddPendingLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConsumePendingLinkImplCopyWith<$Res> {
  factory _$$ConsumePendingLinkImplCopyWith(_$ConsumePendingLinkImpl value,
          $Res Function(_$ConsumePendingLinkImpl) then) =
      __$$ConsumePendingLinkImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CustomerCodeInfo selectedCustomerCode,
      ShipToInfo selectedShipTo,
      MaterialFilter materialFilter});

  $CustomerCodeInfoCopyWith<$Res> get selectedCustomerCode;
  $ShipToInfoCopyWith<$Res> get selectedShipTo;
  $MaterialFilterCopyWith<$Res> get materialFilter;
}

/// @nodoc
class __$$ConsumePendingLinkImplCopyWithImpl<$Res>
    extends _$DeepLinkingEventCopyWithImpl<$Res, _$ConsumePendingLinkImpl>
    implements _$$ConsumePendingLinkImplCopyWith<$Res> {
  __$$ConsumePendingLinkImplCopyWithImpl(_$ConsumePendingLinkImpl _value,
      $Res Function(_$ConsumePendingLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCustomerCode = null,
    Object? selectedShipTo = null,
    Object? materialFilter = null,
  }) {
    return _then(_$ConsumePendingLinkImpl(
      selectedCustomerCode: null == selectedCustomerCode
          ? _value.selectedCustomerCode
          : selectedCustomerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      selectedShipTo: null == selectedShipTo
          ? _value.selectedShipTo
          : selectedShipTo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialFilter: null == materialFilter
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
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

  @override
  @pragma('vm:prefer-inline')
  $MaterialFilterCopyWith<$Res> get materialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.materialFilter, (value) {
      return _then(_value.copyWith(materialFilter: value));
    });
  }
}

/// @nodoc

class _$ConsumePendingLinkImpl implements _ConsumePendingLink {
  const _$ConsumePendingLinkImpl(
      {required this.selectedCustomerCode,
      required this.selectedShipTo,
      required this.materialFilter});

  @override
  final CustomerCodeInfo selectedCustomerCode;
  @override
  final ShipToInfo selectedShipTo;
  @override
  final MaterialFilter materialFilter;

  @override
  String toString() {
    return 'DeepLinkingEvent.consumePendingLink(selectedCustomerCode: $selectedCustomerCode, selectedShipTo: $selectedShipTo, materialFilter: $materialFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumePendingLinkImpl &&
            (identical(other.selectedCustomerCode, selectedCustomerCode) ||
                other.selectedCustomerCode == selectedCustomerCode) &&
            (identical(other.selectedShipTo, selectedShipTo) ||
                other.selectedShipTo == selectedShipTo) &&
            (identical(other.materialFilter, materialFilter) ||
                other.materialFilter == materialFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, selectedCustomerCode, selectedShipTo, materialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumePendingLinkImplCopyWith<_$ConsumePendingLinkImpl> get copyWith =>
      __$$ConsumePendingLinkImplCopyWithImpl<_$ConsumePendingLinkImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(EzrxLink link, EZReachBanner? banner)
        addPendingLink,
    required TResult Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)
        consumePendingLink,
  }) {
    return consumePendingLink(
        selectedCustomerCode, selectedShipTo, materialFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? addPendingLink,
    TResult? Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)?
        consumePendingLink,
  }) {
    return consumePendingLink?.call(
        selectedCustomerCode, selectedShipTo, materialFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(EzrxLink link, EZReachBanner? banner)? addPendingLink,
    TResult Function(CustomerCodeInfo selectedCustomerCode,
            ShipToInfo selectedShipTo, MaterialFilter materialFilter)?
        consumePendingLink,
    required TResult orElse(),
  }) {
    if (consumePendingLink != null) {
      return consumePendingLink(
          selectedCustomerCode, selectedShipTo, materialFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_AddPendingLink value) addPendingLink,
    required TResult Function(_ConsumePendingLink value) consumePendingLink,
  }) {
    return consumePendingLink(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_AddPendingLink value)? addPendingLink,
    TResult? Function(_ConsumePendingLink value)? consumePendingLink,
  }) {
    return consumePendingLink?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
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
      required final ShipToInfo selectedShipTo,
      required final MaterialFilter materialFilter}) = _$ConsumePendingLinkImpl;

  CustomerCodeInfo get selectedCustomerCode;
  ShipToInfo get selectedShipTo;
  MaterialFilter get materialFilter;
  @JsonKey(ignore: true)
  _$$ConsumePendingLinkImplCopyWith<_$ConsumePendingLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeepLinkingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
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
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'DeepLinkingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
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
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
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
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DeepLinkingState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LinkPendingImplCopyWith<$Res> {
  factory _$$LinkPendingImplCopyWith(
          _$LinkPendingImpl value, $Res Function(_$LinkPendingImpl) then) =
      __$$LinkPendingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EzrxLink link, EZReachBanner? banner});

  $EZReachBannerCopyWith<$Res>? get banner;
}

/// @nodoc
class __$$LinkPendingImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$LinkPendingImpl>
    implements _$$LinkPendingImplCopyWith<$Res> {
  __$$LinkPendingImplCopyWithImpl(
      _$LinkPendingImpl _value, $Res Function(_$LinkPendingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? banner = freezed,
  }) {
    return _then(_$LinkPendingImpl(
      null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as EzrxLink,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as EZReachBanner?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EZReachBannerCopyWith<$Res>? get banner {
    if (_value.banner == null) {
      return null;
    }

    return $EZReachBannerCopyWith<$Res>(_value.banner!, (value) {
      return _then(_value.copyWith(banner: value));
    });
  }
}

/// @nodoc

class _$LinkPendingImpl implements _LinkPending {
  const _$LinkPendingImpl(this.link, {this.banner});

  @override
  final EzrxLink link;
  @override
  final EZReachBanner? banner;

  @override
  String toString() {
    return 'DeepLinkingState.linkPending(link: $link, banner: $banner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkPendingImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.banner, banner) || other.banner == banner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, link, banner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkPendingImplCopyWith<_$LinkPendingImpl> get copyWith =>
      __$$LinkPendingImplCopyWithImpl<_$LinkPendingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return linkPending(link, banner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return linkPending?.call(link, banner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (linkPending != null) {
      return linkPending(link, banner);
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
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
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
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
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (linkPending != null) {
      return linkPending(this);
    }
    return orElse();
  }
}

abstract class _LinkPending implements DeepLinkingState {
  const factory _LinkPending(final EzrxLink link,
      {final EZReachBanner? banner}) = _$LinkPendingImpl;

  EzrxLink get link;
  EZReachBanner? get banner;
  @JsonKey(ignore: true)
  _$$LinkPendingImplCopyWith<_$LinkPendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectBundleDetailImplCopyWith<$Res> {
  factory _$$RedirectBundleDetailImplCopyWith(_$RedirectBundleDetailImpl value,
          $Res Function(_$RedirectBundleDetailImpl) then) =
      __$$RedirectBundleDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber materialNumber, EZReachBanner? banner});

  $EZReachBannerCopyWith<$Res>? get banner;
}

/// @nodoc
class __$$RedirectBundleDetailImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectBundleDetailImpl>
    implements _$$RedirectBundleDetailImplCopyWith<$Res> {
  __$$RedirectBundleDetailImplCopyWithImpl(_$RedirectBundleDetailImpl _value,
      $Res Function(_$RedirectBundleDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? banner = freezed,
  }) {
    return _then(_$RedirectBundleDetailImpl(
      null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as EZReachBanner?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EZReachBannerCopyWith<$Res>? get banner {
    if (_value.banner == null) {
      return null;
    }

    return $EZReachBannerCopyWith<$Res>(_value.banner!, (value) {
      return _then(_value.copyWith(banner: value));
    });
  }
}

/// @nodoc

class _$RedirectBundleDetailImpl implements _RedirectBundleDetail {
  const _$RedirectBundleDetailImpl(this.materialNumber, {this.banner});

  @override
  final MaterialNumber materialNumber;
  @override
  final EZReachBanner? banner;

  @override
  String toString() {
    return 'DeepLinkingState.redirectBundleDetail(materialNumber: $materialNumber, banner: $banner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectBundleDetailImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.banner, banner) || other.banner == banner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, banner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectBundleDetailImplCopyWith<_$RedirectBundleDetailImpl>
      get copyWith =>
          __$$RedirectBundleDetailImplCopyWithImpl<_$RedirectBundleDetailImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectBundleDetail(materialNumber, banner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectBundleDetail?.call(materialNumber, banner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectBundleDetail != null) {
      return redirectBundleDetail(materialNumber, banner);
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
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
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
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
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectBundleDetail != null) {
      return redirectBundleDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectBundleDetail implements DeepLinkingState {
  const factory _RedirectBundleDetail(final MaterialNumber materialNumber,
      {final EZReachBanner? banner}) = _$RedirectBundleDetailImpl;

  MaterialNumber get materialNumber;
  EZReachBanner? get banner;
  @JsonKey(ignore: true)
  _$$RedirectBundleDetailImplCopyWith<_$RedirectBundleDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectProductDetailImplCopyWith<$Res> {
  factory _$$RedirectProductDetailImplCopyWith(
          _$RedirectProductDetailImpl value,
          $Res Function(_$RedirectProductDetailImpl) then) =
      __$$RedirectProductDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber materialNumber, EZReachBanner? banner});

  $EZReachBannerCopyWith<$Res>? get banner;
}

/// @nodoc
class __$$RedirectProductDetailImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectProductDetailImpl>
    implements _$$RedirectProductDetailImplCopyWith<$Res> {
  __$$RedirectProductDetailImplCopyWithImpl(_$RedirectProductDetailImpl _value,
      $Res Function(_$RedirectProductDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? banner = freezed,
  }) {
    return _then(_$RedirectProductDetailImpl(
      null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as EZReachBanner?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $EZReachBannerCopyWith<$Res>? get banner {
    if (_value.banner == null) {
      return null;
    }

    return $EZReachBannerCopyWith<$Res>(_value.banner!, (value) {
      return _then(_value.copyWith(banner: value));
    });
  }
}

/// @nodoc

class _$RedirectProductDetailImpl implements _RedirectProductDetail {
  const _$RedirectProductDetailImpl(this.materialNumber, {this.banner});

  @override
  final MaterialNumber materialNumber;
  @override
  final EZReachBanner? banner;

  @override
  String toString() {
    return 'DeepLinkingState.redirectProductDetail(materialNumber: $materialNumber, banner: $banner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectProductDetailImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.banner, banner) || other.banner == banner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, banner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectProductDetailImplCopyWith<_$RedirectProductDetailImpl>
      get copyWith => __$$RedirectProductDetailImplCopyWithImpl<
          _$RedirectProductDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectProductDetail(materialNumber, banner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectProductDetail?.call(materialNumber, banner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectProductDetail != null) {
      return redirectProductDetail(materialNumber, banner);
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
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
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
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
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectProductDetail != null) {
      return redirectProductDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectProductDetail implements DeepLinkingState {
  const factory _RedirectProductDetail(final MaterialNumber materialNumber,
      {final EZReachBanner? banner}) = _$RedirectProductDetailImpl;

  MaterialNumber get materialNumber;
  EZReachBanner? get banner;
  @JsonKey(ignore: true)
  _$$RedirectProductDetailImplCopyWith<_$RedirectProductDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectProductsTabImplCopyWith<$Res> {
  factory _$$RedirectProductsTabImplCopyWith(_$RedirectProductsTabImpl value,
          $Res Function(_$RedirectProductsTabImpl) then) =
      __$$RedirectProductsTabImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey, MaterialFilter materialFilter});

  $MaterialFilterCopyWith<$Res> get materialFilter;
}

/// @nodoc
class __$$RedirectProductsTabImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectProductsTabImpl>
    implements _$$RedirectProductsTabImplCopyWith<$Res> {
  __$$RedirectProductsTabImplCopyWithImpl(_$RedirectProductsTabImpl _value,
      $Res Function(_$RedirectProductsTabImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
    Object? materialFilter = null,
  }) {
    return _then(_$RedirectProductsTabImpl(
      null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      null == materialFilter
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialFilterCopyWith<$Res> get materialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.materialFilter, (value) {
      return _then(_value.copyWith(materialFilter: value));
    });
  }
}

/// @nodoc

class _$RedirectProductsTabImpl implements _RedirectProductsTab {
  const _$RedirectProductsTabImpl(this.searchKey, this.materialFilter);

  @override
  final SearchKey searchKey;
  @override
  final MaterialFilter materialFilter;

  @override
  String toString() {
    return 'DeepLinkingState.redirectProductsTab(searchKey: $searchKey, materialFilter: $materialFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectProductsTabImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.materialFilter, materialFilter) ||
                other.materialFilter == materialFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey, materialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectProductsTabImplCopyWith<_$RedirectProductsTabImpl> get copyWith =>
      __$$RedirectProductsTabImplCopyWithImpl<_$RedirectProductsTabImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectProductsTab(searchKey, materialFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectProductsTab?.call(searchKey, materialFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectProductsTab != null) {
      return redirectProductsTab(searchKey, materialFilter);
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) {
    return redirectProductsTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) {
    return redirectProductsTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectProductsTab != null) {
      return redirectProductsTab(this);
    }
    return orElse();
  }
}

abstract class _RedirectProductsTab implements DeepLinkingState {
  const factory _RedirectProductsTab(
          final SearchKey searchKey, final MaterialFilter materialFilter) =
      _$RedirectProductsTabImpl;

  SearchKey get searchKey;
  MaterialFilter get materialFilter;
  @JsonKey(ignore: true)
  _$$RedirectProductsTabImplCopyWith<_$RedirectProductsTabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectOrderDetailImplCopyWith<$Res> {
  factory _$$RedirectOrderDetailImplCopyWith(_$RedirectOrderDetailImpl value,
          $Res Function(_$RedirectOrderDetailImpl) then) =
      __$$RedirectOrderDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderNumber orderNumber});
}

/// @nodoc
class __$$RedirectOrderDetailImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectOrderDetailImpl>
    implements _$$RedirectOrderDetailImplCopyWith<$Res> {
  __$$RedirectOrderDetailImplCopyWithImpl(_$RedirectOrderDetailImpl _value,
      $Res Function(_$RedirectOrderDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderNumber = null,
  }) {
    return _then(_$RedirectOrderDetailImpl(
      null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
    ));
  }
}

/// @nodoc

class _$RedirectOrderDetailImpl implements _RedirectOrderDetail {
  const _$RedirectOrderDetailImpl(this.orderNumber);

  @override
  final OrderNumber orderNumber;

  @override
  String toString() {
    return 'DeepLinkingState.redirectOrderDetail(orderNumber: $orderNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectOrderDetailImpl &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectOrderDetailImplCopyWith<_$RedirectOrderDetailImpl> get copyWith =>
      __$$RedirectOrderDetailImplCopyWithImpl<_$RedirectOrderDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectOrderDetail(orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectOrderDetail?.call(orderNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
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
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
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
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
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
      _$RedirectOrderDetailImpl;

  OrderNumber get orderNumber;
  @JsonKey(ignore: true)
  _$$RedirectOrderDetailImplCopyWith<_$RedirectOrderDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectReturnDetailImplCopyWith<$Res> {
  factory _$$RedirectReturnDetailImplCopyWith(_$RedirectReturnDetailImpl value,
          $Res Function(_$RedirectReturnDetailImpl) then) =
      __$$RedirectReturnDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnRequestsId returnId});

  $ReturnRequestsIdCopyWith<$Res> get returnId;
}

/// @nodoc
class __$$RedirectReturnDetailImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectReturnDetailImpl>
    implements _$$RedirectReturnDetailImplCopyWith<$Res> {
  __$$RedirectReturnDetailImplCopyWithImpl(_$RedirectReturnDetailImpl _value,
      $Res Function(_$RedirectReturnDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnId = null,
  }) {
    return _then(_$RedirectReturnDetailImpl(
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

class _$RedirectReturnDetailImpl implements _RedirectReturnDetail {
  const _$RedirectReturnDetailImpl(this.returnId);

  @override
  final ReturnRequestsId returnId;

  @override
  String toString() {
    return 'DeepLinkingState.redirectReturnDetail(returnId: $returnId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectReturnDetailImpl &&
            (identical(other.returnId, returnId) ||
                other.returnId == returnId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectReturnDetailImplCopyWith<_$RedirectReturnDetailImpl>
      get copyWith =>
          __$$RedirectReturnDetailImplCopyWithImpl<_$RedirectReturnDetailImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectReturnDetail(returnId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectReturnDetail?.call(returnId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
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
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
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
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
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
      _$RedirectReturnDetailImpl;

  ReturnRequestsId get returnId;
  @JsonKey(ignore: true)
  _$$RedirectReturnDetailImplCopyWith<_$RedirectReturnDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectPaymentDetailImplCopyWith<$Res> {
  factory _$$RedirectPaymentDetailImplCopyWith(
          _$RedirectPaymentDetailImpl value,
          $Res Function(_$RedirectPaymentDetailImpl) then) =
      __$$RedirectPaymentDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace});

  $PaymentSummaryDetailsCopyWith<$Res> get paymentIdentifierInfo;
}

/// @nodoc
class __$$RedirectPaymentDetailImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectPaymentDetailImpl>
    implements _$$RedirectPaymentDetailImplCopyWith<$Res> {
  __$$RedirectPaymentDetailImplCopyWithImpl(_$RedirectPaymentDetailImpl _value,
      $Res Function(_$RedirectPaymentDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentIdentifierInfo = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$RedirectPaymentDetailImpl(
      paymentIdentifierInfo: null == paymentIdentifierInfo
          ? _value.paymentIdentifierInfo
          : paymentIdentifierInfo // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryDetails,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$RedirectPaymentDetailImpl implements _RedirectPaymentDetail {
  const _$RedirectPaymentDetailImpl(
      {required this.paymentIdentifierInfo, required this.isMarketPlace});

  @override
  final PaymentSummaryDetails paymentIdentifierInfo;
  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'DeepLinkingState.redirectPaymentDetail(paymentIdentifierInfo: $paymentIdentifierInfo, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectPaymentDetailImpl &&
            (identical(other.paymentIdentifierInfo, paymentIdentifierInfo) ||
                other.paymentIdentifierInfo == paymentIdentifierInfo) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentIdentifierInfo, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectPaymentDetailImplCopyWith<_$RedirectPaymentDetailImpl>
      get copyWith => __$$RedirectPaymentDetailImplCopyWithImpl<
          _$RedirectPaymentDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectPaymentDetail(paymentIdentifierInfo, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectPaymentDetail?.call(paymentIdentifierInfo, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectPaymentDetail != null) {
      return redirectPaymentDetail(paymentIdentifierInfo, isMarketPlace);
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
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
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
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
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
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
      {required final PaymentSummaryDetails paymentIdentifierInfo,
      required final bool isMarketPlace}) = _$RedirectPaymentDetailImpl;

  PaymentSummaryDetails get paymentIdentifierInfo;
  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$RedirectPaymentDetailImplCopyWith<_$RedirectPaymentDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectZPPaymentHomeImplCopyWith<$Res> {
  factory _$$RedirectZPPaymentHomeImplCopyWith(
          _$RedirectZPPaymentHomeImpl value,
          $Res Function(_$RedirectZPPaymentHomeImpl) then) =
      __$$RedirectZPPaymentHomeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RedirectZPPaymentHomeImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectZPPaymentHomeImpl>
    implements _$$RedirectZPPaymentHomeImplCopyWith<$Res> {
  __$$RedirectZPPaymentHomeImplCopyWithImpl(_$RedirectZPPaymentHomeImpl _value,
      $Res Function(_$RedirectZPPaymentHomeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RedirectZPPaymentHomeImpl implements _RedirectZPPaymentHome {
  const _$RedirectZPPaymentHomeImpl();

  @override
  String toString() {
    return 'DeepLinkingState.redirectZPPaymentHome()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectZPPaymentHomeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectZPPaymentHome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectZPPaymentHome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectZPPaymentHome != null) {
      return redirectZPPaymentHome();
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) {
    return redirectZPPaymentHome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) {
    return redirectZPPaymentHome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectZPPaymentHome != null) {
      return redirectZPPaymentHome(this);
    }
    return orElse();
  }
}

abstract class _RedirectZPPaymentHome implements DeepLinkingState {
  const factory _RedirectZPPaymentHome() = _$RedirectZPPaymentHomeImpl;
}

/// @nodoc
abstract class _$$RedirectMPPaymentHomeImplCopyWith<$Res> {
  factory _$$RedirectMPPaymentHomeImplCopyWith(
          _$RedirectMPPaymentHomeImpl value,
          $Res Function(_$RedirectMPPaymentHomeImpl) then) =
      __$$RedirectMPPaymentHomeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RedirectMPPaymentHomeImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectMPPaymentHomeImpl>
    implements _$$RedirectMPPaymentHomeImplCopyWith<$Res> {
  __$$RedirectMPPaymentHomeImplCopyWithImpl(_$RedirectMPPaymentHomeImpl _value,
      $Res Function(_$RedirectMPPaymentHomeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RedirectMPPaymentHomeImpl implements _RedirectMPPaymentHome {
  const _$RedirectMPPaymentHomeImpl();

  @override
  String toString() {
    return 'DeepLinkingState.redirectMPPaymentHome()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectMPPaymentHomeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectMPPaymentHome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectMPPaymentHome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectMPPaymentHome != null) {
      return redirectMPPaymentHome();
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) {
    return redirectMPPaymentHome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) {
    return redirectMPPaymentHome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectMPPaymentHome != null) {
      return redirectMPPaymentHome(this);
    }
    return orElse();
  }
}

abstract class _RedirectMPPaymentHome implements DeepLinkingState {
  const factory _RedirectMPPaymentHome() = _$RedirectMPPaymentHomeImpl;
}

/// @nodoc
abstract class _$$RedirectInvoiceDetailImplCopyWith<$Res> {
  factory _$$RedirectInvoiceDetailImplCopyWith(
          _$RedirectInvoiceDetailImpl value,
          $Res Function(_$RedirectInvoiceDetailImpl) then) =
      __$$RedirectInvoiceDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String invoiceNumber, bool isMarketPlace});
}

/// @nodoc
class __$$RedirectInvoiceDetailImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectInvoiceDetailImpl>
    implements _$$RedirectInvoiceDetailImplCopyWith<$Res> {
  __$$RedirectInvoiceDetailImplCopyWithImpl(_$RedirectInvoiceDetailImpl _value,
      $Res Function(_$RedirectInvoiceDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$RedirectInvoiceDetailImpl(
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RedirectInvoiceDetailImpl implements _RedirectInvoiceDetail {
  const _$RedirectInvoiceDetailImpl(
      {required this.invoiceNumber, required this.isMarketPlace});

  @override
  final String invoiceNumber;
  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'DeepLinkingState.redirectInvoiceDetail(invoiceNumber: $invoiceNumber, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectInvoiceDetailImpl &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceNumber, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectInvoiceDetailImplCopyWith<_$RedirectInvoiceDetailImpl>
      get copyWith => __$$RedirectInvoiceDetailImplCopyWithImpl<
          _$RedirectInvoiceDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectInvoiceDetail(invoiceNumber, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectInvoiceDetail?.call(invoiceNumber, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectInvoiceDetail != null) {
      return redirectInvoiceDetail(invoiceNumber, isMarketPlace);
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
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
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
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
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectInvoiceDetail != null) {
      return redirectInvoiceDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectInvoiceDetail implements DeepLinkingState {
  const factory _RedirectInvoiceDetail(
      {required final String invoiceNumber,
      required final bool isMarketPlace}) = _$RedirectInvoiceDetailImpl;

  String get invoiceNumber;
  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$RedirectInvoiceDetailImplCopyWith<_$RedirectInvoiceDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectFAQImplCopyWith<$Res> {
  factory _$$RedirectFAQImplCopyWith(
          _$RedirectFAQImpl value, $Res Function(_$RedirectFAQImpl) then) =
      __$$RedirectFAQImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RedirectFAQImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectFAQImpl>
    implements _$$RedirectFAQImplCopyWith<$Res> {
  __$$RedirectFAQImplCopyWithImpl(
      _$RedirectFAQImpl _value, $Res Function(_$RedirectFAQImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RedirectFAQImpl implements _RedirectFAQ {
  const _$RedirectFAQImpl();

  @override
  String toString() {
    return 'DeepLinkingState.redirectFAQ()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RedirectFAQImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectFAQ();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectFAQ?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectFAQ != null) {
      return redirectFAQ();
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) {
    return redirectFAQ(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) {
    return redirectFAQ?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectFAQ != null) {
      return redirectFAQ(this);
    }
    return orElse();
  }
}

abstract class _RedirectFAQ implements DeepLinkingState {
  const factory _RedirectFAQ() = _$RedirectFAQImpl;
}

/// @nodoc
abstract class _$$RedirectAboutUsImplCopyWith<$Res> {
  factory _$$RedirectAboutUsImplCopyWith(_$RedirectAboutUsImpl value,
          $Res Function(_$RedirectAboutUsImpl) then) =
      __$$RedirectAboutUsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RedirectAboutUsImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectAboutUsImpl>
    implements _$$RedirectAboutUsImplCopyWith<$Res> {
  __$$RedirectAboutUsImplCopyWithImpl(
      _$RedirectAboutUsImpl _value, $Res Function(_$RedirectAboutUsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RedirectAboutUsImpl implements _RedirectAboutUs {
  const _$RedirectAboutUsImpl();

  @override
  String toString() {
    return 'DeepLinkingState.redirectAboutUs()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RedirectAboutUsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectAboutUs();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectAboutUs?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectAboutUs != null) {
      return redirectAboutUs();
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) {
    return redirectAboutUs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) {
    return redirectAboutUs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectAboutUs != null) {
      return redirectAboutUs(this);
    }
    return orElse();
  }
}

abstract class _RedirectAboutUs implements DeepLinkingState {
  const factory _RedirectAboutUs() = _$RedirectAboutUsImpl;
}

/// @nodoc
abstract class _$$RedirectContactUsImplCopyWith<$Res> {
  factory _$$RedirectContactUsImplCopyWith(_$RedirectContactUsImpl value,
          $Res Function(_$RedirectContactUsImpl) then) =
      __$$RedirectContactUsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppMarket market});
}

/// @nodoc
class __$$RedirectContactUsImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectContactUsImpl>
    implements _$$RedirectContactUsImplCopyWith<$Res> {
  __$$RedirectContactUsImplCopyWithImpl(_$RedirectContactUsImpl _value,
      $Res Function(_$RedirectContactUsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = null,
  }) {
    return _then(_$RedirectContactUsImpl(
      null == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as AppMarket,
    ));
  }
}

/// @nodoc

class _$RedirectContactUsImpl implements _RedirectContactUs {
  const _$RedirectContactUsImpl(this.market);

  @override
  final AppMarket market;

  @override
  String toString() {
    return 'DeepLinkingState.redirectContactUs(market: $market)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectContactUsImpl &&
            (identical(other.market, market) || other.market == market));
  }

  @override
  int get hashCode => Object.hash(runtimeType, market);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectContactUsImplCopyWith<_$RedirectContactUsImpl> get copyWith =>
      __$$RedirectContactUsImplCopyWithImpl<_$RedirectContactUsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectContactUs(market);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectContactUs?.call(market);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectContactUs != null) {
      return redirectContactUs(market);
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) {
    return redirectContactUs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) {
    return redirectContactUs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectContactUs != null) {
      return redirectContactUs(this);
    }
    return orElse();
  }
}

abstract class _RedirectContactUs implements DeepLinkingState {
  const factory _RedirectContactUs(final AppMarket market) =
      _$RedirectContactUsImpl;

  AppMarket get market;
  @JsonKey(ignore: true)
  _$$RedirectContactUsImplCopyWith<_$RedirectContactUsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectUserGuideImplCopyWith<$Res> {
  factory _$$RedirectUserGuideImplCopyWith(_$RedirectUserGuideImpl value,
          $Res Function(_$RedirectUserGuideImpl) then) =
      __$$RedirectUserGuideImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RedirectUserGuideImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectUserGuideImpl>
    implements _$$RedirectUserGuideImplCopyWith<$Res> {
  __$$RedirectUserGuideImplCopyWithImpl(_$RedirectUserGuideImpl _value,
      $Res Function(_$RedirectUserGuideImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RedirectUserGuideImpl implements _RedirectUserGuide {
  const _$RedirectUserGuideImpl();

  @override
  String toString() {
    return 'DeepLinkingState.redirectUserGuide()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RedirectUserGuideImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectUserGuide();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectUserGuide?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectUserGuide != null) {
      return redirectUserGuide();
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) {
    return redirectUserGuide(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) {
    return redirectUserGuide?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectUserGuide != null) {
      return redirectUserGuide(this);
    }
    return orElse();
  }
}

abstract class _RedirectUserGuide implements DeepLinkingState {
  const factory _RedirectUserGuide() = _$RedirectUserGuideImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiFailure failure});

  $ApiFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorImpl(
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

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.failure);

  @override
  final ApiFailure failure;

  @override
  String toString() {
    return 'DeepLinkingState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
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
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
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
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DeepLinkingState {
  const factory _Error(final ApiFailure failure) = _$ErrorImpl;

  ApiFailure get failure;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectResetPasswordImplCopyWith<$Res> {
  factory _$$RedirectResetPasswordImplCopyWith(
          _$RedirectResetPasswordImpl value,
          $Res Function(_$RedirectResetPasswordImpl) then) =
      __$$RedirectResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetPasswordCred resetPasswordCred});

  $ResetPasswordCredCopyWith<$Res> get resetPasswordCred;
}

/// @nodoc
class __$$RedirectResetPasswordImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectResetPasswordImpl>
    implements _$$RedirectResetPasswordImplCopyWith<$Res> {
  __$$RedirectResetPasswordImplCopyWithImpl(_$RedirectResetPasswordImpl _value,
      $Res Function(_$RedirectResetPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetPasswordCred = null,
  }) {
    return _then(_$RedirectResetPasswordImpl(
      null == resetPasswordCred
          ? _value.resetPasswordCred
          : resetPasswordCred // ignore: cast_nullable_to_non_nullable
              as ResetPasswordCred,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ResetPasswordCredCopyWith<$Res> get resetPasswordCred {
    return $ResetPasswordCredCopyWith<$Res>(_value.resetPasswordCred, (value) {
      return _then(_value.copyWith(resetPasswordCred: value));
    });
  }
}

/// @nodoc

class _$RedirectResetPasswordImpl implements _RedirectResetPassword {
  const _$RedirectResetPasswordImpl(this.resetPasswordCred);

  @override
  final ResetPasswordCred resetPasswordCred;

  @override
  String toString() {
    return 'DeepLinkingState.redirectResetPassword(resetPasswordCred: $resetPasswordCred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedirectResetPasswordImpl &&
            (identical(other.resetPasswordCred, resetPasswordCred) ||
                other.resetPasswordCred == resetPasswordCred));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resetPasswordCred);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RedirectResetPasswordImplCopyWith<_$RedirectResetPasswordImpl>
      get copyWith => __$$RedirectResetPasswordImplCopyWithImpl<
          _$RedirectResetPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectResetPassword(resetPasswordCred);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectResetPassword?.call(resetPasswordCred);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectResetPassword != null) {
      return redirectResetPassword(resetPasswordCred);
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) {
    return redirectResetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) {
    return redirectResetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectResetPassword != null) {
      return redirectResetPassword(this);
    }
    return orElse();
  }
}

abstract class _RedirectResetPassword implements DeepLinkingState {
  const factory _RedirectResetPassword(
      final ResetPasswordCred resetPasswordCred) = _$RedirectResetPasswordImpl;

  ResetPasswordCred get resetPasswordCred;
  @JsonKey(ignore: true)
  _$$RedirectResetPasswordImplCopyWith<_$RedirectResetPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedirectOrderImplCopyWith<$Res> {
  factory _$$RedirectOrderImplCopyWith(
          _$RedirectOrderImpl value, $Res Function(_$RedirectOrderImpl) then) =
      __$$RedirectOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RedirectOrderImplCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$RedirectOrderImpl>
    implements _$$RedirectOrderImplCopyWith<$Res> {
  __$$RedirectOrderImplCopyWithImpl(
      _$RedirectOrderImpl _value, $Res Function(_$RedirectOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RedirectOrderImpl implements _RedirectOrder {
  const _$RedirectOrderImpl();

  @override
  String toString() {
    return 'DeepLinkingState.redirectOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RedirectOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(EzrxLink link, EZReachBanner? banner) linkPending,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectBundleDetail,
    required TResult Function(
            MaterialNumber materialNumber, EZReachBanner? banner)
        redirectProductDetail,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        redirectProductsTab,
    required TResult Function(OrderNumber orderNumber) redirectOrderDetail,
    required TResult Function(ReturnRequestsId returnId) redirectReturnDetail,
    required TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)
        redirectPaymentDetail,
    required TResult Function() redirectZPPaymentHome,
    required TResult Function() redirectMPPaymentHome,
    required TResult Function(String invoiceNumber, bool isMarketPlace)
        redirectInvoiceDetail,
    required TResult Function() redirectFAQ,
    required TResult Function() redirectAboutUs,
    required TResult Function(AppMarket market) redirectContactUs,
    required TResult Function() redirectUserGuide,
    required TResult Function(ApiFailure failure) error,
    required TResult Function(ResetPasswordCred resetPasswordCred)
        redirectResetPassword,
    required TResult Function() redirectOrder,
  }) {
    return redirectOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult? Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult? Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult? Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult? Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult? Function()? redirectZPPaymentHome,
    TResult? Function()? redirectMPPaymentHome,
    TResult? Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult? Function()? redirectFAQ,
    TResult? Function()? redirectAboutUs,
    TResult? Function(AppMarket market)? redirectContactUs,
    TResult? Function()? redirectUserGuide,
    TResult? Function(ApiFailure failure)? error,
    TResult? Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult? Function()? redirectOrder,
  }) {
    return redirectOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(EzrxLink link, EZReachBanner? banner)? linkPending,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectBundleDetail,
    TResult Function(MaterialNumber materialNumber, EZReachBanner? banner)?
        redirectProductDetail,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        redirectProductsTab,
    TResult Function(OrderNumber orderNumber)? redirectOrderDetail,
    TResult Function(ReturnRequestsId returnId)? redirectReturnDetail,
    TResult Function(
            PaymentSummaryDetails paymentIdentifierInfo, bool isMarketPlace)?
        redirectPaymentDetail,
    TResult Function()? redirectZPPaymentHome,
    TResult Function()? redirectMPPaymentHome,
    TResult Function(String invoiceNumber, bool isMarketPlace)?
        redirectInvoiceDetail,
    TResult Function()? redirectFAQ,
    TResult Function()? redirectAboutUs,
    TResult Function(AppMarket market)? redirectContactUs,
    TResult Function()? redirectUserGuide,
    TResult Function(ApiFailure failure)? error,
    TResult Function(ResetPasswordCred resetPasswordCred)?
        redirectResetPassword,
    TResult Function()? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectOrder != null) {
      return redirectOrder();
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
    required TResult Function(_RedirectProductsTab value) redirectProductsTab,
    required TResult Function(_RedirectOrderDetail value) redirectOrderDetail,
    required TResult Function(_RedirectReturnDetail value) redirectReturnDetail,
    required TResult Function(_RedirectPaymentDetail value)
        redirectPaymentDetail,
    required TResult Function(_RedirectZPPaymentHome value)
        redirectZPPaymentHome,
    required TResult Function(_RedirectMPPaymentHome value)
        redirectMPPaymentHome,
    required TResult Function(_RedirectInvoiceDetail value)
        redirectInvoiceDetail,
    required TResult Function(_RedirectFAQ value) redirectFAQ,
    required TResult Function(_RedirectAboutUs value) redirectAboutUs,
    required TResult Function(_RedirectContactUs value) redirectContactUs,
    required TResult Function(_RedirectUserGuide value) redirectUserGuide,
    required TResult Function(_Error value) error,
    required TResult Function(_RedirectResetPassword value)
        redirectResetPassword,
    required TResult Function(_RedirectOrder value) redirectOrder,
  }) {
    return redirectOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult? Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult? Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult? Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult? Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult? Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult? Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult? Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult? Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult? Function(_RedirectFAQ value)? redirectFAQ,
    TResult? Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult? Function(_RedirectContactUs value)? redirectContactUs,
    TResult? Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult? Function(_Error value)? error,
    TResult? Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult? Function(_RedirectOrder value)? redirectOrder,
  }) {
    return redirectOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectBundleDetail value)? redirectBundleDetail,
    TResult Function(_RedirectProductDetail value)? redirectProductDetail,
    TResult Function(_RedirectProductsTab value)? redirectProductsTab,
    TResult Function(_RedirectOrderDetail value)? redirectOrderDetail,
    TResult Function(_RedirectReturnDetail value)? redirectReturnDetail,
    TResult Function(_RedirectPaymentDetail value)? redirectPaymentDetail,
    TResult Function(_RedirectZPPaymentHome value)? redirectZPPaymentHome,
    TResult Function(_RedirectMPPaymentHome value)? redirectMPPaymentHome,
    TResult Function(_RedirectInvoiceDetail value)? redirectInvoiceDetail,
    TResult Function(_RedirectFAQ value)? redirectFAQ,
    TResult Function(_RedirectAboutUs value)? redirectAboutUs,
    TResult Function(_RedirectContactUs value)? redirectContactUs,
    TResult Function(_RedirectUserGuide value)? redirectUserGuide,
    TResult Function(_Error value)? error,
    TResult Function(_RedirectResetPassword value)? redirectResetPassword,
    TResult Function(_RedirectOrder value)? redirectOrder,
    required TResult orElse(),
  }) {
    if (redirectOrder != null) {
      return redirectOrder(this);
    }
    return orElse();
  }
}

abstract class _RedirectOrder implements DeepLinkingState {
  const factory _RedirectOrder() = _$RedirectOrderImpl;
}
