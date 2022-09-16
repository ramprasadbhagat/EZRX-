import 'dart:async';

import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/repository/i_announcement_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';
part 'announcement_bloc.freezed.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final IAnnouncementRepository announcementRepository;

  AnnouncementBloc({
    required this.announcementRepository,
  }) : super(AnnouncementState.initial()) {
    on<AnnouncementEvent>(_onEvent);
    add(const AnnouncementEvent.getAnnouncement());
  }

  Future<FutureOr<void>> _onEvent(
    AnnouncementEvent event,
    Emitter<AnnouncementState> emit,
  ) async {
    await event.map(
      getAnnouncement: (_) async {
        emit(state.copyWith(isLoading: true));
        final failureOrSuccess =
            await announcementRepository.getAnnouncements();
        failureOrSuccess.fold(
          (failure) {
            emit(state.copyWith(isLoading: false));
          },
          (newAnnouncement) {
            emit(
              state.copyWith(
                isLoading: false,
                announcement: newAnnouncement,
              ),
            );
          },
        );
      },
      close: (_) {
        emit(
          state.copyWith(
            announcement: Announcement.empty(),
            isClosed: true,
          ),
        );
      },
    );
  }
}
