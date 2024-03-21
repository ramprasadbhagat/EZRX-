import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_section.dart';
import 'package:ezrxmobile/presentation/home/banners/top_advert_box_banner/top_advert_box_banner.dart';
import 'package:ezrxmobile/presentation/home/combo_offers_section/combo_offers_section.dart';
import 'package:ezrxmobile/presentation/home/product_offer_section/product_offer_section.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/home/browse_products/browse_products.dart';
import 'package:ezrxmobile/presentation/home/widgets/explore_marketplace_banner.dart';
import 'package:ezrxmobile/presentation/home/widgets/quick_access_menu.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/widgets/edi_user_banner.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/orders/recent_order/recent_order_section.dart';

import 'package:ezrxmobile/presentation/home/bundle_section/bundle_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //BlocBuilder is required here as there is a delay in userbloc
    //due to delay UI is not updating according to accessright value
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          //check user role and accessRight as getter depends on both

          previous.salesOrgConfigs != current.salesOrgConfigs ||
          previous.customerCodeInfo != current.customerCodeInfo ||
          (previous.shipToInfo != current.shipToInfo && current.haveShipTo),
      builder: (context, state) {
        return Scaffold(
          key: WidgetKeys.homeScreen,
          appBar: CustomAppBar.homeTabAppBar(
            title: const CustomerCodeSelector(
              key: WidgetKeys.customerCodeSelector,
            ),
            actionWidget: const [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CartButton(),
              ),
            ],
            customerBlockedOrSuspended: state.customerBlockOrSuspended,
            isSearchBarVisible: state.user.userCanAccessProducts,
            boxShadowColor: state.disableCreateOrder
                ? ZPColors.customerBlockedBannerColor
                : ZPColors.white,
          ),
          //SingleChildScrollView and Column is needed
          //as the ListView is rebuilding the BrowseProduct & BundleSection
          //and it was recreating the BlocProvider
          body: RefreshIndicator(
            onRefresh: () async => context.read<SalesOrgBloc>().add(
                  SalesOrgEvent.loadSavedOrganisation(
                    salesOrganisations: context
                        .read<EligibilityBloc>()
                        .state
                        .user
                        .userSalesOrganisations,
                  ),
                ),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  AnnouncementWidget(
                    currentPath: const HomeTabRoute().path,
                    key: WidgetKeys.homeTabAnnouncementWidget,
                  ),
                  const EdiUserBanner(),
                  const QuickAccessMenuPanel(),
                  const CarouselBanner(),
                  BlocBuilder<EligibilityBloc, EligibilityState>(
                    buildWhen: (previous, current) =>
                        previous.marketPlaceEligible !=
                        current.marketPlaceEligible,
                    builder: (context, state) => state.marketPlaceEligible
                        ? const ExploreMarketPlaceBanner()
                        : const SizedBox(),
                  ),
                  BlocBuilder<EligibilityBloc, EligibilityState>(
                    buildWhen: (previous, current) =>
                        previous.comboDealEligible != current.comboDealEligible,
                    builder: (context, state) {
                      if (state.comboDealEligible) {
                        return const ComboOffersSection();
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                  if (state.haveShipTo && state.user.userCanAccessProducts) ...[
                    const ProductsOnOffer(),
                    if (!state.salesOrgConfigs.disableBundles)
                      const BundleSection(),
                  ],
                  if (state.haveShipTo && state.user.userCanAccessOrderHistory)
                    const RecentOrdersSection(),
                  if (state.haveShipTo && state.user.userCanAccessProducts)
                    const BrowseProduct(),
                  const TopAdvertBoxBanner(),
                  const AnnouncementSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
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
