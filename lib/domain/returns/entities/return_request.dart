import 'package:ezrxmobile/domain/returns/entities/material_basic_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_request.freezed.dart';

@freezed
class ReturnRequest with _$ReturnRequest {
  const ReturnRequest._();

  const factory ReturnRequest({
    required bool isSearchComplete,
    required List<MaterialBasicInformation> basicInformations,
    required List<ReturnItem> items,
  }) = _ReturnRequest;

  factory ReturnRequest.empty() => const ReturnRequest(
        isSearchComplete: false,
        basicInformations: <MaterialBasicInformation>[],
        items: <ReturnItem>[],
      );
}
