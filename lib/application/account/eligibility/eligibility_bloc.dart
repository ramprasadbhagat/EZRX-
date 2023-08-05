import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/chatbot/repository/i_chatbot_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';

part 'eligibility_event.dart';
part 'eligibility_state.dart';
part 'eligibility_bloc.freezed.dart';

class EligibilityBloc extends Bloc<EligibilityEvent, EligibilityState> {
  final IChatBotRepository chatBotRepository;
  EligibilityBloc({required this.chatBotRepository})
      : super(EligibilityState.initial()) {
    on<EligibilityEvent>(_onEvent);
  }

  Future<void> _onEvent(
    EligibilityEvent event,
    Emitter<EligibilityState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(EligibilityState.initial()),
      update: (e) async {
        emit(
          state.copyWith(
            user: e.user,
            salesOrganisation: e.salesOrganisation,
            salesOrgConfigs: e.salesOrgConfigs,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            selectedOrderType: e.selectedOrderType,
          ),
        );
        final failureOrSuccess = await chatBotRepository.passPayloadToChatbot(
          salesOrganisation: state.salesOrganisation,
          user: state.user,
          salesOrganisationConfigs: state.salesOrgConfigs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (value) {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void onChange(Change<EligibilityState> change) {
    super.onChange(change);
    // print(change);
  }
}
