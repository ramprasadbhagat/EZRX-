//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ShowOfferDialogWidget extends StatelessWidget {
  const ShowOfferDialogWidget({
    Key? key,
    required this.bonusMaterialList,
  }) : super(key: key);
  final List<BonusMaterial> bonusMaterialList;

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
            _AvailableOfferList(bonusMaterialList: bonusMaterialList,),
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
  }) : super(key: key);
  final List<BonusMaterial> bonusMaterialList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      itemCount: bonusMaterialList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: AvailableOfferItem(
          bonusMaterial: bonusMaterialList[index],
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
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
