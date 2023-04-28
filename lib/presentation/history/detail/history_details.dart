import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/history/detail/section/bill_to_section.dart';
import 'package:ezrxmobile/presentation/history/detail/section/invoice_section.dart';
import 'package:ezrxmobile/presentation/history/detail/section/order_detail_section.dart';
import 'package:ezrxmobile/presentation/history/detail/section/order_summary_section.dart';
import 'package:ezrxmobile/presentation/history/detail/section/po_attachment_section.dart';
import 'package:ezrxmobile/presentation/history/detail/section/ship_to_section.dart';
import 'package:ezrxmobile/presentation/history/detail/section/sold_to_section.dart';
import 'package:ezrxmobile/presentation/history/detail/section/system_message_section.dart';
import 'package:ezrxmobile/presentation/history/detail/widget/re_order_button.dart';

class HistoryDetails extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final BillToInfo billToInfo;
  final CustomerCodeInfo customerCodeInfo;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;
  final SalesOrganisationConfigs salesOrgConfigs;

  const HistoryDetails({
    Key? key,
    required this.orderHistoryItem,
    required this.billToInfo,
    required this.customerCodeInfo,
    required this.orderHistoryBasicInfo,
    required this.salesOrgConfigs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trackMixpanelEvent(
      MixpanelEvents.orderDetailPageView,
    );
    final disableCreateOrder =
        !context.read<UserBloc>().state.userCanCreateOrder;

    return MultiBlocListener(
      listeners: [
        BlocListener<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          listener: (context, state) {
            final eligibilityState = context.read<EligibilityBloc>().state;
            context.read<MaterialPriceDetailBloc>().add(
                  MaterialPriceDetailEvent.fetch(
                    user: eligibilityState.user,
                    customerCode: eligibilityState.customerCodeInfo,
                    salesOrganisation: eligibilityState.salesOrganisation,
                    salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
                    shipToCode: eligibilityState.shipToInfo,
                    materialInfoList:
                        state.orderHistoryDetails.allItemQueryInfo,
                    skipFOCCheck: true,
                    pickAndPack: context
                        .read<EligibilityBloc>()
                        .state
                        .getPNPValueMaterial,
                  ),
                );
          },
        ),
        BlocListener<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  final failureMessage = failure.failureMessage;
                  showSnackBar(
                    context: context,
                    message: failureMessage.tr(),
                  );
                },
                (success) {},
              ),
            );
          },
        ),
      ],
      child: Scaffold(
        key: const ValueKey('orderHistoryDetailsPage'),
        appBar: AppBar(
          leading: IconButton(
            key: const ValueKey('backToOrderHistoryDetailsPage'),
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () => context.router.pop(),
          ),
          title: Text('#//${orderHistoryItem.orderNumber.getOrCrash()}'.tr()),
          actions: disableCreateOrder
              ? <Widget>[]
              : <Widget>[
                  const ReOrderButton(fromTopMenu: true),
                ],
        ),
        body: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 20,
            ),
            key: const Key('scrollHistoryDetail'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HistorySystemMessageSection(),
                const HistoryOrderDetailSection(),
                const HistorySoldToSection(
                  key: Key('soldToAddressWidget'),
                ),
                const HistoryShipToSection(
                  key: Key('shipToAddressWidget'),
                ),
                if (context.read<EligibilityBloc>().state.isBillToInfo)
                  HistoryBillToSection(
                    billToInfo: billToInfo,
                  ),
                if (context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .showPOAttachment)
                  const HistoryPoAttachmentSection(),
                const HistoryInvoiceSection(),
                HistoryOrderSummarySection(
                  salesOrgConfigs: salesOrgConfigs,
                ),
                const ReOrderButton(fromTopMenu: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
