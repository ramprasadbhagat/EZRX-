import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/orders_expansion_tile.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/payments_expansion_tile.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/returns_expansion_tile.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/home/selector/sales_org_selector.dart';
import 'package:ezrxmobile/presentation/home/selector/shipping_address_selector.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/orders/core/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ezrxmobile/locator.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configService = locator<RemoteConfigService>();

    return Scaffold(
      key: const Key('homeScreen'),
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset('assets/svg/ezrxlogo.svg', height: 30),
        automaticallyImplyLeading: false,
        actions: const [CartButton()],
        toolbarHeight: kToolbarHeight + 8.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              children: const [
                SalesOrgSelector(key: ValueKey('homeSalesOrgSelector')),
                CustomerCodeSelector(key: ValueKey('homeCustomerCodeSelector')),
                ShipCodeSelector(key: ValueKey('homeShipCodeSelector')),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          AnnouncementWidget(
            currentPath: const HomeTabRoute().path,
            key: const Key('homeTabAnnouncementWidget'),
          ),
          const EdiUserBanner(),
          const AccountSuspendedBanner(),
          const HomeBanner(
            key: ValueKey('HomeBanner'),
          ),
          const OrdersExpansionTile(),
          configService.getReturnsConfig()
              ? const ReturnsExpansionTile()
              : const SizedBox.shrink(),
          configService.getPaymentsConfig()
              ? const PaymentsExpansionTile()
              : const SizedBox.shrink(),
        ],
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
