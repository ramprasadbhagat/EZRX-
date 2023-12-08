import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_linking_event.dart';
part 'deep_linking_state.dart';
part 'deep_linking_bloc.freezed.dart';

class DeepLinkingBloc extends Bloc<DeepLinkingEvent, DeepLinkingState> {
  final DeepLinkingService service;
  final IDeepLinkingRepository repository;
  StreamSubscription? dynamicLinkStream;

  DeepLinkingBloc({
    required this.service,
    required this.repository,
  }) : super(const DeepLinkingState.initial()) {
    on<DeepLinkingEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DeepLinkingEvent event,
    Emitter<DeepLinkingState> emit,
  ) async {
    await event.map(
      initialize: (_) async {
        dynamicLinkStream ??= await service.init();
      },
      stopConsumeLink: (_) {
        service.setInitialLinkHandled();
        dynamicLinkStream?.cancel();
        dynamicLinkStream = null;
      },
      addPendingLink: (event) {
        emit(
          DeepLinkingState.linkPending(event.link),
        );
      },
      consumePendingLink: (event) {
        state.when(
          initial: () {},
          linkPending: (link) {
            if (link.path.startsWith('/product-details')) {
              final failureOrSuccess = repository.extractMaterialNumber(
                link: link,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (materialNumber) => emit(
                  DeepLinkingState.redirectProductDetail(materialNumber),
                ),
              );
            } else if (link.path.startsWith('/bundle-details')) {
              final failureOrSuccess = repository.extractMaterialNumber(
                link: link,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (materialNumber) => emit(
                  DeepLinkingState.redirectBundleDetail(materialNumber),
                ),
              );
            } else if (link.path == '/my-account/orders/order-detail') {
              final failureOrSuccess = repository.extractOrderNumber(
                selectedCustomerCode: event.selectedCustomerCode,
                selectedShipTo: event.selectedShipTo,
                link: link,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (orderNumber) => emit(
                  DeepLinkingState.redirectOrderDetail(orderNumber),
                ),
              );
            } else if (link.path == '/my-account/return-summary-details') {
              final failureOrSuccess = repository.extractReturnId(
                selectedCustomerCode: event.selectedCustomerCode,
                selectedShipTo: event.selectedShipTo,
                link: link,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (returnId) => emit(
                  DeepLinkingState.redirectReturnDetail(returnId),
                ),
              );
            } else if (link.path ==
                '/payments/payment-summary/invoice-details') {
              final failureOrSuccess =
                  repository.extractPaymentBatchAdditionalInfo(link: link);

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (paymentBatchAdditionalInfo) => emit(
                  DeepLinkingState.redirectPaymentDetail(
                    paymentBatchAdditionalInfo,
                  ),
                ),
              );
            }
          },
          redirectProductDetail: (_) {},
          redirectBundleDetail: (_) {},
          redirectOrderDetail: (_) {},
          redirectReturnDetail: (_) {},
          redirectPaymentDetail: (_) {},
          error: (_) {},
        );
      },
    );
  }

  @override
  Future<void> close() {
    dynamicLinkStream?.cancel();

    return super.close();
  }
}
