import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_stock_info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_information_bloc.freezed.dart';
part 'stock_information_event.dart';
part 'stock_information_state.dart';

class StockInformationBloc
    extends Bloc<StockInformationEvent, StockInformationState> {
  IStockInfoRepository stockInfoRepository;

  StockInformationBloc({
    required this.stockInfoRepository,
  }) : super(StockInformationState.initial()) {
    on<StockInformationEvent>(_onEvent);
  }

  Future<void> _onEvent(event, emit) async {
    await event.map(
      initialized: (_) async => emit(StockInformationState.initial()),
      fetch: (e) async {
        emit(state.copyWith(isSubmitting: true, showErrorMessages: false));

        final failureOrSuccess = await stockInfoRepository.getStockInfoList(
          material: e.material,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          shipToInfo: e.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) => emit(state.copyWith(
            stockInfoListFailureOrSuccessOption: optionOf(failureOrSuccess),
            isSubmitting: false,
            showErrorMessages: true,
          )),
          (stockInfoList) => emit(state.copyWith(
            stockInfoListFailureOrSuccessOption: optionOf(failureOrSuccess),
            isSubmitting: false,
            stockInfoList: stockInfoList,
          )),
        );
      },
    );
  }
}
