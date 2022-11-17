import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_po_documents.freezed.dart';

@freezed
class OrderHistoryDetailsPODocuments with _$OrderHistoryDetailsPODocuments {
  const OrderHistoryDetailsPODocuments._();
  factory OrderHistoryDetailsPODocuments({
    required String url,
    required String name,
  }) = _OrderHistoryDetailsPODocuments;
  factory OrderHistoryDetailsPODocuments.empty() =>
      OrderHistoryDetailsPODocuments(
        url: '',
        name: '',
      );
  Map<String, String> get getNameUrlAsMap => <String, String>{name: url};
}
