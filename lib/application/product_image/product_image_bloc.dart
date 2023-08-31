import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/product_images/repository/i_product_images_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_bloc.freezed.dart';
part 'product_image_event.dart';
part 'product_image_state.dart';

class ProductImageBloc extends Bloc<ProductImageEvent, ProductImageState> {
  final IProductImagesRepository productImagesRepository;

  ProductImageBloc({
    required this.productImagesRepository,
  }) : super(ProductImageState.initial()) {
    on<ProductImageEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ProductImageEvent event,
    Emitter<ProductImageState> emit,
  ) async {
    event.map(
      initialized: (e) => emit(ProductImageState.initial()),
      set: (e) {
        final updatedMap = {...state.productImageMap};
        for (final entry in e.productImageMap.entries) {
          if (!updatedMap.containsKey(entry.key)) {
            updatedMap[entry.key] = entry.value;
          }
        }
        emit(
          state.copyWith(
            isFetching: false,
            productImageMap: updatedMap,
          ),
        );
      },
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );

        final materialNumbers = e.list.map((e) => e.materialNumber).toList();
        final queryMaterialNumber = List<MaterialNumber>.from(materialNumbers)
            .where((element) => !state.productImageMap.containsKey(element))
            .toSet()
            .toList();

        if (queryMaterialNumber.isEmpty) {
          emit(
            state.copyWith(
              isFetching: false,
            ),
          );

          return;
        }
        final failureOrSuccess =
            await productImagesRepository.getImagesForMaterials(
          list: queryMaterialNumber,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
            ),
          ),
          (productImageMap) =>
              add(ProductImageEvent.set(productImageMap: productImageMap)),
        );
      },
    );
  }
}
