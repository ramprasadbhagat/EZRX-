import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/presentation/core/po_attachment.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPoAttachmentSection extends StatelessWidget {
  const HistoryPoAttachmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      builder: (context, state) {
        if (!state.orderHistoryDetails.poDocumentsAvailable) {
          return const SizedBox();
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: PoAttachment(
                poDocuments:
                    state.orderHistoryDetails.orderHistoryDetailsPoDocuments,
                poattachMentRenderMode: PoAttachMentRenderMode.view,
                uploadingPocDocument: const <PoDocuments>[],
              ),
            ),
            const Divider(
              color: ZPColors.lightGray,
              endIndent: 0,
              indent: 0,
            ),
          ],
        );
      },
    );
  }
}
