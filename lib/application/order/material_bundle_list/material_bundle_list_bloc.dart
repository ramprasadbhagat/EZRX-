import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_bundle_list_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_detail_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_bundle_list_bloc.freezed.dart';
part 'material_bundle_list_event.dart';
part 'material_bundle_list_state.dart';

const int _pageSize = 10;

class MaterialBundleListBloc
    extends Bloc<MaterialBundleListEvent, MaterialBundleListState> {
  final IMaterialBundleListRepository materialBundleListRepository;
  final IMaterialPriceDetailRepository customerMaterialPriceDetailsRepository;

  MaterialBundleListBloc({
    required this.materialBundleListRepository,
    required this.customerMaterialPriceDetailsRepository,
  }) : super(MaterialBundleListState.initial()) {
    on<MaterialBundleListEvent>(_onEvent);
  }

  Future<void> _onEvent(
    MaterialBundleListEvent event,
    Emitter<MaterialBundleListState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(MaterialBundleListState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            bundleList: [],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await materialBundleListRepository.getMaterialBundleList(
          user: e.user,
          customerCode: e.customerCode,
          shipToCode: e.shipToCode,
          salesOrganisation: e.salesOrganisation,
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
          (materialBundleItemList) {
            final bundleList = <Bundle>[];

            for (final item in materialBundleItemList) {
              if (item.bundles.isNotEmpty &&
                  bundleList
                      .where((element) =>
                          element.bundleCode == item.bundles[0].bundleCode)
                      .isEmpty) {
                bundleList.add(item.bundles[0]);
              }
            }

            emit(
              state.copyWith(
                bundleList: bundleList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: materialBundleItemList.length >= _pageSize,
                nextPageIndex: 1,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await materialBundleListRepository.getMaterialBundleList(
          user: e.user,
          customerCode: e.customerCode,
          shipToCode: e.shipToCode,
          salesOrganisation: e.salesOrganisation,
        );

        await failureOrSuccess.fold(
          (failure) async {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (morebundleList) async {
            final bundleList = <Bundle>[];
            for (final item in morebundleList) {
              if (item.bundles.isNotEmpty &&
                  bundleList
                      .where((element) =>
                          element.bundleCode == item.bundles[0].bundleCode)
                      .isEmpty) {
                //item.bundles[0].bundleInformation
                //.sort((a, b) => a.quantity.compareTo(b.quantity));
                bundleList.add(item.bundles[0]);
              }
            }
            final newBundleList = List<Bundle>.from(state.bundleList)
              ..addAll(bundleList);
            emit(
              state.copyWith(
                bundleList: newBundleList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: newBundleList.length >= _pageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
    );
  }
}
