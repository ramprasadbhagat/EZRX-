import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveTemplateTextField extends StatelessWidget {
  const SaveTemplateTextField({
    Key? key,
  }) : super(key: key);

  final String currentTemplateName = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTemplateListBloc, OrderTemplateListState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                key: const Key('saveTemplateInputField'),
                initialValue: currentTemplateName,
                maxLines: null,
                maxLength: 35,
                decoration: InputDecoration(
                  labelText: 'Template name'.tr(),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                onChanged: (value) => context.read<OrderTemplateListBloc>().add(
                      OrderTemplateListEvent.templateNameChanged(value),
                    ),
                validator: (_) => state.templateName.value.fold(
                  (f) => f.maybeMap(
                    empty: (_) => 'Template name cannot be empty.'.tr(),
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
