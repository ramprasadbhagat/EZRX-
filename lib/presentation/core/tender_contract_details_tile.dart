import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class TenderContractDetailsTile extends StatelessWidget {
  final TenderContract tenderContract;

  const TenderContractDetailsTile({Key? key, required this.tenderContract})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          height: 20,
          indent: 0,
          endIndent: 0,

        ),
        Text(
          'Contract:  ${tenderContract.contractNumber.displayTenderContractNumber}',
          style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.black,
              ),
        ),
        !tenderContract.tenderOrderReason.isEmpty
            ? Text(
                '${tenderContract.tenderOrderReason.displayTenderContractReason} : Tender with Contract',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
              )
            : const SizedBox.shrink(),
        BalanceTextRow(
          keyFlex: 1,
          valueFlex: 1,
          keyText: 'Tender Price',
          valueText: tenderContract.tenderPrice
              .tenderPriceByPricingUnit(tenderContract.pricingUnit)
              .toString(),
        ),
        BalanceTextRow(
          keyFlex: 1,
          valueFlex: 1,
          keyText: 'Contact Reference',
          valueText: tenderContract.contractReference.displayContractReference,
        ),
        BalanceTextRow(
          keyFlex: 1,
          valueFlex: 1,
          keyText: 'Package Description',
          valueText: tenderContract
              .tenderPackageDescription.displayTenderPackageDescription,
        ),
      ],
    );
  }
}
