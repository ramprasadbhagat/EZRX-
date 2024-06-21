// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_po_attachment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminPoAttachmentDto _$AdminPoAttachmentDtoFromJson(Map<String, dynamic> json) {
  return _AdminPoAttachmentDto.fromJson(json);
}

/// @nodoc
mixin _$AdminPoAttachmentDto {
  @JsonKey(name: 'salesOrderNumber', defaultValue: '', toJson: overrideToJson)
  String get salesOrderNumber => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'ezrxReferenceNumber', defaultValue: '', toJson: overrideToJson)
  String get ezrxReferenceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdBy', defaultValue: '', toJson: overrideToJson)
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdTime', defaultValue: '', toJson: overrideToJson)
  String get createdTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentUrl', defaultValue: '', toJson: overrideToJson)
  String get documentUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentName', defaultValue: '', toJson: overrideToJson)
  String get documentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesOrg', defaultValue: '', toJson: overrideToJson)
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'soldToCode', defaultValue: '', toJson: overrideToJson)
  String get soldToCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipToCode', defaultValue: '', toJson: overrideToJson)
  String get shipToCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'tempOrderNumber', defaultValue: '', toJson: overrideToJson)
  String get tempOrderNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminPoAttachmentDtoCopyWith<AdminPoAttachmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminPoAttachmentDtoCopyWith<$Res> {
  factory $AdminPoAttachmentDtoCopyWith(AdminPoAttachmentDto value,
          $Res Function(AdminPoAttachmentDto) then) =
      _$AdminPoAttachmentDtoCopyWithImpl<$Res, AdminPoAttachmentDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'salesOrderNumber', defaultValue: '', toJson: overrideToJson)
      String salesOrderNumber,
      @JsonKey(
          name: 'ezrxReferenceNumber', defaultValue: '', toJson: overrideToJson)
      String ezrxReferenceNumber,
      @JsonKey(name: 'createdBy', defaultValue: '', toJson: overrideToJson)
      String createdBy,
      @JsonKey(name: 'createdTime', defaultValue: '', toJson: overrideToJson)
      String createdTime,
      @JsonKey(name: 'documentUrl', defaultValue: '', toJson: overrideToJson)
      String documentUrl,
      @JsonKey(name: 'documentName', defaultValue: '', toJson: overrideToJson)
      String documentName,
      @JsonKey(name: 'salesOrg', defaultValue: '', toJson: overrideToJson)
      String salesOrg,
      @JsonKey(name: 'soldToCode', defaultValue: '', toJson: overrideToJson)
      String soldToCode,
      @JsonKey(name: 'shipToCode', defaultValue: '', toJson: overrideToJson)
      String shipToCode,
      @JsonKey(
          name: 'tempOrderNumber', defaultValue: '', toJson: overrideToJson)
      String tempOrderNumber});
}

/// @nodoc
class _$AdminPoAttachmentDtoCopyWithImpl<$Res,
        $Val extends AdminPoAttachmentDto>
    implements $AdminPoAttachmentDtoCopyWith<$Res> {
  _$AdminPoAttachmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderNumber = null,
    Object? ezrxReferenceNumber = null,
    Object? createdBy = null,
    Object? createdTime = null,
    Object? documentUrl = null,
    Object? documentName = null,
    Object? salesOrg = null,
    Object? soldToCode = null,
    Object? shipToCode = null,
    Object? tempOrderNumber = null,
  }) {
    return _then(_value.copyWith(
      salesOrderNumber: null == salesOrderNumber
          ? _value.salesOrderNumber
          : salesOrderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ezrxReferenceNumber: null == ezrxReferenceNumber
          ? _value.ezrxReferenceNumber
          : ezrxReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      documentUrl: null == documentUrl
          ? _value.documentUrl
          : documentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      soldToCode: null == soldToCode
          ? _value.soldToCode
          : soldToCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipToCode: null == shipToCode
          ? _value.shipToCode
          : shipToCode // ignore: cast_nullable_to_non_nullable
              as String,
      tempOrderNumber: null == tempOrderNumber
          ? _value.tempOrderNumber
          : tempOrderNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminPoAttachmentDtoImplCopyWith<$Res>
    implements $AdminPoAttachmentDtoCopyWith<$Res> {
  factory _$$AdminPoAttachmentDtoImplCopyWith(_$AdminPoAttachmentDtoImpl value,
          $Res Function(_$AdminPoAttachmentDtoImpl) then) =
      __$$AdminPoAttachmentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'salesOrderNumber', defaultValue: '', toJson: overrideToJson)
      String salesOrderNumber,
      @JsonKey(
          name: 'ezrxReferenceNumber', defaultValue: '', toJson: overrideToJson)
      String ezrxReferenceNumber,
      @JsonKey(name: 'createdBy', defaultValue: '', toJson: overrideToJson)
      String createdBy,
      @JsonKey(name: 'createdTime', defaultValue: '', toJson: overrideToJson)
      String createdTime,
      @JsonKey(name: 'documentUrl', defaultValue: '', toJson: overrideToJson)
      String documentUrl,
      @JsonKey(name: 'documentName', defaultValue: '', toJson: overrideToJson)
      String documentName,
      @JsonKey(name: 'salesOrg', defaultValue: '', toJson: overrideToJson)
      String salesOrg,
      @JsonKey(name: 'soldToCode', defaultValue: '', toJson: overrideToJson)
      String soldToCode,
      @JsonKey(name: 'shipToCode', defaultValue: '', toJson: overrideToJson)
      String shipToCode,
      @JsonKey(
          name: 'tempOrderNumber', defaultValue: '', toJson: overrideToJson)
      String tempOrderNumber});
}

/// @nodoc
class __$$AdminPoAttachmentDtoImplCopyWithImpl<$Res>
    extends _$AdminPoAttachmentDtoCopyWithImpl<$Res, _$AdminPoAttachmentDtoImpl>
    implements _$$AdminPoAttachmentDtoImplCopyWith<$Res> {
  __$$AdminPoAttachmentDtoImplCopyWithImpl(_$AdminPoAttachmentDtoImpl _value,
      $Res Function(_$AdminPoAttachmentDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderNumber = null,
    Object? ezrxReferenceNumber = null,
    Object? createdBy = null,
    Object? createdTime = null,
    Object? documentUrl = null,
    Object? documentName = null,
    Object? salesOrg = null,
    Object? soldToCode = null,
    Object? shipToCode = null,
    Object? tempOrderNumber = null,
  }) {
    return _then(_$AdminPoAttachmentDtoImpl(
      salesOrderNumber: null == salesOrderNumber
          ? _value.salesOrderNumber
          : salesOrderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ezrxReferenceNumber: null == ezrxReferenceNumber
          ? _value.ezrxReferenceNumber
          : ezrxReferenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String,
      documentUrl: null == documentUrl
          ? _value.documentUrl
          : documentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      soldToCode: null == soldToCode
          ? _value.soldToCode
          : soldToCode // ignore: cast_nullable_to_non_nullable
              as String,
      shipToCode: null == shipToCode
          ? _value.shipToCode
          : shipToCode // ignore: cast_nullable_to_non_nullable
              as String,
      tempOrderNumber: null == tempOrderNumber
          ? _value.tempOrderNumber
          : tempOrderNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminPoAttachmentDtoImpl extends _AdminPoAttachmentDto {
  const _$AdminPoAttachmentDtoImpl(
      {@JsonKey(
          name: 'salesOrderNumber', defaultValue: '', toJson: overrideToJson)
      required this.salesOrderNumber,
      @JsonKey(
          name: 'ezrxReferenceNumber', defaultValue: '', toJson: overrideToJson)
      required this.ezrxReferenceNumber,
      @JsonKey(name: 'createdBy', defaultValue: '', toJson: overrideToJson)
      required this.createdBy,
      @JsonKey(name: 'createdTime', defaultValue: '', toJson: overrideToJson)
      required this.createdTime,
      @JsonKey(name: 'documentUrl', defaultValue: '', toJson: overrideToJson)
      required this.documentUrl,
      @JsonKey(name: 'documentName', defaultValue: '', toJson: overrideToJson)
      required this.documentName,
      @JsonKey(name: 'salesOrg', defaultValue: '', toJson: overrideToJson)
      required this.salesOrg,
      @JsonKey(name: 'soldToCode', defaultValue: '', toJson: overrideToJson)
      required this.soldToCode,
      @JsonKey(name: 'shipToCode', defaultValue: '', toJson: overrideToJson)
      required this.shipToCode,
      @JsonKey(
          name: 'tempOrderNumber', defaultValue: '', toJson: overrideToJson)
      required this.tempOrderNumber})
      : super._();

  factory _$AdminPoAttachmentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminPoAttachmentDtoImplFromJson(json);

  @override
  @JsonKey(name: 'salesOrderNumber', defaultValue: '', toJson: overrideToJson)
  final String salesOrderNumber;
  @override
  @JsonKey(
      name: 'ezrxReferenceNumber', defaultValue: '', toJson: overrideToJson)
  final String ezrxReferenceNumber;
  @override
  @JsonKey(name: 'createdBy', defaultValue: '', toJson: overrideToJson)
  final String createdBy;
  @override
  @JsonKey(name: 'createdTime', defaultValue: '', toJson: overrideToJson)
  final String createdTime;
  @override
  @JsonKey(name: 'documentUrl', defaultValue: '', toJson: overrideToJson)
  final String documentUrl;
  @override
  @JsonKey(name: 'documentName', defaultValue: '', toJson: overrideToJson)
  final String documentName;
  @override
  @JsonKey(name: 'salesOrg', defaultValue: '', toJson: overrideToJson)
  final String salesOrg;
  @override
  @JsonKey(name: 'soldToCode', defaultValue: '', toJson: overrideToJson)
  final String soldToCode;
  @override
  @JsonKey(name: 'shipToCode', defaultValue: '', toJson: overrideToJson)
  final String shipToCode;
  @override
  @JsonKey(name: 'tempOrderNumber', defaultValue: '', toJson: overrideToJson)
  final String tempOrderNumber;

  @override
  String toString() {
    return 'AdminPoAttachmentDto(salesOrderNumber: $salesOrderNumber, ezrxReferenceNumber: $ezrxReferenceNumber, createdBy: $createdBy, createdTime: $createdTime, documentUrl: $documentUrl, documentName: $documentName, salesOrg: $salesOrg, soldToCode: $soldToCode, shipToCode: $shipToCode, tempOrderNumber: $tempOrderNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminPoAttachmentDtoImpl &&
            (identical(other.salesOrderNumber, salesOrderNumber) ||
                other.salesOrderNumber == salesOrderNumber) &&
            (identical(other.ezrxReferenceNumber, ezrxReferenceNumber) ||
                other.ezrxReferenceNumber == ezrxReferenceNumber) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.documentUrl, documentUrl) ||
                other.documentUrl == documentUrl) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.soldToCode, soldToCode) ||
                other.soldToCode == soldToCode) &&
            (identical(other.shipToCode, shipToCode) ||
                other.shipToCode == shipToCode) &&
            (identical(other.tempOrderNumber, tempOrderNumber) ||
                other.tempOrderNumber == tempOrderNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrderNumber,
      ezrxReferenceNumber,
      createdBy,
      createdTime,
      documentUrl,
      documentName,
      salesOrg,
      soldToCode,
      shipToCode,
      tempOrderNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminPoAttachmentDtoImplCopyWith<_$AdminPoAttachmentDtoImpl>
      get copyWith =>
          __$$AdminPoAttachmentDtoImplCopyWithImpl<_$AdminPoAttachmentDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminPoAttachmentDtoImplToJson(
      this,
    );
  }
}

abstract class _AdminPoAttachmentDto extends AdminPoAttachmentDto {
  const factory _AdminPoAttachmentDto(
      {@JsonKey(
          name: 'salesOrderNumber', defaultValue: '', toJson: overrideToJson)
      required final String salesOrderNumber,
      @JsonKey(
          name: 'ezrxReferenceNumber', defaultValue: '', toJson: overrideToJson)
      required final String ezrxReferenceNumber,
      @JsonKey(name: 'createdBy', defaultValue: '', toJson: overrideToJson)
      required final String createdBy,
      @JsonKey(name: 'createdTime', defaultValue: '', toJson: overrideToJson)
      required final String createdTime,
      @JsonKey(name: 'documentUrl', defaultValue: '', toJson: overrideToJson)
      required final String documentUrl,
      @JsonKey(name: 'documentName', defaultValue: '', toJson: overrideToJson)
      required final String documentName,
      @JsonKey(name: 'salesOrg', defaultValue: '', toJson: overrideToJson)
      required final String salesOrg,
      @JsonKey(name: 'soldToCode', defaultValue: '', toJson: overrideToJson)
      required final String soldToCode,
      @JsonKey(name: 'shipToCode', defaultValue: '', toJson: overrideToJson)
      required final String shipToCode,
      @JsonKey(
          name: 'tempOrderNumber', defaultValue: '', toJson: overrideToJson)
      required final String tempOrderNumber}) = _$AdminPoAttachmentDtoImpl;
  const _AdminPoAttachmentDto._() : super._();

  factory _AdminPoAttachmentDto.fromJson(Map<String, dynamic> json) =
      _$AdminPoAttachmentDtoImpl.fromJson;

  @override
  @JsonKey(name: 'salesOrderNumber', defaultValue: '', toJson: overrideToJson)
  String get salesOrderNumber;
  @override
  @JsonKey(
      name: 'ezrxReferenceNumber', defaultValue: '', toJson: overrideToJson)
  String get ezrxReferenceNumber;
  @override
  @JsonKey(name: 'createdBy', defaultValue: '', toJson: overrideToJson)
  String get createdBy;
  @override
  @JsonKey(name: 'createdTime', defaultValue: '', toJson: overrideToJson)
  String get createdTime;
  @override
  @JsonKey(name: 'documentUrl', defaultValue: '', toJson: overrideToJson)
  String get documentUrl;
  @override
  @JsonKey(name: 'documentName', defaultValue: '', toJson: overrideToJson)
  String get documentName;
  @override
  @JsonKey(name: 'salesOrg', defaultValue: '', toJson: overrideToJson)
  String get salesOrg;
  @override
  @JsonKey(name: 'soldToCode', defaultValue: '', toJson: overrideToJson)
  String get soldToCode;
  @override
  @JsonKey(name: 'shipToCode', defaultValue: '', toJson: overrideToJson)
  String get shipToCode;
  @override
  @JsonKey(name: 'tempOrderNumber', defaultValue: '', toJson: overrideToJson)
  String get tempOrderNumber;
  @override
  @JsonKey(ignore: true)
  _$$AdminPoAttachmentDtoImplCopyWith<_$AdminPoAttachmentDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
