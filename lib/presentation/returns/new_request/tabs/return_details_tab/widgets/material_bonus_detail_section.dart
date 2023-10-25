part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _MaterialBonusDetailsSection extends StatelessWidget {
  const _MaterialBonusDetailsSection({
    Key? key,
    required this.item,
    required this.detail,
  }) : super(key: key);
  final ReturnMaterial item;
  final ReturnItemDetails detail;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      labelText: context.tr('Bonus return details'),
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
                BalanceQuantityField(data: item),
                const SizedBox(
                  height: 8,
                ),
                ReturnQuantityField(
                  uuid: detail.uuid,
                  balanceQuantity: item.balanceQuantity,
                  key: WidgetKeys.bonusQuantityField(detail.uuid),
                ),
                const SizedBox(
                  height: 8,
                ),
                ReturnValueField(
                  data: item,
                ),
                const SizedBox(
                  height: 8,
                ),
                ReturnCounterOfferField(
                  uuid: detail.uuid,
                  enabled: false,
                ),
                const SizedBox(
                  height: 8,
                ),
                ReasonDropdown(
                  uuid: detail.uuid,
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
