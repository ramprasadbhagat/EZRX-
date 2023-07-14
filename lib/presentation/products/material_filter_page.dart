import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/products/filter_by_page.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialFilterSheet extends StatefulWidget {
  const MaterialFilterSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<MaterialFilterSheet> createState() => _MaterialFilterSheetState();
}

class _MaterialFilterSheetState extends State<MaterialFilterSheet> {
  @override
  void initState() {
    context.read<MaterialFilterBloc>().add(
          MaterialFilterEvent.initSelectedMaterialFilter(
            context.read<MaterialListBloc>().state.selectedMaterialFilter,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Title(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            children: const [
              _ShowProduct(),
              SizedBox(
                height: 24.0,
              ),
              _SortBy(),
              SizedBox(
                height: 32.0,
              ),
              _FilterBy(),
            ],
          ),
        ),
        const _ButtonBottom(),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
      title: Text(
        'Filter & Sort'.tr(),
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: ZPColors.primary),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.close_outlined,
          color: ZPColors.primary,
          size: 24,
        ),
      ),
    );
  }
}

class _ShowProduct extends StatelessWidget {
  const _ShowProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Show product'.tr(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ListTileTheme(
              horizontalTitleGap: 0,
              child: CheckboxListTile(
                value: state.materialFilter.isFavourite,
                onChanged: (value) {
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.isFavourite,
                          !state.materialFilter.isFavourite,
                        ),
                      );
                },
                title: Text(
                  'Favourites'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
                side: const BorderSide(color: ZPColors.lightGray2, width: 2),
              ),
            ),
            ListTileTheme(
              horizontalTitleGap: 0,
              child: CheckboxListTile(
                value: state.materialFilter.isProductOffer,
                onChanged: (value) {
                  if (state.materialFilter.bundleOffers) {
                    context.read<MaterialFilterBloc>().add(
                          MaterialFilterEvent.updateSelectedMaterialFilter(
                            MaterialFilterType.bundleOffers,
                            !state.materialFilter.bundleOffers,
                          ),
                        );
                  }
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.productOffers,
                          !state.materialFilter.isProductOffer,
                        ),
                      );
                },
                title: Text(
                  'Items with offers'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
                side: const BorderSide(color: ZPColors.lightGray2, width: 2),
              ),
            ),
            ListTileTheme(
              horizontalTitleGap: 0,
              child: CheckboxListTile(
                value: state.materialFilter.bundleOffers,
                onChanged: (value) {
                  if (!state.materialFilter.isProductOffer) {
                    context.read<MaterialFilterBloc>().add(
                           MaterialFilterEvent
                              .updateSelectedMaterialFilter(
                            MaterialFilterType.productOffers,
                            !state.materialFilter.isProductOffer,
                          ),
                        );
                  }
                  context.read<MaterialFilterBloc>().add(
                        MaterialFilterEvent.updateSelectedMaterialFilter(
                          MaterialFilterType.bundleOffers,
                          !state.materialFilter.bundleOffers,
                        ),
                      );
                },
                title: Text(
                  'Bundle offers'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.only(left: 32.0),
                dense: true,
                side: const BorderSide(color: ZPColors.lightGray2, width: 2),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SortBy extends StatelessWidget {
  const _SortBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sort by'.tr(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        ...Sort.values
            .map((e) => BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
                  builder: (context, state) {
                    return RadioListTile(
                      title: Text(
                        e.title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                      visualDensity:
                          const VisualDensity(horizontal: -4.0, vertical: -4.0),
                      contentPadding: EdgeInsets.zero,
                      value: e,
                      groupValue: state.materialFilter.sortBy,
                      onChanged: (Sort? value) {
                        context.read<MaterialFilterBloc>().add(
                              MaterialFilterEvent.updateSelectedMaterialFilter(
                                MaterialFilterType.sortBy,
                                value ?? Sort.az,
                              ),
                            );
                      },
                    );
                  },
                ))
            .toList(),
      ],
    );
  }
}

class _FilterBy extends StatelessWidget {
  const _FilterBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter by'.tr(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          const SizedBox(
            height: 22.0,
          ),
          IntrinsicWidth(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 161,
              ),
              child: BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
                builder: (context, st) {
                  return LoadingShimmer.withChild(
                    enabled: st.isFetching,
                    child: InkWell(
                      onTap: st.isFetching
                          ? null
                          : () => _showFilterByPage(
                                context: context,
                                materialFilterType:
                                    MaterialFilterType.manufactured,
                              ),
                      child:
                          BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
                        buildWhen: (previous, current) =>
                            previous.materialFilter.manufactureListSelected !=
                            current.materialFilter.manufactureListSelected,
                        builder: (context, state) {
                          final totalItemSelected = state
                              .materialFilter.manufactureListSelected.length;

                          return Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Manufacturer'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: ZPColors.neutralsBlack,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              totalItemSelected != 0
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: ZPColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      child: Text(
                                        '$totalItemSelected selected'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              color: ZPColors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                width: 4.0,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: ZPColors.orange,
                                size: 12,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 22.0,
          ),
          IntrinsicWidth(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 161,
              ),
              child: BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
                builder: (context, st) {
                  return LoadingShimmer.withChild(
                    enabled: st.isFetching,
                    child: InkWell(
                      onTap: st.isFetching
                          ? null
                          : () => _showFilterByPage(
                                context: context,
                                materialFilterType:
                                    MaterialFilterType.countryList,
                              ),
                      child:
                          BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
                        buildWhen: (previous, current) =>
                            previous.materialFilter.countryListSelected !=
                            current.materialFilter.countryListSelected,
                        builder: (context, state) {
                          final totalItemSelected =
                              state.materialFilter.countryListSelected.length;

                          return Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Country of origin'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: ZPColors.neutralsBlack,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              totalItemSelected != 0
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: ZPColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0,
                                      ),
                                      child: Text(
                                        '$totalItemSelected selected'.tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              color: ZPColors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                width: 4.0,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: ZPColors.orange,
                                size: 12,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterByPage({
    required BuildContext context,
    required MaterialFilterType materialFilterType,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      builder: (_) {
        return FilterByPage(
          materialFilterType: materialFilterType,
        );
      },
    ).then(
      (value) => context.read<MaterialFilterBloc>().add(
            const MaterialFilterEvent.updateSearchKey(''),
          ),
    );
  }
}

class _ButtonBottom extends StatelessWidget {
  const _ButtonBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ZPColors.extraLightGrey2,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                context.read<MaterialFilterBloc>().add(
                      const MaterialFilterEvent.resetFilter(),
                    );
                Navigator.of(context).pop(context
                    .read<MaterialFilterBloc>()
                    .state
                    .emptyMaterialFilter);
              },
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: const MaterialStatePropertyAll(
                      ZPColors.white,
                    ),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        side: BorderSide(color: ZPColors.primary),
                      ),
                    ),
                  ),
              child: Text(
                'Reset'.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.primary,
                    ),
              ),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                  context.read<MaterialFilterBloc>().state.materialFilter,
                );
              },
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: const MaterialStatePropertyAll(
                      ZPColors.primary,
                    ),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        side: BorderSide(color: ZPColors.primary),
                      ),
                    ),
                  ),
              child: Text(
                'Apply'.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
