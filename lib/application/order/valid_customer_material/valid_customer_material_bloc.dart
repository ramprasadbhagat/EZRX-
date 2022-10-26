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
        if (state.validMaterialNumbers.containsKey(
          e.validateId,
        )) return;
        emit(state.copyWith(isValidating: true));
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
            emit(state.copyWith(isValidating: false));
          },
          (validMaterialList) {
            // final availableValidMaterialList =
            //     Set<MaterialNumber>.from(state.validMaterialList);
            // availableValidMaterialList.addAll(validMaterialList);
            // emit(
            //   state.copyWith(
            //     isValidating: false,
            //     validMaterialList: availableValidMaterialList.toList()
            //       ..shuffle(),
            //   ),
            // );
            emit(
              state.copyWith(
                isValidating: false,
                validMaterialNumbers: Map.from(state.validMaterialNumbers)
                  ..addAll({e.validateId: validMaterialList}),
              ),
            );
          },
        );
      },
    );
  }
}
