import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/manage_payment_method/manage_payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPaymentMethodsPage extends StatelessWidget {
  const EditPaymentMethodsPage({
    Key? key,
    required this.salesOrg,
    required this.oldPaymentMethod,
  }) : super(key: key);
  final SalesOrg salesOrg;
  final PaymentMethod oldPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('editPaymentMethod'),
      appBar: AppBar(title: const Text('Edit Payment Method').tr()),
      body: BlocConsumer<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
        listenWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {
              if (!state.isSubmitting) {
                context
                    .read<PaymentMethodsBloc>()
                    .add(const PaymentMethodsEvent.fetch());
                context.router.pop();
              }
            },
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (success) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) {
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    BalanceTextRow(
                      keyText: 'Sales Organization'.tr(),
                      valueText:
                          '${salesOrg.getOrDefaultValue('')} - ${salesOrg.buName}',
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                    const SizedBox(height: 20),
                    BalanceTextRow(
                      keyText: 'Old Payment Method'.tr(),
                      valueText: oldPaymentMethod.getOrDefaultValue(''),
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                    const SizedBox(height: 20),
                    _NewPaymentMethodField(),
                    const SizedBox(height: 20),
                    EditPaymentMethodButton(
                      salesOrg: salesOrg,
                      oldPaymentMethod: oldPaymentMethod,
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NewPaymentMethodField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFormField(
          key: const Key('newPaymentMethodField'),
          autocorrect: false,
          enabled: !state.isSubmitting,
          decoration: InputDecoration(labelText: 'New Payment Method'.tr()),
          onChanged: (value) => context.read<ManagePaymentMethodsBloc>().add(
                ManagePaymentMethodsEvent.newPaymentMethodChanged(
                  paymentMethod: value,
                ),
              ),
          validator: (text) => PaymentMethod(text!).value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'New payment method cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
        );
      },
    );
  }
}

class EditPaymentMethodButton extends StatelessWidget {
  const EditPaymentMethodButton({
    Key? key,
    required this.salesOrg,
    required this.oldPaymentMethod,
  }) : super(key: key);

  final SalesOrg salesOrg;
  final PaymentMethod oldPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManagePaymentMethodsBloc, ManagePaymentMethodsState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('editPaymentMethodButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ManagePaymentMethodsBloc>().add(
                        ManagePaymentMethodsEvent.editPaymentMethod(
                          salesOrg: salesOrg,
                          oldPaymentMethod: oldPaymentMethod,
                        ),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Edit Payment Method').tr(),
          ),
        );
      },
    );
  }
}
