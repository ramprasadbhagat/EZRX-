// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request_information_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReturnRequestInformationDto _$ReturnRequestInformationDtoFromJson(
    Map<String, dynamic> json) {
  return _ReturnRequestInformationDto.fromJson(json);
}

/// @nodoc
mixin _$ReturnRequestInformationDto {
  @JsonKey(name: 'invoiceNo', defaultValue: '')
  String get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejectReason', defaultValue: '')
  String get rejectReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnQuantity', defaultValue: '')
  String get returnQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitPrice', defaultValue: '')
  String get unitPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPrice', defaultValue: '')
  String get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch', defaultValue: '')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnOrderDesc', defaultValue: '')
  String get returnOrderDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialGroup', defaultValue: '')
  String get materialGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl', defaultValue: <String>[])
  List<String> get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'attachments', defaultValue: <String>[])
  List<String> get attachments => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDate', defaultValue: '')
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'principal', defaultValue: '')
  String get principal => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bapiSalesDocNumber', defaultValue: '')
  String get bapiSalesDocNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'bapiStatus', defaultValue: '')
  String get bapiStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusReason', defaultValue: '')
  String get statusReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  bool get outsidePolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  String get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'bonusInformation', defaultValue: <ReturnRequestInformationDto>[])
  List<ReturnRequestInformationDto> get bonusInformation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReturnRequestInformationDtoCopyWith<ReturnRequestInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnRequestInformationDtoCopyWith<$Res> {
  factory $ReturnRequestInformationDtoCopyWith(
          ReturnRequestInformationDto value,
          $Res Function(ReturnRequestInformationDto) then) =
      _$ReturnRequestInformationDtoCopyWithImpl<$Res,
          ReturnRequestInformationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNo', defaultValue: '')
          String invoiceNo,
      @JsonKey(name: 'expiryDate', defaultValue: '')
          String expiryDate,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'rejectReason', defaultValue: '')
          String rejectReason,
      @JsonKey(name: 'returnQuantity', defaultValue: '')
          String returnQuantity,
      @JsonKey(name: 'unitPrice', defaultValue: '')
          String unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: '')
          String totalPrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'batch', defaultValue: '')
          String batch,
      @JsonKey(name: 'returnOrderDesc', defaultValue: '')
          String returnOrderDesc,
      @JsonKey(name: 'materialGroup', defaultValue: '')
          String materialGroup,
      @JsonKey(name: 'imageUrl', defaultValue: <String>[])
          List<String> imageUrl,
      @JsonKey(name: 'attachments', defaultValue: <String>[])
          List<String> attachments,
      @JsonKey(name: 'createdDate', defaultValue: '')
          String createdDate,
      @JsonKey(name: 'principal', defaultValue: '')
          String principal,
      @JsonKey(name: 'principalName', defaultValue: '')
          String principalName,
      @JsonKey(name: 'bapiSalesDocNumber', defaultValue: '')
          String bapiSalesDocNumber,
      @JsonKey(name: 'bapiStatus', defaultValue: '')
          String bapiStatus,
      @JsonKey(name: 'status', defaultValue: '')
          String status,
      @JsonKey(name: 'statusReason', defaultValue: '')
          String statusReason,
      @JsonKey(name: 'outsidePolicy', defaultValue: false)
          bool outsidePolicy,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          String invoiceDate,
      @JsonKey(name: 'bonusInformation', defaultValue: <ReturnRequestInformationDto>[])
          List<ReturnRequestInformationDto> bonusInformation});
}

/// @nodoc
class _$ReturnRequestInformationDtoCopyWithImpl<$Res,
        $Val extends ReturnRequestInformationDto>
    implements $ReturnRequestInformationDtoCopyWith<$Res> {
  _$ReturnRequestInformationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNo = null,
    Object? expiryDate = null,
    Object? comment = null,
    Object? rejectReason = null,
    Object? returnQuantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? batch = null,
    Object? returnOrderDesc = null,
    Object? materialGroup = null,
    Object? imageUrl = null,
    Object? attachments = null,
    Object? createdDate = null,
    Object? principal = null,
    Object? principalName = null,
    Object? bapiSalesDocNumber = null,
    Object? bapiStatus = null,
    Object? status = null,
    Object? statusReason = null,
    Object? outsidePolicy = null,
    Object? invoiceDate = null,
    Object? bonusInformation = null,
  }) {
    return _then(_value.copyWith(
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      rejectReason: null == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String,
      returnQuantity: null == returnQuantity
          ? _value.returnQuantity
          : returnQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      returnOrderDesc: null == returnOrderDesc
          ? _value.returnOrderDesc
          : returnOrderDesc // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      bapiSalesDocNumber: null == bapiSalesDocNumber
          ? _value.bapiSalesDocNumber
          : bapiSalesDocNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bapiStatus: null == bapiStatus
          ? _value.bapiStatus
          : bapiStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusReason: null == statusReason
          ? _value.statusReason
          : statusReason // ignore: cast_nullable_to_non_nullable
              as String,
      outsidePolicy: null == outsidePolicy
          ? _value.outsidePolicy
          : outsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
      bonusInformation: null == bonusInformation
          ? _value.bonusInformation
          : bonusInformation // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformationDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnRequestInformationDtoCopyWith<$Res>
    implements $ReturnRequestInformationDtoCopyWith<$Res> {
  factory _$$_ReturnRequestInformationDtoCopyWith(
          _$_ReturnRequestInformationDto value,
          $Res Function(_$_ReturnRequestInformationDto) then) =
      __$$_ReturnRequestInformationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoiceNo', defaultValue: '')
          String invoiceNo,
      @JsonKey(name: 'expiryDate', defaultValue: '')
          String expiryDate,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'rejectReason', defaultValue: '')
          String rejectReason,
      @JsonKey(name: 'returnQuantity', defaultValue: '')
          String returnQuantity,
      @JsonKey(name: 'unitPrice', defaultValue: '')
          String unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: '')
          String totalPrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'batch', defaultValue: '')
          String batch,
      @JsonKey(name: 'returnOrderDesc', defaultValue: '')
          String returnOrderDesc,
      @JsonKey(name: 'materialGroup', defaultValue: '')
          String materialGroup,
      @JsonKey(name: 'imageUrl', defaultValue: <String>[])
          List<String> imageUrl,
      @JsonKey(name: 'attachments', defaultValue: <String>[])
          List<String> attachments,
      @JsonKey(name: 'createdDate', defaultValue: '')
          String createdDate,
      @JsonKey(name: 'principal', defaultValue: '')
          String principal,
      @JsonKey(name: 'principalName', defaultValue: '')
          String principalName,
      @JsonKey(name: 'bapiSalesDocNumber', defaultValue: '')
          String bapiSalesDocNumber,
      @JsonKey(name: 'bapiStatus', defaultValue: '')
          String bapiStatus,
      @JsonKey(name: 'status', defaultValue: '')
          String status,
      @JsonKey(name: 'statusReason', defaultValue: '')
          String statusReason,
      @JsonKey(name: 'outsidePolicy', defaultValue: false)
          bool outsidePolicy,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          String invoiceDate,
      @JsonKey(name: 'bonusInformation', defaultValue: <ReturnRequestInformationDto>[])
          List<ReturnRequestInformationDto> bonusInformation});
}

/// @nodoc
class __$$_ReturnRequestInformationDtoCopyWithImpl<$Res>
    extends _$ReturnRequestInformationDtoCopyWithImpl<$Res,
        _$_ReturnRequestInformationDto>
    implements _$$_ReturnRequestInformationDtoCopyWith<$Res> {
  __$$_ReturnRequestInformationDtoCopyWithImpl(
      _$_ReturnRequestInformationDto _value,
      $Res Function(_$_ReturnRequestInformationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNo = null,
    Object? expiryDate = null,
    Object? comment = null,
    Object? rejectReason = null,
    Object? returnQuantity = null,
    Object? unitPrice = null,
    Object? totalPrice = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? batch = null,
    Object? returnOrderDesc = null,
    Object? materialGroup = null,
    Object? imageUrl = null,
    Object? attachments = null,
    Object? createdDate = null,
    Object? principal = null,
    Object? principalName = null,
    Object? bapiSalesDocNumber = null,
    Object? bapiStatus = null,
    Object? status = null,
    Object? statusReason = null,
    Object? outsidePolicy = null,
    Object? invoiceDate = null,
    Object? bonusInformation = null,
  }) {
    return _then(_$_ReturnRequestInformationDto(
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      rejectReason: null == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String,
      returnQuantity: null == returnQuantity
          ? _value.returnQuantity
          : returnQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      returnOrderDesc: null == returnOrderDesc
          ? _value.returnOrderDesc
          : returnOrderDesc // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value._imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      bapiSalesDocNumber: null == bapiSalesDocNumber
          ? _value.bapiSalesDocNumber
          : bapiSalesDocNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bapiStatus: null == bapiStatus
          ? _value.bapiStatus
          : bapiStatus // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusReason: null == statusReason
          ? _value.statusReason
          : statusReason // ignore: cast_nullable_to_non_nullable
              as String,
      outsidePolicy: null == outsidePolicy
          ? _value.outsidePolicy
          : outsidePolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as String,
      bonusInformation: null == bonusInformation
          ? _value._bonusInformation
          : bonusInformation // ignore: cast_nullable_to_non_nullable
              as List<ReturnRequestInformationDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReturnRequestInformationDto extends _ReturnRequestInformationDto {
  _$_ReturnRequestInformationDto(
      {@JsonKey(name: 'invoiceNo', defaultValue: '')
          required this.invoiceNo,
      @JsonKey(name: 'expiryDate', defaultValue: '')
          required this.expiryDate,
      @JsonKey(name: 'comment', defaultValue: '')
          required this.comment,
      @JsonKey(name: 'rejectReason', defaultValue: '')
          required this.rejectReason,
      @JsonKey(name: 'returnQuantity', defaultValue: '')
          required this.returnQuantity,
      @JsonKey(name: 'unitPrice', defaultValue: '')
          required this.unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: '')
          required this.totalPrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'batch', defaultValue: '')
          required this.batch,
      @JsonKey(name: 'returnOrderDesc', defaultValue: '')
          required this.returnOrderDesc,
      @JsonKey(name: 'materialGroup', defaultValue: '')
          required this.materialGroup,
      @JsonKey(name: 'imageUrl', defaultValue: <String>[])
          required final List<String> imageUrl,
      @JsonKey(name: 'attachments', defaultValue: <String>[])
          required final List<String> attachments,
      @JsonKey(name: 'createdDate', defaultValue: '')
          required this.createdDate,
      @JsonKey(name: 'principal', defaultValue: '')
          required this.principal,
      @JsonKey(name: 'principalName', defaultValue: '')
          required this.principalName,
      @JsonKey(name: 'bapiSalesDocNumber', defaultValue: '')
          required this.bapiSalesDocNumber,
      @JsonKey(name: 'bapiStatus', defaultValue: '')
          required this.bapiStatus,
      @JsonKey(name: 'status', defaultValue: '')
          required this.status,
      @JsonKey(name: 'statusReason', defaultValue: '')
          required this.statusReason,
      @JsonKey(name: 'outsidePolicy', defaultValue: false)
          required this.outsidePolicy,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          required this.invoiceDate,
      @JsonKey(name: 'bonusInformation', defaultValue: <ReturnRequestInformationDto>[])
          required final List<ReturnRequestInformationDto> bonusInformation})
      : _imageUrl = imageUrl,
        _attachments = attachments,
        _bonusInformation = bonusInformation,
        super._();

  factory _$_ReturnRequestInformationDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReturnRequestInformationDtoFromJson(json);

  @override
  @JsonKey(name: 'invoiceNo', defaultValue: '')
  final String invoiceNo;
  @override
  @JsonKey(name: 'expiryDate', defaultValue: '')
  final String expiryDate;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  final String comment;
  @override
  @JsonKey(name: 'rejectReason', defaultValue: '')
  final String rejectReason;
  @override
  @JsonKey(name: 'returnQuantity', defaultValue: '')
  final String returnQuantity;
  @override
  @JsonKey(name: 'unitPrice', defaultValue: '')
  final String unitPrice;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: '')
  final String totalPrice;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'batch', defaultValue: '')
  final String batch;
  @override
  @JsonKey(name: 'returnOrderDesc', defaultValue: '')
  final String returnOrderDesc;
  @override
  @JsonKey(name: 'materialGroup', defaultValue: '')
  final String materialGroup;
  final List<String> _imageUrl;
  @override
  @JsonKey(name: 'imageUrl', defaultValue: <String>[])
  List<String> get imageUrl {
    if (_imageUrl is EqualUnmodifiableListView) return _imageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrl);
  }

  final List<String> _attachments;
  @override
  @JsonKey(name: 'attachments', defaultValue: <String>[])
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  @JsonKey(name: 'createdDate', defaultValue: '')
  final String createdDate;
  @override
  @JsonKey(name: 'principal', defaultValue: '')
  final String principal;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'bapiSalesDocNumber', defaultValue: '')
  final String bapiSalesDocNumber;
  @override
  @JsonKey(name: 'bapiStatus', defaultValue: '')
  final String bapiStatus;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'statusReason', defaultValue: '')
  final String statusReason;
  @override
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  final bool outsidePolicy;
  @override
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  final String invoiceDate;
  final List<ReturnRequestInformationDto> _bonusInformation;
  @override
  @JsonKey(
      name: 'bonusInformation', defaultValue: <ReturnRequestInformationDto>[])
  List<ReturnRequestInformationDto> get bonusInformation {
    if (_bonusInformation is EqualUnmodifiableListView)
      return _bonusInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusInformation);
  }

  @override
  String toString() {
    return 'ReturnRequestInformationDto(invoiceNo: $invoiceNo, expiryDate: $expiryDate, comment: $comment, rejectReason: $rejectReason, returnQuantity: $returnQuantity, unitPrice: $unitPrice, totalPrice: $totalPrice, materialNumber: $materialNumber, materialDescription: $materialDescription, batch: $batch, returnOrderDesc: $returnOrderDesc, materialGroup: $materialGroup, imageUrl: $imageUrl, attachments: $attachments, createdDate: $createdDate, principal: $principal, principalName: $principalName, bapiSalesDocNumber: $bapiSalesDocNumber, bapiStatus: $bapiStatus, status: $status, statusReason: $statusReason, outsidePolicy: $outsidePolicy, invoiceDate: $invoiceDate, bonusInformation: $bonusInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnRequestInformationDto &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.returnQuantity, returnQuantity) ||
                other.returnQuantity == returnQuantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.returnOrderDesc, returnOrderDesc) ||
                other.returnOrderDesc == returnOrderDesc) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            const DeepCollectionEquality().equals(other._imageUrl, _imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.principal, principal) ||
                other.principal == principal) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.bapiSalesDocNumber, bapiSalesDocNumber) ||
                other.bapiSalesDocNumber == bapiSalesDocNumber) &&
            (identical(other.bapiStatus, bapiStatus) ||
                other.bapiStatus == bapiStatus) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusReason, statusReason) ||
                other.statusReason == statusReason) &&
            (identical(other.outsidePolicy, outsidePolicy) ||
                other.outsidePolicy == outsidePolicy) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            const DeepCollectionEquality()
                .equals(other._bonusInformation, _bonusInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        invoiceNo,
        expiryDate,
        comment,
        rejectReason,
        returnQuantity,
        unitPrice,
        totalPrice,
        materialNumber,
        materialDescription,
        batch,
        returnOrderDesc,
        materialGroup,
        const DeepCollectionEquality().hash(_imageUrl),
        const DeepCollectionEquality().hash(_attachments),
        createdDate,
        principal,
        principalName,
        bapiSalesDocNumber,
        bapiStatus,
        status,
        statusReason,
        outsidePolicy,
        invoiceDate,
        const DeepCollectionEquality().hash(_bonusInformation)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnRequestInformationDtoCopyWith<_$_ReturnRequestInformationDto>
      get copyWith => __$$_ReturnRequestInformationDtoCopyWithImpl<
          _$_ReturnRequestInformationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReturnRequestInformationDtoToJson(
      this,
    );
  }
}

abstract class _ReturnRequestInformationDto
    extends ReturnRequestInformationDto {
  factory _ReturnRequestInformationDto(
      {@JsonKey(name: 'invoiceNo', defaultValue: '')
          required final String invoiceNo,
      @JsonKey(name: 'expiryDate', defaultValue: '')
          required final String expiryDate,
      @JsonKey(name: 'comment', defaultValue: '')
          required final String comment,
      @JsonKey(name: 'rejectReason', defaultValue: '')
          required final String rejectReason,
      @JsonKey(name: 'returnQuantity', defaultValue: '')
          required final String returnQuantity,
      @JsonKey(name: 'unitPrice', defaultValue: '')
          required final String unitPrice,
      @JsonKey(name: 'totalPrice', defaultValue: '')
          required final String totalPrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'batch', defaultValue: '')
          required final String batch,
      @JsonKey(name: 'returnOrderDesc', defaultValue: '')
          required final String returnOrderDesc,
      @JsonKey(name: 'materialGroup', defaultValue: '')
          required final String materialGroup,
      @JsonKey(name: 'imageUrl', defaultValue: <String>[])
          required final List<String> imageUrl,
      @JsonKey(name: 'attachments', defaultValue: <String>[])
          required final List<String> attachments,
      @JsonKey(name: 'createdDate', defaultValue: '')
          required final String createdDate,
      @JsonKey(name: 'principal', defaultValue: '')
          required final String principal,
      @JsonKey(name: 'principalName', defaultValue: '')
          required final String principalName,
      @JsonKey(name: 'bapiSalesDocNumber', defaultValue: '')
          required final String bapiSalesDocNumber,
      @JsonKey(name: 'bapiStatus', defaultValue: '')
          required final String bapiStatus,
      @JsonKey(name: 'status', defaultValue: '')
          required final String status,
      @JsonKey(name: 'statusReason', defaultValue: '')
          required final String statusReason,
      @JsonKey(name: 'outsidePolicy', defaultValue: false)
          required final bool outsidePolicy,
      @JsonKey(name: 'invoiceDate', defaultValue: '')
          required final String invoiceDate,
      @JsonKey(name: 'bonusInformation', defaultValue: <ReturnRequestInformationDto>[])
          required final List<ReturnRequestInformationDto> bonusInformation}) = _$_ReturnRequestInformationDto;
  _ReturnRequestInformationDto._() : super._();

  factory _ReturnRequestInformationDto.fromJson(Map<String, dynamic> json) =
      _$_ReturnRequestInformationDto.fromJson;

  @override
  @JsonKey(name: 'invoiceNo', defaultValue: '')
  String get invoiceNo;
  @override
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment;
  @override
  @JsonKey(name: 'rejectReason', defaultValue: '')
  String get rejectReason;
  @override
  @JsonKey(name: 'returnQuantity', defaultValue: '')
  String get returnQuantity;
  @override
  @JsonKey(name: 'unitPrice', defaultValue: '')
  String get unitPrice;
  @override
  @JsonKey(name: 'totalPrice', defaultValue: '')
  String get totalPrice;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'batch', defaultValue: '')
  String get batch;
  @override
  @JsonKey(name: 'returnOrderDesc', defaultValue: '')
  String get returnOrderDesc;
  @override
  @JsonKey(name: 'materialGroup', defaultValue: '')
  String get materialGroup;
  @override
  @JsonKey(name: 'imageUrl', defaultValue: <String>[])
  List<String> get imageUrl;
  @override
  @JsonKey(name: 'attachments', defaultValue: <String>[])
  List<String> get attachments;
  @override
  @JsonKey(name: 'createdDate', defaultValue: '')
  String get createdDate;
  @override
  @JsonKey(name: 'principal', defaultValue: '')
  String get principal;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'bapiSalesDocNumber', defaultValue: '')
  String get bapiSalesDocNumber;
  @override
  @JsonKey(name: 'bapiStatus', defaultValue: '')
  String get bapiStatus;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'statusReason', defaultValue: '')
  String get statusReason;
  @override
  @JsonKey(name: 'outsidePolicy', defaultValue: false)
  bool get outsidePolicy;
  @override
  @JsonKey(name: 'invoiceDate', defaultValue: '')
  String get invoiceDate;
  @override
  @JsonKey(
      name: 'bonusInformation', defaultValue: <ReturnRequestInformationDto>[])
  List<ReturnRequestInformationDto> get bonusInformation;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnRequestInformationDtoCopyWith<_$_ReturnRequestInformationDto>
      get copyWith => throw _privateConstructorUsedError;
}
