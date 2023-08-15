
part of 'package:ezrxmobile/presentation/faq/faq.dart';
class _FAQSearchBar extends StatefulWidget {
  const _FAQSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_FAQSearchBar> createState() => FAQSearchBarState();
}

class FAQSearchBarState extends State<_FAQSearchBar> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.value = TextEditingValue(
      text: context.read<FaqBloc>().state.searchKey.getOrDefaultValue(''),
      selection: TextSelection.collapsed(
        offset: controller.selection.base.offset,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqBloc, FaqState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        controller.text = state.searchKey.getOrDefaultValue('');

        return Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: SearchBar(
            controller: controller,
            onSearchChanged: (value) {
              context.read<FaqBloc>().add(
                    FaqEvent.updatedSearchFaq(searchKey: value),
                  );
            },
            isDense: true,
            onSearchSubmitted: (value) {
              context.read<FaqBloc>().add(
                    FaqEvent.updatedSearchFaq(searchKey: value),
                  );
            },
            clearIconKey: WidgetKeys.clearIconKey,
            customValidator: () => SearchKey.search(controller.text).isValid(),
            onClear: () {
              if (controller.text.isEmpty) return;
              controller.clear();
              context.read<FaqBloc>().add(
                    const FaqEvent.updatedSearchFaq(searchKey: ''),
                  );
            },
            border: InputBorder.none,
          ),
        );
      },
    );
  }
}
