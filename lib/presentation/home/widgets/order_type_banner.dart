import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/order_type.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTypeBanner extends StatelessWidget {
  const OrderTypeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.isShowOrderType != current.isShowOrderType,
      builder: (context, state) {
        if (!state.isShowOrderType) return const SizedBox.shrink();

        final currentOrderType = state.salesOrgConfigs.orderTypes.firstWhere(
          (orderType) => orderType.enabled,
          orElse: () => OrderType.empty(),
        );
        final orderTypeCode = currentOrderType.orderType.getOrDefaultValue('');
        final description = currentOrderType.description.displayNAIfEmpty;

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: padding12),
          tileColor: ZPColors.bannerBackground,
          title: Text(
            '${context.tr('Order Type')} : $description ($orderTypeCode)',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.edit_outlined,
              color: theme.iconTheme.color,
            ),
            iconSize: 20,
            onPressed: () => _onChangeOrderType(context, state),
          ),
        );
      },
    );
  }

  void _onChangeOrderType(BuildContext context, EligibilityState state) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) => _OrderTypeSelector(eligibilityState: state),
    );
  }
}

// TODO(anyone): update UI bottom sheet and logic update order type
class _OrderTypeSelector extends StatelessWidget {
  const _OrderTypeSelector({required this.eligibilityState});
  final EligibilityState eligibilityState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final orderTypes = eligibilityState.salesOrgConfigs.orderTypes;

    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Change Order Type'.tr(),
            style: theme.textTheme.titleLarge,
          ),
          ...orderTypes
              .map((e) => Text(e.orderType.getOrDefaultValue('defaultValue'))),
        ],
      ),
    );
  }
}
