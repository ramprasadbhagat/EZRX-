import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AddPolicyConfiguration extends StatefulWidget {
  const AddPolicyConfiguration({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(20),
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
              BlocListener<PolicyConfigurationBloc, PolicyConfigurationState>(
                listener: (context, state) {},
                listenWhen: (previous, current) =>
                    previous.returnsAllowed != current.returnsAllowed,
                child: BlocBuilder<PolicyConfigurationBloc,
                    PolicyConfigurationState>(
                  builder: (context, state) {
                    return state.returnsAllowed.getOrCrash()
                        ? Column(
                            children: const [
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
              ),
              const _SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesOrganizationField extends StatelessWidget {
  const _SalesOrganizationField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context
          .read<EligibilityBloc>()
          .state
          .salesOrganisation
          .salesOrg
          .getOrCrash(),
      onChanged: (value) {},
      enabled: false,
      keyboardType: TextInputType.none,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        labelText: 'Sales Organization '.tr(),
        labelStyle: const TextStyle(
          fontSize: 12.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ZPColors.kPrimaryColor,
            width: 1.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ZPColors.kPrimaryColor,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ZPColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class _ReturnsAllowedField extends StatelessWidget {
  const _ReturnsAllowedField({Key? key}) : super(key: key);

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
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                PlatformSwitch(
                  key: const Key('flutterSwitch'),
                  activeColor: ZPColors.darkBlue,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.warning_amber_outlined,
                    color: ZPColors.red,
                    size: 20,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Text(
                      "This principal's materials will NOT be available for return via eZRX",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ZPColors.red,
                      ),
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
  const _PrincipalCodeField({Key? key}) : super(key: key);

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
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        labelText: 'Please assign a valid sales principal code'.tr(),
        labelStyle: const TextStyle(
          fontSize: 12.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ZPColors.kPrimaryColor,
            width: 1.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ZPColors.kPrimaryColor,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ZPColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class _MonthsBeforeExpiryField extends StatelessWidget {
  const _MonthsBeforeExpiryField({Key? key}) : super(key: key);

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
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        labelText: 'Months Before Expiry'.tr(),
        labelStyle: const TextStyle(
          fontSize: 12.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ZPColors.kPrimaryColor,
            width: 1.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ZPColors.kPrimaryColor,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ZPColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class _MonthsAfterExpiryField extends StatelessWidget {
  const _MonthsAfterExpiryField({Key? key}) : super(key: key);

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
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        labelText: 'Months After Expiry'.tr(),
        labelStyle: const TextStyle(
          fontSize: 12.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ZPColors.kPrimaryColor,
            width: 1.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ZPColors.kPrimaryColor,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: ZPColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

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
        style: ElevatedButton.styleFrom(
          backgroundColor: ZPColors.darkBlue,
        ),
        child: Text('Submit'.tr()),
      ),
    );
  }
}
