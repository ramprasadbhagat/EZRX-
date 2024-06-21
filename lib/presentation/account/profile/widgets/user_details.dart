part of 'package:ezrxmobile/presentation/account/profile/profile_page.dart';

class _UserDetails extends StatelessWidget {
  const _UserDetails({super.key});

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
                keyText: context.tr('First name'),
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
                keyText: context.tr('Last name'),
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
                keyText: context.tr('Email'),
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
                keyText: context.tr('Username'),
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
                keyText: context.tr('Contact number'),
                valueText: state.user.mobileNumber.displayTelephoneNumber,
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
              if (!context
                  .read<EligibilityBloc>()
                  .state
                  .disablePaymentTermsDisplayForCustomer)
                BalanceTextRow(
                  keyFlex: 3,
                  valueFlex: 5,
                  keyText: context.tr('Payment terms'),
                  valueText: context
                      .read<EligibilityBloc>()
                      .state
                      .customerCodeInfo
                      .displayPaymentTerm,
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
