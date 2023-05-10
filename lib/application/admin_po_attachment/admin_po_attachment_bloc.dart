import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/account/repository/i_admin_po_attachment_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_po_attachment_event.dart';
part 'admin_po_attachment_state.dart';
part 'admin_po_attachment_bloc.freezed.dart';

const int _pageSize = 10;

class AdminPoAttachmentBloc
    extends Bloc<AdminPoAttachmentEvent, AdminPoAttachmentState> {
  final IAdminPoAttachmentRepository repository;
  AdminPoAttachmentBloc({
    required this.repository,
  }) : super(AdminPoAttachmentState.initial()) {
    on<AdminPoAttachmentEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AdminPoAttachmentEvent event,
    Emitter<AdminPoAttachmentState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(
        AdminPoAttachmentState.initial(),
      ),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            adminPoAttachmentList: [],
            nextPageIndex: 0,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await repository.getAdminPoAttachment(
          pageSize: _pageSize,
          offset: 0,
          adminPoAttachmentFilter: e.adminPoAttachmentFilter,
        );
        await failureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (adminPoAttachmentList) async {
            emit(
              state.copyWith(
                adminPoAttachmentList: adminPoAttachmentList,
                failureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: adminPoAttachmentList.length >= _pageSize,
                nextPageIndex: 1,
              ),
            );
          },
        );
      },
      loadMore: (_LoadMore e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(state.copyWith(isFetching: true, failureOrSuccessOption: none()));

        final failureOrSuccess = await repository.getAdminPoAttachment(
          pageSize: _pageSize,
          offset: state.adminPoAttachmentList.length,
          adminPoAttachmentFilter: e.adminPoAttachmentFilter,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (adminPoAttachmentList) {
            final newOrderHistoryList = List<AdminPoAttachment>.from(
              state.adminPoAttachmentList,
            )..addAll(adminPoAttachmentList);

            emit(
              state.copyWith(
                adminPoAttachmentList: newOrderHistoryList,
                failureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: newOrderHistoryList.length >= _pageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
      selectDeselect: (_SelectDeselect e) async => emit(
        state.copyWith(
          adminPoAttachmentList: state.adminPoAttachmentList
              .map(
                (AdminPoAttachment adminPoAttachment) =>
                    adminPoAttachment.copyWith(
                  isSelected: e.adminPoAttachment == adminPoAttachment
                      ? !adminPoAttachment.isSelected
                      : adminPoAttachment.isSelected,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
