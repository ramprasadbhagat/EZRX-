part of 'all_credits_bloc.dart';

@freezed
class AllCreditsState with _$AllCreditsState {
  //Constructor created for Getter 
  const AllCreditsState._();
  const factory AllCreditsState({
    required List<CreditAndInvoiceItem> credits,
    required int totalCount,
    required String sortDirection,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required bool isLoading,
    required bool canLoadMore,
  }) = _AllCreditsState;

  factory AllCreditsState.initial() => AllCreditsState(
        failureOrSuccessOption: none(),
        isLoading: false,
        canLoadMore: true,
        credits: <CreditAndInvoiceItem>[],
        sortDirection: 'desc',
        totalCount: 0,
      );

}
