import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocConsumer<MaterialFilterBloc, MaterialFilterState>(
            listener: (context, state) {
              if (state.isUpdated) {
                context.read<MaterialListBloc>().add(
                      MaterialListEvent.fetch(
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        configs: context.read<SalesOrgBloc>().state.configs,
                        customerCodeInfo: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        shipToInfo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                        selectedMaterialFilter: context
                            .read<MaterialFilterBloc>()
                            .state
                            .selectedMaterialFilter,
                      ),
                    );
              }
            },
            buildWhen: (previous, current) =>
                previous.selectedMaterialFilter.isFavourite !=
                current.selectedMaterialFilter.isFavourite,
            builder: (context, state) {
              return ChoiceChip(
                label: Text(
                  'Favourites'.tr(),
                ),
                selected: state.selectedMaterialFilter.isFavourite,
                labelStyle: Theme.of(context).chipTheme.labelStyle?.copyWith(
                      color: state.selectedMaterialFilter.isFavourite
                          ? ZPColors.white
                          : ZPColors.shadesBlack,
                     ),
                onSelected: widget.isFetching
                    ? null
                    : (value) {
                        context.read<MaterialFilterBloc>().add(
                              const MaterialFilterEvent
                                  .updateTappedMaterialSelected(
                                MaterialFilterType.isFavourite,
                                '',
                              ),
                            );
                        context.read<MaterialFilterBloc>().add(
                              const MaterialFilterEvent.updateMaterialSelected(
                                MaterialFilterType.isFavourite,
                              ),
                            );
                      },
              );
            },
          ),
        ],
      ),
    );
  }
}
