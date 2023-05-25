import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_district_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_district_event.dart';
part 'sales_district_state.dart';
part 'sales_district_bloc.freezed.dart';

class SalesDistrictBloc extends Bloc<SalesDistrictEvent, SalesDistrictState> {
  final ISalesDistrictRepository salesDistrictRepository;

  SalesDistrictBloc({required this.salesDistrictRepository})
      : super(SalesDistrictState.initial()) {
    on<SalesDistrictEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SalesDistrictEvent event,
    Emitter<SalesDistrictState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(SalesDistrictState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await salesDistrictRepository.getSalesDistrictList();

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (salesDistrictList) {
            emit(
              state.copyWith(
                salesDistrictList: salesDistrictList,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
    );
  }
}
