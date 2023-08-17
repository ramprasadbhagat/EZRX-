part of '../profile_page.dart';

class _LanguageDropDown extends StatelessWidget {
  const _LanguageDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            'Language'.tr(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
        ),
        const Text(':  '),
        Expanded(
          flex: 8,
          child: BlocBuilder<LanguageBloc, LanguageState>(
            buildWhen: (previous, current) =>
                current.activeLanguage != previous.activeLanguage,
            builder: (context, state) {
              return DropdownButtonFormField2<Language>(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 12, 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ZPColors.black,
                  ),
                ),
                items: state.languages
                    .map((e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Text(e.subTag.languageString),
                      ),
                    )
                    .toList(),
                value: state.activeLanguage,
                onChanged: (selectedLanguage) =>
                    context.read<LanguageBloc>().add(
                          LanguageEvent.changeLanguage(
                            selectedLanguage ?? Language.english(),
                          ),
                        ),
              );
            },
          ),
        ),
      ],
    );
  }
}
