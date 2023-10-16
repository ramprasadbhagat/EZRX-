import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class FilterValueList extends StatefulWidget {
  final bool isFetching;

  const FilterValueList({required this.isFetching, Key? key}) : super(key: key);

  @override
  State<FilterValueList> createState() => _FilterValueListState();
}

class _FilterValueListState extends State<FilterValueList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          BlocBuilder<MaterialListBloc, MaterialListState>(
            buildWhen: (previous, current) =>
                previous.selectedMaterialFilter.isFavourite !=
                current.selectedMaterialFilter.isFavourite,
            builder: (context, state) {
              return ChoiceChip(
                key: WidgetKeys.favoritesChoiceChip,
                label: Text(
                  'Favourites'.tr(),
                ),
                selected: state.selectedMaterialFilter.isFavourite,
                backgroundColor: ZPColors.secondaryEmerald10,
                selectedColor: ZPColors.primary,
                labelStyle: Theme.of(context).chipTheme.labelStyle?.copyWith(
                      color: state.selectedMaterialFilter.isFavourite
                          ? ZPColors.white
                          : ZPColors.shadesBlack,
                    ),
                onSelected: widget.isFetching
                    ? null
                    : (value) {
                        trackMixpanelEvent(
                          MixpanelEvents.productFilterClicked,
                          props: {MixpanelProps.filterClicked: 'Favourites'},
                        );
                        context.read<MaterialFilterBloc>().add(
                              MaterialFilterEvent.updateSelectedMaterialFilter(
                                MaterialFilterType.isFavourite,
                                !state.selectedMaterialFilter.isFavourite,
                              ),
                            );
                        context.read<MaterialListBloc>().add(
                              MaterialListEvent.fetch(
                                salesOrganisation: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                                configs: context
                                    .read<EligibilityBloc>()
                                    .state
                                    .salesOrgConfigs,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                shipToInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .shipToInfo,
                                selectedMaterialFilter:
                                    state.selectedMaterialFilter.copyWith(
                                  isFavourite:
                                      !state.selectedMaterialFilter.isFavourite,
                                ),
                              ),
                            );
                      },
              );
            },
          ),
          BlocBuilder<MaterialListBloc, MaterialListState>(
            buildWhen: (previous, current) =>
                previous.selectedMaterialFilter.isFOCMaterial !=
                current.selectedMaterialFilter.isFOCMaterial,
            builder: (context, state) {
              return context.read<EligibilityBloc>().state.isCovidMaterialEnable
                  ? ChoiceChip(
                      label: Text(
                        'Covid-19'.tr(),
                      ),
                      selected: state.selectedMaterialFilter.isFOCMaterial,
                      backgroundColor: ZPColors.secondaryEmerald10,
                      selectedColor: ZPColors.primary,
                      labelStyle: Theme.of(context)
                          .chipTheme
                          .labelStyle
                          ?.copyWith(
                            color: state.selectedMaterialFilter.isFOCMaterial
                                ? ZPColors.white
                                : ZPColors.shadesBlack,
                          ),
                      onSelected: widget.isFetching
                          ? null
                          : (value) {
                              trackMixpanelEvent(
                                MixpanelEvents.productFilterClicked,
                                props: {
                                  MixpanelProps.filterClicked: 'Covid-19',
                                },
                              );
                              context.read<MaterialFilterBloc>().add(
                                    MaterialFilterEvent
                                        .updateSelectedMaterialFilter(
                                      MaterialFilterType.isFOCMaterial,
                                      !state
                                          .selectedMaterialFilter.isFOCMaterial,
                                    ),
                                  );
                              context.read<MaterialListBloc>().add(
                                    MaterialListEvent.fetch(
                                      salesOrganisation: context
                                          .read<SalesOrgBloc>()
                                          .state
                                          .salesOrganisation,
                                      configs: context
                                          .read<SalesOrgBloc>()
                                          .state
                                          .configs,
                                      customerCodeInfo: context
                                          .read<CustomerCodeBloc>()
                                          .state
                                          .customerCodeInfo,
                                      shipToInfo: context
                                          .read<CustomerCodeBloc>()
                                          .state
                                          .shipToInfo,
                                      selectedMaterialFilter:
                                          state.selectedMaterialFilter.copyWith(
                                        isFOCMaterial: !state
                                            .selectedMaterialFilter
                                            .isFOCMaterial,
                                      ),
                                    ),
                                  );
                            },
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
