import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MaterialFrameWrapper extends StatelessWidget {
  final Widget child;
  final bool usingLocalization;

  const MaterialFrameWrapper(
      {Key? key, required this.child, this.usingLocalization = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return usingLocalization
          ? MaterialApp(
              theme: appThemeData[AppTheme.light],
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              home: _buildHome(),
            )
          : MaterialApp(
              theme: appThemeData[AppTheme.light],
              home: _buildHome(),
            );
    });
  }

  Widget _buildHome() {
    EasyLocalization.logger.enableBuildModes = [];
    return MediaQuery(
      data: const MediaQueryData(size: Size(480, 900)),
      child: child,
    );
  }
}
