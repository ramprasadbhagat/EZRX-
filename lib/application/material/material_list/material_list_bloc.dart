import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/domain/material/repository/i_material_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_list_event.dart';
part 'material_list_state.dart';
part 'material_list_bloc.freezed.dart';

const int _pageSize = 10;

class MaterialListBloc extends Bloc<MaterialListEvent, MaterialListState> {
  final IMaterialListRepository materialListRepository;
  final SalesOrgBloc salesOrgBloc;
  final SearchBloc searchBloc;
  final UserBloc userBloc;
  final CustomerCodeBloc customerCodeBloc;
  final ShipToCodeBloc shipToCodeBloc;
  late final StreamSubscription _shipToBlocSubscription;
  // late final StreamSubscription _searchTextBlocSubscription;
  MaterialListBloc({
    required this.salesOrgBloc,
    required this.customerCodeBloc,
    required this.shipToCodeBloc,
    required this.userBloc,
    required this.searchBloc,
    required this.materialListRepository,
  }) : super(MaterialListState.initial()) {
    on<MaterialListEvent>(_onEvent);
    if (shipToCodeBloc.state.shipToInfo != ShipToInfo.empty()) {
      add(const MaterialListEvent.fetch());
    }
    _shipToBlocSubscription = shipToCodeBloc.stream.listen((state) {
      if (state.shipToInfo == ShipToInfo.empty()) {
        add(const MaterialListEvent.initialized());
      } else {
        add(const MaterialListEvent.fetch());
      }
    });

    // _searchTextBlocSubscription = searchBloc.stream.listen(
    //   (searchTextState) async {
    //     if (!searchTextState.isSearchInProgress) return;
    //     add(MaterialListEvent.updateSearchKey(searchTextState.searchText));
    //     add(const MaterialListEvent.fetch());
    //   },
    // );
  }

  Future<void> _onEvent(
    MaterialListEvent event,
    Emitter<MaterialListState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(MaterialListState.initial()),
      updateSearchKey: (e) async =>
          emit(state.copyWith(searchKey: e.searchKey)),
      fetch: (e) async {
        // if (state.isFetching) return;
        searchBloc.add(const SearchEvent.resetSearchInProgress(true));
        emit(
          state.copyWith(
            isFetching: true,
            materialList: [],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await materialListRepository.getMaterialList(
          user: userBloc.state.user,
          salesOrganisation: salesOrgBloc.state.salesOrganisation,
          salesOrgConfig: salesOrgBloc.state.configs,
          customerCodeInfo: customerCodeBloc.state.customeCodeInfo,
          shipToInfo: shipToCodeBloc.state.shipToInfo,
          pageSize: _pageSize,
          offset: 0,
          orderBy: 'materialDescription_asc',
          searchKey: state.searchKey,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
            // if (searchBloc.state.isSearchInProgress) {
            //   searchBloc.add(const SearchEvent.resetSearchInProgress(false));
            // }
          },
          (materialList) {
            emit(
              state.copyWith(
                materialList: materialList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: materialList.length >= _pageSize,
                nextPageIndex: 1,
              ),
            );

            // if (searchBloc.state.isSearchInProgress) {
            //   searchBloc.add(const SearchEvent.resetSearchInProgress(false));
            // }
          },
        );
      },
      loadMore: (_) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await materialListRepository.getMaterialList(
          user: userBloc.state.user,
          salesOrganisation: salesOrgBloc.state.salesOrganisation,
          salesOrgConfig: salesOrgBloc.state.configs,
          customerCodeInfo: customerCodeBloc.state.customeCodeInfo,
          shipToInfo: shipToCodeBloc.state.shipToInfo,
          pageSize: _pageSize,
          offset: state.materialList.length,
          orderBy: 'materialDescription_asc',
          searchKey: state.searchKey,
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
          (materialList) async {
            final newSavedOrders = List<MaterialInfo>.from(state.materialList)
              ..addAll(materialList);
            emit(
              state.copyWith(
                materialList: newSavedOrders,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: materialList.length >= _pageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _shipToBlocSubscription.cancel();
    // await _searchTextBlocSubscription.cancel();

    return super.close();
  }

  @override
  void onChange(Change<MaterialListState> change) {
    super.onChange(change);
    // print(change);
  }
}
