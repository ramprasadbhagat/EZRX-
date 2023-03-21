import 'package:ezrxmobile/domain/returns/entities/returns_overview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'returns_overview_dto.freezed.dart';
part 'returns_overview_dto.g.dart';

@freezed
class ReturnsOverviewDto with _$ReturnsOverviewDto {
  const ReturnsOverviewDto._();

  const factory ReturnsOverviewDto({
    @JsonKey(name: 'requestSubmitted', defaultValue: 0)
        required int requestSubmitted,
    @JsonKey(name: 'requestPendingApproval', defaultValue: 0)
        required int requestPendingApproval,
    @JsonKey(name: 'requestRejected', defaultValue: 0)
        required int requestRejected,
    @JsonKey(name: 'requestForApproval', defaultValue: 0)
        required int requestForApproval,
  }) = _ReturnsOverviewDto;

  ReturnsOverview toDomain() {
    return ReturnsOverview(
      requestSubmitted: requestSubmitted,
      requestPendingApproval: requestPendingApproval,
      requestRejected: requestRejected,
      requestForApproval: requestForApproval,
    );
  }

  factory ReturnsOverviewDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReturnsOverviewDtoFromJson(json);
}
