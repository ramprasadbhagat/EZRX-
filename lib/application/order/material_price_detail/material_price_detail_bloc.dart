import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_detail_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_price_detail_bloc.freezed.dart';
part 'material_price_detail_event.dart';
part 'material_price_detail_state.dart';

class MaterialPriceDetailBloc
    extends Bloc<MaterialPriceDetailEvent, MaterialPriceDetailState> {
  final IMaterialPriceDetailRepository repository;
  MaterialPriceDetailBloc(this.repository)
      : super(MaterialPriceDetailState.initial()) {
    on<MaterialPriceDetailEvent>((event, emit) async {
      await event.map(
        initialized: (_) async => emit(
          MaterialPriceDetailState.initial(),
        ),
        fetch: (e) async {
          _filterFOCMaterial(
            e.materialInfos,
            emit,
          );

          final queryMaterialInfo =
              List<MaterialQueryInfo>.from(e.materialInfos)
                ..removeWhere(
                  (element) => state.materialDetails.containsKey(
                    element,
                  ),
                );

          if (queryMaterialInfo.isEmpty) return;

          emit(
            state.copyWith(
              isFetching: true,
            ),
          );
          final failureOrSuccess = await repository.getMaterialDetail(
            salesOrganisation: e.salesOrganisation,
            salesOrganisationConfigs: e.salesOrganisationConfigs,
            customerCodeInfo: e.customerCode,
            shipToCodeInfo: e.shipToCode,
            materialQueryList: queryMaterialInfo.toSet().toList(),
          );

          await failureOrSuccess.fold(
            (_) async {
              emit(
                state.copyWith(
                  isFetching: false,
                ),
              );
            },
            (newDetailsFetched) async {
              final newMaterialDetails =
                  Map<MaterialQueryInfo, MaterialPriceDetail>.from(
                state.materialDetails,
              )..addAll(
                      newDetailsFetched,
                    );
              emit(
                state.copyWith(
                  isFetching: false,
                  materialDetails: newMaterialDetails,
                ),
              );
            },
          );
        },
      );
    });
  }

  void _filterFOCMaterial(
    List<MaterialQueryInfo> materials,
    Emitter<MaterialPriceDetailState> emit,
  ) {
    final focMaterialDetails = <MaterialQueryInfo, MaterialPriceDetail>{};
    for (final material in materials) {
      if (material.materialGroup4.isFOC) {
        focMaterialDetails.addEntries(
          {
            material: MaterialPriceDetail.empty().copyWith(
              price: Price.empty().copyWith(materialNumber: material.value),
            ),
          }.entries,
        );
      }
    }

    if (focMaterialDetails.isNotEmpty) {
      emit(
        state.copyWith(
          materialDetails: Map.from(state.materialDetails)
            ..addAll(
              focMaterialDetails,
            ),
        ),
      );
    }
  }
}
