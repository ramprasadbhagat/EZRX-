import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_month_picker.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'widgets/soa_tile.dart';
part 'widgets/filter_bottom_sheet.dart';
part 'widgets/header.dart';
part 'widgets/filter_button.dart';

class StatementAccountsPage extends StatelessWidget {
  StatementAccountsPage({Key? key}) : super(key: key);

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Statement of accounts'.tr(),
        ),
        centerTitle: false,
      ),
      floatingActionButton: ScaleButton(
        icon: Icons.add,
        label: 'New payment'.tr(),
        onPress: () => _toNewPayment(context),
        scrollController: _scrollController,
      ),
      body: BlocConsumer<SoaBloc, SoaState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.filterList != current.filterList,
        builder: (context, state) {
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: ScrollList<Soa>(
              header: Column(
                children: const [
                  _Header(),
                  _Filter(),
                ],
              ),
              noRecordFoundWidget: const NoRecordFound(
                title: 'No statements available',
                subTitle: '',
                svgImage: SvgImage.emptyOrder,
              ),
              controller: _scrollController,
              onRefresh: () => context.read<SoaBloc>().add(
                    SoaEvent.fetch(
                      customerCodeInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                    ),
                  ),
              onLoadingMore: () {},
              isLoading: state.isFetching,
              itemBuilder: (context, index, itemInfo) {
                return _SoaTile(
                  soa: itemInfo,
                );
              },
              items: state.filterList,
            ),
          );
        },
      ),
    );
  }

  void _toNewPayment(BuildContext context) {
    context.read<OutstandingInvoicesBloc>().add(
          OutstandingInvoicesEvent.fetch(
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            appliedFilter: OutstandingInvoiceFilter.empty(),
            searchKey: SearchKey.search(''),
          ),
        );
    context.read<AvailableCreditsBloc>().add(
          AvailableCreditsEvent.fetch(
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            appliedFilter: AvailableCreditFilter.empty(),
            searchKey: SearchKey.search(''),
          ),
        );
    context.read<NewPaymentBloc>().add(
          const NewPaymentEvent.initialized(),
        );
    context.router.pushNamed('payments/new_payment');
  }
}
