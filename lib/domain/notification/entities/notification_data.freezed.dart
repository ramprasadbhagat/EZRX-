// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationData {
  int get id => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  NotificationTitle get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTimeStringValue get createdAt => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  ReturnRequestsId get returnRequestId => throw _privateConstructorUsedError;
  OrderNumber get orderNumber => throw _privateConstructorUsedError;
  StringValue get paymentNumber => throw _privateConstructorUsedError;
  StringValue get paymentBatchAdditionalInfo =>
      throw _privateConstructorUsedError;
  EZReachBannerLink get hyperLink => throw _privateConstructorUsedError;
  bool get isMarketPlace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationDataCopyWith<NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataCopyWith<$Res> {
  factory $NotificationDataCopyWith(
          NotificationData value, $Res Function(NotificationData) then) =
      _$NotificationDataCopyWithImpl<$Res, NotificationData>;
  @useResult
  $Res call(
      {int id,
      NotificationType type,
      NotificationTitle title,
      String description,
      DateTimeStringValue createdAt,
      bool isRead,
      ReturnRequestsId returnRequestId,
      OrderNumber orderNumber,
      StringValue paymentNumber,
      StringValue paymentBatchAdditionalInfo,
      EZReachBannerLink hyperLink,
      bool isMarketPlace});

  $ReturnRequestsIdCopyWith<$Res> get returnRequestId;
}

/// @nodoc
class _$NotificationDataCopyWithImpl<$Res, $Val extends NotificationData>
    implements $NotificationDataCopyWith<$Res> {
  _$NotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? returnRequestId = null,
    Object? orderNumber = null,
    Object? paymentNumber = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? hyperLink = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as NotificationTitle,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      returnRequestId: null == returnRequestId
          ? _value.returnRequestId
          : returnRequestId // ignore: cast_nullable_to_non_nullable
              as ReturnRequestsId,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      paymentNumber: null == paymentNumber
          ? _value.paymentNumber
          : paymentNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as StringValue,
      hyperLink: null == hyperLink
          ? _value.hyperLink
          : hyperLink // ignore: cast_nullable_to_non_nullable
              as EZReachBannerLink,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestsIdCopyWith<$Res> get returnRequestId {
    return $ReturnRequestsIdCopyWith<$Res>(_value.returnRequestId, (value) {
      return _then(_value.copyWith(returnRequestId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationDataCopyWith<$Res>
    implements $NotificationDataCopyWith<$Res> {
  factory _$$_NotificationDataCopyWith(
          _$_NotificationData value, $Res Function(_$_NotificationData) then) =
      __$$_NotificationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      NotificationType type,
      NotificationTitle title,
      String description,
      DateTimeStringValue createdAt,
      bool isRead,
      ReturnRequestsId returnRequestId,
      OrderNumber orderNumber,
      StringValue paymentNumber,
      StringValue paymentBatchAdditionalInfo,
      EZReachBannerLink hyperLink,
      bool isMarketPlace});

  @override
  $ReturnRequestsIdCopyWith<$Res> get returnRequestId;
}

/// @nodoc
class __$$_NotificationDataCopyWithImpl<$Res>
    extends _$NotificationDataCopyWithImpl<$Res, _$_NotificationData>
    implements _$$_NotificationDataCopyWith<$Res> {
  __$$_NotificationDataCopyWithImpl(
      _$_NotificationData _value, $Res Function(_$_NotificationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? isRead = null,
    Object? returnRequestId = null,
    Object? orderNumber = null,
    Object? paymentNumber = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? hyperLink = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$_NotificationData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as NotificationTitle,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      returnRequestId: null == returnRequestId
          ? _value.returnRequestId
          : returnRequestId // ignore: cast_nullable_to_non_nullable
              as ReturnRequestsId,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as OrderNumber,
      paymentNumber: null == paymentNumber
          ? _value.paymentNumber
          : paymentNumber // ignore: cast_nullable_to_non_nullable
              as StringValue,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as StringValue,
      hyperLink: null == hyperLink
          ? _value.hyperLink
          : hyperLink // ignore: cast_nullable_to_non_nullable
              as EZReachBannerLink,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NotificationData extends _NotificationData {
  _$_NotificationData(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.createdAt,
      required this.isRead,
      required this.returnRequestId,
      required this.orderNumber,
      required this.paymentNumber,
      required this.paymentBatchAdditionalInfo,
      required this.hyperLink,
      required this.isMarketPlace})
      : super._();

  @override
  final int id;
  @override
  final NotificationType type;
  @override
  final NotificationTitle title;
  @override
  final String description;
  @override
  final DateTimeStringValue createdAt;
  @override
  final bool isRead;
  @override
  final ReturnRequestsId returnRequestId;
  @override
  final OrderNumber orderNumber;
  @override
  final StringValue paymentNumber;
  @override
  final StringValue paymentBatchAdditionalInfo;
  @override
  final EZReachBannerLink hyperLink;
  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'NotificationData(id: $id, type: $type, title: $title, description: $description, createdAt: $createdAt, isRead: $isRead, returnRequestId: $returnRequestId, orderNumber: $orderNumber, paymentNumber: $paymentNumber, paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo, hyperLink: $hyperLink, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.returnRequestId, returnRequestId) ||
                other.returnRequestId == returnRequestId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.paymentNumber, paymentNumber) ||
                other.paymentNumber == paymentNumber) &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo) &&
            (identical(other.hyperLink, hyperLink) ||
                other.hyperLink == hyperLink) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      description,
      createdAt,
      isRead,
      returnRequestId,
      orderNumber,
      paymentNumber,
      paymentBatchAdditionalInfo,
      hyperLink,
      isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      __$$_NotificationDataCopyWithImpl<_$_NotificationData>(this, _$identity);
}

abstract class _NotificationData extends NotificationData {
  factory _NotificationData(
      {required final int id,
      required final NotificationType type,
      required final NotificationTitle title,
      required final String description,
      required final DateTimeStringValue createdAt,
      required final bool isRead,
      required final ReturnRequestsId returnRequestId,
      required final OrderNumber orderNumber,
      required final StringValue paymentNumber,
      required final StringValue paymentBatchAdditionalInfo,
      required final EZReachBannerLink hyperLink,
      required final bool isMarketPlace}) = _$_NotificationData;
  _NotificationData._() : super._();

  @override
  int get id;
  @override
  NotificationType get type;
  @override
  NotificationTitle get title;
  @override
  String get description;
  @override
  DateTimeStringValue get createdAt;
  @override
  bool get isRead;
  @override
  ReturnRequestsId get returnRequestId;
  @override
  OrderNumber get orderNumber;
  @override
  StringValue get paymentNumber;
  @override
  StringValue get paymentBatchAdditionalInfo;
  @override
  EZReachBannerLink get hyperLink;
  @override
  bool get isMarketPlace;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationDataCopyWith<_$_NotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}
