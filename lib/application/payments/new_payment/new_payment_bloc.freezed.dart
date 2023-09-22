// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewPaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPaymentEventCopyWith<$Res> {
  factory $NewPaymentEventCopyWith(
          NewPaymentEvent value, $Res Function(NewPaymentEvent) then) =
      _$NewPaymentEventCopyWithImpl<$Res, NewPaymentEvent>;
}

/// @nodoc
class _$NewPaymentEventCopyWithImpl<$Res, $Val extends NewPaymentEvent>
    implements $NewPaymentEventCopyWith<$Res> {
  _$NewPaymentEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      User user});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_initializedCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_initialized>
    implements _$$_initializedCopyWith<$Res> {
  __$$_initializedCopyWithImpl(
      _$_initialized _value, $Res Function(_$_initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? user = null,
  }) {
    return _then(_$_initialized(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
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
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_initialized implements _initialized {
  const _$_initialized(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.user});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'NewPaymentEvent.initialized(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_initialized &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganisation, customerCodeInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_initializedCopyWith<_$_initialized> get copyWith =>
      __$$_initializedCopyWithImpl<_$_initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return initialized(salesOrganisation, customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return initialized?.call(salesOrganisation, customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation, customerCodeInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements NewPaymentEvent {
  const factory _initialized(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user}) = _$_initialized;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$_initializedCopyWith<_$_initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectAllInvoicesCopyWith<$Res> {
  factory _$$_SelectAllInvoicesCopyWith(_$_SelectAllInvoices value,
          $Res Function(_$_SelectAllInvoices) then) =
      __$$_SelectAllInvoicesCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CustomerOpenItem> items});
}

/// @nodoc
class __$$_SelectAllInvoicesCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_SelectAllInvoices>
    implements _$$_SelectAllInvoicesCopyWith<$Res> {
  __$$_SelectAllInvoicesCopyWithImpl(
      _$_SelectAllInvoices _value, $Res Function(_$_SelectAllInvoices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_SelectAllInvoices(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
    ));
  }
}

/// @nodoc

class _$_SelectAllInvoices implements _SelectAllInvoices {
  const _$_SelectAllInvoices({required final List<CustomerOpenItem> items})
      : _items = items;

  final List<CustomerOpenItem> _items;
  @override
  List<CustomerOpenItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'NewPaymentEvent.updateAllInvoices(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectAllInvoices &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectAllInvoicesCopyWith<_$_SelectAllInvoices> get copyWith =>
      __$$_SelectAllInvoicesCopyWithImpl<_$_SelectAllInvoices>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return updateAllInvoices(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return updateAllInvoices?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (updateAllInvoices != null) {
      return updateAllInvoices(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return updateAllInvoices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return updateAllInvoices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (updateAllInvoices != null) {
      return updateAllInvoices(this);
    }
    return orElse();
  }
}

abstract class _SelectAllInvoices implements NewPaymentEvent {
  const factory _SelectAllInvoices(
      {required final List<CustomerOpenItem> items}) = _$_SelectAllInvoices;

  List<CustomerOpenItem> get items;
  @JsonKey(ignore: true)
  _$$_SelectAllInvoicesCopyWith<_$_SelectAllInvoices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleInvoiceCopyWith<$Res> {
  factory _$$_ToggleInvoiceCopyWith(
          _$_ToggleInvoice value, $Res Function(_$_ToggleInvoice) then) =
      __$$_ToggleInvoiceCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerOpenItem item, bool selected});

  $CustomerOpenItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ToggleInvoiceCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_ToggleInvoice>
    implements _$$_ToggleInvoiceCopyWith<$Res> {
  __$$_ToggleInvoiceCopyWithImpl(
      _$_ToggleInvoice _value, $Res Function(_$_ToggleInvoice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? selected = null,
  }) {
    return _then(_$_ToggleInvoice(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CustomerOpenItem,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerOpenItemCopyWith<$Res> get item {
    return $CustomerOpenItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_ToggleInvoice implements _ToggleInvoice {
  const _$_ToggleInvoice({required this.item, required this.selected});

  @override
  final CustomerOpenItem item;
  @override
  final bool selected;

  @override
  String toString() {
    return 'NewPaymentEvent.toggleInvoice(item: $item, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleInvoice &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleInvoiceCopyWith<_$_ToggleInvoice> get copyWith =>
      __$$_ToggleInvoiceCopyWithImpl<_$_ToggleInvoice>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return toggleInvoice(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return toggleInvoice?.call(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (toggleInvoice != null) {
      return toggleInvoice(item, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return toggleInvoice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return toggleInvoice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (toggleInvoice != null) {
      return toggleInvoice(this);
    }
    return orElse();
  }
}

abstract class _ToggleInvoice implements NewPaymentEvent {
  const factory _ToggleInvoice(
      {required final CustomerOpenItem item,
      required final bool selected}) = _$_ToggleInvoice;

  CustomerOpenItem get item;
  bool get selected;
  @JsonKey(ignore: true)
  _$$_ToggleInvoiceCopyWith<_$_ToggleInvoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SelectAllCreditsCopyWith<$Res> {
  factory _$$_SelectAllCreditsCopyWith(
          _$_SelectAllCredits value, $Res Function(_$_SelectAllCredits) then) =
      __$$_SelectAllCreditsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CustomerOpenItem> items});
}

/// @nodoc
class __$$_SelectAllCreditsCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_SelectAllCredits>
    implements _$$_SelectAllCreditsCopyWith<$Res> {
  __$$_SelectAllCreditsCopyWithImpl(
      _$_SelectAllCredits _value, $Res Function(_$_SelectAllCredits) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_SelectAllCredits(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
    ));
  }
}

/// @nodoc

class _$_SelectAllCredits implements _SelectAllCredits {
  const _$_SelectAllCredits({required final List<CustomerOpenItem> items})
      : _items = items;

  final List<CustomerOpenItem> _items;
  @override
  List<CustomerOpenItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'NewPaymentEvent.updateAllCredits(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectAllCredits &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectAllCreditsCopyWith<_$_SelectAllCredits> get copyWith =>
      __$$_SelectAllCreditsCopyWithImpl<_$_SelectAllCredits>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return updateAllCredits(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return updateAllCredits?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (updateAllCredits != null) {
      return updateAllCredits(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return updateAllCredits(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return updateAllCredits?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (updateAllCredits != null) {
      return updateAllCredits(this);
    }
    return orElse();
  }
}

abstract class _SelectAllCredits implements NewPaymentEvent {
  const factory _SelectAllCredits(
      {required final List<CustomerOpenItem> items}) = _$_SelectAllCredits;

  List<CustomerOpenItem> get items;
  @JsonKey(ignore: true)
  _$$_SelectAllCreditsCopyWith<_$_SelectAllCredits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleCreditCopyWith<$Res> {
  factory _$$_ToggleCreditCopyWith(
          _$_ToggleCredit value, $Res Function(_$_ToggleCredit) then) =
      __$$_ToggleCreditCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerOpenItem item, bool selected});

  $CustomerOpenItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$_ToggleCreditCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_ToggleCredit>
    implements _$$_ToggleCreditCopyWith<$Res> {
  __$$_ToggleCreditCopyWithImpl(
      _$_ToggleCredit _value, $Res Function(_$_ToggleCredit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? selected = null,
  }) {
    return _then(_$_ToggleCredit(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CustomerOpenItem,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerOpenItemCopyWith<$Res> get item {
    return $CustomerOpenItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$_ToggleCredit implements _ToggleCredit {
  const _$_ToggleCredit({required this.item, required this.selected});

  @override
  final CustomerOpenItem item;
  @override
  final bool selected;

  @override
  String toString() {
    return 'NewPaymentEvent.toggleCredit(item: $item, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleCredit &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleCreditCopyWith<_$_ToggleCredit> get copyWith =>
      __$$_ToggleCreditCopyWithImpl<_$_ToggleCredit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return toggleCredit(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return toggleCredit?.call(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (toggleCredit != null) {
      return toggleCredit(item, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return toggleCredit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return toggleCredit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (toggleCredit != null) {
      return toggleCredit(this);
    }
    return orElse();
  }
}

abstract class _ToggleCredit implements NewPaymentEvent {
  const factory _ToggleCredit(
      {required final CustomerOpenItem item,
      required final bool selected}) = _$_ToggleCredit;

  CustomerOpenItem get item;
  bool get selected;
  @JsonKey(ignore: true)
  _$$_ToggleCreditCopyWith<_$_ToggleCredit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PayCopyWith<$Res> {
  factory _$$_PayCopyWith(_$_Pay value, $Res Function(_$_Pay) then) =
      __$$_PayCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PayCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_Pay>
    implements _$$_PayCopyWith<$Res> {
  __$$_PayCopyWithImpl(_$_Pay _value, $Res Function(_$_Pay) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Pay implements _Pay {
  const _$_Pay();

  @override
  String toString() {
    return 'NewPaymentEvent.pay()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Pay);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return pay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return pay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return pay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return pay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay(this);
    }
    return orElse();
  }
}

abstract class _Pay implements NewPaymentEvent {
  const factory _Pay() = _$_Pay;
}

/// @nodoc
abstract class _$$_UpdatePaymentGatewayCopyWith<$Res> {
  factory _$$_UpdatePaymentGatewayCopyWith(_$_UpdatePaymentGateway value,
          $Res Function(_$_UpdatePaymentGateway) then) =
      __$$_UpdatePaymentGatewayCopyWithImpl<$Res>;
  @useResult
  $Res call({Uri paymentUrl});
}

/// @nodoc
class __$$_UpdatePaymentGatewayCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_UpdatePaymentGateway>
    implements _$$_UpdatePaymentGatewayCopyWith<$Res> {
  __$$_UpdatePaymentGatewayCopyWithImpl(_$_UpdatePaymentGateway _value,
      $Res Function(_$_UpdatePaymentGateway) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentUrl = null,
  }) {
    return _then(_$_UpdatePaymentGateway(
      paymentUrl: null == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_UpdatePaymentGateway implements _UpdatePaymentGateway {
  const _$_UpdatePaymentGateway({required this.paymentUrl});

  @override
  final Uri paymentUrl;

  @override
  String toString() {
    return 'NewPaymentEvent.updatePaymentGateway(paymentUrl: $paymentUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePaymentGateway &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePaymentGatewayCopyWith<_$_UpdatePaymentGateway> get copyWith =>
      __$$_UpdatePaymentGatewayCopyWithImpl<_$_UpdatePaymentGateway>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return updatePaymentGateway(paymentUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return updatePaymentGateway?.call(paymentUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (updatePaymentGateway != null) {
      return updatePaymentGateway(paymentUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return updatePaymentGateway(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return updatePaymentGateway?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (updatePaymentGateway != null) {
      return updatePaymentGateway(this);
    }
    return orElse();
  }
}

abstract class _UpdatePaymentGateway implements NewPaymentEvent {
  const factory _UpdatePaymentGateway({required final Uri paymentUrl}) =
      _$_UpdatePaymentGateway;

  Uri get paymentUrl;
  @JsonKey(ignore: true)
  _$$_UpdatePaymentGatewayCopyWith<_$_UpdatePaymentGateway> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchInvoiceInfoPdfCopyWith<$Res> {
  factory _$$_FetchInvoiceInfoPdfCopyWith(_$_FetchInvoiceInfoPdf value,
          $Res Function(_$_FetchInvoiceInfoPdf) then) =
      __$$_FetchInvoiceInfoPdfCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchInvoiceInfoPdfCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_FetchInvoiceInfoPdf>
    implements _$$_FetchInvoiceInfoPdfCopyWith<$Res> {
  __$$_FetchInvoiceInfoPdfCopyWithImpl(_$_FetchInvoiceInfoPdf _value,
      $Res Function(_$_FetchInvoiceInfoPdf) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchInvoiceInfoPdf implements _FetchInvoiceInfoPdf {
  const _$_FetchInvoiceInfoPdf();

  @override
  String toString() {
    return 'NewPaymentEvent.fetchInvoiceInfoPdf()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchInvoiceInfoPdf);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return fetchInvoiceInfoPdf();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return fetchInvoiceInfoPdf?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (fetchInvoiceInfoPdf != null) {
      return fetchInvoiceInfoPdf();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return fetchInvoiceInfoPdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return fetchInvoiceInfoPdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (fetchInvoiceInfoPdf != null) {
      return fetchInvoiceInfoPdf(this);
    }
    return orElse();
  }
}

abstract class _FetchInvoiceInfoPdf implements NewPaymentEvent {
  const factory _FetchInvoiceInfoPdf() = _$_FetchInvoiceInfoPdf;
}

/// @nodoc
abstract class _$$_SaveInvoicePdfCopyWith<$Res> {
  factory _$$_SaveInvoicePdfCopyWith(
          _$_SaveInvoicePdf value, $Res Function(_$_SaveInvoicePdf) then) =
      __$$_SaveInvoicePdfCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List dataInvoicePdf});
}

/// @nodoc
class __$$_SaveInvoicePdfCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_SaveInvoicePdf>
    implements _$$_SaveInvoicePdfCopyWith<$Res> {
  __$$_SaveInvoicePdfCopyWithImpl(
      _$_SaveInvoicePdf _value, $Res Function(_$_SaveInvoicePdf) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataInvoicePdf = null,
  }) {
    return _then(_$_SaveInvoicePdf(
      dataInvoicePdf: null == dataInvoicePdf
          ? _value.dataInvoicePdf
          : dataInvoicePdf // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$_SaveInvoicePdf implements _SaveInvoicePdf {
  const _$_SaveInvoicePdf({required this.dataInvoicePdf});

  @override
  final Uint8List dataInvoicePdf;

  @override
  String toString() {
    return 'NewPaymentEvent.saveInvoicePdf(dataInvoicePdf: $dataInvoicePdf)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveInvoicePdf &&
            const DeepCollectionEquality()
                .equals(other.dataInvoicePdf, dataInvoicePdf));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(dataInvoicePdf));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveInvoicePdfCopyWith<_$_SaveInvoicePdf> get copyWith =>
      __$$_SaveInvoicePdfCopyWithImpl<_$_SaveInvoicePdf>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return saveInvoicePdf(dataInvoicePdf);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return saveInvoicePdf?.call(dataInvoicePdf);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (saveInvoicePdf != null) {
      return saveInvoicePdf(dataInvoicePdf);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return saveInvoicePdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return saveInvoicePdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (saveInvoicePdf != null) {
      return saveInvoicePdf(this);
    }
    return orElse();
  }
}

abstract class _SaveInvoicePdf implements NewPaymentEvent {
  const factory _SaveInvoicePdf({required final Uint8List dataInvoicePdf}) =
      _$_SaveInvoicePdf;

  Uint8List get dataInvoicePdf;
  @JsonKey(ignore: true)
  _$$_SaveInvoicePdfCopyWith<_$_SaveInvoicePdf> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatePaymentMethodSelectedCopyWith<$Res> {
  factory _$$_UpdatePaymentMethodSelectedCopyWith(
          _$_UpdatePaymentMethodSelected value,
          $Res Function(_$_UpdatePaymentMethodSelected) then) =
      __$$_UpdatePaymentMethodSelectedCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentMethodValue paymentMethodSelected});
}

/// @nodoc
class __$$_UpdatePaymentMethodSelectedCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_UpdatePaymentMethodSelected>
    implements _$$_UpdatePaymentMethodSelectedCopyWith<$Res> {
  __$$_UpdatePaymentMethodSelectedCopyWithImpl(
      _$_UpdatePaymentMethodSelected _value,
      $Res Function(_$_UpdatePaymentMethodSelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodSelected = null,
  }) {
    return _then(_$_UpdatePaymentMethodSelected(
      paymentMethodSelected: null == paymentMethodSelected
          ? _value.paymentMethodSelected
          : paymentMethodSelected // ignore: cast_nullable_to_non_nullable
              as PaymentMethodValue,
    ));
  }
}

/// @nodoc

class _$_UpdatePaymentMethodSelected implements _UpdatePaymentMethodSelected {
  const _$_UpdatePaymentMethodSelected({required this.paymentMethodSelected});

  @override
  final PaymentMethodValue paymentMethodSelected;

  @override
  String toString() {
    return 'NewPaymentEvent.updatePaymentMethodSelected(paymentMethodSelected: $paymentMethodSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePaymentMethodSelected &&
            (identical(other.paymentMethodSelected, paymentMethodSelected) ||
                other.paymentMethodSelected == paymentMethodSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethodSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePaymentMethodSelectedCopyWith<_$_UpdatePaymentMethodSelected>
      get copyWith => __$$_UpdatePaymentMethodSelectedCopyWithImpl<
          _$_UpdatePaymentMethodSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)
        initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(Uri paymentUrl) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(PaymentMethodValue paymentMethodSelected)
        updatePaymentMethodSelected,
  }) {
    return updatePaymentMethodSelected(paymentMethodSelected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(Uri paymentUrl)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
  }) {
    return updatePaymentMethodSelected?.call(paymentMethodSelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, User user)?
        initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(Uri paymentUrl)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(PaymentMethodValue paymentMethodSelected)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (updatePaymentMethodSelected != null) {
      return updatePaymentMethodSelected(paymentMethodSelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
  }) {
    return updatePaymentMethodSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
  }) {
    return updatePaymentMethodSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    required TResult orElse(),
  }) {
    if (updatePaymentMethodSelected != null) {
      return updatePaymentMethodSelected(this);
    }
    return orElse();
  }
}

abstract class _UpdatePaymentMethodSelected implements NewPaymentEvent {
  const factory _UpdatePaymentMethodSelected(
          {required final PaymentMethodValue paymentMethodSelected}) =
      _$_UpdatePaymentMethodSelected;

  PaymentMethodValue get paymentMethodSelected;
  @JsonKey(ignore: true)
  _$$_UpdatePaymentMethodSelectedCopyWith<_$_UpdatePaymentMethodSelected>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewPaymentState {
  PaymentInfo get paymentInfo => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<CustomerOpenItem> get selectedInvoices =>
      throw _privateConstructorUsedError;
  List<CustomerOpenItem> get selectedCredits =>
      throw _privateConstructorUsedError;
  bool get isFetchingInvoiceInfoPdf => throw _privateConstructorUsedError;
  PaymentInvoiceInfoPdf get paymentInvoiceInfoPdf =>
      throw _privateConstructorUsedError;
  bool get isSavingInvoicePdf => throw _privateConstructorUsedError;
  bool get isFetchingPaymentMethod => throw _privateConstructorUsedError;
  List<PaymentMethodValue> get paymentMethods =>
      throw _privateConstructorUsedError;
  PaymentMethodValue get selectedPaymentMethod =>
      throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPaymentStateCopyWith<NewPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPaymentStateCopyWith<$Res> {
  factory $NewPaymentStateCopyWith(
          NewPaymentState value, $Res Function(NewPaymentState) then) =
      _$NewPaymentStateCopyWithImpl<$Res, NewPaymentState>;
  @useResult
  $Res call(
      {PaymentInfo paymentInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      List<CustomerOpenItem> selectedInvoices,
      List<CustomerOpenItem> selectedCredits,
      bool isFetchingInvoiceInfoPdf,
      PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      bool isSavingInvoicePdf,
      bool isFetchingPaymentMethod,
      List<PaymentMethodValue> paymentMethods,
      PaymentMethodValue selectedPaymentMethod,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      User user});

  $PaymentInfoCopyWith<$Res> get paymentInfo;
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$NewPaymentStateCopyWithImpl<$Res, $Val extends NewPaymentState>
    implements $NewPaymentStateCopyWith<$Res> {
  _$NewPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentInfo = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? selectedInvoices = null,
    Object? selectedCredits = null,
    Object? isFetchingInvoiceInfoPdf = null,
    Object? paymentInvoiceInfoPdf = null,
    Object? isSavingInvoicePdf = null,
    Object? isFetchingPaymentMethod = null,
    Object? paymentMethods = null,
    Object? selectedPaymentMethod = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedInvoices: null == selectedInvoices
          ? _value.selectedInvoices
          : selectedInvoices // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      selectedCredits: null == selectedCredits
          ? _value.selectedCredits
          : selectedCredits // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      isFetchingInvoiceInfoPdf: null == isFetchingInvoiceInfoPdf
          ? _value.isFetchingInvoiceInfoPdf
          : isFetchingInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentInvoiceInfoPdf: null == paymentInvoiceInfoPdf
          ? _value.paymentInvoiceInfoPdf
          : paymentInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as PaymentInvoiceInfoPdf,
      isSavingInvoicePdf: null == isSavingInvoicePdf
          ? _value.isSavingInvoicePdf
          : isSavingInvoicePdf // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingPaymentMethod: null == isFetchingPaymentMethod
          ? _value.isFetchingPaymentMethod
          : isFetchingPaymentMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodValue>,
      selectedPaymentMethod: null == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodValue,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res> get paymentInfo {
    return $PaymentInfoCopyWith<$Res>(_value.paymentInfo, (value) {
      return _then(_value.copyWith(paymentInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf {
    return $PaymentInvoiceInfoPdfCopyWith<$Res>(_value.paymentInvoiceInfoPdf,
        (value) {
      return _then(_value.copyWith(paymentInvoiceInfoPdf: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NewPaymentStateCopyWith<$Res>
    implements $NewPaymentStateCopyWith<$Res> {
  factory _$$_NewPaymentStateCopyWith(
          _$_NewPaymentState value, $Res Function(_$_NewPaymentState) then) =
      __$$_NewPaymentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentInfo paymentInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      List<CustomerOpenItem> selectedInvoices,
      List<CustomerOpenItem> selectedCredits,
      bool isFetchingInvoiceInfoPdf,
      PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      bool isSavingInvoicePdf,
      bool isFetchingPaymentMethod,
      List<PaymentMethodValue> paymentMethods,
      PaymentMethodValue selectedPaymentMethod,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      User user});

  @override
  $PaymentInfoCopyWith<$Res> get paymentInfo;
  @override
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_NewPaymentStateCopyWithImpl<$Res>
    extends _$NewPaymentStateCopyWithImpl<$Res, _$_NewPaymentState>
    implements _$$_NewPaymentStateCopyWith<$Res> {
  __$$_NewPaymentStateCopyWithImpl(
      _$_NewPaymentState _value, $Res Function(_$_NewPaymentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentInfo = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? selectedInvoices = null,
    Object? selectedCredits = null,
    Object? isFetchingInvoiceInfoPdf = null,
    Object? paymentInvoiceInfoPdf = null,
    Object? isSavingInvoicePdf = null,
    Object? isFetchingPaymentMethod = null,
    Object? paymentMethods = null,
    Object? selectedPaymentMethod = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? user = null,
  }) {
    return _then(_$_NewPaymentState(
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedInvoices: null == selectedInvoices
          ? _value._selectedInvoices
          : selectedInvoices // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      selectedCredits: null == selectedCredits
          ? _value._selectedCredits
          : selectedCredits // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      isFetchingInvoiceInfoPdf: null == isFetchingInvoiceInfoPdf
          ? _value.isFetchingInvoiceInfoPdf
          : isFetchingInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentInvoiceInfoPdf: null == paymentInvoiceInfoPdf
          ? _value.paymentInvoiceInfoPdf
          : paymentInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as PaymentInvoiceInfoPdf,
      isSavingInvoicePdf: null == isSavingInvoicePdf
          ? _value.isSavingInvoicePdf
          : isSavingInvoicePdf // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingPaymentMethod: null == isFetchingPaymentMethod
          ? _value.isFetchingPaymentMethod
          : isFetchingPaymentMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethods: null == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodValue>,
      selectedPaymentMethod: null == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodValue,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_NewPaymentState extends _NewPaymentState {
  const _$_NewPaymentState(
      {required this.paymentInfo,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required final List<CustomerOpenItem> selectedInvoices,
      required final List<CustomerOpenItem> selectedCredits,
      required this.isFetchingInvoiceInfoPdf,
      required this.paymentInvoiceInfoPdf,
      required this.isSavingInvoicePdf,
      required this.isFetchingPaymentMethod,
      required final List<PaymentMethodValue> paymentMethods,
      required this.selectedPaymentMethod,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.user})
      : _selectedInvoices = selectedInvoices,
        _selectedCredits = selectedCredits,
        _paymentMethods = paymentMethods,
        super._();

  @override
  final PaymentInfo paymentInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;
  final List<CustomerOpenItem> _selectedInvoices;
  @override
  List<CustomerOpenItem> get selectedInvoices {
    if (_selectedInvoices is EqualUnmodifiableListView)
      return _selectedInvoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedInvoices);
  }

  final List<CustomerOpenItem> _selectedCredits;
  @override
  List<CustomerOpenItem> get selectedCredits {
    if (_selectedCredits is EqualUnmodifiableListView) return _selectedCredits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCredits);
  }

  @override
  final bool isFetchingInvoiceInfoPdf;
  @override
  final PaymentInvoiceInfoPdf paymentInvoiceInfoPdf;
  @override
  final bool isSavingInvoicePdf;
  @override
  final bool isFetchingPaymentMethod;
  final List<PaymentMethodValue> _paymentMethods;
  @override
  List<PaymentMethodValue> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
  }

  @override
  final PaymentMethodValue selectedPaymentMethod;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'NewPaymentState(paymentInfo: $paymentInfo, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, selectedInvoices: $selectedInvoices, selectedCredits: $selectedCredits, isFetchingInvoiceInfoPdf: $isFetchingInvoiceInfoPdf, paymentInvoiceInfoPdf: $paymentInvoiceInfoPdf, isSavingInvoicePdf: $isSavingInvoicePdf, isFetchingPaymentMethod: $isFetchingPaymentMethod, paymentMethods: $paymentMethods, selectedPaymentMethod: $selectedPaymentMethod, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewPaymentState &&
            (identical(other.paymentInfo, paymentInfo) ||
                other.paymentInfo == paymentInfo) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._selectedInvoices, _selectedInvoices) &&
            const DeepCollectionEquality()
                .equals(other._selectedCredits, _selectedCredits) &&
            (identical(
                    other.isFetchingInvoiceInfoPdf, isFetchingInvoiceInfoPdf) ||
                other.isFetchingInvoiceInfoPdf == isFetchingInvoiceInfoPdf) &&
            (identical(other.paymentInvoiceInfoPdf, paymentInvoiceInfoPdf) ||
                other.paymentInvoiceInfoPdf == paymentInvoiceInfoPdf) &&
            (identical(other.isSavingInvoicePdf, isSavingInvoicePdf) ||
                other.isSavingInvoicePdf == isSavingInvoicePdf) &&
            (identical(
                    other.isFetchingPaymentMethod, isFetchingPaymentMethod) ||
                other.isFetchingPaymentMethod == isFetchingPaymentMethod) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            (identical(other.selectedPaymentMethod, selectedPaymentMethod) ||
                other.selectedPaymentMethod == selectedPaymentMethod) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentInfo,
      failureOrSuccessOption,
      isLoading,
      const DeepCollectionEquality().hash(_selectedInvoices),
      const DeepCollectionEquality().hash(_selectedCredits),
      isFetchingInvoiceInfoPdf,
      paymentInvoiceInfoPdf,
      isSavingInvoicePdf,
      isFetchingPaymentMethod,
      const DeepCollectionEquality().hash(_paymentMethods),
      selectedPaymentMethod,
      salesOrganisation,
      customerCodeInfo,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewPaymentStateCopyWith<_$_NewPaymentState> get copyWith =>
      __$$_NewPaymentStateCopyWithImpl<_$_NewPaymentState>(this, _$identity);
}

abstract class _NewPaymentState extends NewPaymentState {
  const factory _NewPaymentState(
      {required final PaymentInfo paymentInfo,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading,
      required final List<CustomerOpenItem> selectedInvoices,
      required final List<CustomerOpenItem> selectedCredits,
      required final bool isFetchingInvoiceInfoPdf,
      required final PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      required final bool isSavingInvoicePdf,
      required final bool isFetchingPaymentMethod,
      required final List<PaymentMethodValue> paymentMethods,
      required final PaymentMethodValue selectedPaymentMethod,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user}) = _$_NewPaymentState;
  const _NewPaymentState._() : super._();

  @override
  PaymentInfo get paymentInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  List<CustomerOpenItem> get selectedInvoices;
  @override
  List<CustomerOpenItem> get selectedCredits;
  @override
  bool get isFetchingInvoiceInfoPdf;
  @override
  PaymentInvoiceInfoPdf get paymentInvoiceInfoPdf;
  @override
  bool get isSavingInvoicePdf;
  @override
  bool get isFetchingPaymentMethod;
  @override
  List<PaymentMethodValue> get paymentMethods;
  @override
  PaymentMethodValue get selectedPaymentMethod;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_NewPaymentStateCopyWith<_$_NewPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
