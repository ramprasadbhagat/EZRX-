part of '../contact_us_page.dart';

class _ContactNumberTextField extends StatelessWidget {
  const _ContactNumberTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting ||
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        final isLoading = state.isSubmitting;
        final country = context.read<SalesOrgBloc>().state.salesOrg.country;

        return Column(
          key: WidgetKeys.phoneNumberKey,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Contact Number'.tr(),
                style: Theme.of(context).textTheme.labelSmall,
                children: <TextSpan>[
                  TextSpan(
                    text: ' *',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InternationalPhoneNumberInput(
              countries: [country],
              onInputValidated: (bool value) {},
              autoValidateMode: state.showErrorMessage
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              ignoreBlank: false,
              onInputChanged: isLoading
                  ? null
                  : (value) {
                      if (value.phoneNumber == value.dialCode) {
                        context.read<ContactUsBloc>().add(
                              ContactUsEvent.onContactNumberChange(
                                newValue: value.phoneNumber!
                                    .replaceAll(value.dialCode ?? '', ''),
                              ),
                            );
                      } else {
                        context.read<ContactUsBloc>().add(
                              ContactUsEvent.onContactNumberChange(
                                newValue: value.phoneNumber!,
                              ),
                            );
                      }
                    },
              formatInput: false,
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
                leadingPadding: 16,
                showFlags: true,
                setSelectorButtonAsPrefixIcon: true,
              ),
              inputDecoration: InputDecoration(
                hintText: 'Enter your phone number'.tr(),
              ),
              validator: (_) {
                return context
                    .read<ContactUsBloc>()
                    .state
                    .contactUs
                    .contactNumber
                    .value
                    .fold(
                      (f) => f.maybeMap(
                        empty: (_) => 'Enter a valid contact number.'.tr(),
                        orElse: () => null,
                      ),
                      (_) => null,
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
