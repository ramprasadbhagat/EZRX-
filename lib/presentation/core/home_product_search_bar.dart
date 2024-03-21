part of 'package:ezrxmobile/presentation/core/custom_app_bar.dart';

class _HomeProductSearchBar extends StatelessWidget {
  final bool isCustomerBlocked;
  final Color? boxShadowColor;
  const _HomeProductSearchBar({
    Key? key,
    required this.isCustomerBlocked,
    this.boxShadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: WidgetKeys.homeProductSearchBar,
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Expanded(
                child: ColoredBox(
                  color: ZPColors.primary,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: boxShadowColor ??
                            (isCustomerBlocked
                                ? ZPColors.customerBlockedBannerColor
                                : ZPColors.white),
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ProductSearchEntry(),
        ),
      ],
    );
  }
}
