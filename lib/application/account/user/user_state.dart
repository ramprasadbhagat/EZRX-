part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required User user,
    required Option<Either<UserFailure, dynamic>> userFailureOrSuccessOption,
  }) = _UserState;

  factory UserState.initial() => UserState(
        user: User.empty(),
        userFailureOrSuccessOption: none(),
      );
}
