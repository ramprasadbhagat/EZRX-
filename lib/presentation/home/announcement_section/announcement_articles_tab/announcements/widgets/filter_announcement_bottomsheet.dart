part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

class _AnnouncementFilterBottomSheet extends StatelessWidget {
  const _AnnouncementFilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      sheetKey: WidgetKeys.announcementFilterKey,
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
          const _AnnouncementCategorySelector(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              _AnnouncementFilterResetButton(),
              SizedBox(
                width: 12,
              ),
              _AnnouncementFilterApplyButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnnouncementCategorySelector extends StatelessWidget {
  const _AnnouncementCategorySelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementFilterBloc, AnnouncementFilterState>(
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
              key: WidgetKeys.announcementStatusFilter(category, value),
              contentPadding: EdgeInsets.zero,
              title: Text(
                category,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<AnnouncementFilterBloc>().add(
                      AnnouncementFilterEvent.categoryChanged(
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

class _AnnouncementFilterResetButton extends StatelessWidget {
  const _AnnouncementFilterResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          context.read<AnnouncementFilterBloc>().add(
                const AnnouncementFilterEvent.resetCategory(),
              );
          context.read<AnnouncementInfoBloc>().add(
                const AnnouncementInfoEvent.setCategoryKey(
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

class _AnnouncementFilterApplyButton extends StatelessWidget {
  const _AnnouncementFilterApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementFilterBloc, AnnouncementFilterState>(
      builder: (context, state) {
        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.filterApplyButton,
            onPressed: state.filterCategoryKeyList.isEmpty
                ? null
                : () {
                    context.read<AnnouncementInfoBloc>().add(
                          AnnouncementInfoEvent.setCategoryKey(
                            categoryKeyList: state.filterCategoryKeyList,
                          ),
                        );
                    context.router.popForced();
                  },
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
