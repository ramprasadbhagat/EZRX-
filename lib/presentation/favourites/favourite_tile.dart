import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteListTile extends StatelessWidget {
  final Favourite favourite;
  const FavouriteListTile({Key? key, required this.favourite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(favourite.materialNumber),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
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
                                    text: favourite.materialDescription
                                        .toUpperCase(),
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
                          IconButton(
                            key: const Key('deleteFavouriteFavPage'),
                            icon: const Icon(
                              Icons.favorite,
                              color: ZPColors.secondary,
                            ),
                            onPressed: () async =>
                                context.read<FavouriteBloc>().add(
                                      FavouriteEvent.delete(favourite),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
