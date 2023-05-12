// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_return_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubmitReturnRequestDto _$SubmitReturnRequestDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitReturnRequestDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitReturnRequestDto {
  @JsonKey(name: 'soldToCustomer', defaultValue: '')
  String get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', defaultValue: '')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderSource', defaultValue: '')
  String get orderSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
  bool get subscribeStatusChange => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialInstruction')
  String get specialInstruction => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchaseNumberC', defaultValue: '')
  String get purchaseNumberC => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailsDto>[])
  List<InvoiceDetailsDto> get invoiceDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitReturnRequestDtoCopyWith<SubmitReturnRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitReturnRequestDtoCopyWith<$Res> {
  factory $SubmitReturnRequestDtoCopyWith(SubmitReturnRequestDto value,
          $Res Function(SubmitReturnRequestDto) then) =
      _$SubmitReturnRequestDtoCopyWithImpl<$Res, SubmitReturnRequestDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'soldToCustomer', defaultValue: '')
          String customerCode,
      @JsonKey(name: 'username', defaultValue: '')
          String username,
      @JsonKey(name: 'orderSource', defaultValue: '')
          String orderSource,
      @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
          bool subscribeStatusChange,
      @JsonKey(name: 'specialInstruction')
          String specialInstruction,
      @JsonKey(name: 'purchaseNumberC', defaultValue: '')
          String purchaseNumberC,
      @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailsDto>[])
          List<InvoiceDetailsDto> invoiceDetails});
}

/// @nodoc
class _$SubmitReturnRequestDtoCopyWithImpl<$Res,
        $Val extends SubmitReturnRequestDto>
    implements $SubmitReturnRequestDtoCopyWith<$Res> {
  _$SubmitReturnRequestDtoCopyWithImpl(this._value, this._then);

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
              as String,
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
              as List<InvoiceDetailsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitReturnRequestDtoCopyWith<$Res>
    implements $SubmitReturnRequestDtoCopyWith<$Res> {
  factory _$$_SubmitReturnRequestDtoCopyWith(_$_SubmitReturnRequestDto value,
          $Res Function(_$_SubmitReturnRequestDto) then) =
      __$$_SubmitReturnRequestDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'soldToCustomer', defaultValue: '')
          String customerCode,
      @JsonKey(name: 'username', defaultValue: '')
          String username,
      @JsonKey(name: 'orderSource', defaultValue: '')
          String orderSource,
      @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
          bool subscribeStatusChange,
      @JsonKey(name: 'specialInstruction')
          String specialInstruction,
      @JsonKey(name: 'purchaseNumberC', defaultValue: '')
          String purchaseNumberC,
      @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailsDto>[])
          List<InvoiceDetailsDto> invoiceDetails});
}

/// @nodoc
class __$$_SubmitReturnRequestDtoCopyWithImpl<$Res>
    extends _$SubmitReturnRequestDtoCopyWithImpl<$Res,
        _$_SubmitReturnRequestDto>
    implements _$$_SubmitReturnRequestDtoCopyWith<$Res> {
  __$$_SubmitReturnRequestDtoCopyWithImpl(_$_SubmitReturnRequestDto _value,
      $Res Function(_$_SubmitReturnRequestDto) _then)
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
    return _then(_$_SubmitReturnRequestDto(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
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
              as List<InvoiceDetailsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubmitReturnRequestDto extends _SubmitReturnRequestDto {
  const _$_SubmitReturnRequestDto(
      {@JsonKey(name: 'soldToCustomer', defaultValue: '')
          required this.customerCode,
      @JsonKey(name: 'username', defaultValue: '')
          required this.username,
      @JsonKey(name: 'orderSource', defaultValue: '')
          required this.orderSource,
      @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
          required this.subscribeStatusChange,
      @JsonKey(name: 'specialInstruction')
          required this.specialInstruction,
      @JsonKey(name: 'purchaseNumberC', defaultValue: '')
          required this.purchaseNumberC,
      @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailsDto>[])
          required final List<InvoiceDetailsDto> invoiceDetails})
      : _invoiceDetails = invoiceDetails,
        super._();

  factory _$_SubmitReturnRequestDto.fromJson(Map<String, dynamic> json) =>
      _$$_SubmitReturnRequestDtoFromJson(json);

  @override
  @JsonKey(name: 'soldToCustomer', defaultValue: '')
  final String customerCode;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  final String username;
  @override
  @JsonKey(name: 'orderSource', defaultValue: '')
  final String orderSource;
  @override
  @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
  final bool subscribeStatusChange;
  @override
  @JsonKey(name: 'specialInstruction')
  final String specialInstruction;
  @override
  @JsonKey(name: 'purchaseNumberC', defaultValue: '')
  final String purchaseNumberC;
  final List<InvoiceDetailsDto> _invoiceDetails;
  @override
  @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailsDto>[])
  List<InvoiceDetailsDto> get invoiceDetails {
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceDetails);
  }

  @override
  String toString() {
    return 'SubmitReturnRequestDto(customerCode: $customerCode, username: $username, orderSource: $orderSource, subscribeStatusChange: $subscribeStatusChange, specialInstruction: $specialInstruction, purchaseNumberC: $purchaseNumberC, invoiceDetails: $invoiceDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitReturnRequestDto &&
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

  @JsonKey(ignore: true)
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
  _$$_SubmitReturnRequestDtoCopyWith<_$_SubmitReturnRequestDto> get copyWith =>
      __$$_SubmitReturnRequestDtoCopyWithImpl<_$_SubmitReturnRequestDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubmitReturnRequestDtoToJson(
      this,
    );
  }
}

abstract class _SubmitReturnRequestDto extends SubmitReturnRequestDto {
  const factory _SubmitReturnRequestDto(
          {@JsonKey(name: 'soldToCustomer', defaultValue: '')
              required final String customerCode,
          @JsonKey(name: 'username', defaultValue: '')
              required final String username,
          @JsonKey(name: 'orderSource', defaultValue: '')
              required final String orderSource,
          @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
              required final bool subscribeStatusChange,
          @JsonKey(name: 'specialInstruction')
              required final String specialInstruction,
          @JsonKey(name: 'purchaseNumberC', defaultValue: '')
              required final String purchaseNumberC,
          @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailsDto>[])
              required final List<InvoiceDetailsDto> invoiceDetails}) =
      _$_SubmitReturnRequestDto;
  const _SubmitReturnRequestDto._() : super._();

  factory _SubmitReturnRequestDto.fromJson(Map<String, dynamic> json) =
      _$_SubmitReturnRequestDto.fromJson;

  @override
  @JsonKey(name: 'soldToCustomer', defaultValue: '')
  String get customerCode;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  String get username;
  @override
  @JsonKey(name: 'orderSource', defaultValue: '')
  String get orderSource;
  @override
  @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
  bool get subscribeStatusChange;
  @override
  @JsonKey(name: 'specialInstruction')
  String get specialInstruction;
  @override
  @JsonKey(name: 'purchaseNumberC', defaultValue: '')
  String get purchaseNumberC;
  @override
  @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailsDto>[])
  List<InvoiceDetailsDto> get invoiceDetails;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitReturnRequestDtoCopyWith<_$_SubmitReturnRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}
