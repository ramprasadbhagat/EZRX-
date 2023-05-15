import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/deep_linking/repository/i_deep_linking_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/dynamic_links.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_linking_event.dart';
part 'deep_linking_state.dart';
part 'deep_linking_bloc.freezed.dart';

//TODO: widget_test

class DeepLinkingBloc extends Bloc<DeepLinkingEvent, DeepLinkingState> {
  final DynamicLinksService service;
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
      initialize: (event) async {
        dynamicLinkStream ??= await service.initDynamicLinks();
      },
      addPendingLink: (event) async {
        emit(
          DeepLinkingState.linkPending(event.link),
        );
      },
      consumePendingLink: (event) async {
        state.when(
          initial: () {},
          linkPending: (link) {
            switch (link.path) {
              case '/material_detail':
                final failureOrSuccess = repository.extractMaterialNumber(
                  selectedSalesOrganisation: event.selectedSalesOrganisation,
                  selectedCustomerCode: event.selectedCustomerCode,
                  selectedShipTo: event.selectedShipTo,
                  link: link,
                );

                failureOrSuccess.fold(
                  (error) => emit(
                    DeepLinkingState.error(error),
                  ),
                  (materialNumber) => emit(
                    DeepLinkingState.redirectMaterialDetail(materialNumber),
                  ),
                );
                break;
              case '/history_details':
                final failureOrSuccess = repository.extractOrderHistory(
                  selectedSalesOrganisation: event.selectedSalesOrganisation,
                  selectedCustomerCode: event.selectedCustomerCode,
                  selectedShipTo: event.selectedShipTo,
                  link: link,
                );

                failureOrSuccess.fold(
                  (error) => emit(
                    DeepLinkingState.error(error),
                  ),
                  (history) => emit(
                    DeepLinkingState.redirectHistoryDetail(history),
                  ),
                );
                break;
              default:
            }
          },
          redirectMaterialDetail: (_) {},
          redirectHistoryDetail: (_) {},
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
