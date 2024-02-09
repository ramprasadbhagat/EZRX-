import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_linking_event.dart';

part 'deep_linking_state.dart';

part 'deep_linking_bloc.freezed.dart';

class DeepLinkingBloc extends Bloc<DeepLinkingEvent, DeepLinkingState> {
  final DeepLinkingService service;
  final ChatBotService chatBotService;
  final IDeepLinkingRepository repository;
  StreamSubscription? dynamicLinkStream;

  DeepLinkingBloc({
    required this.service,
    required this.repository,
    required this.chatBotService,
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
      addPendingLink: (event) async {
        emit(
          DeepLinkingState.linkPending(event.link),
        );
        // ChatBot is managed by plugin and the ChatBot screen is an overlay.
        // For now, whenever we tap on the deep link, a screen opened from the
        // link will be behind the ChatBot, so we need to close the chatbot when
        // receive the link to be able to see the screen from the link
        await chatBotService.closeChatBot();
      },
      consumePendingLink: (event) {
        state.whenOrNull(
          linkPending: (link) {
            if (link.path == '/contact-us') {
              final failureOrSuccess = repository.getCurrentMarket();

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (market) => emit(
                  DeepLinkingState.redirectContactUs(market),
                ),
              );
            }

            if (event.selectedShipTo == ShipToInfo.empty()) {
              emit(
                const DeepLinkingState.error(
                  ApiFailure.other('Please login to proceed'),
                ),
              );

              return;
            }

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
            } else if (link.path == '/product-listing') {
              final failureOrSuccess = repository.extractProductSearchKey(
                link: link,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (searchKey) => emit(
                  DeepLinkingState.redirectProductSuggestion(searchKey),
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
                  repository.extractPaymentIdentifierInfo(link: link);

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
            } else if (link.path ==
                '/payments/account-summary/invoice-details') {
              final failureOrSuccess =
                  repository.extractInvoiceNumber(link: link);

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (invoiceNumber) => emit(
                  DeepLinkingState.redirectInvoiceDetail(invoiceNumber),
                ),
              );
            } else if (link.path == '/my-account/payments') {
              emit(const DeepLinkingState.redirectPaymentHome());
            } else if (link.path == '/faq') {
              emit(const DeepLinkingState.redirectFAQ());
            } else if (link.path == '/about-us') {
              emit(const DeepLinkingState.redirectAboutUs());
            } else {
              emit(
                const DeepLinkingState.error(
                  ApiFailure.other('Link is not valid'),
                ),
              );
            }
          },
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
