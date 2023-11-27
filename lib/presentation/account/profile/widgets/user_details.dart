part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

class _UserDetails extends StatelessWidget {
  const _UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: BlocBuilder<UserBloc, UserState>(
        buildWhen: (previous, current) => previous.user != current.user,
        builder: (context, state) {
          return Column(
            children: [
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: 'First name'.tr(),
                valueText: state.user.fullName.firstName,
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: 20),
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: 'Last name'.tr(),
                valueText: state.user.fullName.lastName,
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: 20),
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: 'Email'.tr(),
                valueText: state.user.email.getOrDefaultValue(''),
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: 20),
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: 'Username'.tr(),
                valueText: state.user.username.getOrDefaultValue(''),
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: 20),
              BalanceTextRow(
                keyFlex: 3,
                valueFlex: 5,
                keyText: 'Contact number'.tr(),
                valueText: state.user.mobileNumber.displayLabel,
                keyTextStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.neutralsBlack),
                valueTextStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ZPColors.neutralsBlack),
              ),
              const SizedBox(height: 20),
              const _LanguageDropDown(),
            ],
          );
        },
      ),
    );
  }
}
