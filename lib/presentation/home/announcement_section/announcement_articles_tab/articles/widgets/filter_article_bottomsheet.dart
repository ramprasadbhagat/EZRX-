part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _ArticleFilterBottomSheet extends StatelessWidget {
  const _ArticleFilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      sheetKey: WidgetKeys.articleFilterKey,
      headerText: 'Filter',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              context.tr('Category'),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          const _CategorySelector(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children:  [
              _ArticleFilterResetButton(),
              SizedBox(
                width: 12,
              ),
              _ArticleFilterApplyButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesInfoFilterBloc, ArticlesInfoFilterState>(
      buildWhen: (previous, current) =>
          previous.filterCategoryKeyList != current.filterCategoryKeyList,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.categoryKeyList.map((String category) {
            final value = state.filterCategoryKeyList.contains(category);

            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                category,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<ArticlesInfoFilterBloc>().add(
                      ArticlesInfoFilterEvent.categoryChanged(
                        category,
                        value ?? false,
                      ),
                    );
              },
              value: value,
            );
          }).toList(),
        );
      },
    );
  }
}

class _ArticleFilterResetButton extends StatelessWidget {
  const _ArticleFilterResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          context.read<ArticlesInfoFilterBloc>().add(
                const ArticlesInfoFilterEvent.resetCategory(),
              );
          context.read<ArticlesInfoBloc>().add(
                const ArticlesInfoEvent.setCategoryKey(
                  categoryKeyList: [],
                ),
              );
          context.router.popForced();
        },
        child: Text(
          context.tr('Reset'),
          style: const TextStyle(color: ZPColors.primary),
        ),
      ),
    );
  }
}

class _ArticleFilterApplyButton extends StatelessWidget {
  const _ArticleFilterApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesInfoFilterBloc, ArticlesInfoFilterState>(
      buildWhen: (previous, current) =>
          previous.filterCategoryKeyList != current.filterCategoryKeyList,
      builder: (context, state) {
        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.filterApplyButton,
            onPressed: state.filterCategoryKeyList.isNotEmpty
                ? () {
                    context.read<ArticlesInfoBloc>().add(
                          ArticlesInfoEvent.setCategoryKey(
                            categoryKeyList: state.filterCategoryKeyList,
                          ),
                        );
                    context.router.popForced();
                  }
                : null,
            child: Text(
              context.tr('Apply'),
              style: const TextStyle(color: ZPColors.white),
            ),
          ),
        );
      },
    );
  }
}
