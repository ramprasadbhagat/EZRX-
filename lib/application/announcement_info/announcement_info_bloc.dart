import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_info_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_info_bloc.freezed.dart';
part 'announcement_info_event.dart';
part 'announcement_info_state.dart';

const _pageSize = 24;

class AnnouncementInfoBloc
    extends Bloc<AnnouncementInfoEvent, AnnouncementInfoState> {
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
      fetch: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
            apiFailureOrSuccessOption: none(),
            announcementInfo: AnnouncementArticleInfo.empty(),
          ),
        );
        final failureOrSuccess =
            await announcementInfoRepository.getAnnouncement(
          salesOrg: e.salesOrg,
          pageSize: _pageSize,
          after: '',
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isLoading: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (announcementInfo) {
            emit(
              state.copyWith(
                isLoading: false,
                announcementInfo: announcementInfo,
                canLoadMore: announcementInfo.total > _pageSize,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isLoading || !state.canLoadMore) {
          return;
        }

        emit(
          state.copyWith(
            isLoading: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await announcementInfoRepository.getAnnouncement(
          salesOrg: e.salesOrg,
          pageSize: _pageSize,
          after: state.announcementInfo.endCursor,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
            ),
          ),
          (announcement) {
            final newList = List<AnnouncementArticleItem>.from(
              state.announcementInfo.announcementList,
            )..addAll(announcement.announcementList);

            emit(
              state.copyWith(
                announcementInfo: state.announcementInfo.copyWith(
                  endCursor: announcement.endCursor,
                  announcementList: newList,
                ),
                apiFailureOrSuccessOption: none(),
                isLoading: false,
                canLoadMore: announcement.announcementList.length >= _pageSize,
              ),
            );
          },
        );
      },
    );
  }
}
