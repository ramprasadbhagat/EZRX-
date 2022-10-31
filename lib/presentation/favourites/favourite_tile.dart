import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteListTile extends StatelessWidget {
  final Favourite favourite;
  const FavouriteListTile({Key? key, required this.favourite})
      : super(key: key);

  MaterialQueryInfo get itemPriceQuery => MaterialQueryInfo.fromFavorite(
        material: favourite,
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(favourite.materialNumber),
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
                              text: favourite.materialDescription.toUpperCase(),
                              style: const TextStyle(
                                color:
                                    ZPColors.darkerGreen, // zpDarkerGreenColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      key: const Key('deleteFavouriteFavPage'),
                      icon: const Icon(
                        Icons.favorite,
                        color: ZPColors.secondary,
                      ),
                      onPressed: () async => context.read<FavouriteBloc>().add(
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
                BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
                  buildWhen: (previous, current) =>
                      previous.materialDetails[itemPriceQuery] !=
                      current.materialDetails[itemPriceQuery],
                  builder: (context, state) {
                    final itemInfo =
                        state.materialDetails[itemPriceQuery]?.price;

                    if (itemInfo != null) {
                      final currentCurrency =
                          context.read<SalesOrgBloc>().state.configs.currency;

                      return Text(
                        '${'Unit Price: '.tr()}${itemInfo.finalPrice.displayWithCurrency(
                          currency: currentCurrency,
                          hidePrice: false,
                        )}',
                        style: const TextStyle(
                          color: ZPColors.darkerGreen,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }
                    if (state.isFetching) {
                      return SizedBox(
                        key: const Key('price-loading'),
                        width: 40,
                        child: LoadingShimmer.tile(),
                      );
                    }

                    return Text(
                      '${'Unit Price: '.tr()}NA',
                      style: const TextStyle(
                        color: ZPColors.darkerGreen,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
