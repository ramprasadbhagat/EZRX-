import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnCounterOfferField extends StatelessWidget {
  const ReturnCounterOfferField({
    Key? key,
    required this.enabled,
    required this.uuid,
  }) : super(key: key);

  final String uuid;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return !eligibilityState.isReturnsOverrideEnable
        ? const SizedBox.shrink()
        : Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<NewRequestBloc, NewRequestState>(
                buildWhen: (previous, current) =>
                    previous.getReturnItemDetails(uuid).priceOverride !=
                    current.getReturnItemDetails(uuid).priceOverride,
                builder: (context, state) {
                  final labelText =
                      '${context.tr('Request counter offer')} ${eligibilityState.salesOrgConfigs.currency.code}';
                  final initValue = state
                      .getReturnItemDetails(uuid)
                      .priceOverride
                      .getOrDefaultValue('');

                  return CustomNumericTextField.wholeNumber(
                    fieldKey: enabled
                        ? WidgetKeys.requestCounterOfferTextField(uuid)
                        : WidgetKeys.requestCounterOfferTextField(initValue),
                    labelText: labelText,
                    decoration: enabled
                        ? InputDecoration(
                            hintText: context.tr('Request return unit price'),
                          )
                        : const InputDecoration(
                            fillColor: ZPColors.inputBorderColor,
                            hintText: '0.00',
                          ),
                    isEnabled: enabled,
                    mandatory: false,
                    initValue: initValue,
                    onChanged: (value) => context.read<NewRequestBloc>().add(
                          NewRequestEvent.updateRequestCounterOffer(
                            uuid: uuid,
                            isChangeMaterialCounterOffer: enabled,
                            counterOfferValue: CounterOfferValue(value),
                          ),
                        ),
                  );
                },
              ),
            ],
          );
  }
}
