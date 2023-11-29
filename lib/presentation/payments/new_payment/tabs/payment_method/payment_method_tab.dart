import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/color_container.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/details_info_section.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/or_divider.dart';
import 'package:ezrxmobile/presentation/core/rich_text_span.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/payment_item_list_view.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/payment_method_selector.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/note_announcement.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/warning_announcement.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/instruction_note.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/bank_info.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/bank_info_detail.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/payment_option_item.dart';
part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/apl_payment_method.dart';

class PaymentMethodTab extends StatelessWidget {
  const PaymentMethodTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final saleOrg = context.read<EligibilityBloc>().state.salesOrg;

    return ListView(
      children: [
        if (!saleOrg.isID) const _NoteAnnouncement(),
        DetailsInfoSection(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          label: saleOrg.isID ? '' : 'Select payment method',
          labelStyle: Theme.of(context).textTheme.labelMedium,
          child: Column(
            children: [
              if (saleOrg.isPH) const _WarningAnnouncement(),
              const _PaymentMethodSelector(),
              BlocConsumer<NewPaymentBloc, NewPaymentState>(
                listenWhen: (previous, current) =>
                    previous.selectedPaymentMethod !=
                        current.selectedPaymentMethod &&
                    current.selectedPaymentMethod.paymentMethod.isBankIn,
                listener: (context, state) {
                  context.read<BankInAccountsBloc>().add(
                        BankInAccountsEvent.bankInFetch(
                          salesOrg: saleOrg,
                        ),
                      );
                },
                buildWhen: (previous, current) =>
                    previous.selectedPaymentMethod !=
                    current.selectedPaymentMethod,
                builder: (context, state) {
                  return state.selectedPaymentMethod.paymentMethod.isBankIn
                      ? const _BankInfo(
                          key: WidgetKeys.bankInAccountInfo,
                        )
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
        DetailsInfoSection(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          label: 'Payment details',
          child: Column(
            children: [
              const SizedBox(height: 20),
              AddressInfoSection.noAction(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const _PaymentItemListView(),
      ],
    );
  }
}
