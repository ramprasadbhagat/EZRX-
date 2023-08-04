import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/icon_label.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

class ReturnItemsTab extends StatelessWidget {
  const ReturnItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Row(
            children: [
              Expanded(
                child: SearchBar(
                  onSearchChanged: (String value) {},
                  clearIconKey: WidgetKeys.clearIconKey,
                  controller: TextEditingController(),
                  onClear: () {},
                ),
              ),
              CustomBadge(
                Icons.tune,
                count: 0,
                badgeColor: ZPColors.orange,
                onPressed: () {},
              ),
            ],
          ),
        ),
        BlocConsumer<ReturnItemsBloc, ReturnItemsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return Expanded(
              child: state.isLoading && state.items.isEmpty
                  ? LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ScrollList<ReturnMaterial>(
                        noRecordFoundWidget: NoRecordFound(
                          title: 'No record found'.tr(),
                        ),
                        controller: ScrollController(),
                        onRefresh: () {
                          context.read<ReturnItemsBloc>().add(
                                ReturnItemsEvent.fetch(
                                  salesOrganisation: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  customerCodeInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                  shipToInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .shipToInfo,
                                ),
                              );
                        },
                        onLoadingMore: () {
                          context.read<ReturnItemsBloc>().add(
                                ReturnItemsEvent.loadMore(
                                  salesOrganisation: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  customerCodeInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                  shipToInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .shipToInfo,
                                ),
                              );
                        },
                        isLoading: state.isLoading,
                        itemBuilder: (context, index, item) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: _ReturnMaterial(
                            data: item,
                          ),
                        ),
                        items: state.items,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _ReturnMaterial extends StatefulWidget {
  final ReturnMaterial data;
  const _ReturnMaterial({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<_ReturnMaterial> createState() => _ReturnMaterialState();
}

class _ReturnMaterialState extends State<_ReturnMaterial> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 12),
          child: EdgeCheckbox(
            onChanged: (bool value) {
              context.read<NewRequestBloc>().add(
                    NewRequestEvent.toggleReturnItem(
                      selected: value,
                      item: widget.data,
                    ),
                  );
            },
            value: state.selectedItems.contains(widget.data),
            body: CustomCard(
              showBorder: true,
              showShadow: false,
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProductImageWithLabel(
                        materialNumber: widget.data.materialNumber,
                      ),
                      Expanded(
                        child: _MaterialInfo(data: widget.data),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Qty: ${widget.data.targetQuantity.apiParameterValue}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.black,
                            ),
                      ),
                      PriceComponent(
                        salesOrgConfig:
                            context.read<SalesOrgBloc>().state.configs,
                        price: widget.data.unitPrice.apiParameterValue,
                        currencyCodeTextStyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: ZPColors.primary,
                                ),
                        priceTextStyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: ZPColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _isExpanded
                              ? 'Hide details'.tr()
                              : 'Show details'.tr(),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ZPColors.extraDarkGreen,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: ZPColors.extraDarkGreen,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _ExtendedSection(
                    isExtended: _isExpanded,
                    data: widget.data,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ExtendedSection extends StatelessWidget {
  const _ExtendedSection({
    Key? key,
    required this.data,
    required this.isExtended,
  }) : super(key: key);
  final ReturnMaterial data;
  final bool isExtended;

  @override
  Widget build(BuildContext context) {
    return isExtended
        ? Column(
            children: [
              const Divider(
                indent: 0,
                height: 20,
                endIndent: 0,
                color: ZPColors.lightGray2,
              ),
              _MaterialDetailsSection(
                data: data,
              ),
              _BonusItemSection(
                data: data,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  const _MaterialDetailsSection({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Material details'.tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        BalanceTextRow(
          keyText: 'Principal code'.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: data.principalCode.getOrDefaultValue(''),
        ),
        BalanceTextRow(
          keyText: 'Principal name'.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: data.principalName.name.tr(),
        ),
        BalanceTextRow(
          keyText: 'Invoice number'.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: data.assignmentNumber,
        ),
        BalanceTextRow(
          keyText: 'Invoice date'.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: data.priceDate.dateString,
        ),
      ],
    );
  }
}

class _BonusItemSection extends StatelessWidget {
  const _BonusItemSection({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return data.bonusItems.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                indent: 0,
                height: 20,
                endIndent: 0,
                color: ZPColors.lightGray2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Bonus details'.tr(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              ...data.bonusItems.map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: ZPColors.extraLightGrey3,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            e.materialNumber.displayMatNo,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: ZPColors.primary,
                            ),
                            child: Text(
                              'Bonus'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ZPColors.white,
                                    fontSize: 10,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        e.materialDescription,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Batch ${e.batch} (Expires ${e.expiryDate.dateString})',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: ZPColors.darkGray,
                                    fontSize: 12,
                                  ),
                            ),
                          ),
                          Text(
                            'x ${e.targetQuantity.apiParameterValue} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: ZPColors.skyBlueColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

class _MaterialInfo extends StatelessWidget {
  const _MaterialInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        bottom: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.materialNumber.displayMatNo.tr(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            data.materialDescription,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Wrap(
            children: [
              Text(
                '${'Batch'.tr()} ${data.batch} ',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.darkGray,
                      fontSize: 12,
                    ),
              ),
              Text(
                '(Expires ${data.expiryDate.dateString})',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.darkGray,
                      fontSize: 12,
                    ),
              ),
            ],
          ),
          PriceComponent(
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
            price: data.unitPrice.apiParameterValue,
            currencyCodeTextStyle:
                Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ZPColors.darkGray,
                    ),
            priceTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
        ],
      ),
    );
  }
}

class _ProductImageWithLabel extends StatelessWidget {
  const _ProductImageWithLabel({
    Key? key,
    required this.materialNumber,
  }) : super(key: key);

  final MaterialNumber materialNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ZPColors.lightGray2, width: 1.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: ProductImage(
            width: MediaQuery.of(context).size.height * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            fit: BoxFit.fitHeight,
            materialNumber: materialNumber,
            errorWidgetColor: ZPColors.white,
            errorWidgetPadding: const EdgeInsets.all(16),
          ),
        ),
        const IconLabel(
          icon: Icons.local_offer_outlined,
          backgroundColor: ZPColors.darkYellow,
          labelText: '',
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.fromLTRB(6, 2, 2, 2),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
            topLeft: Radius.circular(8.0),
          ),
        ),
      ],
    );
  }
}
