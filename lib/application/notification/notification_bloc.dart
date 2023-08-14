import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/domain/notification/repository/i_notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

const int _pageSize = 24;

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final INotificationRepository notificationRepository;
  NotificationBloc({required this.notificationRepository})
      : super(NotificationState.initial()) {
    on<NotificationEvent>(_onEvent);
  }
  Future<void> _onEvent(
    NotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(NotificationState.initial()),
      fetch: (e) async {
        emit(
          NotificationState.initial().copyWith(
            isFetching: true,
          ),
        );

        final failureOrSuccess = await notificationRepository.getNotification(
          page: state.nextPageIndex,
          perPage: _pageSize,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (notificationList) {
            emit(
              state.copyWith(
                notificationList: notificationList,
                isFetching: false,
                nextPageIndex: state.nextPageIndex + 1,
                canLoadMore: notificationList.notificationData.length >=
                    state.notificationList.pagination.totalItem,
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
      deleteAllNotifications: (e) async {
        emit(
          state.copyWith(
            notificationFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess =
            await notificationRepository.deleteAllNotificationList();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isFetching: false,
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (notificationList) => emit(
            NotificationState.initial().copyWith(
              isDeletedAllSuccess: true,
            ),
          ),
        );
      },
      readNotifications: (e) async {
        emit(
          state.copyWith(
            notificationFailureOrSuccessOption: none(),
            isReadNotification: true,
          ),
        );

        final failureOrSuccess = await notificationRepository.readNotification(
          notificationId: e.notificationId,
          previousNotificationDataList: state.notificationList.notificationData,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isReadNotification: false,
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (updatedNotificationList) {
            emit(
              state.copyWith(
                notificationList: state.notificationList.copyWith(
                  notificationData: updatedNotificationList,
                ),
                isReadNotification: false,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            notificationFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await notificationRepository.getNotification(
          page: state.nextPageIndex,
          perPage: _pageSize,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (notificationList) {
            final newNotificationList = [
              ...state.notificationList.notificationData,
              ...notificationList.notificationData,
            ];
            emit(
              state.copyWith(
                notificationList: state.notificationList.copyWith(
                  notificationData: newNotificationList,
                  pagination: notificationList.pagination,
                ),
                notificationFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: state.notificationList.notificationData.length >=
                    state.notificationList.pagination.totalItem,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
    );
  }
}
