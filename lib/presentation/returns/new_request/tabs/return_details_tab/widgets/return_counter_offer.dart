import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _decimalOnlyRegex = RegExp(r'^\d+\.?\d{0,10}');

class ReturnCounterOfferField extends StatelessWidget {
  const ReturnCounterOfferField({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.isReturnsOverrideEnable != current.isReturnsOverrideEnable,
      builder: (context, eligibilityState) {
        if (!eligibilityState.isReturnsOverrideEnable) {
          return const SizedBox.shrink();
        }

        return BlocBuilder<NewRequestBloc, NewRequestState>(
          buildWhen: (previous, current) =>
              previous.getReturnItemDetails(uuid).priceOverride !=
              current.getReturnItemDetails(uuid).priceOverride,
          builder: (context, state) {
            return TextFieldWithLabel(
              fieldKey: WidgetKeys.returnQuantityField(uuid),
              labelText:
                  '${context.tr('Request counter offer')} ${context.read<EligibilityBloc>().state.salesOrgConfigs.currency.code}',
              decoration: InputDecoration(
                hintText: context.tr('Request return unit price'),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(_decimalOnlyRegex),
              ],
              isEnabled: true,
              mandatory: false,
              initValue: context
                  .read<NewRequestBloc>()
                  .state
                  .getReturnItemDetails(uuid)
                  .priceOverride
                  .getOrDefaultValue(''),
              onChanged: (value) => context.read<NewRequestBloc>().add(
                    NewRequestEvent.additionInfoChanged(
                      additionInfo: context
                          .read<NewRequestBloc>()
                          .state
                          .getReturnItemDetails(uuid)
                          .copyWith(
                            priceOverride: CounterOfferValue(value),
                          ),
                    ),
                  ),
            );
          },
        );
      },
    );
  }
}
