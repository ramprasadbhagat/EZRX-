part of 'package:ezrxmobile/presentation/faq/faq_info.dart';

class _CategoryTile extends StatelessWidget {
  final FAQCategoryGroup faqCategoryGroup;
  const _CategoryTile({
    Key? key,
    required this.faqCategoryGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqBloc, FaqState>(
      buildWhen: (previous, current) =>
          previous.getSearchedFaqList != current.getSearchedFaqList,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !state.searchKey.validFilterSearchKey &&
                    state.selectedCategory.getOrDefaultValue('') !=
                        faqCategoryGroup.displayName
                ? Text(
                    faqCategoryGroup.displayName,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: ZPColors.primary),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
            ...faqCategoryGroup.faqItem
                .map(
                  (e) => CustomCard(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: custom.ExpansionTile(
                      threeLineTitle: true,
                      initiallyExpanded: false,
                      iconColor: ZPColors.primary,
                      title: Text(
                        e.question,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: ZPColors.primary),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            e.answer,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: ZPColors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }
}
