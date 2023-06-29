import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterByPage extends StatelessWidget {
  final MaterialFilterType materialFilterType;
  const FilterByPage({
    Key? key,
    required this.materialFilterType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(materialFilterType: materialFilterType),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: _SearchBar(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: _SelectedItem(materialFilterType: materialFilterType),
          ),
          Expanded(
            child: BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
              builder: (_, state) {
                return materialFilterType == MaterialFilterType.manufactured
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0,),
                        child: ScrollList<String>(
                          isLoading: state.isFetching,
                          itemBuilder: (_, index, item) {
                            return _ItemBuilder(
                                item: state.displayMaterialFilter,
                                index: index,
                                materialFilterType: materialFilterType,);
                          },
                          items: state.displayMaterialFilter
                              .manufactureMapOptions.entries
                              .map((e) => e.key)
                              .toList(),
                          emptyMessage: '',
                          controller: ScrollController(),
                        ),
                      )
                    : materialFilterType == MaterialFilterType.countryList
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0,),
                            child: ScrollList<MaterialFilterCountry>(
                              isLoading: state.isFetching,
                              itemBuilder: (_, index, item) {
                                return _ItemBuilder(
                                    item: state.displayMaterialFilter,
                                    index: index,
                                    materialFilterType: materialFilterType,);
                              },
                              items: state.displayMaterialFilter
                                  .countryMapOptions.entries
                                  .map((e) => e.key)
                                  .toList(),
                              emptyMessage: '',
                              controller: ScrollController(),
                            ),
                          )
                        : const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final MaterialFilterType materialFilterType;
  const _Header({required this.materialFilterType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 10.0, right: 10.0),
      title: Text(
        materialFilterType == MaterialFilterType.countryList
            ? 'Country of origin'.tr()
            : materialFilterType == MaterialFilterType.manufactured
                ? 'Manufacturer'.tr()
                : '',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ZPColors.primary,
              fontSize: 20.0,
            ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ZPColors.primary,
          size: 15,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
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

class _ItemBuilder extends StatelessWidget {
  final MaterialFilter item;
  final int index;
  final MaterialFilterType materialFilterType;
  const _ItemBuilder({
    required this.item,
    required this.index,
    required this.materialFilterType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (materialFilterType) {
      case MaterialFilterType.manufactured:
        final conditionOfLabel = index == 0 ||
            item.manufactureMapOptions.keys.elementAt(index)[0] !=
                item.manufactureMapOptions.keys.elementAt(index - 1)[0];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            conditionOfLabel
                ? Column(
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        item.manufactureMapOptions.keys.elementAt(index)[0],
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                    ],
                  )
                : const SizedBox(),
            InkWell(
              onTap: () {
                context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        materialFilterType,
                        item.manufactureMapOptions.keys.elementAt(index),
                      ),
                    );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.manufactureMapOptions.keys.elementAt(index),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ZPColors.extraLightGrey4,
                          ),
                    ),
                    item.manufactureMapOptions.values.elementAt(index)
                        ? const Icon(
                            Icons.check_outlined,
                            size: 16,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        );
      case MaterialFilterType.countryList:
        final conditionOfLabel = index == 0 ||
            item.countryMapOptions.keys.elementAt(index).name[0] !=
                item.countryMapOptions.keys.elementAt(index - 1).name[0];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            conditionOfLabel
                ? Column(
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        item.countryMapOptions.keys.elementAt(index).name[0],
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                    ],
                  )
                : const SizedBox(),
            InkWell(
              onTap: () {
                context.read<MaterialFilterBloc>().add(
                      MaterialFilterEvent.updateSelectedMaterialFilter(
                        materialFilterType,
                        item.countryMapOptions.keys.elementAt(index),
                      ),
                    );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.countryMapOptions.keys.elementAt(index).name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ZPColors.extraLightGrey4,
                          ),
                    ),
                    item.countryMapOptions.values.elementAt(index)
                        ? const Icon(
                            Icons.check_outlined,
                            size: 16,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}

class _SelectedItem extends StatelessWidget {
  final MaterialFilterType materialFilterType;
  const _SelectedItem({required this.materialFilterType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      buildWhen: (previous, current) =>
          previous.materialFilter != current.materialFilter,
      builder: (context, state) {
        switch (materialFilterType) {
          case MaterialFilterType.manufactured:
            return Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: state.materialFilter.manufactureMapOptions.entries
                  .where((element) => element.value)
                  .map(
                    (e) => ChoiceChip(
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              e.key,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: ZPColors.shadesBlack,
                                  ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Icon(
                              Icons.cancel,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      selected: false,
                      onSelected: (value) {
                        context.read<MaterialFilterBloc>().add(
                              MaterialFilterEvent.updateSelectedMaterialFilter(
                                materialFilterType,
                                e.key,
                              ),
                            );
                      },
                    ),
                  )
                  .toList(),
            );
          case MaterialFilterType.countryList:
            return Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: state.materialFilter.countryMapOptions.entries
                  .where((element) => element.value)
                  .map(
                    (e) => ChoiceChip(
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              e.key.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: ZPColors.shadesBlack,
                                  ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Icon(
                              Icons.cancel,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      selected: false,
                      onSelected: (value) {
                        context.read<MaterialFilterBloc>().add(
                              MaterialFilterEvent.updateSelectedMaterialFilter(
                                materialFilterType,
                                e.key,
                              ),
                            );
                      },
                    ),
                  )
                  .toList(),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final TextEditingController _textSearchController = TextEditingController();

  @override
  void dispose() {
    _textSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaterialFilterBloc, MaterialFilterState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        return SearchBar(
          onSearchChanged: (value) {
            context.read<MaterialFilterBloc>().add(
                  MaterialFilterEvent.updateSearchKey(value),
                );
          },
          isAutoSearch: false,
          clearIconKey: WidgetKeys.clearSearchFilter,
          controller: _textSearchController,
          onClear: () {
            _textSearchController.clear();
            context.read<MaterialFilterBloc>().add(
                  const MaterialFilterEvent.updateSearchKey(''),
                );
          },
          onSearchSubmitted: (value) {
            context.read<MaterialFilterBloc>().add(
                  MaterialFilterEvent.updateSearchKey(value),
                );
          },
          customValidator: () =>
              SearchKey.searchFilter(_textSearchController.text).isValid(),
        );
      },
    );
  }
}
