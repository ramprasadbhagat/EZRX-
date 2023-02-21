import 'package:ezrxmobile/domain/returns/entities/approver_return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/approver_return_requests_id_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Approver return request information header dto ', () {
    test(
        '=> Approver return request ApproverReturnRequestsIdDto fromJson valid requestId',
        () {
      final approverReturnRequestsId =
          ApproverReturnRequestsIdDto.fromJson({'requestId': 'fake-Id'});
      expect(approverReturnRequestsId.requestId, 'fake-Id');
      expect(approverReturnRequestsId.isValidRequestId, true);
    });

    test(
        '=> Approver return request ApproverReturnRequestsIdDto fromJson not valid requestId',
        () {
      final approverReturnRequestsId =
          ApproverReturnRequestsIdDto.fromJson({'requestId': ''});
      expect(approverReturnRequestsId.requestId, '');
      expect(approverReturnRequestsId.isValidRequestId, false);
    });

    test(
        '=> Approver return request ApproverReturnRequestsIdDto fromJson valid requestId',
        () {
      final approverReturnRequestsId =
          ApproverReturnRequestsIdDto.fromJson({'requestId': 'fake-Id'})
              .toDomain();
      expect(
        approverReturnRequestsId,
        ApproverReturnRequestsId(requestId: 'fake-Id'),
      );
    });
  });
}
