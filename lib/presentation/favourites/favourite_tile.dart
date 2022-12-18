import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
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
      child: CustomSlidable(
        borderRadius: 8,
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete'.tr(),
            icon: Icons.delete_outline,
            onPressed: (context) => context.read<FavouriteBloc>().add(
                  FavouriteEvent.delete(
                    item: favourite,
                    user: context.read<UserBloc>().state.user,
                  ),
                ),
          ),
        ],
        child: BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            final queryInfo =
                MaterialQueryInfo.fromFavorite(material: favourite);
            final priceDetail = state.materialDetails[queryInfo]!;

            final priceAggregate = PriceAggregate(
              price: priceDetail.price,
              materialInfo: priceDetail.info,
              salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
              quantity: 1,
              discountedMaterialCount: 0,
              bundle: Bundle.empty(),
              addedBonusList: [],
              stockInfo: StockInfo.empty().copyWith(
                materialNumber: priceDetail.info.materialNumber,
              ),
              tenderContract: TenderContract.empty(),
            );

            return ListTile(
              onTap: state.isFetching
                  ? null
                  : () {
                      CartBottomSheet.showAddToCartBottomSheet(
                        context: context,
                        priceAggregate: priceAggregate,
                      );
                    },
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        favourite.materialNumber.displayMatNo,
                        style: Theme.of(context).textTheme.subtitle2?.apply(
                              color: ZPColors.kPrimaryColor,
                            ),
                      ),
                      // BonusDiscountLabel(materialInfo: materialInfo),
                    ],
                  ),
                  Text(
                    favourite.materialDescription,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  priceAggregate.isDefaultMDEnabled
                      ? Text(
                          "${'Mat Default Description: '.tr()}${priceAggregate.materialInfo.defaultMaterialDescription}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.apply(color: ZPColors.lightGray),
                        )
                      : const SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state.isFetching
                          ? SizedBox(
                              key: const Key('price-loading'),
                              width: 40,
                              child: LoadingShimmer.tile(),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .configs
                                        .enableVat
                                    ? Text(
                                        '${'Price before ${context.read<SalesOrgBloc>().state.salesOrg.taxCode}: '.tr()}${priceAggregate.display(PriceType.listPrice)}',
                                        key: const Key('priceBefore'),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.apply(
                                              color: ZPColors.lightGray,
                                            ),
                                      )
                                    : const SizedBox.shrink(),
                                Text(
                                  '${'Unit Price: '.tr()}${priceAggregate.display(PriceType.unitPrice)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.apply(
                                        color: ZPColors.black,
                                      ),
                                ),
                              ],
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
                            ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
