import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'material_frame_wrapper.dart';
import 'multi_bloc_provider_frame_wrapper.dart';

class WidgetUtils {
  static StackRouterScope getScopedWidget(
      {required AppRouter autoRouterMock,
      List<BlocProvider> providers = const <BlocProvider>[],
      required Widget child}) {
    EasyLocalization.logger.enableLevels = [];
    EasyLocalization.logger.enableBuildModes = [];

    return StackRouterScope(
      controller: autoRouterMock,
      stateHash: 0,
      child: providers.isNotEmpty
          ? MultiBlocProviderFrameWrapper(
              providers: providers,
              child: child,
            )
          : MaterialFrameWrapper(
              child: child,
            ),
    );
  }
}
