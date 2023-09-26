import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewRequestButton extends StatelessWidget {
  const NewRequestButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      icon: Icons.add,
      label: 'New request'.tr(),
      onPress: () {
        context.read<UsageCodeBloc>().add(
              UsageCodeEvent.fetch(
                salesOrg: context.read<EligibilityBloc>().state.salesOrg,
              ),
            );
        context.read<ReturnItemsBloc>().add(
              ReturnItemsEvent.fetch(
                appliedFilter: ReturnItemsFilter.empty(),
                salesOrganisation:
                    context.read<EligibilityBloc>().state.salesOrganisation,
                customerCodeInfo:
                    context.read<EligibilityBloc>().state.customerCodeInfo,
                shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
                searchKey: SearchKey.search(''),
              ),
            );
        context.read<NewRequestBloc>().add(
              const NewRequestEvent.initialized(),
            );
        context.router.pushNamed('returns/new_request');
      },
      scrollController: controller,
    );
  }
}
