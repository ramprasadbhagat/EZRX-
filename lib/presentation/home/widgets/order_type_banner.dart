import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/home/widgets/select_order_type_bottom_sheet.dart';
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
          previous.isShowOrderType != current.isShowOrderType ||
          previous.selectedOrderTypeInfo != current.selectedOrderTypeInfo,
      builder: (context, state) {
        if (!state.isShowOrderType) return const SizedBox.shrink();

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: padding12),
          tileColor: ZPColors.bannerBackground,
          title: Text(
            '${context.tr('Order Type')} : ${state.selectedOrderTypeInfo.displayText}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          trailing: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.edit_outlined,
              color: theme.iconTheme.color,
            ),
            iconSize: 20,
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              isDismissible: false,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.8,
              ),
              builder: (_) => const SelectOrderTypeBottomSheet(),
            ),
          ),
        );
      },
    );
  }
}
