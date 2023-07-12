import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomStatusStepper extends StatelessWidget {
  final List<CustomStep> customStep;

  const CustomStatusStepper({
    Key? key,
    required this.customStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 32.0, bottom: 16.0),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  customStep[index].title,
                  style: _titleStyle(context, customStep[index]),
                ),
                Text(
                  customStep[index].subtitle,
                  style: _subTitleStyle(context, customStep[index]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Container(
                    color: ZPColors.lightGray,
                    width: index == 0 ? 0 : 1,
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: customStep[index].state == CustomStepState.disabled
                          ? ZPColors.transparent
                          : ZPColors.kPrimaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            customStep[index].state == CustomStepState.disabled
                                ? ZPColors.lightGray
                                : ZPColors.kPrimaryColor,
                      ),
                    ),
                    child: Icon(
                      customStep[index].icon,
                      size: 16,
                      color: customStep[index].state == CustomStepState.disabled
                          ? ZPColors.lightGray
                          : ZPColors.white,
                    ),
                  ),
                  Container(
                    color: ZPColors.lightGray,
                    width: index >= 3 ? 0.0 : 1.0,
                    height: 20,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                customStep[index].status,
                style: _titleStyle(context, customStep[index]),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomStep {
  const CustomStep({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.icon,
    this.state = CustomStepState.active,
  });

  final String title;

  final String subtitle;
  final IconData icon;

  final String status;

  final CustomStepState state;
}

enum CustomStepState {
  active,
  disabled,
}

TextStyle _titleStyle(BuildContext context, CustomStep customStep) {
  switch (customStep.state) {
    case CustomStepState.disabled:
      return Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: ZPColors.lightGray,
          );
    default:
      return Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: ZPColors.black);
  }
}

TextStyle _subTitleStyle(BuildContext context, CustomStep customStep) {
  switch (customStep.state) {
    case CustomStepState.disabled:
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.lightGray,
          );
    default:
      return Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: ZPColors.black);
  }
}
