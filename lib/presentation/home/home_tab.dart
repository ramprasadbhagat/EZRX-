import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/orders_expansion_tile.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/payments_expansion_tile.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/returns_expansion_tile.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/orders/core/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ezrxmobile/locator.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configService = locator<RemoteConfigService>();

    return Scaffold(
      key: WidgetKeys.homeScreen,
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset('assets/svg/ezrxlogo.svg', height: 30),
        automaticallyImplyLeading: false,
        actions: const [CartButton()],
        toolbarHeight: kToolbarHeight + 8.0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: CustomerCodeSelector(
              key: WidgetKeys.homeCustomerCodeSelector,
            ),
          ),
        ),
      ),
      body: BlocListener<MaterialListBloc, MaterialListState>(
        listenWhen: (previous, current) =>
            previous.nextPageIndex != current.nextPageIndex,
        listener: (context, state) {
          if (state.materialList.isNotEmpty) {
            context.read<MaterialPriceBloc>().add(
                  MaterialPriceEvent.fetch(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    salesConfigs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    comboDealEligible:
                        context.read<EligibilityBloc>().state.comboDealEligible,
                    materials: state.materialList,
                  ),
                );
          }
        },
        child: ListView(
          children: [
            AnnouncementWidget(
              currentPath: const HomeTabRoute().path,
              key: WidgetKeys.homeTabAnnouncementWidget,
            ),
            const EdiUserBanner(),
            const AccountSuspendedBanner(),
            const HomeBanner(),
            const OrdersExpansionTile(),
            configService.getReturnsConfig()
                ? const ReturnsExpansionTile()
                : const SizedBox.shrink(),
            configService.getPaymentsConfig()
                ? const PaymentsExpansionTile()
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class HomePageTile {
  const HomePageTile({
    this.key,
    required this.title,
    required this.icon,
    required this.routeName,
  });

  final Key? key;
  final String title;
  final IconData icon;
  final String routeName;
}

// class _WelcomeUser extends StatelessWidget {
//   const _WelcomeUser({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserBloc, UserState>(
//       listenWhen: (previous, current) => previous.user != current.user,
//       listener: (context, state) {
//         state.userFailureOrSuccessOption.fold(
//           () {},
//           (either) => either.fold(
//             (failure) {
//               final failureMessage = failure.failureMessage;
//               showSnackBar(context: context, message: failureMessage.tr());
//               if (failureMessage == 'authentication failed') {
//                 context.read<AuthBloc>().add(const AuthEvent.logout());
//               }
//             },
//             (_) {},
//           ),
//         );
//       },
//       buildWhen: (previous, current) => previous.user != current.user,
//       builder: (context, state) {
//         return state.isNotEmpty
//             ? Text(
//                 state.userFullName.toString(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline6
//                     ?.apply(color: ZPColors.darkGray),
//               )
//             : LoadingShimmer.tile(line: 3);
//       },
//     );
//   }
// }
