//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
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
        if (!price.isBonusDealEligible) {
          return const SizedBox.shrink();
        }
        final bonusMaterialList = price.availableBonus.toList();

        return Column(
          children: [
            _AvailableOfferLabel(bonusMaterialList: bonusMaterialList),
            _AvailableOfferScrollList(bonusMaterialList: bonusMaterialList),
          ],
        );
      },
    );
  }
}

class _AvailableOfferScrollList extends StatelessWidget {
  const _AvailableOfferScrollList({
    Key? key,
    required this.bonusMaterialList,
  }) : super(key: key);
  final List<BonusMaterial> bonusMaterialList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bonusMaterialList.length,
        itemBuilder: (context, index) {
          final left = index == 0 ? 16.0 : 4.0;
          final right = index == bonusMaterialList.length - 1 ? 16.0 : 4.0;

          return Padding(
            padding: EdgeInsets.only(
              left: left,
              right: right,
            ),
            child: AvailableOfferItem(
              bonusMaterial: bonusMaterialList[index],
              width: size.width * 0.4,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AvailableOfferLabel extends StatelessWidget {
  const _AvailableOfferLabel({
    Key? key,
    required this.bonusMaterialList,
  }) : super(key: key);

  final List<BonusMaterial> bonusMaterialList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      title:  Text(
        'Available offers'.tr(),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 18,
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
      ),
    );
  }
}
