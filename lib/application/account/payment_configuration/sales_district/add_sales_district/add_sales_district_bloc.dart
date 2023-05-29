import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/add_sales_district.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_district_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_sales_district_event.dart';
part 'add_sales_district_state.dart';
part 'add_sales_district_bloc.freezed.dart';

class AddSalesDistrictBloc
    extends Bloc<AddSalesDistrictEvent, AddSalesDistrictState> {
  final ISalesDistrictRepository salesDistrictRepository;

  AddSalesDistrictBloc({required this.salesDistrictRepository})
      : super(AddSalesDistrictState.initial()) {
    on<AddSalesDistrictEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AddSalesDistrictEvent event,
    Emitter<AddSalesDistrictState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(AddSalesDistrictState.initial()),
      addSalesDistrict: (e) async {
        emit(
          state.copyWith(
            showErrorMessages: false,
          ),
        );
        if (state.isSalesDistrictFieldIsValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess =
              await salesDistrictRepository.addSalesDistrict(
            salesOrg: state.salesOrg,
            salesDistrictHeader: state.salesDistrictHeader,
            salesDistrictLabel: state.salesDistrictLabel,
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
            (addSalesDistrict) async {
              emit(
                state.copyWith(
                  salesDistrictHeader: StringValue(''),
                  salesDistrictLabel: StringValue(''),
                  salesOrg: SalesOrg(''),
                  addSalesDistrict: addSalesDistrict,
                  isSubmitting: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
          );
        } else {
          emit(
            state.copyWith(showErrorMessages: true),
          );
        }
      },
      salesOrgChanged: (e) async {
        emit(
          state.copyWith(
            salesOrg: e.salesOrg,
            failureOrSuccessOption: none(),
          ),
        );
      },
      salesDistrictLabelChanged: (e) async {
        emit(
          state.copyWith(
            salesDistrictLabel: e.salesDistrictLabel,
            failureOrSuccessOption: none(),
          ),
        );
      },
      salesDistrictHeaderChanged: (e) async {
        emit(
          state.copyWith(
            salesDistrictHeader: e.salesDistrictHeader,
            failureOrSuccessOption: none(),
          ),
        );
      },
    );
  }
}
