import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdiUserContinueNote extends StatelessWidget {
  const EdiUserContinueNote({Key? key, required this.maxStepsReached})
      : super(key: key);
  final bool maxStepsReached;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDocumentTypeBloc, OrderDocumentTypeState>(
      buildWhen: (previous, current) =>
          previous.selectedOrderType != current.selectedOrderType,
      builder: (context, state) {
        return _displayNote(context) && maxStepsReached
            ? SizedBox(
                height: 38,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '*Note: For special orders if you want to proceed please select order type inside Additional Information.'
                          .tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  bool _displayNote(BuildContext context) {
    final orderType = context.read<OrderDocumentTypeBloc>().state;
    final eligibilityState = context.read<EligibilityBloc>().state;

    return eligibilityState.customerCodeInfo.status.isEDI &&
        eligibilityState.user.role.type.isSalesRepRole &&
        !orderType.isSpecialOrderType &&
        !eligibilityState.salesOrgConfigs.disableOrderType;
  }
}
