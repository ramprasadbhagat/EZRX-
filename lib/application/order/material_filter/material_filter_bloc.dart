import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/repository/i_filter_material_repository.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
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
          searchKey: '',
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
                isFetching: false,
              ),
            );
          },
        );
      },
      search: (e) {},
      updateSelectedMaterialFilter: (e) {
        switch (e.filterType) {
          case MaterialFilterType.countryList:
            final materialFilterCountry = Map<MaterialFilterCountry, bool>.from(
              state.materialFilter.countryMapOptions,
            );
            if (e.key is MaterialFilterCountry) {
              materialFilterCountry[e.key as MaterialFilterCountry] =
                  !(materialFilterCountry[e.key] ?? false);
            }

            emit(
              state.copyWith(
                materialFilter: state.materialFilter.copyWith(
                  countryMapOptions: materialFilterCountry,
                  countryListSelected: materialFilterCountry.entries
                      .where((element) => element.value)
                      .map((e) => e.key)
                      .toList(),
                ),
              ),
            );
            break;
          case MaterialFilterType.manufactured:
            final materialFilterManufacture = Map<String, bool>.from(
              state.materialFilter.manufactureMapOptions,
            );
            if (e.key is String) {
              materialFilterManufacture[e.key as String] =
                  !(materialFilterManufacture[e.key] ?? false);
            }

            emit(
              state.copyWith(
                materialFilter: state.materialFilter.copyWith(
                  manufactureMapOptions: materialFilterManufacture,
                  manufactureListSelected: materialFilterManufacture.entries
                      .where((element) => element.value)
                      .map((e) => e.key)
                      .toList(),
                ),
              ),
            );
            break;
          case MaterialFilterType.isFavourite:
            emit(
              state.copyWith(
                materialFilter:
                    state.materialFilter.copyWith(isFavourite: e.key as bool),
              ),
            );
            break;
          case MaterialFilterType.isFOCMaterial:
            emit(
              state.copyWith(
                materialFilter:
                    state.materialFilter.copyWith(isFOCMaterial: e.key as bool),
              ),
            );
            break;
          case MaterialFilterType.bundleOffers:
            emit(
              state.copyWith(
                materialFilter:
                    state.materialFilter.copyWith(bundleOffers: e.key as bool),
              ),
            );
            break;
          case MaterialFilterType.productOffers:
            emit(
              state.copyWith(
                materialFilter: state.materialFilter
                    .copyWith(isProductOffer: e.key as bool),
              ),
            );
            break;
          case MaterialFilterType.sortBy:
            emit(
              state.copyWith(
                materialFilter:
                    state.materialFilter.copyWith(sortBy: e.key as Sort),
              ),
            );
            break;
          default:
            break;
        }
      },
      updateSearchKey: (e) async => emit(
        state.copyWith(
          searchKey: SearchKey.searchFilter(e.searchKey),
        ),
      ),
      initSelectedMaterialFilter: (e) {
        final manufactureMap = Map<String, bool>.from(
          state.materialFilter.manufactureMapOptions,
        );
        manufactureMap.updateAll((key, value) => value = false);

        final countryMap = Map<MaterialFilterCountry, bool>.from(
          state.materialFilter.countryMapOptions,
        );
        countryMap.updateAll((key, value) => value = false);

        for (final element
            in e.selectedMaterialFilter.manufactureListSelected) {
          manufactureMap[element] = true;
        }
        for (final element in e.selectedMaterialFilter.countryListSelected) {
          countryMap[element] = true;
        }
        emit(
          state.copyWith(
            materialFilter: state.materialFilter.copyWith(
              isFavourite: e.selectedMaterialFilter.isFavourite,
              sortBy: e.selectedMaterialFilter.sortBy,
              bundleOffers: e.selectedMaterialFilter.bundleOffers,
              isProductOffer: e.selectedMaterialFilter.isProductOffer,
              manufactureMapOptions: manufactureMap,
              countryMapOptions: countryMap,
              manufactureListSelected:
                  e.selectedMaterialFilter.manufactureListSelected,
              countryListSelected: e.selectedMaterialFilter.countryListSelected,
            ),
            searchKey: SearchKey.searchFilter(''),
          ),
        );
      },
      resetFilter: (e) {
        final manufactureMap = Map<String, bool>.from(
          state.materialFilter.manufactureMapOptions,
        );
        manufactureMap.updateAll((key, value) => value = false);

        final countryMap = Map<MaterialFilterCountry, bool>.from(
          state.materialFilter.countryMapOptions,
        );
        countryMap.updateAll((key, value) => value = false);

        emit(
          state.copyWith(
            materialFilter: MaterialFilter.empty().copyWith(
              manufactureMapOptions: manufactureMap,
              countryMapOptions: countryMap,
            ),
          ),
        );
      },
    );
  }
}
