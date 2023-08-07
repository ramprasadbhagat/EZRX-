import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_user_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository userRepository;

  UserBloc({
    required this.userRepository,
  }) : super(UserState.initial()) {
    on<UserEvent>(_onEvent);
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
              isLoginOnBehalf: e.isLoginOnBehalf,
              userFailureOrSuccessOption: none(),
            ),
          ),
        );
      },
      acceptTnc: (e) async {
        final failureOrSuccess = await userRepository.updateUserTc();

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              userFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (settingTc) => emit(
            state.copyWith(
              user: state.user.copyWith(
                acceptPrivacyPolicy: settingTc.acceptTC,
              ),
              userFailureOrSuccessOption: none(),
            ),
          ),
        );
      },
      updateNotificationSettings: (e) async {
        final user = state.user.copyWith(
          settings: state.user.settings.copyWith(
            languagePreference: e.languagePreference,
            emailNotifications: e.emailNotifications,
          ),
        );

        final failureOrSuccess =
            await userRepository.updateNotificationSettings(user);
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              userFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (user) => emit(
            state.copyWith(
              user: state.user.copyWith(
                settings: state.user.settings.copyWith(
                  emailNotifications: user.settings.emailNotifications,
                  languagePreference: user.settings.languagePreference,
                ),
              ),
              userFailureOrSuccessOption: none(),
            ),
          ),
        );
      },
      updatePaymentNotificationSettings: (e) {
        emit(
          state.copyWith(
            user: state.user.copyWith(
              settings: state.user.settings.copyWith(
                paymentNotification: e.paymentNotification,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
  }
}
