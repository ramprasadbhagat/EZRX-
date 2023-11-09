part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _TransferMethodsSection extends StatelessWidget {
  const _TransferMethodsSection({
    Key? key,
    required this.visible,
    required this.bankInstruction,
  }) : super(key: key);
  final bool visible;
  final BankInstruction bankInstruction;
  @override
  Widget build(BuildContext context) {
    return visible
        ? _DetailsInfoSection(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            label: 'Transfer methods',
            labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ZPColors.primary,
                  fontWeight: FontWeight.w600,
                ),
            child: Column(
              children: bankInstruction.transferMethods
                  .map(
                    (e) => _ExpandableTransferMethodItem(
                      transferMethod: e,
                    ),
                  )
                  .toList(),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _ExpandableTransferMethodItem extends StatefulWidget {
  final TransferMethod transferMethod;
  const _ExpandableTransferMethodItem({
    Key? key,
    required this.transferMethod,
  }) : super(key: key);

  @override
  State<_ExpandableTransferMethodItem> createState() =>
      __ExpandableTransferMethodItemState();
}

class __ExpandableTransferMethodItemState
    extends State<_ExpandableTransferMethodItem> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(widget.transferMethod.title),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ZPColors.primary,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                ...List.generate(
                  widget.transferMethod.paymentInstructions.length,
                  (firstIndex) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.transferMethod.paymentInstructions[firstIndex]
                          .instructionType.isNotEmpty)
                        Text(
                          context.tr(
                            widget
                                .transferMethod
                                .paymentInstructions[firstIndex]
                                .instructionType,
                          ),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ZPColors.shadesBlack,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ...List.generate(
                        widget.transferMethod.paymentInstructions[firstIndex]
                            .instructions.length,
                        (secondIndex) => Text(
                          context.tr(
                            widget
                                .transferMethod
                                .paymentInstructions[firstIndex]
                                .instructions[secondIndex],
                          ),
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ZPColors.passwordValidationsColor,
                                    height: 1.5,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
