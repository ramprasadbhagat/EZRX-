import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

class TenderContractItem extends StatelessWidget {
  final TenderContract tenderContract;

  const TenderContractItem({Key? key, required this.tenderContract})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      key: Key(tenderContract.contractNumber.displayTenderContractNumber),
      threeLineTitle: true,
      leading: BlocBuilder<TenderContractBloc, TenderContractState>(
        builder: (context, state) {
          return GestureDetector(
            key: Key(
              'tenderContractIcon${tenderContract.contractNumber.displayTenderContractNumber}',
            ),
            onTap: () => selectTenderContract(context),
            child: Container(
              height: 35,
              width: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: ZPColors.lightGray),
                borderRadius: BorderRadius.circular(10),
                color: _isSelected(state) ? ZPColors.primary : ZPColors.white,
              ),
              child: Icon(
                Icons.check_rounded,
                size: 17,
                color: _isSelected(state) ? ZPColors.white : ZPColors.lightGray,
              ),
            ),
          );
        },
      ),
      initiallyExpanded: false,
      title: TenderContractHeader(tenderContract: tenderContract),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TenderContractBody(
            tenderContract: tenderContract,
            key: Key(
              'tenderContractBody${tenderContract.contractNumber.displayTenderContractNumber}',
            ),
          ),
        ),
      ],
    );
  }

  bool _isSelected(TenderContractState state) =>
      state.selectedTenderContract.contractNumber ==
      tenderContract.contractNumber;

  void selectTenderContract(BuildContext context) =>
      context.read<TenderContractBloc>().add(
            TenderContractEvent.selected(
              tenderContract: tenderContract,
            ),
          );
}

class TenderContractHeader extends StatelessWidget {
  final TenderContract tenderContract;

  const TenderContractHeader({Key? key, required this.tenderContract})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contract - ${tenderContract.contractNumber.displayTenderContractNumber.tr()}',
          style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.black,
              ),
        ),
        !tenderContract.tenderOrderReason.isEmpty
            ? Text(
                '${tenderContract.tenderOrderReason.displayTenderContractReason.tr()} : Tender with Contract',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
              )
            : const SizedBox.shrink(),
        Text(
          'Tender Price: ${tenderContract.tenderPriceByPricingUnit}',
          style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.lightGray,
              ),
        ),
      ],
    );
  }
}

class TenderContractBody extends StatelessWidget {
  final TenderContract tenderContract;

  const TenderContractBody({Key? key, required this.tenderContract})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TenderInfoText(
                title: 'Contract Reference',
                info: tenderContract.contractReference.displayContractReference
                    .tr(),
              ),
              TenderInfoText(
                title: 'Material Visa Number',
                info: tenderContract.tenderVisaNumber.displayTenderVisaNumber
                    .tr(),
              ),
              TenderInfoText(
                title: 'Sales District',
                info: tenderContract.salesDistrict.displaySalesDistrict.tr(),
              ),
              TenderInfoText(
                title: 'Announcement Letter Number',
                info: tenderContract
                    .announcementLetterNumber.displayAnnouncementLetterNumber
                    .tr(),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TenderInfoText(
                title: 'Remaining Quantity',
                info: tenderContract.remainingTenderQuantity.toString(),
              ),
              TenderInfoText(
                title: 'Contract Quantity',
                info: tenderContract.contractQuantity.toString(),
              ),
              TenderInfoText(
                title: 'Contract Expiry Date',
                info: tenderContract
                    .contractExpiryDate.displayContractExpiryDate
                    .tr(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TenderInfoText extends StatelessWidget {
  final String title;
  final String info;

  const TenderInfoText({Key? key, required this.title, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      color: ZPColors.darkGray,
      fontSize: 13.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
    const infoTextStyle = TextStyle(
      color: ZPColors.black,
      fontSize: 13.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleTextStyle,
        ),
        Text(
          info,
          style: infoTextStyle,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
