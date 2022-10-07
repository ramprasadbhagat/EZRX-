import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_user_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository userRepository;
  final AuthBloc authBloc;
  late final StreamSubscription _authBlocSubscription;
  UserBloc({
    required this.authBloc,
    required this.userRepository,
  }) : super(UserState.initial()) {
    on<UserEvent>(_onEvent);
    add(const UserEvent.fetch());
    _authBlocSubscription = authBloc.stream.listen((state) {
      state.map(
        initial: (_) {},
        loading: (_) {},
        authenticated: (_) => add(const UserEvent.fetch()),
        unauthenticated: (_) => add(const UserEvent.initialized()),
      );
    });
  }

  Future<void> _onEvent(UserEvent event, Emitter<UserState> emit) async {
    await event.map(
      initialized: (e) async => emit(UserState.initial()),
      fetch: (e) async {
        final failureOrSuccess = await userRepository.getUser();
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              userFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (user) => emit(
            state.copyWith(
              user: user,
              userFailureOrSuccessOption: none(),
            ),
          ),
        );
      },
      accptTnc: (e) async {
        if (state.user.role.type.isAupAudience) {
          final failureOrSuccess =
              await userRepository.updateUserAup(state.user);

          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                userFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (settingAup) => emit(
              state.copyWith(
                user: state.user.copyWith(settingAup: settingAup),
                userFailureOrSuccessOption: none(),
              ),
            ),
          );
        } else {
          final failureOrSuccess =
              await userRepository.updateUserTc(state.user);

          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                userFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (settingTc) => emit(
              state.copyWith(
                user: state.user.copyWith(settingTc: settingTc),
                userFailureOrSuccessOption: none(),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() async {
    await _authBlocSubscription.cancel();

    return super.close();
  }

  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
  }
}
