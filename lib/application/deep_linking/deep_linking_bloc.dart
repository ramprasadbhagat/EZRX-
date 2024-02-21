import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password_cred.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_linking_event.dart';

part 'deep_linking_state.dart';

part 'deep_linking_bloc.freezed.dart';

class DeepLinkingBloc extends Bloc<DeepLinkingEvent, DeepLinkingState> {
  final ChatBotService chatBotService;
  final IDeepLinkingRepository repository;
  StreamSubscription<EzrxLink>? _deepLinkStreamSubscription;

  DeepLinkingBloc({
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
        await _deepLinkStreamSubscription?.cancel();

        _deepLinkStreamSubscription = repository.watchDeepLinkValue().listen(
              (event) => add(
                DeepLinkingEvent.addPendingLink(event),
              ),
            );
        final failureOrSuccess = await repository.initializeDeepLink();

        failureOrSuccess.fold(
          (failure) => emit(
            DeepLinkingState.error(failure),
          ),
          (success) {},
        );
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
            if (link.isContactUs) {
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

            if (event.selectedShipTo == ShipToInfo.empty() &&
                !link.isResetPassword) {
              emit(
                const DeepLinkingState.error(
                  ApiFailure.other('Please login to proceed'),
                ),
              );

              return;
            }
            if (link.isResetPassword) {
              final failureOrSuccess = repository.extractResetPasswordCred(
                link: link.resetPasswordFilteredUri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (resetPassword) => emit(
                  DeepLinkingState.redirectResetPassword(resetPassword),
                ),
              );
            }

            if (link.isProductDetail) {
              final failureOrSuccess = repository.extractMaterialNumber(
                link: link.uri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (materialNumber) => emit(
                  DeepLinkingState.redirectProductDetail(materialNumber),
                ),
              );
            } else if (link.isBundleDetail) {
              final failureOrSuccess = repository.extractMaterialNumber(
                link: link.uri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (materialNumber) => emit(
                  DeepLinkingState.redirectBundleDetail(materialNumber),
                ),
              );
            } else if (link.isProductListing) {
              final failureOrSuccess = repository.extractProductSearchKey(
                link: link.uri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (searchKey) => emit(
                  DeepLinkingState.redirectProductSuggestion(searchKey),
                ),
              );
            } else if (link.isOrderDetail) {
              final failureOrSuccess = repository.extractOrderNumber(
                selectedCustomerCode: event.selectedCustomerCode,
                selectedShipTo: event.selectedShipTo,
                link: link.uri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (orderNumber) => emit(
                  DeepLinkingState.redirectOrderDetail(orderNumber),
                ),
              );
            } else if (link.isReturnSummaryDetail) {
              final failureOrSuccess = repository.extractReturnId(
                selectedCustomerCode: event.selectedCustomerCode,
                selectedShipTo: event.selectedShipTo,
                link: link.uri,
              );

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (returnId) => emit(
                  DeepLinkingState.redirectReturnDetail(returnId),
                ),
              );
            } else if (link.isPaymentSummaryInvoiceDetail) {
              final failureOrSuccess =
                  repository.extractPaymentIdentifierInfo(link: link.uri);

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
            } else if (link.isAccountSummaryInvoiceDetail) {
              final failureOrSuccess =
                  repository.extractInvoiceNumber(link: link.uri);

              failureOrSuccess.fold(
                (error) => emit(
                  DeepLinkingState.error(error),
                ),
                (invoiceNumber) => emit(
                  DeepLinkingState.redirectInvoiceDetail(invoiceNumber),
                ),
              );
            } else if (link.isMyAccountPayment) {
              emit(const DeepLinkingState.redirectPaymentHome());
            } else if (link.isFaq) {
              emit(const DeepLinkingState.redirectFAQ());
            } else if (link.isAboutUs) {
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
    _deepLinkStreamSubscription?.cancel();

    return super.close();
  }
}
