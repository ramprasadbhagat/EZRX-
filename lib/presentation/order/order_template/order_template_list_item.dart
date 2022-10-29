import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/presentation/core/action_button.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class OrderTemplateListItem extends StatelessWidget {
  final OrderTemplate orderTemplate;
  const OrderTemplateListItem({Key? key, required this.orderTemplate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderTemplateListBloc, OrderTemplateListState>(
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final failureMessage = failure.failureMessage;
              showSnackBar(
                context: context,
                message: failureMessage.tr(),
              );
              if (failureMessage == 'authentication failed') {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              }
            },
            (_) {
              context.read<AuthBloc>().add(const AuthEvent.authCheck());
            },
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return Container(
          key: Key(
            'materialOption${orderTemplate.templateId}',
          ),
          child: Card(
            elevation: 1.0,
            margin: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          orderTemplate.templateName,
                          softWrap: true,
                          style: _textStyle,
                        ),
                      ),
                    ],
                  ),
                  _sizedBoxH20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionButton(
                        text: 'View',
                        width: 72,
                        onTap: () {
                          context.read<MaterialPriceDetailBloc>().add(
                                MaterialPriceDetailEvent.fetch(
                                  customerCode: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                  salesOrganisation: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  salesOrganisationConfigs: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .configs,
                                  shipToCode: context
                                      .read<ShipToCodeBloc>()
                                      .state
                                      .shipToInfo,
                                  materialInfos: orderTemplate.cartItems
                                      .map(
                                        (item) =>
                                            MaterialQueryInfo.fromOrderTemplate(
                                          orderMaterial: item,
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                          //TODO: Navigate to Detail and handle Price UI logic
                        },
                      ),
                      _sizedBoxW20,
                      ActionButton(
                        text: 'Delete',
                        width: 72,
                        onTap: () {
                          showPlatformDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => PlatformAlertDialog(
                              title: const Text('Info').tr(),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    const Text(
                                      'This action will delete the item from your order templates.',
                                    ).tr(),
                                    const Text('Do you want to proceed?').tr(),
                                  ],
                                ),
                              ),
                              actions: [
                                PlatformDialogAction(
                                  child: const Text('Cancel').tr(),
                                  onPressed: () {
                                    context.router.pop();
                                  },
                                ),
                                PlatformDialogAction(
                                  child: const Text('Confirm').tr(),
                                  onPressed: () {
                                    context.router.pop();
                                    context.read<OrderTemplateListBloc>().add(
                                          OrderTemplateListEvent.delete(
                                            orderTemplate,
                                          ),
                                        );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static const _sizedBoxW20 = SizedBox(
    width: 20,
  );

  static const _sizedBoxH20 = SizedBox(
    height: 20,
  );
  static const _textStyle = TextStyle(
    fontSize: 18.0,
    color: ZPColors.black,
    fontWeight: FontWeight.w600,
  );
}
