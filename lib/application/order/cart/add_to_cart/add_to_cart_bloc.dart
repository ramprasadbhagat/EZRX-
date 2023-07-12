import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_detail_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';
part 'add_to_cart_bloc.freezed.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  final IMaterialPriceDetailRepository materialPriceDetailRepository;

  AddToCartBloc({
    required this.materialPriceDetailRepository,
  }) : super(AddToCartState.initial()) {
    on<AddToCartEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AddToCartEvent event,
    Emitter<AddToCartState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(AddToCartState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
            cartItem: PriceAggregate.empty(),
          ),
        );

        final failureOrSuccess =
            await materialPriceDetailRepository.getMaterialDetail(
          materialNumber: e.materialNumber,
          isComboDealMaterials: false,
          customerCodeInfo: e.customerCode,
          salesOrganisation: e.salesOrganisation,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          shipToCodeInfo: e.shipToCode,
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
          (materialPriceDetail) {
            add(
              _SetCartItem(
                PriceAggregate.empty().copyWith(
                  materialInfo: materialPriceDetail.info,
                  price: materialPriceDetail.price,
                  salesOrgConfig: e.salesOrganisationConfigs,
                  isSpecialOrderType: e.isSpecialOrderType,
                ),
              ),
            );
            add(
              _UpdateQuantity(
                quantity: 1,
                cartZmgQtyExcludeCurrent: e.cartZmgQtyExcludeCurrent,
                customerCode: e.customerCode,
                salesOrganisation: e.salesOrganisation,
                shipToCode: e.shipToCode,
              ),
            );
          },
        );
      },
      setCartItem: (e) {
        emit(
          state.copyWith(
            cartItem: e.cartItem,
            isFetching: false,
          ),
        );
      },
      updateQuantity: (e) async {
        if (state.cartItem.isZdp5DiscountEligible) {
          final failureOrSuccess = await materialPriceDetailRepository
              .fetchMaterialPriceWithZdp5Discount(
            cartItem: state.cartItem.copyWith(quantity: e.quantity),
            customerCodeInfo: e.customerCode,
            salesOrganisation: e.salesOrganisation,
            shipToInfo: e.shipToCode,
          );

          failureOrSuccess.fold(
            (failure) {},
            (newItem) {
              emit(state.copyWith(cartItem: newItem));
            },
          );
        }
        final newDiscountedMaterialCount = _calculateDiscountedMaterialCount(
          state: state,
          event: e,
        );

        emit(
          state.copyWith(
            cartItem: state.cartItem.copyWith(
              quantity: e.quantity,
              discountedMaterialCount: newDiscountedMaterialCount,
            ),
          ),
        );
      },
    );
  }

  int _calculateDiscountedMaterialCount({
    required AddToCartState state,
    required _UpdateQuantity event,
  }) {
    if (state.cartItem.price.zmgDiscount) {
      return event.quantity + event.cartZmgQtyExcludeCurrent;
    } else if (state.cartItem.price.isTireDiscountEligible) {
      return event.quantity;
    }

    return 0;
  }
}
