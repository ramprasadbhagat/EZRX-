import 'package:ezrxmobile/presentation/intro/intro_object.dart';
import 'package:flutter/material.dart';


class IntroStep extends StatelessWidget {
  final IntroObject introObject;
  final Function() buttonOnTap;

  const IntroStep({
    Key? key,
    required this.introObject,
    required this.buttonOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: introObject.backgroundColor,
      padding: const EdgeInsets.symmetric(
        vertical: 76,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Image.asset(
              introObject.assetsPath,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  introObject.heading,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: introObject.headingColor,
                        fontSize: 24,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  introObject.description,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: introObject.descriptionColor),
                ),
                const Spacer(),
                OutlinedButton(
                  style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                        backgroundColor: MaterialStateProperty.all(
                          introObject.buttonBGColor,
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide(color: introObject.buttonBorderColor),
                        ),
                      ),
                  onPressed: buttonOnTap,
                  child: Text(
                    introObject.buttonText,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: introObject.buttonTextColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
