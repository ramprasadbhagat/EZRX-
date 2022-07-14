part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required User user,
  }) = _UserState;

  factory UserState.initial() => UserState(
        user: User.empty(),
      );
}
