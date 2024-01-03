import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_request_attachment.freezed.dart';

@freezed
class ReturnRequestAttachment with _$ReturnRequestAttachment {
  const ReturnRequestAttachment._();
  factory ReturnRequestAttachment({
    required String path,
    required String name,
    required FileSize size,
  }) = _ReturnRequestAttachment;
  factory ReturnRequestAttachment.empty() => ReturnRequestAttachment(
        path: '',
        name: '',
        size: FileSize(0),
      );
}
