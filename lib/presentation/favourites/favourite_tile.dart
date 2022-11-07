import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/presentation/core/action_button.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteListTile extends StatelessWidget {
  final Favourite favourite;
  const FavouriteListTile({
    Key? key,
    required this.favourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(favourite.materialNumber),
      child: CustomSlidable(
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete',
            icon: Icons.delete_outline,
            onPressed: (context) => context.read<FavouriteBloc>().add(
                  FavouriteEvent.delete(
                    item: favourite,
                    user: context.read<UserBloc>().state.user,
                  ),
                ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            key: const Key('itemClicked'),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: RichText(
                          overflow: TextOverflow.visible,
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    favourite.materialDescription.toUpperCase(),
                                style: const TextStyle(
                                  color: ZPColors
                                      .darkerGreen, // zpDarkerGreenColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      favourite.isWaitingStatusUpdate
                          ? LoadingShimmer.withChild(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.favorite,
                                  color: ZPColors.secondary,
                                ),
                                onPressed: () {},
                              ),
                            )
                          : IconButton(
                              key: const Key('deleteFavouriteFavPage'),
                              icon: const Icon(
                                Icons.favorite,
                                color: ZPColors.secondary,
                              ),
                              onPressed: () async => context
                                  .read<FavouriteBloc>()
                                  .add(
                                    FavouriteEvent.delete(
                                      item: favourite,
                                      user: context.read<UserBloc>().state.user,
                                    ),
                                  ),

                              // context.read<BonusMaterialBloc>().add(
                              //       BonusMaterialEvent.fetch(
                              //         pickandpack: true,
                              //         searchKey: '',
                              //         user: User.empty(),
                              //         configs:
                              //             SalesOrganisationConfigs.empty(),
                              //         customerInfo:
                              //             SalesOrgCustomerInfo.empty(),
                              //         shipInfo: SalesOrgShipToInfo.empty(),
                              //         salesOrganisation:
                              //             SalesOrganisation.empty(),
                              //       ),
                              //     ),
                            ),
                    ],
                  ),
                  Text(
                    "${'Mat No: '.tr()}${favourite.materialNumber.displayMatNo}",
                    style: const TextStyle(
                      color: ZPColors.darkGray,
                      fontSize: 12,
                    ),
                  ),
                  BlocBuilder<MaterialPriceDetailBloc,
                      MaterialPriceDetailState>(
                    buildWhen: (previous, current) =>
                        previous.isFetching != current.isFetching,
                    builder: (context, state) {
                      final queryInfo =
                          MaterialQueryInfo.fromFavorite(material: favourite);
                      final priceDetail = state.materialDetails[queryInfo];

                      if (state.isFetching || priceDetail == null) {
                        return SizedBox(
                          key: const Key('price-loading'),
                          width: 40,
                          child: LoadingShimmer.tile(),
                        );
                      }

                      final priceAggregate = PriceAggregate(
                        price: priceDetail.price,
                        materialInfo:
                            MaterialInfo.empty().copyWith(hidePrice: false),
                        salesOrgConfig:
                            context.read<SalesOrgBloc>().state.configs,
                        quantity: 1,
                        zmgMaterialCountOnCart: 0,
                      );

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${'Unit Price: '.tr()}${priceAggregate.display(PriceType.unitPrice)}',
                            style: Theme.of(context).textTheme.bodyText1?.apply(
                                  color: ZPColors.black,
                                ),
                          ),
                          BlocBuilder<SalesOrgBloc, SalesOrgState>(
                            buildWhen: (previous, current) =>
                                previous.configs != current.configs,
                            builder: (context, state) {
                              final hidePrice = priceDetail.info.hidePrice;
                              final itemPrice = priceDetail.price.finalPrice;
                              if ((hidePrice || itemPrice.isEmpty()) &&
                                  !state.configs.materialWithoutPrice) {
                                return const SizedBox();
                              }

                              return ActionButton(
                                width: 120,
                                onTap: () {
                                  //TODO: Implement Add to cart
                                },
                                text: 'Add to Cart'.tr(),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
