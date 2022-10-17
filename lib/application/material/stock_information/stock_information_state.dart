part of 'stock_information_bloc.dart';

@freezed
class StockInformationState with _$StockInformationState {
  const factory StockInformationState({
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<ApiFailure, List<StockInfo>>>
        stockInfoListFailureOrSuccessOption,
    required List<StockInfo> stockInfoList,
  }) = _StockInformationState;

  factory StockInformationState.initial() => StockInformationState(
        isSubmitting: false,
        showErrorMessages: false,
        stockInfoListFailureOrSuccessOption: none(),
        stockInfoList: <StockInfo>[],
      );
}
