import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_item_group.freezed.dart';

@freezed
class ReturnItemGroup with _$ReturnItemGroup {
  const ReturnItemGroup._();

  const factory ReturnItemGroup({
    required DateTimeStringValue requestDate,
    required List<ReturnItem> items,
  }) = _ReturnItemGroup;

  factory ReturnItemGroup.empty() => ReturnItemGroup(
        requestDate: DateTimeStringValue(''),
        items: <ReturnItem>[],
      );
}
