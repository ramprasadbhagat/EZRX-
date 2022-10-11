import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'multi_bloc_provider_frame_wrapper.dart';

class WidgetUtils {
  static StackRouterScope getScopedWidget(
      {required AppRouter autoRouterMock,
      required List<BlocProvider> providers,
      required Widget child}) {
    EasyLocalization.logger.enableBuildModes = [];

    return StackRouterScope(
      controller: autoRouterMock,
      stateHash: 0,
      child: MultiBlocProviderFrameWrapper(
        providers: providers,
        child: child,
      ),
    );
  }
}
