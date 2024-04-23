part of 'tender_contract_detail_bloc.dart';

@freezed
class TenderContractDetailState with _$TenderContractDetailState {
  const factory TenderContractDetailState({
    required List<TenderContract> tenderContractList,
    required bool tenderContractEnable,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
    required TenderContract selectedTenderContract,
  }) = _TenderContractDetailState;

  factory TenderContractDetailState.initial() => TenderContractDetailState(
        tenderContractList: <TenderContract>[],
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        tenderContractEnable: false,
        selectedTenderContract: TenderContract.empty(),
      );
}
