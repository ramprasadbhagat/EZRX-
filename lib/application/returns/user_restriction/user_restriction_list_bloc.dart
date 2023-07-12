import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/returns/repository/i_user_restriction_repository.dart';

part 'user_restriction_list_bloc.freezed.dart';

part 'user_restriction_list_event.dart';

part 'user_restriction_list_state.dart';

class UserRestrictionListBloc
    extends Bloc<UserRestrictionListEvent, UserRestrictionListState> {
  final IUserRestrictionRepository userRestrictionRepository;

  UserRestrictionListBloc({
    required this.userRestrictionRepository,
  }) : super(UserRestrictionListState.initial()) {
    on<UserRestrictionListEvent>(_onEvent);
  }

  Future<void> _onEvent(
    UserRestrictionListEvent event,
    Emitter<UserRestrictionListState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(UserRestrictionListState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            usernames: <String>[],
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await userRestrictionRepository.getUserRestrictionsList(e.salesOrg);

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isFetching: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (usernameList) {
            emit(
              state.copyWith(
                isFetching: false,
                usernames: usernameList,
                apiFailureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      updateSearchKey: (e) {
        emit(
          state.copyWith(
            searchKey: e.searchKey,
          ),
        );
      },
    );
  }
}
