import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/remarks_form/remarks_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemarksForm extends StatelessWidget {
  const RemarksForm({
    Key? key,
    this.currentRemarkData = '',
  }) : super(key: key);

  final String currentRemarkData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemarksFormBloc, RemarksFormState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Material(
            color: Colors.transparent,
            child: TextFormField(
              key: const Key('remarkTextField'),
              keyboardType: TextInputType.multiline,
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'\n'),
                ),
              ],
              initialValue: currentRemarkData,
              maxLines: null,
              maxLength: 132,
              decoration: const InputDecoration(
                hintText: 'Enter a remark',
              ),
              onChanged: (value) => context.read<RemarksFormBloc>().add(
                    RemarksFormEvent.remarksChanged(value),
                  ),
              validator: (_) => state.remarks.value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Remark cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
            ),
          ),
        );
      },
    );
  }
}
