import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'material_frame_wrapper.dart';
import 'multi_bloc_provider_frame_wrapper.dart';

class WidgetUtils {
  static RouteDataScope getScopedWidget({
    required AppRouter autoRouterMock,
    required Widget child,
    final bool useMediaQuery = true,
    List<BlocProvider> providers = const <BlocProvider>[],
    String? routeName,
  }) {
    EasyLocalization.logger.enableLevels = [];
    EasyLocalization.logger.enableBuildModes = [];

    return RouteDataScope(
      routeData: RouteData(
        router: autoRouterMock,
        route: RouteMatch(
          name: routeName ?? 'MaterialRootRoute',
          segments: const [''],
          path: '',
          stringMatch: '',
          key: ValueKey(routeName ?? 'MaterialRootRoute'),
        ),
        pendingChildren: [],
      ),
      child: RouterScope(
        controller: autoRouterMock,
        inheritableObserversBuilder: () => [],
        navigatorObservers: const [],
        stateHash: 0,
        child: StackRouterScope(
          controller: autoRouterMock,
          stateHash: 0,
          child: providers.isNotEmpty
              ? MultiBlocProviderFrameWrapper(
                  useMediaQuery: useMediaQuery,
                  providers: providers,
                  child: child,
                )
              : MaterialFrameWrapper(
                  useMediaQuery: useMediaQuery,
                  child: child,
                ),
        ),
      ),
    );
  }
}
