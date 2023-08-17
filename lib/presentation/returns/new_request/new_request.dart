import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewRequestPage extends StatelessWidget {
  const NewRequestPage({Key? key}) : super(key: key);
  final _tabs = const [
    ReturnItemsTabRoute(),
    ReturnDetailsTabRoute(),
    ReturnReviewTabRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: _tabs,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, tabController) {
        final step = tabController.index + 1;
        var title = '';
        switch (step) {
          case 1:
            title = 'Select item(s) to return'.tr();
            break;
          case 2:
            title = 'Fill in return details'.tr();
            break;
          default:
            title = 'Review return details'.tr();
        }

        return Scaffold(
          key: WidgetKeys.newRequestPage,
          appBar: AppBar(
            centerTitle: false,
            title: const Text('New return request').tr(),
            leading: _PreviousButton(
              tabController: tabController,
              step: step,
            ),
          ),
          body: AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: BlocBuilder<NewRequestBloc, NewRequestState>(
              buildWhen: (previous, current) =>
                  previous.selectedItems != current.selectedItems,
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    'Step $step of ${_tabs.length}: $title',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ZPColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                LinearProgressIndicator(
                                  value: step / _tabs.length,
                                  backgroundColor: ZPColors.accentColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: child,
                          ),
                        ],
                      ),
                    ),
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        color: ZPColors.whiteBgCard,
                      ),
                      child: SafeArea(
                        top: false,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: ZPColors.lightGray2,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${'Return for'.tr()} ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerName.name1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const Icon(Icons.chevron_right),
                                  ],
                                ),
                              ),
                              Text(
                                '${state.selectedItems.length} item(s) selected'
                                    .tr(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Return Total: '.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ZPColors.darkGray,
                                        ),
                                  ),
                                  PriceComponent(
                                    salesOrgConfig: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .configs,
                                    price: state.selectedItems.amountTotal
                                        .toString(),
                                  ),
                                  const Spacer(),
                                  if (step == 1)
                                    _NextButton(
                                      tabController: tabController,
                                      enabled: state.selectedItems.isNotEmpty,
                                    ),
                                  if (step == 2)
                                    _NextButton(
                                      tabController: tabController,
                                      enabled: true,
                                    ),
                                  if (step == 3)
                                    ElevatedButton(
                                      key: WidgetKeys.submitButton,
                                      onPressed: null,
                                      child: Text(
                                        'Submit'.tr(),
                                        style: const TextStyle(
                                          color: ZPColors.white,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _PreviousButton extends StatelessWidget {
  final TabController tabController;
  final int step;

  const _PreviousButton({
    Key? key,
    required this.tabController,
    required this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return step == 1
        ? IconButton(
            key: WidgetKeys.closeButton,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        : IconButton(
            key: WidgetKeys.backButton,
            onPressed: () {
              tabController.animateTo(
                tabController.index - 1,
              );
            },
            icon: const Icon(Icons.chevron_left),
          );
  }
}

class _NextButton extends StatelessWidget {
  final TabController tabController;
  final bool enabled;
  const _NextButton({
    Key? key,
    required this.tabController,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.nextButton,
      onPressed: enabled
          ? () {
              tabController.animateTo(
                tabController.index + 1,
              );
            }
          : null,
      child: Text(
        'Next'.tr(),
        style: const TextStyle(
          color: ZPColors.white,
        ),
      ),
    );
  }
}
