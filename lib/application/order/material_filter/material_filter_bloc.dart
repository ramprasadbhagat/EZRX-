import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_filter_material_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_filter_event.dart';
part 'material_filter_state.dart';
part 'material_filter_bloc.freezed.dart';

class MaterialFilterBloc
    extends Bloc<MaterialFilterEvent, MaterialFilterState> {
  final IMaterialFilterRepository materialFilterRepository;
  MaterialFilterBloc({required this.materialFilterRepository})
      : super(MaterialFilterState.initial()) {
    on<MaterialFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    MaterialFilterEvent event,
    Emitter<MaterialFilterState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(MaterialFilterState.initial()),
      fetch: (e) async {
        final failureOrSuccess =
            await materialFilterRepository.getMaterialFilterList(
          salesOrgConfig: e.salesOrgConfig,
          salesOrganisation: e.salesOrganisation,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          user: e.user,
          pickAndPack: e.pickAndPack,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (materialFilter) {
            emit(state.copyWith(
              apiFailureOrSuccessOption: none(),
              materialFilter: materialFilter,
            ));
          },
        );
      },
      updateMaterialSelected: (e) async {
        switch (e.filterType) {
          case MaterialFilterType.principal:
            final newUniquePrincipalName =
                materialFilterRepository.updateSelectedList(
              selectedList: state.selectedMaterialFilter.uniquePrincipalName,
              name: e.selectedFilter,
            );

            emit(state.copyWith(
              selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                uniquePrincipalName: newUniquePrincipalName,
              ),
              apiFailureOrSuccessOption: none(),
            ));
            break;
          case MaterialFilterType.therapeutic:
            final newUniqueTherapeuticClass =
                materialFilterRepository.updateSelectedList(
              selectedList: state.selectedMaterialFilter.uniqueTherapeuticClass,
              name: e.selectedFilter,
            );

            emit(state.copyWith(
              selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                uniqueTherapeuticClass: newUniqueTherapeuticClass,
              ),
              apiFailureOrSuccessOption: none(),
            ));
            break;
          case MaterialFilterType.brand:
          default:
            final newUniqueItemBrand =
                materialFilterRepository.updateSelectedList(
              selectedList: state.selectedMaterialFilter.uniqueItemBrand,
              name: e.selectedFilter,
            );

            emit(state.copyWith(
              selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                uniqueItemBrand: newUniqueItemBrand,
              ),
              apiFailureOrSuccessOption: none(),
            ));
            break;
        }
      },
      updateSearchKey: (e) async =>
          emit(state.copyWith(searchKey: e.searchkey)),
      clearSelected: (_) async => emit(
        state.copyWith(
          selectedMaterialFilter: const MaterialFilter(
            uniqueItemBrand: <String>[],
            uniquePrincipalName: <String>[],
            uniqueTherapeuticClass: <String>[],
          ),
        ),
      ),
    );
  }
}
