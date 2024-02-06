import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_customer_code_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/chatbot/repository/i_chatbot_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/mixpanel/repository/i_mixpanel_repository.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';

part 'eligibility_event.dart';

part 'eligibility_state.dart';

part 'eligibility_bloc.freezed.dart';

class EligibilityBloc extends Bloc<EligibilityEvent, EligibilityState> {
  final IChatBotRepository chatBotRepository;
  final IMixpanelRepository mixpanelRepository;
  final ICustomerCodeRepository customerCodeRepository;
  final Config config;

  EligibilityBloc({
    required this.chatBotRepository,
    required this.mixpanelRepository,
    required this.customerCodeRepository,
    required this.config,
  }) : super(EligibilityState.initial()) {
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
            selectedOrderType: e.selectedOrderType,
            isLoading: true,
          ),
        );
        mixpanelRepository.registerSuperProps(
          user: e.user,
          salesOrg: e.salesOrganisation.salesOrg,
          salesOrgConfigs: e.salesOrgConfigs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
        );

        final failureOrSuccess = await chatBotRepository.passPayloadToChatbot(
          salesOrganisation: state.salesOrganisation,
          user: state.user,
          salesOrganisationConfigs: state.salesOrgConfigs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          locale: state.user.preferredLanguage.locale,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (value) {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      selectedCustomerCode: (e) async {
        await customerCodeRepository.storeCustomerInfo(
          customerCode: e.customerCodeInfo.customerCodeSoldTo,
          shippingAddress: e.shipToInfo.shipToCustomerCode,
        );
        emit(
          state.copyWith(
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
          ),
        );
      },
      loadStoredCustomerCode: (e) async {
        emit(
          state.copyWith(
            isLoadingCustomerCode: true,
            preSelectShipTo: false,
          ),
        );

        final customerStorageSuccessOrFailure =
            await customerCodeRepository.getCustomerCodeStorage();

        final lastSavedCustomerInfo = customerStorageSuccessOrFailure.fold(
          (_) => AccountSelector.empty(),
          (accountSelector) => accountSelector,
        );

        if (lastSavedCustomerInfo.customerCode.isEmpty) {
          add(
            const EligibilityEvent.fetchAndPreSelectCustomerCode(),
          );

          return;
        }

        // Using the last saved shippingAddress to fetch current customerInformation
        // as we do not receive all the shipToCodes associated with a customerCode
        // at once. Necessary because when using the last saved customerCode,
        // If the required shipToCode is on a paginated page beyond the first,
        // the default behavior sets the first shipToCode as the shippingAddress.

        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: state.salesOrganisation,
          customerCodes: [lastSavedCustomerInfo.shippingAddress],
          hideCustomer: state.salesOrgConfigs.hideCustomer,
          user: state.user,
          pageSize: config.pageSize,
          offset: 0,
        );

        final customerCodeInfoList =
            failureOrSuccess.fold<List<CustomerCodeInfo>>(
          (_) => <CustomerCodeInfo>[],
          (customerInformation) => customerInformation.soldToInformation,
        );

        if (customerCodeInfoList.isEmpty) {
          add(
            const EligibilityEvent.fetchAndPreSelectCustomerCode(),
          );

          return;
        }

        var shipToInfo = ShipToInfo.empty();
        if (lastSavedCustomerInfo.shippingAddress.isNotEmpty) {
          shipToInfo = customerCodeInfoList.first.shipToInfos.firstWhere(
            (shipToInfo) =>
                shipToInfo.shipToCustomerCode ==
                lastSavedCustomerInfo.shippingAddress,
            orElse: () => ShipToInfo.empty(),
          );
        }

        final customerCodeInfo = customerCodeInfoList.firstWhere(
          (element) =>
              element.customerCodeSoldTo == lastSavedCustomerInfo.customerCode,
          orElse: () => customerCodeInfoList.first,
        );

        emit(
          state.copyWith(
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo == ShipToInfo.empty()
                ? customerCodeInfoList.first.shipToInfos.first
                : shipToInfo,
            isLoadingCustomerCode: false,
            preSelectShipTo: true,
          ),
        );
      },
      fetchAndPreSelectCustomerCode: (e) async {
        final finalCustomerCodeInfo = state.salesOrganisation.customerInfos;

        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: state.salesOrganisation,
          customerCodes: finalCustomerCodeInfo
              .map(
                (customerItem) =>
                    customerItem.customerCodeSoldTo.checkAllOrCustomerCode,
              )
              .toList(),
          hideCustomer: state.salesOrgConfigs.hideCustomer,
          user: state.user,
          pageSize: config.pageSize,
          offset: 0,
        );

        final customerCodeInfoList =
            failureOrSuccess.fold<List<CustomerCodeInfo>>(
          (_) => <CustomerCodeInfo>[],
          (customerInformation) => customerInformation.soldToInformation,
        );

        emit(
          state.copyWith(
            customerCodeInfo: customerCodeInfoList.preSelectedCustomerCodeInfo,
            shipToInfo: customerCodeInfoList.preSelectedShipToInfo,
            isLoadingCustomerCode: false,
            preSelectShipTo: customerCodeInfoList.canPreSelectShipToCode,
          ),
        );
      },
    );
  }
}
