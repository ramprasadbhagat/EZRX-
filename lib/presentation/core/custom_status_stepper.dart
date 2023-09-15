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
      itemCount: customStep.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            _CustomStepWithIcon(
              customStep: customStep,
              index: index,
            ),
            _SubStatusSection(
              customStep: customStep,
              index: index,
            ),
          ],
        );
      },
    );
  }
}

class _CustomStepWithIcon extends StatelessWidget {
  final List<CustomStep> customStep;
  final int index;

  const _CustomStepWithIcon({
    Key? key,
    required this.customStep,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///TODO: will implement after datetime is availbale in the api
        // Column(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       Text(
        //         customStep[index].title,
        //         style: _titleStyle(context, customStep[index]),
        //       ),
        //       Text(
        //         customStep[index].subtitle,
        //         style: _subTitleStyle(context, customStep[index]),
        //       ),
        //     ],
        //   ),
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
                      : ZPColors.extraDarkGreen,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: customStep[index].state == CustomStepState.disabled
                        ? ZPColors.lightGray
                        : ZPColors.extraDarkGreen,
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
                width: index >= (customStep.length - 1) ? 0.0 : 1.0,
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
  }
}

class _SubStatusSection extends StatelessWidget {
  final List<CustomStep> customStep;
  final int index;

  const _SubStatusSection({
    Key? key,
    required this.customStep,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: customStep[index]
          .subSection
          .map(
            (e) => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Column(
                    children: [
                      Container(
                        color: ZPColors.lightGray,
                        width: 1,
                        height: 20,
                      ),
                      const Icon(
                        Icons.circle,
                        size: 16,
                        color: ZPColors.lightGray,
                      ),
                      Container(
                        color: ZPColors.lightGray,
                        width: 1.0,
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    e,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class CustomStep {
  const CustomStep({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.icon,
    required this.subSection,
    this.state = CustomStepState.active,
  });

  final String title;

  final String subtitle;
  final IconData icon;

  final String status;

  final CustomStepState state;
  final List<String> subSection;
}

enum CustomStepState {
  active,
  disabled,
}

TextStyle _titleStyle(BuildContext context, CustomStep customStep) {
  switch (customStep.state) {
    case CustomStepState.disabled:
      return Theme.of(context).textTheme.labelMedium!.copyWith(
            color: ZPColors.lightGray,
          );
    default:
      return Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: ZPColors.black);
  }
}

///TODO: will use in future
// TextStyle _subTitleStyle(BuildContext context, CustomStep customStep) {
//   switch (customStep.state) {
//     case CustomStepState.disabled:
//       return Theme.of(context).textTheme.bodySmall!.copyWith(
//             color: ZPColors.lightGray,
//           );
//     default:
//       return Theme.of(context)
//           .textTheme
//           .bodySmall!
//           .copyWith(color: ZPColors.black);
//   }
// }
