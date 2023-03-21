import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/returns/entities/returns_overview.dart';
import 'package:ezrxmobile/domain/returns/repository/i_returns_overview_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
part 'returns_overview_event.dart';
part 'returns_overview_state.dart';
part 'returns_overview_bloc.freezed.dart';

class ReturnsOverviewBloc
    extends Bloc<ReturnsOverviewEvent, ReturnsOverviewState> {
  final IReturnsOverviewRepository returnsOverviewRepository;
  ReturnsOverviewBloc({required this.returnsOverviewRepository})
      : super(ReturnsOverviewState.initial()) {
    on<ReturnsOverviewEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ReturnsOverviewEvent event,
    Emitter<ReturnsOverviewState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ReturnsOverviewState.initial()),
      fetch: (e) async {
        emit(
          ReturnsOverviewState.initial().copyWith(isLoading: true),
        );
        final failureOrSuccess =
            await returnsOverviewRepository.getReturnsOverview(
          shipTo: e.shipToInfo.shipToCustomerCode,
          soldTo: e.customerCodeInfo.customerCodeSoldTo,
          username: e.user.username,
          salesOrg: e.salesOrganisation.salesOrg,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (returnOverview) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                returnRequestsOverview: returnOverview,
                isLoading: false,
              ),
            );
          },
        );
      },
    );
  }

  @override
  void onChange(Change<ReturnsOverviewState> change) {
    super.onChange(change);
  }
}
