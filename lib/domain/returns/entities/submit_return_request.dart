import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

part 'submit_return_request.freezed.dart';

@freezed
class SubmitReturnsRequest with _$SubmitReturnsRequest {
  const SubmitReturnsRequest._();

  const factory SubmitReturnsRequest({
    required String customerCode,
    required Username username,
    required String orderSource,
    required bool subscribeStatusChange,
    required String specialInstruction,
    required String purchaseNumberC,
    required List<InvoiceDetails> invoiceDetails,
  }) = _SubmitReturnsRequest;

  factory SubmitReturnsRequest.empty() => SubmitReturnsRequest(
        customerCode: '',
        invoiceDetails: <InvoiceDetails>[],
        orderSource: '',
        purchaseNumberC: '',
        specialInstruction: '',
        subscribeStatusChange: false,
        username: Username(''),
      );
}
