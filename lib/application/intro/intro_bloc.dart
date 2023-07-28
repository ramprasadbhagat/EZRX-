import 'package:ezrxmobile/domain/core/device/repository/i_device_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'intro_bloc.freezed.dart';
part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final IDeviceRepository deviceRepository;

  IntroBloc({
    required this.deviceRepository,
  }) : super(IntroState.initial()) {
    on<IntroEvent>(_onEvent);
  }
  Future<void> _onEvent(
    IntroEvent event,
    Emitter<IntroState> emit,
  ) async {
    await event.map(
      initialIndex: (_) async => emit(IntroState.initial()),
      setIndex: (e) {
        emit(state.copyWith(index: e.index));
      },
      checkAppFirstLaunch: (e) async {
        final failureOrSuccess = await deviceRepository.getDeviceData();
        final checkAppIsLaunched = failureOrSuccess.fold(
          (_) => true,
          (isAppFirstLaunch) => isAppFirstLaunch,
        );
        emit(
          state.copyWith(
            isAppFirstLaunch: checkAppIsLaunched,
          ),
        );
      },
      setAppFirstLaunch: (e) async {
        await deviceRepository.setDeviceData(
          isAppFirstLaunch: false,
        );
        emit(
          state.copyWith(
            isAppFirstLaunch: false,
          ),
        );
      },
    );
  }
}
