import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_request_params.freezed.dart';

@freezed
class AddRequestParams with _$AddRequestParams {
  const AddRequestParams._();

  const factory AddRequestParams({
    required String orderSource,
    required String returnReference,
    required String specialInstruction,
    required Username userName,
    required String soldTo,
    required List<InvoiceDetails> invoiceDetails,
  }) = _AddRequestParams;

  factory AddRequestParams.empty() => AddRequestParams(
        orderSource: '',
        returnReference: '',
        specialInstruction: '',
        soldTo: '',
        userName: Username(''),
        invoiceDetails: <InvoiceDetails>[],
      );
}
