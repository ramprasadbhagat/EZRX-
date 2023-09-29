import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_info_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_info_bloc.freezed.dart';
part 'announcement_info_event.dart';
part 'announcement_info_state.dart';

class AnnouncementInfoBloc
    extends Bloc<AnnouncementInfoEvent, AnnouncementInfoState> {
  final IAnnouncementInfoRepository announcementInfoRepository;
  final Config config;
  AnnouncementInfoBloc({
    required this.announcementInfoRepository,
    required this.config,
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
            searchKey: SearchKey.searchFilter(''),
          ),
        );
        final failureOrSuccess =
            await announcementInfoRepository.getAnnouncement(
          salesOrg: e.salesOrg,
          pageSize: config.pageSize,
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
                canLoadMore: announcementInfo.total > config.pageSize,
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
          pageSize: config.pageSize,
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
            final newList = <AnnouncementArticleItem>[
              ...state.announcementInfo.announcementList,
              ...announcement.announcementList,
            ];

            emit(
              state.copyWith(
                announcementInfo: state.announcementInfo.copyWith(
                  endCursor: announcement.endCursor,
                  announcementList: newList,
                ),
                apiFailureOrSuccessOption: none(),
                isLoading: false,
                canLoadMore:
                    announcement.announcementList.length >= config.pageSize,
              ),
            );
          },
        );
      },
      updateSearchKey: (_UpdateSearchKey e) {
        final eventSearchKey = SearchKey.searchFilter(e.searchKey);
        if (eventSearchKey != state.searchKey && eventSearchKey.isValid()) {
          emit(
            state.copyWith(
              searchKey: SearchKey.searchFilter(e.searchKey),
            ),
          );
        }
      },
    );
  }
}
