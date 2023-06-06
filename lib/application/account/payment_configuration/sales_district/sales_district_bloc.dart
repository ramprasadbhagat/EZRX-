import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/manage_sales_district.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_district_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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
      onValueChange: (e) async =>
          _onValueChanged(field: e.field, value: e.value, emit: emit),
      resetField: (_) {
        emit(state.copyWith(
          selectedSalesOrg: SalesOrg(''),
          selectedSalesDistrictInfo: SalesDistrictInfo.empty(),
          salesDistrictResponseMessage: SalesDistrictResponseMessage.empty(),
        ));
      },
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
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
        );
      },
      add: (e) async {
        if (state.isAllFieldValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              failureOrSuccessOption: none(),
              showErrorMessages: false,
            ),
          );
          final failureOrSuccess =
              await salesDistrictRepository.addSalesDistrict(
            salesOrg: state.selectedSalesOrg,
            salesDistrictInfo: state.selectedSalesDistrictInfo,
          );
          await failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
            (salesDistrictResponseMessage) async {
              emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                  salesDistrictResponseMessage: salesDistrictResponseMessage,
                ),
              );
              add(const SalesDistrictEvent.resetField());
              add(const SalesDistrictEvent.fetch());
            },
          );
        } else {
          emit(
            state.copyWith(showErrorMessages: true),
          );
        }
      },
      edit: (e) async {
        if (state.isAllFieldValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              failureOrSuccessOption: none(),
              showErrorMessages: false,
            ),
          );
          final failureOrSuccess =
              await salesDistrictRepository.editSalesDistrict(
            salesOrg: state.selectedSalesOrg,
            salesDistrictInfo: state.selectedSalesDistrictInfo,
          );
          await failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
            (salesDistrictResponseMessage) async {
              final salesDistrictInfo = SalesDistrictInfo(
                id: state.selectedSalesDistrictInfo.id,
                salesDistrictHeader:
                    state.selectedSalesDistrictInfo.salesDistrictHeader,
                salesDistrictLabel:
                    state.selectedSalesDistrictInfo.salesDistrictLabel,
                isDeleteInProgress: false,
              );
              emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                  salesDistrictResponseMessage: salesDistrictResponseMessage,
                  salesDistrictList: state.salesDistrictList
                      .map(
                        (district) => SalesDistrict(
                          salesOrg: district.salesOrg,
                          salesDistrictInfo: district.salesDistrictInfo
                              .map(
                                (info) => info.id ==
                                        state.selectedSalesDistrictInfo.id
                                    ? salesDistrictInfo
                                    : info,
                              )
                              .toList(),
                        ),
                      )
                      .toList(),
                ),
              );
              add(const SalesDistrictEvent.resetField());
            },
          );
        } else {
          emit(
            state.copyWith(showErrorMessages: true),
          );
        }
      },
      delete: (e) async {
        final modifiedSalesDistrictList = state.salesDistrictList
            .map((district) => district.copyWith(
                  salesDistrictInfo: district.salesDistrictInfo
                      .map((info) =>
                          info.id == state.selectedSalesDistrictInfo.id
                              ? info.copyWith(isDeleteInProgress: true)
                              : info)
                      .toList(),
                ))
            .toList();

        emit(
          state.copyWith(
            isSubmitting: true,
            failureOrSuccessOption: none(),
            salesDistrictList: modifiedSalesDistrictList,
          ),
        );

        final failureOrSuccess =
            await salesDistrictRepository.deleteSalesDistrict(
          id: state.selectedSalesDistrictInfo.id,
        );
        await failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isSubmitting: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (salesDistrictResponseMessage) async {
            final modifiedList = state.salesDistrictList.map((district) {
              if (state.selectedSalesOrg == district.salesOrg) {
                final salesDistrictInfo = district.salesDistrictInfo
                    .where((e) => state.selectedSalesDistrictInfo.id != e.id)
                    .toList();

                return district.copyWith(salesDistrictInfo: salesDistrictInfo);
              } else {
                return district;
              }
            }).toList();

            emit(
              state.copyWith(
                isSubmitting: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                salesDistrictResponseMessage: salesDistrictResponseMessage,
                salesDistrictList: modifiedList,
              ),
            );
          },
        );
      },
    );
  }

  void _onValueChanged({
    required SalesDistrictField field,
    required String value,
    required Emitter<SalesDistrictState> emit,
  }) {
    switch (field) {
      case SalesDistrictField.salesOrg:
        emit(
          state.copyWith(
            selectedSalesOrg: SalesOrg(value),
          ),
        );
        break;
      case SalesDistrictField.salesDistrictHeader:
        emit(
          state.copyWith(
            selectedSalesDistrictInfo: state.selectedSalesDistrictInfo.copyWith(
              salesDistrictHeader: StringValue(value),
            ),
          ),
        );
        break;
      case SalesDistrictField.salesDistrictLabel:
        emit(
          state.copyWith(
            selectedSalesDistrictInfo: state.selectedSalesDistrictInfo.copyWith(
              salesDistrictLabel: StringValue(value),
            ),
          ),
        );
        break;
      case SalesDistrictField.id:
        emit(
          state.copyWith(
            selectedSalesDistrictInfo: state.selectedSalesDistrictInfo.copyWith(
              id: int.parse(value),
            ),
          ),
        );
        break;
    }
  }
}
