import 'dart:async';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_info_bloc.freezed.dart';
part 'announcement_info_event.dart';
part 'announcement_info_state.dart';

class AnnouncementInfoBloc extends Bloc<AnnouncementInfoEvent, AnnouncementInfoState> {
  final IAnnouncementInfoRepository announcementInfoRepository;

  AnnouncementInfoBloc({
    required this.announcementInfoRepository,
  }) : super(AnnouncementInfoState.initial()) {
    on<AnnouncementInfoEvent>(_onEvent);
  }

  Future<FutureOr<void>> _onEvent(
    AnnouncementInfoEvent event,
    Emitter<AnnouncementInfoState> emit,
  ) async {
    await event.map(
      getAnnouncement: (e) async {
        emit(state.copyWith(isLoading: true));
        final failureOrSuccess =
            await announcementInfoRepository.getAnnouncement(
              salesOrg: e.salesOrg,
              pageSize: e.pageSize,
            );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(isLoading: false),
            );
          },
          (announcementInfo) {
            emit(
              state.copyWith(
                isLoading: false,
                announcementInfo: announcementInfo,
              ),
            );
          },
        );
      },
    );
  }
}
