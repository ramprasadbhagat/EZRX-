import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemarksForm extends StatelessWidget {
  const RemarksForm({
    Key? key,
    this.currentRemarkData = '',
  }) : super(key: key);

  final String currentRemarkData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
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
              initialValue: currentRemarkData,
              maxLines: null,
              maxLength: 132,
              decoration: const InputDecoration(
                label: Text('Remarks'),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.primary, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.darkGray, width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              onChanged: (value) => context.read<CartBloc>().add(
                    CartEvent.remarksChanged(value),
                  ),
              validator: (_) =>
                  context.read<CartBloc>().state.remarks.value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Remarks cannot be empty.'.tr(),
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
