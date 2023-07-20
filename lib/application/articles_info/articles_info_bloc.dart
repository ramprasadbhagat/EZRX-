import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/article_info/repository/i_article_info_repository.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';

part 'articles_info_event.dart';
part 'articles_info_state.dart';
part 'articles_info_bloc.freezed.dart';

const _pageSize = 24;

class ArticlesInfoBloc extends Bloc<ArticlesInfoEvent, ArticlesInfoState> {
  final IArticleInfoRepository articleInfoRepository;
  ArticlesInfoBloc({required this.articleInfoRepository})
      : super(ArticlesInfoState.initial()) {
    on<ArticlesInfoEvent>(_onEvent);
  }

  Future<FutureOr<void>> _onEvent(
    ArticlesInfoEvent event,
    Emitter<ArticlesInfoState> emit,
  ) async {
    await event.map(
      getArticles: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            canLoadMore: true,
            articleInfo: AnnouncementArticleInfo.empty(),
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccessOption = await articleInfoRepository.getArticles(
          salesOrg: e.salesOrg,
          user: e.user,
          pageSize: _pageSize,
          after: state.articleInfo.endCursor,
        );

        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
            ),
          ),
          (articles) => emit(
            state.copyWith(
              articleInfo: articles,
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
            ),
          ),
        );
      },
      loadMoreArticles: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccessOption = await articleInfoRepository.getArticles(
          salesOrg: e.salesOrg,
          user: e.user,
          pageSize: _pageSize,
          after: state.articleInfo.endCursor,
        );

        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
            ),
          ),
          (articles) {
            final newArticlesList = List<AnnouncementArticleItem>.from(
              state.articleInfo.announcementList,
            )..addAll(articles.announcementList);
            emit(
              state.copyWith(
                articleInfo: articles.copyWith(
                  announcementList: newArticlesList,
                ),
                canLoadMore: articles.announcementList.length >= _pageSize,
                isFetching: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccessOption),
              ),
            );
          },
        );
      },
    );
  }
}
