import 'package:ezrxmobile/domain/user/entities/user.dart';
import 'package:ezrxmobile/domain/user/repository/i_user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserState.initial()) {
    on<UserEvent>(_onEvent);
  }

  Future<void> _onEvent(UserEvent event, Emitter<UserState> emit) async {
    await event.map(
      initialized: (e) async {},
      update: (e) async {},
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }

  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
    // debugPrint(change);
  }
}
