import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerCodeSelector extends StatelessWidget {
  const CustomerCodeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          minLeadingWidth: 40,
          horizontalTitleGap: 0,
          dense: true,
          key: WidgetKeys.customerCodeSelect,
          onTap: state.isFetching
              ? null
              : () => context.router.pushNamed('customer_search'),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on_outlined),
            ],
          ),
          title: state.isFetching
              ? LoadingShimmer.tile()
              : Text(
                  state.shipToInfo == ShipToInfo.empty()
                      ? 'NA'.tr()
                      : state.shipToInfo.shipToCustomerCode,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
          subtitle: state.isFetching
              ? LoadingShimmer.tile()
              : Row(
                  children: [
                    Expanded(
                      child: Text(
                        state.displayShipTo.tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: ZPColors.primary,
                    ),
                  ],
                ),
        );
      },
    );
  }
}
