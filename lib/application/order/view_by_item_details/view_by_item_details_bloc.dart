import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/repository/i_product_images_repository.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/repository/i_view_by_item_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_item_details_event.dart';
part 'view_by_item_details_state.dart';
part 'view_by_item_details_bloc.freezed.dart';

class ViewByItemDetailsBloc
    extends Bloc<ViewByItemDetailsEvent, ViewByItemDetailsState> {
  final IViewByItemDetailsRepository viewByItemDetailsRepository;
  final IProductImagesRepository productImagesRepository;

  ViewByItemDetailsBloc({
    required this.viewByItemDetailsRepository,
    required this.productImagesRepository,
  }) : super(ViewByItemDetailsState.initial()) {
    on<ViewByItemDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ViewByItemDetailsEvent event,
    Emitter<ViewByItemDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ViewByItemDetailsState.initial()),
      fetch: (e) async {
        emit(
          ViewByItemDetailsState.initial().copyWith(
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await viewByItemDetailsRepository.getViewByItemDetails(
          soldTo: e.soldTo,
          user: e.user,
          orderHistoryItem: e.orderHistoryItem,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
                showErrorMessage: true,
              ),
            );
          },
          (viewByItemDetails) {
            emit(
              state.copyWith(
                viewByItemDetails: viewByItemDetails,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
            add(const _FetchProductImage());
          },
        );
      },
      fetchProductImage: (e) async {
        emit(
          state.copyWith(
            isImageLoading: true,
          ),
        );

        final failureOrSuccess = await productImagesRepository.getProductImages(
          list: state.viewByItemDetails.orderHistoryItems,
        );

        await failureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isImageLoading: false,
            ),
          ),
          (updatedListWithImages) async {
            emit(
              state.copyWith(
                viewByItemDetails: state.viewByItemDetails.copyWith(
                  orderHistoryItems: updatedListWithImages
                      .map((e) => e as OrderHistoryItem)
                      .toList(),
                ),
                failureOrSuccessOption: none(),
                isImageLoading: false,
              ),
            );
          },
        );
      },
    );
  }
}
