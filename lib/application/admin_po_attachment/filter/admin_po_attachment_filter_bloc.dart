import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_po_attachment_filter_event.dart';
part 'admin_po_attachment_filter_state.dart';
part 'admin_po_attachment_filter_bloc.freezed.dart';

class AdminPoAttachmentFilterBloc
    extends Bloc<AdminPoAttachmentFilterEvent, AdminPoAttachmentFilterState> {
  AdminPoAttachmentFilterBloc()
      : super(AdminPoAttachmentFilterState.initial()) {
    on<AdminPoAttachmentFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(AdminPoAttachmentFilterEvent event,
    Emitter<AdminPoAttachmentFilterState> emit,
  ) async {
    event.map(
      initialized: (_) => emit(
        AdminPoAttachmentFilterState.initial(),
      ),
      applyFilters: (_ApplyFilters value) {
        emit(state.copyWith(
          isSubmitting: false,
        ));
        if (state.adminPoAttachmentFilter.areFiltersValid) {
          emit(state.copyWith(
            isSubmitting: true,
          ));
        } else {
          emit(state.copyWith(
            showErrorMessages: true,
          ));
        }
      },
      orderNoChanged: (_OrderNoChanged e) => emit(
        state.copyWith(
          adminPoAttachmentFilter: state.adminPoAttachmentFilter.copyWith(
            orderNumber: SearchKey.searchFilter(e.orderNumber),
          ),
          showErrorMessages: false,
        ),
      ),
      ezrxNoChanged: (_EzrxNoChanged e) => emit(
        state.copyWith(
          adminPoAttachmentFilter: state.adminPoAttachmentFilter.copyWith(
            exRxNo: SearchKey.searchFilter(e.exRxNo),
          ),
          showErrorMessages: false,
        ),
      ),
      salesOrgChanged: (_SalesOrgChanged e) {
        if (state.adminPoAttachmentFilter.salesOrg == e.salesOrg) return;
        emit(
          state.copyWith(
            adminPoAttachmentFilter: state.adminPoAttachmentFilter.copyWith(
              salesOrg: e.salesOrg,
              soldTo: CustomerCodeInfo.empty(),
            ),
            showErrorMessages: false,
          ),
        );
      },
      soldToChanged: (_CustomerCodeChanged e) => emit(
        state.copyWith(
          adminPoAttachmentFilter: state.adminPoAttachmentFilter.copyWith(
            soldTo: e.soldTo,
          ),
          showErrorMessages: false,
        ),
      ),
      setOrderDate: (_SetOrderDate e) => emit(
        state.copyWith(
          adminPoAttachmentFilter: state.adminPoAttachmentFilter.copyWith(
            fromDate: DateTimeStringValue(
              getDateStringByDateTime(e.orderDateRange.start),
            ),
            toDate: DateTimeStringValue(
              getDateStringByDateTime(e.orderDateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
    );
  }
}
