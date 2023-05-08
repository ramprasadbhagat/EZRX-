import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/presentation/orders/create_order/additional_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdditionalDetailsStep extends StatelessWidget {
  const AdditionalDetailsStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      key: const Key('additionalDetailsFormKey'),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return AdditionalDetails(
          config: context.read<SalesOrgBloc>().state.configs,
          state: state,
        );
      },
    );
  }
}
