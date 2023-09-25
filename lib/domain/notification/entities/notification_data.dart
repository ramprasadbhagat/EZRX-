import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/notification/value/value_object.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data.freezed.dart';

@freezed
class NotificationData with _$NotificationData {
  const NotificationData._();

  factory NotificationData({
    required int id,
    required NotificationType type,
    required NotificationTitle title,
    required String description,
    required DateTimeStringValue createdAt,
    required bool isRead,
    required ReturnRequestsId returnRequestId,
    required OrderNumber orderNumber,
    required StringValue saleDocument,
  }) = _NotificationData;

  factory NotificationData.empty() => NotificationData(
        id: 0,
        type: NotificationType(''),
        title: NotificationTitle(''),
        description: '',
        createdAt: DateTimeStringValue(''),
        isRead: false,
        returnRequestId: ReturnRequestsId.empty(),
        orderNumber: OrderNumber(''),
        saleDocument: StringValue(''),
      );

  bool get isReturnEligible =>
      type.navigateToReturnDetailPage && returnRequestId.isValidRequestId;

  bool get isOrderEligible =>
      type.navigateToOrderDetailPage && orderNumber.isValid();

  bool get isPaymentEligible =>
      type.navigateToPaymentDetailPage && saleDocument.isValid();
}
