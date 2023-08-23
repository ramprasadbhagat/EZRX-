// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_request_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddRequestParams {
  String get orderSource => throw _privateConstructorUsedError;
  String get returnReference => throw _privateConstructorUsedError;
  String get specialInstruction => throw _privateConstructorUsedError;
  Username get userName => throw _privateConstructorUsedError;
  String get soldTo => throw _privateConstructorUsedError;
  List<InvoiceDetails> get invoiceDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddRequestParamsCopyWith<AddRequestParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddRequestParamsCopyWith<$Res> {
  factory $AddRequestParamsCopyWith(
          AddRequestParams value, $Res Function(AddRequestParams) then) =
      _$AddRequestParamsCopyWithImpl<$Res, AddRequestParams>;
  @useResult
  $Res call(
      {String orderSource,
      String returnReference,
      String specialInstruction,
      Username userName,
      String soldTo,
      List<InvoiceDetails> invoiceDetails});
}

/// @nodoc
class _$AddRequestParamsCopyWithImpl<$Res, $Val extends AddRequestParams>
    implements $AddRequestParamsCopyWith<$Res> {
  _$AddRequestParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderSource = null,
    Object? returnReference = null,
    Object? specialInstruction = null,
    Object? userName = null,
    Object? soldTo = null,
    Object? invoiceDetails = null,
  }) {
    return _then(_value.copyWith(
      orderSource: null == orderSource
          ? _value.orderSource
          : orderSource // ignore: cast_nullable_to_non_nullable
              as String,
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDetails: null == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddRequestParamsCopyWith<$Res>
    implements $AddRequestParamsCopyWith<$Res> {
  factory _$$_AddRequestParamsCopyWith(
          _$_AddRequestParams value, $Res Function(_$_AddRequestParams) then) =
      __$$_AddRequestParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderSource,
      String returnReference,
      String specialInstruction,
      Username userName,
      String soldTo,
      List<InvoiceDetails> invoiceDetails});
}

/// @nodoc
class __$$_AddRequestParamsCopyWithImpl<$Res>
    extends _$AddRequestParamsCopyWithImpl<$Res, _$_AddRequestParams>
    implements _$$_AddRequestParamsCopyWith<$Res> {
  __$$_AddRequestParamsCopyWithImpl(
      _$_AddRequestParams _value, $Res Function(_$_AddRequestParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderSource = null,
    Object? returnReference = null,
    Object? specialInstruction = null,
    Object? userName = null,
    Object? soldTo = null,
    Object? invoiceDetails = null,
  }) {
    return _then(_$_AddRequestParams(
      orderSource: null == orderSource
          ? _value.orderSource
          : orderSource // ignore: cast_nullable_to_non_nullable
              as String,
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstruction: null == specialInstruction
          ? _value.specialInstruction
          : specialInstruction // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDetails: null == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
    ));
  }
}

/// @nodoc

class _$_AddRequestParams extends _AddRequestParams {
  const _$_AddRequestParams(
      {required this.orderSource,
      required this.returnReference,
      required this.specialInstruction,
      required this.userName,
      required this.soldTo,
      required final List<InvoiceDetails> invoiceDetails})
      : _invoiceDetails = invoiceDetails,
        super._();

  @override
  final String orderSource;
  @override
  final String returnReference;
  @override
  final String specialInstruction;
  @override
  final Username userName;
  @override
  final String soldTo;
  final List<InvoiceDetails> _invoiceDetails;
  @override
  List<InvoiceDetails> get invoiceDetails {
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceDetails);
  }

  @override
  String toString() {
    return 'AddRequestParams(orderSource: $orderSource, returnReference: $returnReference, specialInstruction: $specialInstruction, userName: $userName, soldTo: $soldTo, invoiceDetails: $invoiceDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddRequestParams &&
            (identical(other.orderSource, orderSource) ||
                other.orderSource == orderSource) &&
            (identical(other.returnReference, returnReference) ||
                other.returnReference == returnReference) &&
            (identical(other.specialInstruction, specialInstruction) ||
                other.specialInstruction == specialInstruction) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderSource,
      returnReference,
      specialInstruction,
      userName,
      soldTo,
      const DeepCollectionEquality().hash(_invoiceDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddRequestParamsCopyWith<_$_AddRequestParams> get copyWith =>
      __$$_AddRequestParamsCopyWithImpl<_$_AddRequestParams>(this, _$identity);
}

abstract class _AddRequestParams extends AddRequestParams {
  const factory _AddRequestParams(
          {required final String orderSource,
          required final String returnReference,
          required final String specialInstruction,
          required final Username userName,
          required final String soldTo,
          required final List<InvoiceDetails> invoiceDetails}) =
      _$_AddRequestParams;
  const _AddRequestParams._() : super._();

  @override
  String get orderSource;
  @override
  String get returnReference;
  @override
  String get specialInstruction;
  @override
  Username get userName;
  @override
  String get soldTo;
  @override
  List<InvoiceDetails> get invoiceDetails;
  @override
  @JsonKey(ignore: true)
  _$$_AddRequestParamsCopyWith<_$_AddRequestParams> get copyWith =>
      throw _privateConstructorUsedError;
}
