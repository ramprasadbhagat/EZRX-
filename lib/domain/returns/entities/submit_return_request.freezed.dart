// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_return_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitReturnsRequest {
  String get customerCode => throw _privateConstructorUsedError;
  Username get username => throw _privateConstructorUsedError;
  String get orderSource => throw _privateConstructorUsedError;
  bool get subscribeStatusChange => throw _privateConstructorUsedError;
  String get specialInstruction => throw _privateConstructorUsedError;
  String get purchaseNumberC => throw _privateConstructorUsedError;
  List<InvoiceDetails> get invoiceDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitReturnsRequestCopyWith<SubmitReturnsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitReturnsRequestCopyWith<$Res> {
  factory $SubmitReturnsRequestCopyWith(SubmitReturnsRequest value,
          $Res Function(SubmitReturnsRequest) then) =
      _$SubmitReturnsRequestCopyWithImpl<$Res, SubmitReturnsRequest>;
  @useResult
  $Res call(
      {String customerCode,
      Username username,
      String orderSource,
      bool subscribeStatusChange,
      String specialInstruction,
      String purchaseNumberC,
      List<InvoiceDetails> invoiceDetails});
}

/// @nodoc
class _$SubmitReturnsRequestCopyWithImpl<$Res,
        $Val extends SubmitReturnsRequest>
    implements $SubmitReturnsRequestCopyWith<$Res> {
  _$SubmitReturnsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? username = null,
    Object? orderSource = null,
    Object? subscribeStatusChange = null,
    Object? specialInstruction = null,
    Object? purchaseNumberC = null,
    Object? invoiceDetails = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      orderSource: null == orderSource
          ? _value.orderSource
          : orderSource // ignore: cast_nullable_to_non_nullable
              as String,
      subscribeStatusChange: null == subscribeStatusChange
          ? _value.subscribeStatusChange
          : subscribeStatusChange // ignore: cast_nullable_to_non_nullable
              as bool,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseNumberC: null == purchaseNumberC
          ? _value.purchaseNumberC
          : purchaseNumberC // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDetails: null == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitReturnsRequestCopyWith<$Res>
    implements $SubmitReturnsRequestCopyWith<$Res> {
  factory _$$_SubmitReturnsRequestCopyWith(_$_SubmitReturnsRequest value,
          $Res Function(_$_SubmitReturnsRequest) then) =
      __$$_SubmitReturnsRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerCode,
      Username username,
      String orderSource,
      bool subscribeStatusChange,
      String specialInstruction,
      String purchaseNumberC,
      List<InvoiceDetails> invoiceDetails});
}

/// @nodoc
class __$$_SubmitReturnsRequestCopyWithImpl<$Res>
    extends _$SubmitReturnsRequestCopyWithImpl<$Res, _$_SubmitReturnsRequest>
    implements _$$_SubmitReturnsRequestCopyWith<$Res> {
  __$$_SubmitReturnsRequestCopyWithImpl(_$_SubmitReturnsRequest _value,
      $Res Function(_$_SubmitReturnsRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? username = null,
    Object? orderSource = null,
    Object? subscribeStatusChange = null,
    Object? specialInstruction = null,
    Object? purchaseNumberC = null,
    Object? invoiceDetails = null,
  }) {
    return _then(_$_SubmitReturnsRequest(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      orderSource: null == orderSource
          ? _value.orderSource
          : orderSource // ignore: cast_nullable_to_non_nullable
              as String,
      subscribeStatusChange: null == subscribeStatusChange
          ? _value.subscribeStatusChange
          : subscribeStatusChange // ignore: cast_nullable_to_non_nullable
              as bool,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseNumberC: null == purchaseNumberC
          ? _value.purchaseNumberC
          : purchaseNumberC // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDetails: null == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
    ));
  }
}

/// @nodoc

class _$_SubmitReturnsRequest extends _SubmitReturnsRequest {
  const _$_SubmitReturnsRequest(
      {required this.customerCode,
      required this.username,
      required this.orderSource,
      required this.subscribeStatusChange,
      required this.specialInstruction,
      required this.purchaseNumberC,
      required final List<InvoiceDetails> invoiceDetails})
      : _invoiceDetails = invoiceDetails,
        super._();

  @override
  final String customerCode;
  @override
  final Username username;
  @override
  final String orderSource;
  @override
  final bool subscribeStatusChange;
  @override
  final String specialInstruction;
  @override
  final String purchaseNumberC;
  final List<InvoiceDetails> _invoiceDetails;
  @override
  List<InvoiceDetails> get invoiceDetails {
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceDetails);
  }

  @override
  String toString() {
    return 'SubmitReturnsRequest(customerCode: $customerCode, username: $username, orderSource: $orderSource, subscribeStatusChange: $subscribeStatusChange, specialInstruction: $specialInstruction, purchaseNumberC: $purchaseNumberC, invoiceDetails: $invoiceDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitReturnsRequest &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.orderSource, orderSource) ||
                other.orderSource == orderSource) &&
            (identical(other.subscribeStatusChange, subscribeStatusChange) ||
                other.subscribeStatusChange == subscribeStatusChange) &&
            (identical(other.specialInstruction, specialInstruction) ||
                other.specialInstruction == specialInstruction) &&
            (identical(other.purchaseNumberC, purchaseNumberC) ||
                other.purchaseNumberC == purchaseNumberC) &&
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerCode,
      username,
      orderSource,
      subscribeStatusChange,
      specialInstruction,
      purchaseNumberC,
      const DeepCollectionEquality().hash(_invoiceDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitReturnsRequestCopyWith<_$_SubmitReturnsRequest> get copyWith =>
      __$$_SubmitReturnsRequestCopyWithImpl<_$_SubmitReturnsRequest>(
          this, _$identity);
}

abstract class _SubmitReturnsRequest extends SubmitReturnsRequest {
  const factory _SubmitReturnsRequest(
          {required final String customerCode,
          required final Username username,
          required final String orderSource,
          required final bool subscribeStatusChange,
          required final String specialInstruction,
          required final String purchaseNumberC,
          required final List<InvoiceDetails> invoiceDetails}) =
      _$_SubmitReturnsRequest;
  const _SubmitReturnsRequest._() : super._();

  @override
  String get customerCode;
  @override
  Username get username;
  @override
  String get orderSource;
  @override
  bool get subscribeStatusChange;
  @override
  String get specialInstruction;
  @override
  String get purchaseNumberC;
  @override
  List<InvoiceDetails> get invoiceDetails;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitReturnsRequestCopyWith<_$_SubmitReturnsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
