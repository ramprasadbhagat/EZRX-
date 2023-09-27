part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _MaterialReturnDetailsSection extends StatelessWidget {
  const _MaterialReturnDetailsSection({
    Key? key,
    required this.item,
    required this.detail,
  }) : super(key: key);
  final ReturnMaterial item;
  final ReturnItemDetails detail;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      labelText: 'Material return details'.tr(),
      child: BlocBuilder<NewRequestBloc, NewRequestState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) {
          return Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: BalanceQuantityField(data: item),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: ReturnValueField(
                        data: item,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                ReturnQuantityField(
                  balanceQuantity: item.balanceQuantity,
                  uuid: detail.uuid,
                ),
                const SizedBox(
                  height: 8,
                ),
                ReturnCounterOfferField(
                  uuid: detail.uuid,
                ),
                const SizedBox(height: 8),
                ReasonDropdown(
                  uuid: item.uuid,
                ),
                const SizedBox(
                  height: 8,
                ),
                _CommentsField(
                  uuid: item.uuid,
                ),
                const SizedBox(
                  height: 8,
                ),
                _UploadAttachmentSection(data: item),
              ],
            ),
          );
        },
      ),
    );
  }
}
