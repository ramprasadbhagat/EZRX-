import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'material_frame_wrapper.dart';

class MultiBlocProviderFrameWrapper extends StatelessWidget {
  final List<BlocProvider> providers;
  final Widget child;

  const MultiBlocProviderFrameWrapper(
      {Key? key, required this.providers, required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialFrameWrapper(
        child: child,
      ),
    );
  }
}
