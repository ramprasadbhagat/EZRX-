import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ShipCodeSelector extends StatelessWidget {
  const ShipCodeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, customerCodeState) {
        return BlocConsumer<ShipToCodeBloc, ShipToCodeState>(
          listenWhen: (previous, current) =>
              previous.shipToInfo != current.shipToInfo,
          listener: (context, state) {
            if (state.haveShipTo) {
              context.read<SavedOrderListBloc>().add(
                    SavedOrderListEvent.fetch(
                      userInfo: context.read<UserBloc>().state.user,
                      selectedSalesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      selectedCustomerCode: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customeCodeInfo,
                      selectedShipTo: state.shipToInfo,
                    ),
                  );
            } else {
              context
                  .read<SavedOrderListBloc>()
                  .add(const SavedOrderListEvent.initialized());
            }
          },
          buildWhen: (previous, current) =>
              previous.shipToInfo != current.shipToInfo,
          builder: (context, state) {
            return CustomSelector(
              key: const Key('shipToCodeSelect'),
              title: 'Shipping Address',
              onTap: customerCodeState.isFetching
                  ? null
                  : () => showPlatformDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (_) => PlatformAlertDialog(
                          title: const Text('Please select a shipping address')
                              .tr(),
                          actions: customerCodeState.customeCodeInfo.shipToInfos
                              .map(
                                (shipToInfo) => PlatformDialogAction(
                                  key: Key(
                                    'shipToOption${shipToInfo.shipToCustomerCode}',
                                  ),
                                  child: Text(
                                    shipToInfo.shipToCustomerCode,
                                    style: TextStyle(
                                      fontWeight:
                                          shipToInfo.defaultShipToAddress
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                      color: shipToInfo.defaultShipToAddress
                                          ? ZPColors.secondary
                                          : Colors.blueAccent,
                                    ),
                                  ),
                                  onPressed: () {
                                    context.read<ShipToCodeBloc>().add(
                                          ShipToCodeEvent.selected(
                                            shipToInfo: shipToInfo,
                                          ),
                                        );
                                    context.router.pop();
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
              child: customerCodeState.isFetching
                  ? LoadingShimmer.tile()
                  : Text(
                      customerCodeState.apiFailureOrSuccessOption.isNone()
                          ? state.shipToInfo.shipToCustomerCode
                          : 'No Shipping',
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.primary,
                          ),
                    ).tr(),
            );
          },
        );
      },
    );
  }
}
