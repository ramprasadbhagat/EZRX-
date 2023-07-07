import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/cart_product.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_price_bloc.freezed.dart';
part 'material_price_event.dart';
part 'material_price_state.dart';

class MaterialPriceBloc extends Bloc<MaterialPriceEvent, MaterialPriceState> {
  final IMaterialPriceRepository repository;
  MaterialPriceBloc({required this.repository})
      : super(MaterialPriceState.initial()) {
    on<MaterialPriceEvent>(_onEvent);
  }

  Future<void> _onEvent(
    MaterialPriceEvent event,
    Emitter<MaterialPriceState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(
        MaterialPriceState.initial(),
      ),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );

        _filterFOCMaterial(e.materials, emit);

        final materialNumbers =
            e.materials.map((e) => e.materialNumber).toList();
        final queryMaterialNumber = List<MaterialNumber>.from(materialNumbers)
          ..removeWhere(
            (element) => state.materialPrice.containsKey(
              element,
            ),
          );
        if (queryMaterialNumber.isEmpty) {
          emit(
            state.copyWith(
              isFetching: false,
            ),
          );

          return;
        }

        final failureOrSuccess = await repository.getMaterialPrice(
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          salesOrganisation: e.salesOrganisation,
          salesConfigs: e.salesConfigs,
          materialNumberList: queryMaterialNumber.toSet().toList(),
          comboDealEligible: e.comboDealEligible,
        );

        await failureOrSuccess.fold(
          (_) async {
            emit(
              state.copyWith(
                isFetching: false,
              ),
            );
          },
          (newPriceFetched) async {
            final newPriceMap =
                Map<MaterialNumber, Price>.from(state.materialPrice)
                  ..addAll(newPriceFetched);
            emit(
              state.copyWith(
                isFetching: false,
                materialPrice: newPriceMap,
              ),
            );
          },
        );
      },
      fetchPriceCartProduct: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );

        final materialNumbers =
        e.products.map((e) => e.materialNumber).toList();

        final failureOrSuccess = await repository.getMaterialPrice(
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          salesOrganisation: e.salesOrganisation,
          salesConfigs: e.salesConfigs,
          materialNumberList: materialNumbers.toSet().toList(),
          comboDealEligible: e.comboDealEligible,
        );

        await failureOrSuccess.fold(
              (_) async {
            // emit(
            //   state.copyWith(
            //     isFetching: false,
            //   ),
            // );
          },
              (newPriceFetched) async {
            final newPriceMap =
            Map<MaterialNumber, Price>.from(state.materialPrice)
              ..addAll(newPriceFetched);
            emit(
              state.copyWith(
                isFetching: false,
                materialPrice: newPriceMap,
              ),
            );

          },
        );
      },
    );
  }

  void _filterFOCMaterial(
    List<MaterialInfo> materials,
    Emitter<MaterialPriceState> emit,
  ) {
    final focMaterialDetails = <MaterialNumber, Price>{};
    for (final material in materials) {
      if (material.materialGroup4.isFOC) {
        final materialNumber = material.materialNumber;
        focMaterialDetails.addEntries(
          {
            materialNumber: Price.empty().copyWith(
              materialNumber: materialNumber,
            ),
          }.entries,
        );
      }
    }
    if (focMaterialDetails.isNotEmpty) {
      emit(
        state.copyWith(
          materialPrice: Map.from(state.materialPrice)
            ..addAll(
              focMaterialDetails,
            ),
        ),
      );
    }
  }
}
