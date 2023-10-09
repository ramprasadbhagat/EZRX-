part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

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
          child: BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) =>
                current.activeLanguage != previous.activeLanguage,
            builder: (context, state) {
              return DropdownButtonFormField2<Locale>(
                key: WidgetKeys.profilePageLanguageDropdown,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 10, 12, 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: ZPColors.black,
                  ),
                ),
                items: state.user.supportedLanguages
                    .map(
                      (e) => DropdownMenuItem<Locale>(
                        key: WidgetKeys.genericKey(
                          key: 'language_${e.languageString()}',
                        ),
                        value: e,
                        child: Text(e.languageString()),
                      ),
                    )
                    .toList(),
                value: state.activeLanguage,
                onChanged: state.user.supportMultipleLanguage
                    ? (selectedLanguage) => context.read<UserBloc>().add(
                          UserEvent.selectLanguage(
                            selectedLanguage ??
                                const Locale(ApiLanguageCode.english),
                          ),
                        )
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}
