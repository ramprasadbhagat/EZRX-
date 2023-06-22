import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/favourites/favourite_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';

class FavouritesTab extends StatelessWidget implements AutoRouteWrapper {
  const FavouritesTab({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<MaterialPriceDetailBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('favouritesPage'),
      appBar: AppBar(
        title: const Text('Favourites').tr(),
        automaticallyImplyLeading: false,
        actions: const [CartButton()],
      ),
      body: Column(
        children: [
          AnnouncementWidget(
            currentPath: const FavouritesTabRoute().path,
          ),
          const AccountSuspendedBanner(),
          Expanded(
            child: BlocConsumer<FavouriteBloc, FavouriteState>(
              listenWhen: (previous, current) {
                return previous.failureOrSuccessOption !=
                        current.failureOrSuccessOption ||
                    (previous.isLoading != current.isLoading);
              },
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
                if (state.favouriteItems.isNotEmpty && !state.isLoading) {
                  context.read<MaterialPriceDetailBloc>().add(
                        MaterialPriceDetailEvent.fetch(
                          user: context.read<UserBloc>().state.user,
                          customerCode: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customerCodeInfo,
                          salesOrganisation: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation,
                          salesOrganisationConfigs:
                              context.read<SalesOrgBloc>().state.configs,
                          shipToCode:
                              context.read<CustomerCodeBloc>().state.shipToInfo,
                          materialInfoList: state.favouriteItems
                              .map(
                                (item) => MaterialQueryInfo.fromFavorite(
                                  material: item,
                                ),
                              )
                              .toList(),
                          pickAndPack: context
                              .read<EligibilityBloc>()
                              .state
                              .getPNPValueMaterial,
                        ),
                      );
                }
              },
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading ||
                  previous.favouriteItems != current.favouriteItems,
              builder: (context, favoriteState) {
                if (favoriteState.isLoading) {
                  return LoadingShimmer.logo(key: const Key('LoaderImage'));
                }

                return _FavoriteScrollList(
                  favoriteState: favoriteState,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteScrollList extends StatelessWidget {
  const _FavoriteScrollList({
    Key? key,
    required this.favoriteState,
  }) : super(key: key);
  final FavouriteState favoriteState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
      buildWhen: (previous, current) =>
          previous.isValidating != current.isValidating,
      builder: (context, priceState) {
        if (priceState.isValidating) {
          return LoadingShimmer.logo(key: const Key('LoaderImage'));
        }

        final validFavoriteItems = favoriteState.favouriteItems
            .where(
              (item) => priceState.isValidMaterial(
                query: MaterialQueryInfo.fromFavorite(material: item),
              ),
            )
            .toList();

        return ScrollList<Favourite>(
          emptyMessage: 'No favorite found'.tr(),
          controller: ScrollController(),
          onRefresh: () {
            context.read<MaterialPriceDetailBloc>().add(
                  const MaterialPriceDetailEvent.initialized(),
                );
            context.read<FavouriteBloc>().add(
                  FavouriteEvent.fetch(
                    user: context.read<UserBloc>().state.user,
                  ),
                );
          },
          isLoading: false,
          itemBuilder: (context, index, itemInfo) {
            return FavouriteListTile(
              key: Key('FavouriteItem$index'),
              favourite: itemInfo,
            );
          },
          items: validFavoriteItems,
        );
      },
    );
  }
}
