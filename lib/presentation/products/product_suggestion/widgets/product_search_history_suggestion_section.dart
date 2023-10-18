part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _ProductSearchHistorySuggestionSection extends StatelessWidget {
  const _ProductSearchHistorySuggestionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchBloc, ProductSearchState>(
      buildWhen: (previous, current) =>
          previous.productSuggestionHistory != current.productSuggestionHistory,
      builder: (context, state) => state
              .productSuggestionHistory.searchKeyList.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.tr('Search History'),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: ZPColors.extraLightGrey4,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outlined,
                          color: ZPColors.extraLightGrey4,
                        ),
                        onPressed: () => {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            builder: (_) =>
                                const ClearProductSearchSuggestionHistory(),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                ...state.productSuggestionHistory.searchKeyList.reversed
                    .map(
                      (e) => _HistoryTile(
                        searchKey: e,
                      ),
                    )
                    .toList(),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
