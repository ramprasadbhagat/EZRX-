import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class TenderContractDetailsTile extends StatelessWidget {
  final TenderContract tenderContract;

  const TenderContractDetailsTile({Key? key, required this.tenderContract})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 20,
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(bottom: 10),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contract:  ${tenderContract.contractNumber.displayTenderContractNumber}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.black,
                    ),
              ),
              !tenderContract.tenderOrderReason.isEmpty
                  ? Text(
                      '${tenderContract.tenderOrderReason.displayTenderContractReason} : Tender with Contract',
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              Text(
                'Tender Price: ${tenderContract.tenderPrice.tenderPriceByPricingUnit(tenderContract.pricingUnit)}',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Contact Reference',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
            ),
            Expanded(
              child: Text(
                tenderContract.contractReference.displayContractReference,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.black,
                    ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Package Description',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
            ),
            Expanded(
              child: Text(
                tenderContract
                    .tenderPackageDescription.displayTenderPackageDescription,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.black,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
