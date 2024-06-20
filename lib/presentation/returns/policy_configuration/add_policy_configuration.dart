import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AddPolicyConfiguration extends StatefulWidget {
  const AddPolicyConfiguration({super.key});

  @override
  State<AddPolicyConfiguration> createState() => AddPolicyConfigurationState();
}

late TextEditingController _principalCodecontroller;
late TextEditingController _monthsBeforeExpiryController;
late TextEditingController _monthsAfterExpiryController;
final formKey = GlobalKey<FormState>();

class AddPolicyConfigurationState extends State<AddPolicyConfiguration> {
  @override
  void initState() {
    super.initState();
    _principalCodecontroller = TextEditingController();
    _monthsBeforeExpiryController = TextEditingController(text: '0');
    _monthsAfterExpiryController = TextEditingController(text: '0');
  }

  @override
  void dispose() {
    _principalCodecontroller.dispose();
    _monthsBeforeExpiryController.dispose();
    _monthsAfterExpiryController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZPColors.white,
      appBar: AppBar(title: const Text('Add Policy Configuration').tr()),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const _SalesOrganizationField(),
                const SizedBox(
                  height: 16,
                ),
                const _PrincipalCodeField(),
                const SizedBox(
                  height: 16,
                ),
                const _ReturnsAllowedField(),
                const SizedBox(
                  height: 16,
                ),
                BlocConsumer<PolicyConfigurationBloc, PolicyConfigurationState>(
                  listenWhen: (previous, current) =>
                      previous.returnsAllowed != current.returnsAllowed,
                  listener: (context, state) {
                    state.failureOrSuccessOption.fold(
                      () {},
                      (either) => either.fold(
                        (failure) {
                          ErrorUtils.handleApiFailure(context, failure);
                        },
                        (_) {},
                      ),
                    );
                  },
                  builder: (context, state) {
                    return state.returnsAllowed.getOrCrash()
                        ? const Column(
                            children: [
                              _MonthsBeforeExpiryField(),
                              SizedBox(
                                height: 16,
                              ),
                              _MonthsAfterExpiryField(),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : const SizedBox.shrink();
                  },
                ),
                const _SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SalesOrganizationField extends StatelessWidget {
  const _SalesOrganizationField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context
          .read<EligibilityBloc>()
          .state
          .salesOrganisation
          .salesOrg
          .getOrCrash(),
      enabled: false,
      autocorrect: false,
      keyboardType: TextInputType.none,
      decoration: InputDecoration(
        labelText: 'Sales Organization '.tr(),
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
        prefix: const SizedBox(width: 15),
      ),
    );
  }
}

class _ReturnsAllowedField extends StatelessWidget {
  const _ReturnsAllowedField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PolicyConfigurationBloc, PolicyConfigurationState>(
      buildWhen: (previous, current) =>
          previous.returnsAllowed != current.returnsAllowed,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  'Return Allowed:'.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Spacer(),
                PlatformSwitch(
                  key: const Key('flutterSwitch'),
                  activeColor: ZPColors.primary,
                  value: state.returnsAllowed.getOrCrash(),
                  onChanged: (bool value) {
                    context.read<PolicyConfigurationBloc>().add(
                          const PolicyConfigurationEvent.returnsAllowedSwitch(),
                        );
                  },
                ),
              ],
            ),
            if (!state.returnsAllowed.getOrCrash())
              Row(
                children: [
                  const Icon(
                    Icons.warning_amber_outlined,
                    color: ZPColors.red,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      "This principal's materials will NOT be available for return via eZRX",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.apply(color: ZPColors.red),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}

class _PrincipalCodeField extends StatelessWidget {
  const _PrincipalCodeField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _principalCodecontroller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return (!PrincipalCode(
          _principalCodecontroller.text,
        ).isValid())
            ? 'Please fill in this field.'.tr()
            : null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Please assign a valid sales principal code'.tr(),
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
        prefix: const SizedBox(width: 15),
      ),
    );
  }
}

class _MonthsBeforeExpiryField extends StatelessWidget {
  const _MonthsBeforeExpiryField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _monthsBeforeExpiryController,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(2),
      ],
      onChanged: (value) {
        _monthsBeforeExpiryController.value = TextEditingValue(
          text: MonthsBeforeExpiry.change(value).getValue(),
          selection: TextSelection.collapsed(
            offset: _monthsBeforeExpiryController.selection.base.offset,
          ),
        );
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Months Before Expiry'.tr(),
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
        prefix: const SizedBox(width: 15),
      ),
    );
  }
}

class _MonthsAfterExpiryField extends StatelessWidget {
  const _MonthsAfterExpiryField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _monthsAfterExpiryController,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(2),
      ],
      onChanged: (value) {
        _monthsAfterExpiryController.value = TextEditingValue(
          text: MonthsAfterExpiry.change(value).getValue(),
          selection: TextSelection.collapsed(
            offset: _monthsAfterExpiryController.selection.base.offset,
          ),
        );
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Months After Expiry'.tr(),
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
        prefix: const SizedBox(width: 15),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            final returnsAllowed = context
                .read<PolicyConfigurationBloc>()
                .state
                .returnsAllowed
                .getOrCrash();
            context.read<PolicyConfigurationBloc>().add(
                  PolicyConfigurationEvent.add(
                    policyConfigurationItems:
                        PolicyConfiguration.empty().copyWith(
                      returnsAllowed: ReturnsAllowed(returnsAllowed),
                      monthsAfterExpiry: MonthsAfterExpiry.change(
                        _monthsAfterExpiryController.text,
                      ),
                      monthsBeforeExpiry: MonthsBeforeExpiry.change(
                        _monthsBeforeExpiryController.text,
                      ),
                      principalCode:
                          PrincipalCode(_principalCodecontroller.text),
                      salesOrg: SalesOrg(
                        context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrganisation
                            .salesOrg
                            .getOrCrash(),
                      ),
                    ),
                  ),
                );
            context.router.pop();
          }
        },
        child: Text('Submit'.tr()),
      ),
    );
  }
}
