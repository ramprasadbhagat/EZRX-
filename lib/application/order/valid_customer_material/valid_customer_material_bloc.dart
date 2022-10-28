import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_view_model.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/repository/i_valid_customer_material_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'valid_customer_material_bloc.freezed.dart';
part 'valid_customer_material_event.dart';
part 'valid_customer_material_state.dart';

class ValidCustomerMaterialBloc
    extends Bloc<ValidCustomerMaterialEvent, ValidCustomerMaterialState> {
  final IValidCustomerMaterialRepository validCustomerMaterialRepository;

  ValidCustomerMaterialBloc({
    required this.validCustomerMaterialRepository,
  }) : super(ValidCustomerMaterialState.initial()) {
    on<ValidCustomerMaterialEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ValidCustomerMaterialEvent event,
    Emitter<ValidCustomerMaterialState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) async =>
          emit(ValidCustomerMaterialState.initial()),
      validate: (_Validate e) async {
        final validatingState = state.validMaterialState[e.validateId];
        if (validatingState != null &&
            validatingState.status == ValidatingStatus.success) {
          emit(
            state.copyWith(
              validMaterialState: Map.from(state.validMaterialState)
                ..addEntries(
                  {
                    e.validateId: validatingState.copyWith(
                      status: ValidatingStatus.loading,
                    ),
                  }.entries,
                ),
            ),
          );
          emit(
            state.copyWith(
              validMaterialState: Map.from(state.validMaterialState)
                ..addEntries(
                  {
                    e.validateId: validatingState.copyWith(
                      status: ValidatingStatus.success,
                    ),
                  }.entries,
                ),
            ),
          );

          return;
        }

        emit(
          state.copyWith(
            validMaterialState: Map.from(state.validMaterialState)
              ..addEntries(
                {
                  e.validateId: const ValidCustomerMaterialViewModel(
                    status: ValidatingStatus.loading,
                  ),
                }.entries,
              ),
          ),
        );
        final failureOrSuccess =
            await validCustomerMaterialRepository.getValidMaterialList(
          user: e.user,
          salesOrganisation: e.salesOrganisation,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          materialList: e.materialList,
          focMaterialList: e.focMaterialList,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                validMaterialState: Map.from(state.validMaterialState)
                  ..addEntries(
                    {
                      e.validateId: const ValidCustomerMaterialViewModel(
                        status: ValidatingStatus.failure,
                      ),
                    }.entries,
                  ),
              ),
            );
          },
          (validMaterialList) {
            emit(
              state.copyWith(
                validMaterialState: Map.from(state.validMaterialState)
                  ..addEntries(
                    {
                      e.validateId: ValidCustomerMaterialViewModel(
                        status: ValidatingStatus.success,
                        validMaterialNumbers: validMaterialList,
                      ),
                    }.entries,
                  ),
              ),
            );
          },
        );
      },
    );
  }
}
