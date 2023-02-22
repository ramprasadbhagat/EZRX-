import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistorySystemMessageSection extends StatelessWidget {
  const HistorySystemMessageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.orderHistoryDetails.orderHistoryDetailsMessages.isEmpty) {
          return const SizedBox();
        }

        return Container(
          key: const ValueKey('systemMessage'),
          color: ZPColors.systrmMessageColor,
          child: ListTile(
            leading: const Icon(
              Icons.error,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'System Message:'.tr(),
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      state.orderHistoryDetails.orderHistoryDetailsMessages.map(
                    (e) {
                      return e.message.isEmpty
                          ? SizedBox(
                              key: const ValueKey('messageEmpty'),
                              width: 40,
                              child: LoadingShimmer.tile(),
                            )
                          : Text(
                              e.message,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
