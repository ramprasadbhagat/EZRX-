//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowOfferDialogWidget extends StatelessWidget {
  const ShowOfferDialogWidget({
    Key? key,
    required this.bonusMaterialList,
    required this.priceTiersList,
  }) : super(key: key);
  final List<BonusMaterial> bonusMaterialList;
  final List<PriceTierItem> priceTiersList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _AvailableOfferHeader(),
            _AvailableOfferList(
              bonusMaterialList: bonusMaterialList,
              priceTiersList: priceTiersList,
            ),
            const _CloseButton(),
          ],
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Close').tr(),
      ),
    );
  }
}

class _AvailableOfferList extends StatelessWidget {
  const _AvailableOfferList({
    Key? key,
    required this.bonusMaterialList,
    required this.priceTiersList,
  }) : super(key: key);
  final List<BonusMaterial> bonusMaterialList;
  final List<PriceTierItem> priceTiersList;

  @override
  Widget build(BuildContext context) {
    final showTierPrice = context.read<ProductDetailBloc>().state.showTierPrice(
          isMYExternalSalesRepUser:
              context.read<EligibilityBloc>().state.isMYExternalSalesRepUser,
        );

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      children: [
        if (showTierPrice)
          ...priceTiersList.map((e) => _PriceTierItem(item: e)).toList(),
        ...bonusMaterialList.map((e) => _BonusMaterialItem(item: e)).toList(),
      ],
    );
  }
}

class _BonusMaterialItem extends StatelessWidget {
  const _BonusMaterialItem({
    required this.item,
  });

  final BonusMaterial item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: AvailableOfferItem(
        bonusMaterial: item,
        priceTier: PriceTierItem.empty(),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
      ),
    );
  }
}

class _PriceTierItem extends StatelessWidget {
  const _PriceTierItem({
    required this.item,
  });
  final PriceTierItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: AvailableOfferItem(
        bonusMaterial: BonusMaterial.empty(),
        priceTier: item,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
      ),
    );
  }
}

class _AvailableOfferHeader extends StatelessWidget {
  const _AvailableOfferHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      title: Text(
        'Available offers'.tr(),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ZPColors.primary,
            ),
      ),
      subtitle: Text(
        'Offers are auto-applied based on quantity purchased.'.tr(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ZPColors.extraLightGrey4,
            ),
      ),
    );
  }
}
