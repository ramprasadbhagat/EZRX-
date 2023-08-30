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
    required TResult Function() initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)
        pay,
    required TResult Function(
            SalesOrganisation salesOrganisation, Uri paymentUrl)
        updatePaymentGateway,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult? Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
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
}

/// @nodoc
class __$$_initializedCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_initialized>
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
    return 'NewPaymentEvent.initialized()';
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
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)
        pay,
    required TResult Function(
            SalesOrganisation salesOrganisation, Uri paymentUrl)
        updatePaymentGateway,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult? Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
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
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
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
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements NewPaymentEvent {
  const factory _initialized() = _$_initialized;
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
    required TResult Function() initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)
        pay,
    required TResult Function(
            SalesOrganisation salesOrganisation, Uri paymentUrl)
        updatePaymentGateway,
  }) {
    return updateAllInvoices(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult? Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
  }) {
    return updateAllInvoices?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
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
    required TResult Function() initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)
        pay,
    required TResult Function(
            SalesOrganisation salesOrganisation, Uri paymentUrl)
        updatePaymentGateway,
  }) {
    return toggleInvoice(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult? Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
  }) {
    return toggleInvoice?.call(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
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
    required TResult Function() initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)
        pay,
    required TResult Function(
            SalesOrganisation salesOrganisation, Uri paymentUrl)
        updatePaymentGateway,
  }) {
    return updateAllCredits(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult? Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
  }) {
    return updateAllCredits?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
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
    required TResult Function() initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)
        pay,
    required TResult Function(
            SalesOrganisation salesOrganisation, Uri paymentUrl)
        updatePaymentGateway,
  }) {
    return toggleCredit(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult? Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
  }) {
    return toggleCredit?.call(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
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
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      String paymentMethod,
      User user});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_PayCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$_Pay>
    implements _$$_PayCopyWith<$Res> {
  __$$_PayCopyWithImpl(_$_Pay _value, $Res Function(_$_Pay) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? paymentMethod = null,
    Object? user = null,
  }) {
    return _then(_$_Pay(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_Pay implements _Pay {
  const _$_Pay(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.paymentMethod,
      required this.user});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final String paymentMethod;
  @override
  final User user;

  @override
  String toString() {
    return 'NewPaymentEvent.pay(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, paymentMethod: $paymentMethod, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pay &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganisation, customerCodeInfo, paymentMethod, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PayCopyWith<_$_Pay> get copyWith =>
      __$$_PayCopyWithImpl<_$_Pay>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)
        pay,
    required TResult Function(
            SalesOrganisation salesOrganisation, Uri paymentUrl)
        updatePaymentGateway,
  }) {
    return pay(salesOrganisation, customerCodeInfo, paymentMethod, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult? Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
  }) {
    return pay?.call(salesOrganisation, customerCodeInfo, paymentMethod, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay(salesOrganisation, customerCodeInfo, paymentMethod, user);
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
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay(this);
    }
    return orElse();
  }
}

abstract class _Pay implements NewPaymentEvent {
  const factory _Pay(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final String paymentMethod,
      required final User user}) = _$_Pay;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  String get paymentMethod;
  User get user;
  @JsonKey(ignore: true)
  _$$_PayCopyWith<_$_Pay> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatePaymentGatewayCopyWith<$Res> {
  factory _$$_UpdatePaymentGatewayCopyWith(_$_UpdatePaymentGateway value,
          $Res Function(_$_UpdatePaymentGateway) then) =
      __$$_UpdatePaymentGatewayCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation, Uri paymentUrl});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
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
    Object? salesOrganisation = null,
    Object? paymentUrl = null,
  }) {
    return _then(_$_UpdatePaymentGateway(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      paymentUrl: null == paymentUrl
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$_UpdatePaymentGateway implements _UpdatePaymentGateway {
  const _$_UpdatePaymentGateway(
      {required this.salesOrganisation, required this.paymentUrl});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final Uri paymentUrl;

  @override
  String toString() {
    return 'NewPaymentEvent.updatePaymentGateway(salesOrganisation: $salesOrganisation, paymentUrl: $paymentUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePaymentGateway &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation, paymentUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePaymentGatewayCopyWith<_$_UpdatePaymentGateway> get copyWith =>
      __$$_UpdatePaymentGatewayCopyWithImpl<_$_UpdatePaymentGateway>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)
        pay,
    required TResult Function(
            SalesOrganisation salesOrganisation, Uri paymentUrl)
        updatePaymentGateway,
  }) {
    return updatePaymentGateway(salesOrganisation, paymentUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult? Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
  }) {
    return updatePaymentGateway?.call(salesOrganisation, paymentUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo, String paymentMethod, User user)?
        pay,
    TResult Function(SalesOrganisation salesOrganisation, Uri paymentUrl)?
        updatePaymentGateway,
    required TResult orElse(),
  }) {
    if (updatePaymentGateway != null) {
      return updatePaymentGateway(salesOrganisation, paymentUrl);
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
    required TResult orElse(),
  }) {
    if (updatePaymentGateway != null) {
      return updatePaymentGateway(this);
    }
    return orElse();
  }
}

abstract class _UpdatePaymentGateway implements NewPaymentEvent {
  const factory _UpdatePaymentGateway(
      {required final SalesOrganisation salesOrganisation,
      required final Uri paymentUrl}) = _$_UpdatePaymentGateway;

  SalesOrganisation get salesOrganisation;
  Uri get paymentUrl;
  @JsonKey(ignore: true)
  _$$_UpdatePaymentGatewayCopyWith<_$_UpdatePaymentGateway> get copyWith =>
      throw _privateConstructorUsedError;
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
      List<CustomerOpenItem> selectedCredits});

  $PaymentInfoCopyWith<$Res> get paymentInfo;
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res> get paymentInfo {
    return $PaymentInfoCopyWith<$Res>(_value.paymentInfo, (value) {
      return _then(_value.copyWith(paymentInfo: value) as $Val);
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
      List<CustomerOpenItem> selectedCredits});

  @override
  $PaymentInfoCopyWith<$Res> get paymentInfo;
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
      required final List<CustomerOpenItem> selectedCredits})
      : _selectedInvoices = selectedInvoices,
        _selectedCredits = selectedCredits,
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
  String toString() {
    return 'NewPaymentState(paymentInfo: $paymentInfo, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, selectedInvoices: $selectedInvoices, selectedCredits: $selectedCredits)';
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
                .equals(other._selectedCredits, _selectedCredits));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentInfo,
      failureOrSuccessOption,
      isLoading,
      const DeepCollectionEquality().hash(_selectedInvoices),
      const DeepCollectionEquality().hash(_selectedCredits));

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
      required final List<CustomerOpenItem>
          selectedCredits}) = _$_NewPaymentState;
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
  @JsonKey(ignore: true)
  _$$_NewPaymentStateCopyWith<_$_NewPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
