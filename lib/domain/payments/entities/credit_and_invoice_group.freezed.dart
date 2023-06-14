// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_and_invoice_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreditAndInvoiceGroup {
  DateTimeStringValue get dueDate => throw _privateConstructorUsedError;
  List<CreditAndInvoiceItem> get invoiceItems =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditAndInvoiceGroupCopyWith<CreditAndInvoiceGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditAndInvoiceGroupCopyWith<$Res> {
  factory $CreditAndInvoiceGroupCopyWith(CreditAndInvoiceGroup value,
          $Res Function(CreditAndInvoiceGroup) then) =
      _$CreditAndInvoiceGroupCopyWithImpl<$Res, CreditAndInvoiceGroup>;
  @useResult
  $Res call(
      {DateTimeStringValue dueDate, List<CreditAndInvoiceItem> invoiceItems});
}

/// @nodoc
class _$CreditAndInvoiceGroupCopyWithImpl<$Res,
        $Val extends CreditAndInvoiceGroup>
    implements $CreditAndInvoiceGroupCopyWith<$Res> {
  _$CreditAndInvoiceGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDate = null,
    Object? invoiceItems = null,
  }) {
    return _then(_value.copyWith(
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      invoiceItems: null == invoiceItems
          ? _value.invoiceItems
          : invoiceItems // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreditAndInvoiceGroupCopyWith<$Res>
    implements $CreditAndInvoiceGroupCopyWith<$Res> {
  factory _$$_CreditAndInvoiceGroupCopyWith(_$_CreditAndInvoiceGroup value,
          $Res Function(_$_CreditAndInvoiceGroup) then) =
      __$$_CreditAndInvoiceGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue dueDate, List<CreditAndInvoiceItem> invoiceItems});
}

/// @nodoc
class __$$_CreditAndInvoiceGroupCopyWithImpl<$Res>
    extends _$CreditAndInvoiceGroupCopyWithImpl<$Res, _$_CreditAndInvoiceGroup>
    implements _$$_CreditAndInvoiceGroupCopyWith<$Res> {
  __$$_CreditAndInvoiceGroupCopyWithImpl(_$_CreditAndInvoiceGroup _value,
      $Res Function(_$_CreditAndInvoiceGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDate = null,
    Object? invoiceItems = null,
  }) {
    return _then(_$_CreditAndInvoiceGroup(
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      invoiceItems: null == invoiceItems
          ? _value._invoiceItems
          : invoiceItems // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItem>,
    ));
  }
}

/// @nodoc

class _$_CreditAndInvoiceGroup implements _CreditAndInvoiceGroup {
  _$_CreditAndInvoiceGroup(
      {required this.dueDate,
      required final List<CreditAndInvoiceItem> invoiceItems})
      : _invoiceItems = invoiceItems;

  @override
  final DateTimeStringValue dueDate;
  final List<CreditAndInvoiceItem> _invoiceItems;
  @override
  List<CreditAndInvoiceItem> get invoiceItems {
    if (_invoiceItems is EqualUnmodifiableListView) return _invoiceItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceItems);
  }

  @override
  String toString() {
    return 'CreditAndInvoiceGroup(dueDate: $dueDate, invoiceItems: $invoiceItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditAndInvoiceGroup &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality()
                .equals(other._invoiceItems, _invoiceItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, dueDate, const DeepCollectionEquality().hash(_invoiceItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditAndInvoiceGroupCopyWith<_$_CreditAndInvoiceGroup> get copyWith =>
      __$$_CreditAndInvoiceGroupCopyWithImpl<_$_CreditAndInvoiceGroup>(
          this, _$identity);
}

abstract class _CreditAndInvoiceGroup implements CreditAndInvoiceGroup {
  factory _CreditAndInvoiceGroup(
          {required final DateTimeStringValue dueDate,
          required final List<CreditAndInvoiceItem> invoiceItems}) =
      _$_CreditAndInvoiceGroup;

  @override
  DateTimeStringValue get dueDate;
  @override
  List<CreditAndInvoiceItem> get invoiceItems;
  @override
  @JsonKey(ignore: true)
  _$$_CreditAndInvoiceGroupCopyWith<_$_CreditAndInvoiceGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
