part of 'recent_order_bloc.dart';

@freezed
class RecentOrderState with _$RecentOrderState {
  const RecentOrderState._();
  const factory RecentOrderState({
    required bool isFetching,
    required List<RecentOrderItem> recentlyOrderedProducts,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _RecentOrderState;

  factory RecentOrderState.initial() => RecentOrderState(
        apiFailureOrSuccessOption: none(),
        isFetching: false,
        recentlyOrderedProducts: <RecentOrderItem>[],
      );

  List<MaterialInfo> get toMaterialInfo => recentlyOrderedProducts
      .map((e) => MaterialInfo.fromRecentOrder(e))
      .toList();
}
