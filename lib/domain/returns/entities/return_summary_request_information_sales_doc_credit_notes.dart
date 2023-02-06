import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_sales_doc_credit_notes_materials.dart';

part 'return_summary_request_information_sales_doc_credit_notes.freezed.dart';

@freezed
class CreditNotes with _$CreditNotes {
  const CreditNotes._();

  const factory CreditNotes({
    required String creditNoteId,
    required List<Materials> materials,
  }) = _CreditNotes;

  factory CreditNotes.empty() => const CreditNotes(
        creditNoteId: '',
        materials: <Materials>[],
      );
}
