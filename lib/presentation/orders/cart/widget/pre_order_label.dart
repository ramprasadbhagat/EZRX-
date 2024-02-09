import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreOrderLabel extends StatelessWidget {
  final bool inStock;
  const PreOrderLabel({Key? key, required this.inStock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return !inStock && !eligibilityState.salesOrgConfigs.hideStockDisplay
        ? StatusLabel(
            status: eligibilityState.outOfStockProductStatus,
            valueColor:
                eligibilityState.outOfStockProductStatus.displayStatusTextColor,
          )
        : const SizedBox.shrink();
  }
}
