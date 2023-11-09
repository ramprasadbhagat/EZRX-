part of 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';

class _DetailsInfoSection extends StatelessWidget {
  const _DetailsInfoSection({
    Key? key,
    required this.label,
    this.labelStyle,
    required this.child,
    this.padding,
  }) : super(key: key);
  final String label;
  final Widget child;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Text(
            context.tr(label),
            style: labelStyle ?? Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: child,
        ),
      ],
    );
  }
}
