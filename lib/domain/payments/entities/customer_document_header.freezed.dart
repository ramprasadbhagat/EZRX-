// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_document_header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerDocumentHeader {
  List<CreditAndInvoiceItem> get invoices => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerDocumentHeaderCopyWith<CustomerDocumentHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDocumentHeaderCopyWith<$Res> {
  factory $CustomerDocumentHeaderCopyWith(CustomerDocumentHeader value,
          $Res Function(CustomerDocumentHeader) then) =
      _$CustomerDocumentHeaderCopyWithImpl<$Res, CustomerDocumentHeader>;
  @useResult
  $Res call({List<CreditAndInvoiceItem> invoices, int totalCount});
}

/// @nodoc
class _$CustomerDocumentHeaderCopyWithImpl<$Res,
        $Val extends CustomerDocumentHeader>
    implements $CustomerDocumentHeaderCopyWith<$Res> {
  _$CustomerDocumentHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoices = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      invoices: null == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItem>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerDocumentHeaderCopyWith<$Res>
    implements $CustomerDocumentHeaderCopyWith<$Res> {
  factory _$$_CustomerDocumentHeaderCopyWith(_$_CustomerDocumentHeader value,
          $Res Function(_$_CustomerDocumentHeader) then) =
      __$$_CustomerDocumentHeaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CreditAndInvoiceItem> invoices, int totalCount});
}

/// @nodoc
class __$$_CustomerDocumentHeaderCopyWithImpl<$Res>
    extends _$CustomerDocumentHeaderCopyWithImpl<$Res,
        _$_CustomerDocumentHeader>
    implements _$$_CustomerDocumentHeaderCopyWith<$Res> {
  __$$_CustomerDocumentHeaderCopyWithImpl(_$_CustomerDocumentHeader _value,
      $Res Function(_$_CustomerDocumentHeader) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoices = null,
    Object? totalCount = null,
  }) {
    return _then(_$_CustomerDocumentHeader(
      invoices: null == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<CreditAndInvoiceItem>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CustomerDocumentHeader extends _CustomerDocumentHeader {
  _$_CustomerDocumentHeader(
      {required final List<CreditAndInvoiceItem> invoices,
      required this.totalCount})
      : _invoices = invoices,
        super._();

  final List<CreditAndInvoiceItem> _invoices;
  @override
  List<CreditAndInvoiceItem> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  @override
  final int totalCount;

  @override
  String toString() {
    return 'CustomerDocumentHeader(invoices: $invoices, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerDocumentHeader &&
            const DeepCollectionEquality().equals(other._invoices, _invoices) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_invoices), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerDocumentHeaderCopyWith<_$_CustomerDocumentHeader> get copyWith =>
      __$$_CustomerDocumentHeaderCopyWithImpl<_$_CustomerDocumentHeader>(
          this, _$identity);
}

abstract class _CustomerDocumentHeader extends CustomerDocumentHeader {
  factory _CustomerDocumentHeader(
      {required final List<CreditAndInvoiceItem> invoices,
      required final int totalCount}) = _$_CustomerDocumentHeader;
  _CustomerDocumentHeader._() : super._();

  @override
  List<CreditAndInvoiceItem> get invoices;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerDocumentHeaderCopyWith<_$_CustomerDocumentHeader> get copyWith =>
      throw _privateConstructorUsedError;
}
