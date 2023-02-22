import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_detail_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_valid_customer_material_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_price_detail_bloc.freezed.dart';
part 'material_price_detail_event.dart';
part 'material_price_detail_state.dart';

class MaterialPriceDetailBloc
    extends Bloc<MaterialPriceDetailEvent, MaterialPriceDetailState> {
  final IMaterialPriceDetailRepository priceRepository;
  final IValidCustomerMaterialRepository validateRepository;

  MaterialPriceDetailBloc({
    required this.priceRepository,
    required this.validateRepository,
  }) : super(MaterialPriceDetailState.initial()) {
    on<MaterialPriceDetailEvent>((event, emit) async {
      await event.map(
        initialized: (_) async => emit(
          MaterialPriceDetailState.initial(),
        ),
        refresh: (e) async {
          emit(
            state.copyWith(
              materialDetails: Map.from(state.materialDetails)
                ..removeWhere(
                  (key, _) => e.materialInfoList.contains(key),
                ),
            ),
          );
          add(
            MaterialPriceDetailEvent.fetch(
              user: e.user,
              customerCode: e.customerCode,
              salesOrganisation: e.salesOrganisation,
              salesOrganisationConfigs: e.salesOrganisationConfigs,
              shipToCode: e.shipToCode,
              materialInfoList: e.materialInfoList,
              pickAndPack: e.pickAndPack,
            ),
          );
        },
        fetch: (e) async {
          emit(
            state.copyWith(isValidating: true),
          );
          final queryMaterials = _getMissingPriceDetailMaterials(
            materials: e.materialInfoList,
          );

          var nonFocValidMaterials = queryMaterials;

          if (queryMaterials.isEmpty) {
            emit(
              state.copyWith(isValidating: false),
            );

            return;
          }

          final validMaterials = await _getValidMaterials(
            materials: queryMaterials,
            event: e,
          );

          final invalidMaterials = _getInvalidMaterials(
            materials: queryMaterials,
            validMaterials: validMaterials,
          );

          nonFocValidMaterials = validMaterials;

          _setPriceForMaterials(
            materials: validMaterials,
            value: Price.empty().copyWith(
              isValidMaterial: true,
              isFOC: false,
            ),
            emit: emit,
          );

          _setPriceForMaterials(
            materials: invalidMaterials,
            value: Price.empty().copyWith(
              isValidMaterial: false,
              isFOC: false,
            ),
            emit: emit,
          );

          emit(
            state.copyWith(
              isValidating: false,
              isFetching: true,
            ),
          );

          if (!e.skipFOCCheck) {
            nonFocValidMaterials = _getNonFOCMaterials(
              materials: validMaterials,
            );
          }

          final focValidMaterials = _getFOCMaterials(
            materials: validMaterials,
          );

          _setPriceForMaterials(
            materials: focValidMaterials,
            value: Price.empty().copyWith(
              isValidMaterial: true,
              isFOC: true,
            ),
            emit: emit,
          );

          _setPriceForMaterials(
            materials: nonFocValidMaterials,
            value: Price.empty().copyWith(
              isValidMaterial: true,
              isFOC: false,
              finalPrice: MaterialPrice.unavailable(),
            ),
            emit: emit,
          );

          if (nonFocValidMaterials.isEmpty) {
            emit(
              state.copyWith(
                isFetching: false,
              ),
            );

            return;
          }

          final newMaterialPriceDetails = await _getMaterialPriceDetails(
            event: e,
            materials: nonFocValidMaterials,
          );

          if (newMaterialPriceDetails.isEmpty) {
            emit(
              state.copyWith(
                isFetching: false,
              ),
            );
          }
          emit(
            state.copyWith(
              isFetching: false,
              materialDetails: Map.from(state.materialDetails)
                ..addAll(newMaterialPriceDetails),
            ),
          );
        },
      );
    });
  }

  List<MaterialQueryInfo> _getMissingPriceDetailMaterials({
    required List<MaterialQueryInfo> materials,
  }) {
    final materialDetails = Map<MaterialQueryInfo, MaterialPriceDetail>.from(
      state.materialDetails,
    )..removeWhere(
        (key, value) => value.price.isFailurePrice,
      );

    return Set<MaterialQueryInfo>.from(materials).toList()
      ..removeWhere((info) => materialDetails.containsKey(info));
  }

  Future<List<MaterialQueryInfo>> _getValidMaterials({
    required _Fetch event,
    required List<MaterialQueryInfo> materials,
  }) async {
    final nonFocMaterialNumbers = materials
        .where((material) => !material.materialGroup4.isFOC)
        .map((material) => material.value)
        .toList();
    final focMaterialNumbers = materials
        .where((material) => material.materialGroup4.isFOC)
        .map((material) => material.value)
        .toList();

    final failureOrSuccess = await validateRepository.getValidMaterialList(
      user: event.user,
      salesOrganisation: event.salesOrganisation,
      customerCodeInfo: event.customerCode,
      shipToInfo: event.shipToCode,
      materialList: nonFocMaterialNumbers,
      focMaterialList: focMaterialNumbers,
      pickAndPack: event.pickAndPack,
    );

    return failureOrSuccess.fold(
      (failure) => [],
      (validMaterialNumbers) async {
        final validMaterials = materials
            .where(
              (material) => validMaterialNumbers.contains(material.value),
            )
            .toList();

        return validMaterials;
      },
    );
  }

  List<MaterialQueryInfo> _getInvalidMaterials({
    required List<MaterialQueryInfo> materials,
    required List<MaterialQueryInfo> validMaterials,
  }) =>
      materials
          .where(
            (material) => !validMaterials.contains(
              material,
            ),
          )
          .toList();

  List<MaterialQueryInfo> _getNonFOCMaterials({
    required List<MaterialQueryInfo> materials,
  }) =>
      materials
          .where(
            (material) => !material.materialGroup4.isFOC,
          )
          .toList();

  List<MaterialQueryInfo> _getFOCMaterials({
    required List<MaterialQueryInfo> materials,
  }) =>
      materials
          .where(
            (material) => material.materialGroup4.isFOC,
          )
          .toList();

  void _setPriceForMaterials({
    required List<MaterialQueryInfo> materials,
    required Price value,
    required Emitter<MaterialPriceDetailState> emit,
  }) {
    final unavailableMaterialDetails = {
      for (final material in materials)
        material: MaterialPriceDetail.defaultWithPrice(
          query: material,
          price: value.copyWith(
            zdp8Override: Zdp8OverrideValue(material.zdp8Override),
            isPriceOverride: material.priceOverride != 0,
            priceOverride: PriceOverrideValue(material.priceOverride),
          ),
        ),
    };

    if (unavailableMaterialDetails.isNotEmpty) {
      emit(
        state.copyWith(
          materialDetails: Map.from(state.materialDetails)
            ..addAll(
              unavailableMaterialDetails,
            ),
        ),
      );
    }
  }

  Future<Map<MaterialQueryInfo, MaterialPriceDetail>> _getMaterialPriceDetails({
    required _Fetch event,
    required List<MaterialQueryInfo> materials,
  }) async {
    final failureOrSuccess = await priceRepository.getMaterialDetail(
      salesOrganisation: event.salesOrganisation,
      salesOrganisationConfigs: event.salesOrganisationConfigs,
      customerCodeInfo: event.customerCode,
      shipToCodeInfo: event.shipToCode,
      materialQueryList: materials,
    );

    return failureOrSuccess.fold(
      (_) => {},
      (newDetailsFetched) => newDetailsFetched,
    );
  }
}
