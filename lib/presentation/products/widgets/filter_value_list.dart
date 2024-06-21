import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

const _chipHeight = 30.0;
const _chipSpacing = 8.0;

class FilterValueList extends StatelessWidget {
  final MaterialListState state;

  const FilterValueList({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final currentFilter = state.selectedMaterialFilter;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: _chipHeight,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          children: [
            _MaterialTypeFilterChip(
              label: 'Favourites',
              isSelected: currentFilter.isFavourite,
              isFetching: state.isFetching,
              onTap: () {
                context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        MaterialFilterType.isFavourite,
                        !currentFilter.isFavourite,
                      ),
                    );
                context.read<MaterialListBloc>().add(
                      MaterialListEvent.fetch(
                        selectedMaterialFilter:
                            state.selectedMaterialFilter.copyWith(
                          isFavourite: !currentFilter.isFavourite,
                        ),
                      ),
                    );
              },
            ),
            if (eligibilityState.marketPlaceEligible)
              Padding(
                padding: const EdgeInsets.only(left: _chipSpacing),
                child: _MaterialTypeFilterChip(
                  label: 'Marketplace',
                  isSelected: currentFilter.isMarketPlace,
                  isFetching: state.isFetching,
                  onTap: () {
                    context.read<MaterialFilterBloc>().add(
                          MaterialFilterEvent.updateSelectedMaterialFilter(
                            MaterialFilterType.isMarketPlace,
                            !currentFilter.isMarketPlace,
                          ),
                        );
                    context.read<MaterialListBloc>().add(
                          MaterialListEvent.fetch(
                            selectedMaterialFilter:
                                state.selectedMaterialFilter.copyWith(
                              isMarketPlace: !currentFilter.isMarketPlace,
                            ),
                          ),
                        );
                  },
                ),
              ),
            if (!eligibilityState.salesOrgConfigs.disablePromotion)
              Padding(
                padding: const EdgeInsets.only(left: _chipSpacing),
                child: _MaterialTypeFilterChip(
                  label: 'Offers',
                  isSelected: currentFilter.isProductOffer,
                  isFetching: state.isFetching,
                  onTap: () {
                    context.read<MaterialFilterBloc>().add(
                          MaterialFilterEvent.updateSelectedMaterialFilter(
                            MaterialFilterType.productOffers,
                            !currentFilter.isProductOffer,
                          ),
                        );
                    context.read<MaterialListBloc>().add(
                          MaterialListEvent.fetch(
                            selectedMaterialFilter:
                                state.selectedMaterialFilter.copyWith(
                              isProductOffer: !currentFilter.isProductOffer,
                            ),
                          ),
                        );
                  },
                ),
              ),
            if (!eligibilityState.salesOrgConfigs.disableBundles &&
                !eligibilityState.salesOrgConfigs.disablePromotion)
              Padding(
                padding: const EdgeInsets.only(left: _chipSpacing),
                child: _MaterialTypeFilterChip(
                  label: 'Bundle offers',
                  isSelected: currentFilter.bundleOffers,
                  isFetching: state.isFetching,
                  onTap: () {
                    context.read<MaterialFilterBloc>().add(
                          MaterialFilterEvent.updateSelectedMaterialFilter(
                            MaterialFilterType.bundleOffers,
                            !currentFilter.bundleOffers,
                          ),
                        );
                    context.read<MaterialListBloc>().add(
                          MaterialListEvent.fetch(
                            selectedMaterialFilter:
                                state.selectedMaterialFilter.copyWith(
                              bundleOffers: !currentFilter.bundleOffers,
                            ),
                          ),
                        );
                  },
                ),
              ),
            if (eligibilityState.salesOrgConfigs.enableComboDeals)
              Padding(
                padding: const EdgeInsets.only(left: _chipSpacing),
                child: _MaterialTypeFilterChip(
                  label: 'Combo offers',
                  isSelected: currentFilter.comboOffers,
                  isFetching: state.isFetching,
                  onTap: () {
                    context.read<MaterialFilterBloc>().add(
                          MaterialFilterEvent.updateSelectedMaterialFilter(
                            MaterialFilterType.comboOffers,
                            !currentFilter.comboOffers,
                          ),
                        );
                    context.read<MaterialListBloc>().add(
                          MaterialListEvent.fetch(
                            selectedMaterialFilter:
                                state.selectedMaterialFilter.copyWith(
                              comboOffers: !currentFilter.comboOffers,
                            ),
                          ),
                        );
                  },
                ),
              ),
            if (eligibilityState.salesOrgConfigs.enableTenderOrders)
              Padding(
                padding: const EdgeInsets.only(left: _chipSpacing),
                child: _MaterialTypeFilterChip(
                  label: 'Tender contract',
                  isSelected: currentFilter.isTender,
                  isFetching: state.isFetching,
                  onTap: () {
                    context.read<MaterialFilterBloc>().add(
                          MaterialFilterEvent.updateSelectedMaterialFilter(
                            MaterialFilterType.isTender,
                            !currentFilter.isTender,
                          ),
                        );
                    context.read<MaterialListBloc>().add(
                          MaterialListEvent.fetch(
                            selectedMaterialFilter:
                                state.selectedMaterialFilter.copyWith(
                              isTender: !currentFilter.isTender,
                            ),
                          ),
                        );
                  },
                ),
              ),
            if (eligibilityState.canOrderCovidMaterial)
              Padding(
                padding: const EdgeInsets.only(left: _chipSpacing),
                child: _MaterialTypeFilterChip(
                  label: 'Covid-19',
                  isSelected: currentFilter.isCovidSelected,
                  isFetching: state.isFetching,
                  onTap: () {
                    context.read<MaterialFilterBloc>().add(
                          MaterialFilterEvent.updateSelectedMaterialFilter(
                            MaterialFilterType.isCovidSelected,
                            !currentFilter.isCovidSelected,
                          ),
                        );
                    context.read<MaterialListBloc>().add(
                          MaterialListEvent.fetch(
                            selectedMaterialFilter:
                                state.selectedMaterialFilter.copyWith(
                              hasAccessToCovidMaterial: true,
                              isCovidSelected: !currentFilter.isCovidSelected,
                            ),
                          ),
                        );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MaterialTypeFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isFetching;
  final VoidCallback onTap;

  const _MaterialTypeFilterChip({
    required this.label,
    required this.isSelected,
    required this.isFetching,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: WidgetKeys.productTypeFilterChip(label),
      onTap: isFetching
          ? null
          : () {
              trackMixpanelEvent(
                TrackingEvents.productFilterClicked,
                props: {TrackingProps.filterClicked: label},
              );
              onTap.call();
            },
      child: Container(
        height: _chipHeight,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? ZPColors.primary : ZPColors.paleBlueGray,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Text(
          context.tr(label),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isSelected ? ZPColors.white : ZPColors.neutralsBlack,
              ),
        ),
      ),
    );
  }
}
