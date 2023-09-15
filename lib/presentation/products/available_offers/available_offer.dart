//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer_item.dart';
import 'package:ezrxmobile/presentation/products/available_offers/show_offer_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableOffer extends StatelessWidget {
  final MaterialNumber materialNumber;
  const AvailableOffer({Key? key, required this.materialNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        final price = state.getPriceForMaterial(materialNumber);

        final bonusMaterialList = price.availableBonus.toList();
        final productDetailsState = context.read<ProductDetailBloc>().state;

        final isMYExternalSalesRepUser =
            context.read<EligibilityBloc>().state.isMYExternalSalesRepUser;

        final displayOffers = productDetailsState.displayOffers(
          isMYExternalSalesRepUser: isMYExternalSalesRepUser,
          bonusMaterialList: bonusMaterialList,
        );

        final showTierPrice = productDetailsState.showTierPrice(
          isMYExternalSalesRepUser: isMYExternalSalesRepUser,
        );

        if ((!price.isBonusDealEligible && !price.isTireDiscountEligible) ||
            !displayOffers) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            _AvailableOfferLabel(
              bonusMaterialList: bonusMaterialList,
              priceTiersList: price.priceTireItem.reversed.toList(),
            ),
            _AvailableOfferScrollList(
              bonusMaterialList: bonusMaterialList,
              priceTiersList: price.priceTireItem.reversed.toList(),
              showTierPrice: showTierPrice,
            ),
          ],
        );
      },
    );
  }
}

class _PriceTierItem extends StatelessWidget {
  const _PriceTierItem({
    required this.priceTierItem,
    required this.left,
    required this.right,
  });

  final PriceTierItem priceTierItem;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
      ),
      child: AvailableOfferItem(
        height: MediaQuery.of(context).size.height * 0.12,
        bonusMaterial: BonusMaterial.empty(),
        priceTier: priceTierItem,
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 14,
        ),
      ),
    );
  }
}

class _BonusLevelItem extends StatelessWidget {
  const _BonusLevelItem({
    required this.bonusMaterial,
    required this.left,
    required this.right,
  });

  final BonusMaterial bonusMaterial;
  final double left;
  final double right;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
      ),
      child: AvailableOfferItem(
        height: MediaQuery.of(context).size.height * 0.12,
        bonusMaterial: bonusMaterial,
        priceTier: PriceTierItem.empty(),
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 14,
        ),
      ),
    );
  }
}

class _AvailableOfferScrollList extends StatelessWidget {
  const _AvailableOfferScrollList({
    Key? key,
    required this.bonusMaterialList,
    required this.priceTiersList,
    required this.showTierPrice,
  }) : super(key: key);
  final List<BonusMaterial> bonusMaterialList;
  final List<PriceTierItem> priceTiersList;
  final bool showTierPrice;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.12,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (showTierPrice)
            ...priceTiersList.asMap().entries.map((e) {
              final left = e.key == 0 ? 16.0 : 4.0;
              final right = bonusMaterialList.isEmpty &&
                      e.key == priceTiersList.length - 1
                  ? 16.0
                  : 4.0;

              return _PriceTierItem(
                priceTierItem: e.value,
                left: left,
                right: right,
              );
            }).toList(),
          ...bonusMaterialList.asMap().entries.map((e) {
            final left = priceTiersList.isEmpty && e.key == 0 ? 16.0 : 4.0;
            final right = e.key == bonusMaterialList.length ? 16.0 : 4.0;

            return _BonusLevelItem(
              bonusMaterial: e.value,
              left: left,
              right: right,
            );
          }).toList(),
        ],
      ),
    );
  }
}

class _AvailableOfferLabel extends StatelessWidget {
  const _AvailableOfferLabel({
    Key? key,
    required this.bonusMaterialList,
    required this.priceTiersList,
  }) : super(key: key);

  final List<BonusMaterial> bonusMaterialList;
  final List<PriceTierItem> priceTiersList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      title: Text(
        'Available offers'.tr(),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: const Icon(
        Icons.chevron_right,
      ),
      onTap: () => _showOfferDialog(context),
    );
  }

  void _showOfferDialog(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      useSafeArea: true,
      context: context,
      builder: (_) => ShowOfferDialogWidget(
        bonusMaterialList: bonusMaterialList,
        priceTiersList: priceTiersList,
      ),
    );
  }
}
