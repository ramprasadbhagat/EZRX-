import 'package:freezed_annotation/freezed_annotation.dart';

part 'returns_overview.freezed.dart';

@freezed
class ReturnsOverview with _$ReturnsOverview {
  const ReturnsOverview._();

  const factory ReturnsOverview({
    required int requestSubmitted,
    required int requestPendingApproval,
    required int requestRejected,
    required int requestForApproval,
  }) = _ReturnsOverview;

  factory ReturnsOverview.empty() => const ReturnsOverview(
        requestSubmitted: 0,
        requestPendingApproval: 0,
        requestRejected: 0,
        requestForApproval: 0,
      );
}
