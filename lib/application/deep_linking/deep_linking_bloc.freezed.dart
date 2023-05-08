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
    required TResult Function(Uri link) addPendingLink,
    required TResult Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)
        consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Uri link)? addPendingLink,
    TResult? Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Uri link)? addPendingLink,
    TResult Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
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
    required TResult Function(Uri link) addPendingLink,
    required TResult Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)
        consumePendingLink,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Uri link)? addPendingLink,
    TResult? Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Uri link)? addPendingLink,
    TResult Function(SalesOrganisation selectedSalesOrganisation,
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
  const factory _Initialize() = _$_Initialize;
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
    required TResult Function(Uri link) addPendingLink,
    required TResult Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)
        consumePendingLink,
  }) {
    return addPendingLink(link);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Uri link)? addPendingLink,
    TResult? Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
  }) {
    return addPendingLink?.call(link);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Uri link)? addPendingLink,
    TResult Function(SalesOrganisation selectedSalesOrganisation,
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
  $Res call(
      {SalesOrganisation selectedSalesOrganisation,
      CustomerCodeInfo selectedCustomerCode,
      ShipToInfo selectedShipTo});

  $SalesOrganisationCopyWith<$Res> get selectedSalesOrganisation;
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
    Object? selectedSalesOrganisation = null,
    Object? selectedCustomerCode = null,
    Object? selectedShipTo = null,
  }) {
    return _then(_$_ConsumePendingLink(
      selectedSalesOrganisation: null == selectedSalesOrganisation
          ? _value.selectedSalesOrganisation
          : selectedSalesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.selectedSalesOrganisation,
        (value) {
      return _then(_value.copyWith(selectedSalesOrganisation: value));
    });
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
      {required this.selectedSalesOrganisation,
      required this.selectedCustomerCode,
      required this.selectedShipTo});

  @override
  final SalesOrganisation selectedSalesOrganisation;
  @override
  final CustomerCodeInfo selectedCustomerCode;
  @override
  final ShipToInfo selectedShipTo;

  @override
  String toString() {
    return 'DeepLinkingEvent.consumePendingLink(selectedSalesOrganisation: $selectedSalesOrganisation, selectedCustomerCode: $selectedCustomerCode, selectedShipTo: $selectedShipTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConsumePendingLink &&
            (identical(other.selectedSalesOrganisation,
                    selectedSalesOrganisation) ||
                other.selectedSalesOrganisation == selectedSalesOrganisation) &&
            (identical(other.selectedCustomerCode, selectedCustomerCode) ||
                other.selectedCustomerCode == selectedCustomerCode) &&
            (identical(other.selectedShipTo, selectedShipTo) ||
                other.selectedShipTo == selectedShipTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedSalesOrganisation,
      selectedCustomerCode, selectedShipTo);

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
    required TResult Function(Uri link) addPendingLink,
    required TResult Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)
        consumePendingLink,
  }) {
    return consumePendingLink(
        selectedSalesOrganisation, selectedCustomerCode, selectedShipTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(Uri link)? addPendingLink,
    TResult? Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
  }) {
    return consumePendingLink?.call(
        selectedSalesOrganisation, selectedCustomerCode, selectedShipTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(Uri link)? addPendingLink,
    TResult Function(SalesOrganisation selectedSalesOrganisation,
            CustomerCodeInfo selectedCustomerCode, ShipToInfo selectedShipTo)?
        consumePendingLink,
    required TResult orElse(),
  }) {
    if (consumePendingLink != null) {
      return consumePendingLink(
          selectedSalesOrganisation, selectedCustomerCode, selectedShipTo);
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
      {required final SalesOrganisation selectedSalesOrganisation,
      required final CustomerCodeInfo selectedCustomerCode,
      required final ShipToInfo selectedShipTo}) = _$_ConsumePendingLink;

  SalesOrganisation get selectedSalesOrganisation;
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
    required TResult Function(String materialNumber) redirectMaterialDetail,
    required TResult Function(RedirectFailure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(String materialNumber)? redirectMaterialDetail,
    TResult? Function(RedirectFailure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(String materialNumber)? redirectMaterialDetail,
    TResult Function(RedirectFailure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectMaterialDetail value)
        redirectMaterialDetail,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
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
    required TResult Function(String materialNumber) redirectMaterialDetail,
    required TResult Function(RedirectFailure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(String materialNumber)? redirectMaterialDetail,
    TResult? Function(RedirectFailure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(String materialNumber)? redirectMaterialDetail,
    TResult Function(RedirectFailure failure)? error,
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
    required TResult Function(_RedirectMaterialDetail value)
        redirectMaterialDetail,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
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
    required TResult Function(String materialNumber) redirectMaterialDetail,
    required TResult Function(RedirectFailure failure) error,
  }) {
    return linkPending(link);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(String materialNumber)? redirectMaterialDetail,
    TResult? Function(RedirectFailure failure)? error,
  }) {
    return linkPending?.call(link);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(String materialNumber)? redirectMaterialDetail,
    TResult Function(RedirectFailure failure)? error,
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
    required TResult Function(_RedirectMaterialDetail value)
        redirectMaterialDetail,
    required TResult Function(_Error value) error,
  }) {
    return linkPending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
    TResult? Function(_Error value)? error,
  }) {
    return linkPending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
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
abstract class _$$_RedirectMaterialDetailCopyWith<$Res> {
  factory _$$_RedirectMaterialDetailCopyWith(_$_RedirectMaterialDetail value,
          $Res Function(_$_RedirectMaterialDetail) then) =
      __$$_RedirectMaterialDetailCopyWithImpl<$Res>;
  @useResult
  $Res call({String materialNumber});
}

/// @nodoc
class __$$_RedirectMaterialDetailCopyWithImpl<$Res>
    extends _$DeepLinkingStateCopyWithImpl<$Res, _$_RedirectMaterialDetail>
    implements _$$_RedirectMaterialDetailCopyWith<$Res> {
  __$$_RedirectMaterialDetailCopyWithImpl(_$_RedirectMaterialDetail _value,
      $Res Function(_$_RedirectMaterialDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
  }) {
    return _then(_$_RedirectMaterialDetail(
      null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RedirectMaterialDetail implements _RedirectMaterialDetail {
  const _$_RedirectMaterialDetail(this.materialNumber);

  @override
  final String materialNumber;

  @override
  String toString() {
    return 'DeepLinkingState.redirectMaterialDetail(materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedirectMaterialDetail &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedirectMaterialDetailCopyWith<_$_RedirectMaterialDetail> get copyWith =>
      __$$_RedirectMaterialDetailCopyWithImpl<_$_RedirectMaterialDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Uri link) linkPending,
    required TResult Function(String materialNumber) redirectMaterialDetail,
    required TResult Function(RedirectFailure failure) error,
  }) {
    return redirectMaterialDetail(materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(String materialNumber)? redirectMaterialDetail,
    TResult? Function(RedirectFailure failure)? error,
  }) {
    return redirectMaterialDetail?.call(materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(String materialNumber)? redirectMaterialDetail,
    TResult Function(RedirectFailure failure)? error,
    required TResult orElse(),
  }) {
    if (redirectMaterialDetail != null) {
      return redirectMaterialDetail(materialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LinkPending value) linkPending,
    required TResult Function(_RedirectMaterialDetail value)
        redirectMaterialDetail,
    required TResult Function(_Error value) error,
  }) {
    return redirectMaterialDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
    TResult? Function(_Error value)? error,
  }) {
    return redirectMaterialDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (redirectMaterialDetail != null) {
      return redirectMaterialDetail(this);
    }
    return orElse();
  }
}

abstract class _RedirectMaterialDetail implements DeepLinkingState {
  const factory _RedirectMaterialDetail(final String materialNumber) =
      _$_RedirectMaterialDetail;

  String get materialNumber;
  @JsonKey(ignore: true)
  _$$_RedirectMaterialDetailCopyWith<_$_RedirectMaterialDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({RedirectFailure failure});

  $RedirectFailureCopyWith<$Res> get failure;
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
              as RedirectFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RedirectFailureCopyWith<$Res> get failure {
    return $RedirectFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.failure);

  @override
  final RedirectFailure failure;

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
    required TResult Function(String materialNumber) redirectMaterialDetail,
    required TResult Function(RedirectFailure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Uri link)? linkPending,
    TResult? Function(String materialNumber)? redirectMaterialDetail,
    TResult? Function(RedirectFailure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Uri link)? linkPending,
    TResult Function(String materialNumber)? redirectMaterialDetail,
    TResult Function(RedirectFailure failure)? error,
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
    required TResult Function(_RedirectMaterialDetail value)
        redirectMaterialDetail,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LinkPending value)? linkPending,
    TResult? Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LinkPending value)? linkPending,
    TResult Function(_RedirectMaterialDetail value)? redirectMaterialDetail,
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
  const factory _Error(final RedirectFailure failure) = _$_Error;

  RedirectFailure get failure;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
