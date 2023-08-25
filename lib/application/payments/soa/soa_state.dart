part of 'soa_bloc.dart';

@freezed
class SoaState with _$SoaState {
  const SoaState._();
  const factory SoaState({
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required List<Soa> soaList,
    required SoaFilter appliedFilter,
  }) = _SoaState;

  factory SoaState.initial() => SoaState(
        isFetching: false,
        failureOrSuccessOption: none(),
        soaList: <Soa>[],
        appliedFilter: SoaFilter.empty(),
      );

  List<Soa> get filterList => soaList
      .where(
        (element) => (DateUtils.isSameMonth(
              element.soaData.date,
              appliedFilter.fromDate,
            ) ||
            DateUtils.isSameMonth(
              element.soaData.date,
              appliedFilter.toDate,
            ) ||
            (element.soaData.date.isAfter(appliedFilter.fromDate) &&
                element.soaData.date.isBefore(appliedFilter.toDate))),
      )
      .toList();

  DateTime get initialFilterFormDate => soaList.isNotEmpty
      ? soaList.last.soaData.date
      : SoaFilter.empty().fromDate;

  DateTime get initialFilterToDate =>
      soaList.isNotEmpty
      ? soaList.first.soaData.date
      : SoaFilter.empty().toDate;
}
