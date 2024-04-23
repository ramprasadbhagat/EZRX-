import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/switch_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TenderContracts extends StatelessWidget {
  final MaterialInfo materialInfo;
  const TenderContracts({
    super.key,
    required this.materialInfo,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocProvider<TenderContractDetailBloc>(
      create: (context) => locator<TenderContractDetailBloc>()
        ..add(
          TenderContractDetailEvent.fetch(
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            materialNumber: materialInfo.materialNumber,
          ),
        )
        ..add(
          TenderContractDetailEvent.toggleSwitch(
            enable: materialInfo.hasMandatoryTenderContract,
          ),
        ),
      child: BlocBuilder<TenderContractDetailBloc, TenderContractDetailState>(
        builder: (context, state) {
          if (state.tenderContractList.isEmpty) {
            return const SizedBox.shrink();
          }

          return Column(
            key: WidgetKeys.materialUseTenderContract,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.tr(
                          'Use Tender Contract',
                        ),
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SwitchWidget(
                      disable: materialInfo.hasMandatoryTenderContract,
                      value: state.tenderContractEnable,
                      onChanged: (value) =>
                          context.read<TenderContractDetailBloc>().add(
                                TenderContractDetailEvent.toggleSwitch(
                                  enable: value,
                                ),
                              ),
                    ),
                  ],
                ),
              ),
              if (state.tenderContractEnable)
                SizedBox(
                  height: 375,
                  child: ListView.separated(
                    key: WidgetKeys.materialTenderContracts,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.tenderContractList.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 16,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final currentContract = state.tenderContractList[index];
                      final isSelected =
                          currentContract == state.selectedTenderContract;

                      return InkWell(
                        key: WidgetKeys.materialTenderContractItem(
                          currentContract
                              .contractNumber.displayTenderContractNumber,
                          isSelected,
                        ),
                        onTap: () =>
                            context.read<TenderContractDetailBloc>().add(
                                  TenderContractDetailEvent.select(
                                    tenderContract: currentContract,
                                  ),
                                ),
                        child: Container(
                          width: 250,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isSelected
                                ? ZPColors.nextDiscountBG
                                : ZPColors.tenderUnselectBg,
                            border: Border.all(
                              color: isSelected
                                  ? ZPColors.blueAccent
                                  : ZPColors.tenderUnselectBorder,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currentContract.contractNumber
                                                .displayTenderContractNumber,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: ZPColors.neutralsGrey1,
                                                ),
                                          ),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              '${currentContract.tenderOrderReason.displayTenderContractReason} - ${context.tr(currentContract.tenderOrderReason.tenderContractReasonTitle)}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                    color:
                                                        ZPColors.neutralsBlack,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Radio(
                                        value: currentContract,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) =>
                                              isSelected
                                                  ? ZPColors.darkTeal
                                                  : ZPColors
                                                      .elevatedDisableColor,
                                        ),
                                        visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity,
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        groupValue:
                                            state.selectedTenderContract,
                                        onChanged: (_) => context
                                            .read<TenderContractDetailBloc>()
                                            .add(
                                              TenderContractDetailEvent.select(
                                                tenderContract: currentContract,
                                              ),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                context.tr('Price'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: ZPColors.neutralsGrey1,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: PriceComponent(
                                  type: PriceStyle.tenderPrice,
                                  price: currentContract.tenderPrice
                                      .getOrDefaultValue(''),
                                  salesOrgConfig:
                                      eligibilityState.salesOrgConfigs,
                                ),
                              ),
                              const Divider(
                                color: ZPColors.elevatedDisableColor,
                                height: 0,
                                indent: 0,
                                endIndent: 0,
                                thickness: 1,
                              ),
                              _DetailField(
                                title: 'Quantity Available',
                                value:
                                    '${currentContract.remainingTenderQuantity}/${currentContract.contractQuantity}',
                              ),
                              _DetailField(
                                title: 'Expiry Date',
                                value: currentContract
                                    .contractExpiryDate.dateTimeOrDashString,
                              ),
                              _DetailField(
                                title: 'Reference',
                                value: currentContract
                                    .contractReference.displayNAIfEmpty,
                              ),
                              _DetailField(
                                title: 'Material Visa No.',
                                value: currentContract
                                    .tenderVisaNumber.displayTenderVisaNumber,
                              ),
                              _DetailField(
                                title: 'Sale District',
                                value: currentContract
                                    .salesDistrict.displayNAIfEmpty,
                              ),
                              _DetailField(
                                title: 'Announcement Letter No.',
                                value: currentContract.announcementLetterNumber
                                    .displayAnnouncementLetterNumber,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _DetailField extends StatelessWidget {
  final String title;
  final String value;
  const _DetailField({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr(title),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: ZPColors.neutralsGrey1,
                ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 12,
                  color: ZPColors.primary,
                ),
          ),
        ],
      ),
    );
  }
}
