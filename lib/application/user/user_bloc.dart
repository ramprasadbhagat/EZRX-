import 'dart:async';

import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/domain/user/repository/i_user_repository.dart';
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
        final result = await userRepository.getUser();
        result.fold(
          (failure) {},
          (user) => emit(state.copyWith(user: user)),
        );
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
    // print(change);
  }
}
