import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/material/entities/price.dart';
import 'package:ezrxmobile/domain/material/repository/i_material_price_repository.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_price_event.dart';
part 'material_price_state.dart';
part 'material_price_bloc.freezed.dart';

class MaterialPriceBloc extends Bloc<MaterialPriceEvent, MaterialPriceState> {
  final IMaterialPriceRepository repository;
  MaterialPriceBloc({required this.repository})
      : super(MaterialPriceState.initial()) {
    on<MaterialPriceEvent>(
      (event, emit) async {
        await event.map(
          initialized: (_) async => emit(
            MaterialPriceState.initial(),
          ),
          fetch: (e) async {
            final queryMaterialNumber =
                List<MaterialNumber>.from(e.materialNumbers)
                  ..removeWhere(
                    (element) => state.materialPrice.containsKey(
                      element,
                    ),
                  );

            if (queryMaterialNumber.isEmpty) return;

            emit(
              state.copyWith(
                isFetching: true,
              ),
            );
            final failureOrSuccess = await repository.getMaterialPrice(
              customerCodeInfo: e.customerCode,
              salesOrganisation: e.salesOrganisation,
              materialNumberList: queryMaterialNumber.toSet().toList(),
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
        );
      },
    );
  }
}
