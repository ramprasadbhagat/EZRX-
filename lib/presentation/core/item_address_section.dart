import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemAddressSection extends StatelessWidget {
  const ItemAddressSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.shipToInfo.shipToName.name1,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Sold To: '.tr(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                state.customerCodeInfo.customerCodeSoldTo,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Text(
                  '${state.customerCodeInfo.customerName.name1}, ${state.customerCodeInfo.customerAddress.street1} ${state.customerCodeInfo.customerAddress.street2}, ${state.customerCodeInfo.postalCode}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Text(
                'Delivery to:'.tr(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                state.shipToInfo.shipToCustomerCode,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${state.customerCodeInfo.customerName.name1}, ${state.customerCodeInfo.customerAddress.street1} ${state.customerCodeInfo.customerAddress.street2}, ${state.customerCodeInfo.postalCode}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
