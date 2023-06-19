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
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );
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
                isFetching: false,
              ),
            );
          },
          (materialFilter) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                materialFilter: materialFilter,
                isFavourite: false,
                isFetching: false,
              ),
            );
          },
        );
      },
      updateMaterialSelected: (e) async {
        switch (e.filterType) {
          case MaterialFilterType.principal:
            emit(state.copyWith(
              selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                uniquePrincipalName: state.selectedItem,
              ),
              isFilterApplied: true,
              apiFailureOrSuccessOption: none(),
            ));
            break;
          case MaterialFilterType.therapeutic:
            emit(state.copyWith(
              selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                uniqueTherapeuticClass: state.selectedItem,
              ),
              isFilterApplied: true,
              apiFailureOrSuccessOption: none(),
            ));
            break;
          case MaterialFilterType.isFavourite:
            emit(state.copyWith(
              selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                isFavourite: state.isFavourite,
              ),
              isFilterApplied: true,
              isUpdated: true,
            ));
            break;
          case MaterialFilterType.brand:
          default:
            emit(state.copyWith(
              selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                uniqueItemBrand: state.selectedItem,
              ),
              isFilterApplied: true,
              apiFailureOrSuccessOption: none(),
            ));
            break;
        }
      },
      updateTappedMaterialSelected: (e) async {
        if (e.filterType == MaterialFilterType.isFavourite) {
          emit(
            state.copyWith(
              isFavourite: !state.isFavourite,
              isUpdated: false,
            ),
          );
        } else {
          final tempList = List<String>.from(state.selectedItem);
          tempList.contains(e.selectedFilter)
              ? tempList.remove(e.selectedFilter)
              : tempList.add(e.selectedFilter);
          emit(
            state.copyWith(
              selectedItem: tempList,
              apiFailureOrSuccessOption: none(),
            ),
          );
        }
      },
      updateSearchKey: (e) async =>
          emit(state.copyWith(searchKey: e.searchkey)),
      clearSelected: (_) async => emit(
        state.copyWith(
          selectedMaterialFilter: state.getEmptyMaterialFilter(),
        ),
      ),
      resetFilter: (_) {
        emit(
          state.copyWith(
            searchKey: '',
            selectedMaterialFilter: state.getEmptyMaterialFilter(),
            materialFilter: state.getEmptyMaterialFilter(),
            isFilterApplied: false,
            isFavourite: false,
            selectedItem: [],
          ),
        );
      },
      clearAllSelected: (e) {
        switch (e.filterType) {
          case MaterialFilterType.principal:
            emit(
              state.copyWith(
                selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                  uniquePrincipalName: <String>[],
                ),
                selectedItem: [],
                isFilterApplied: false,
                apiFailureOrSuccessOption: none(),
              ),
            );
            break;
          case MaterialFilterType.therapeutic:
            emit(
              state.copyWith(
                selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                  uniqueTherapeuticClass: <String>[],
                ),
                selectedItem: [],
                isFilterApplied: false,
                apiFailureOrSuccessOption: none(),
              ),
            );
            break;
          case MaterialFilterType.brand:
            emit(
              state.copyWith(
                selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                  uniqueItemBrand: <String>[],
                ),
                selectedItem: [],
                isFilterApplied: false,
                apiFailureOrSuccessOption: none(),
              ),
            );
            break;
          case MaterialFilterType.isFavourite:
            emit(
              state.copyWith(
                selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
                  isFavourite: false,
                ),
                selectedItem: [],
                isFilterApplied: false,
                apiFailureOrSuccessOption: none(),
              ),
            );
        }
      },
      setTappedMaterialToEmpty: (e) async => emit(
        state.copyWith(
          selectedItem: [],
          isFavourite: false,
          apiFailureOrSuccessOption: none(),
        ),
      ),
      initiateTappedMaterial: (e) async {
        final tempMap = <String>[];
        switch (e.filterType) {
          case MaterialFilterType.principal:
            tempMap.addAll(state.selectedMaterialFilter.uniquePrincipalName);
            break;
          case MaterialFilterType.therapeutic:
            tempMap.addAll(state.selectedMaterialFilter.uniqueTherapeuticClass);
            break;
          case MaterialFilterType.brand:
          default:
            tempMap.addAll(state.selectedMaterialFilter.uniqueItemBrand);
            break;
        }
        emit(
          state.copyWith(
            selectedItem: tempMap,
            isFavourite: false,
            isFilterApplied: false,
            apiFailureOrSuccessOption: none(),
          ),
        );
      },
    );
  }
}
