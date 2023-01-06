part of 'user_restriction_list_bloc.dart';

@freezed
class UserRestrictionListState with _$UserRestrictionListState {
  UserRestrictionListState._();

  factory UserRestrictionListState({
    required bool isFetching,
    required String searchKey,
    required List<String> usernames,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _UserRestrictionState;

  factory UserRestrictionListState.initial() => UserRestrictionListState(
        searchKey: '',
        isFetching: false,
        usernames: <String>[],
        apiFailureOrSuccessOption: none(),
      );

  List<String> get getSearchedUsernamesList {
    return searchKey.isEmpty
        ? usernames
        : usernames
            .where((element) =>
                element.toLowerCase().contains(searchKey.toLowerCase()))
            .toList();
  }
}
