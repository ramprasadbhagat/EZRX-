
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_summary_request_information_sales_doc_credit_notes_materials.freezed.dart';

@freezed
class Materials with _$Materials {
  const Materials._();

  factory Materials({
    required String materialNumber,
    required String lineNumber,
    required String materialDescription,
    required double qty,
    required double value,
  }) = _Materials;

  factory Materials.empty() => Materials(
        materialNumber: '',
        lineNumber: '',
        materialDescription: '',
        qty: 0.0,
        value: 0.0,
      );
}
