import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ship_to_code_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_code_bloc.freezed.dart';

part 'ship_to_code_event.dart';

part 'ship_to_code_state.dart';

class ShipToCodeBloc extends Bloc<ShipToCodeEvent, ShipToCodeState> {
  late ShipToCodeRepository shipToCodeRepository;

  ShipToCodeBloc({
    required this.shipToCodeRepository,
  }) : super(ShipToCodeState.initial()) {
    on<_Initialized>(
      (_, emit) async => emit(
        ShipToCodeState.initial(),
      ),
    );
    on<LoadShipToCode>(
      (e, emit) async {
        final shipToCodeSuccessOrFailure =
            await shipToCodeRepository.getShipToCode();

        // found last selected from local storage => apply
        // not found last selected from local storage => use default ShipToInfo
        final shipToInfo = shipToCodeSuccessOrFailure.fold(
          (_) {
            return e.defaultShipToInfo;
          },
          (shipToCode) {
            return e.shipToInfos.firstWhere(
              (e) =>
                  shipToCode.isNotEmpty && shipToCode == e.shipToCustomerCode,
              orElse: () => e.defaultShipToInfo,
            );
          },
        );
        add(ShipToCodeEvent.selected(shipToInfo: shipToInfo));
      },
    );
    on<_UpdateSearchKey>((e, emit) async =>
        emit(state.copyWith(searchKey: SearchKey.search(e.searchKey))));
    on<_Selected>((e, emit) async {
      await shipToCodeRepository.storeShipToCode(
        shipToCode: e.shipToInfo.shipToCustomerCode,
      );
      emit(state.copyWith(shipToInfo: e.shipToInfo));
    });
    on<_Load>(
      (e, emit) async {
        add(const _UpdateSearchKey(''));
        if (emit.isDone) return;
        emit(state.copyWith(
          searchKey: SearchKey.search(''),
          shipToInfoList: e.shipToInfos,
        ));
      },
      transformer: restartable(),
    );
    on<_Search>(
      (e, emit) {
        final shipToInfos = e.shipToInfos
            .where(
              (i) => i.shipToCustomerCode.contains(state.searchKey.getValue()),
            )
            .toList();
        if (emit.isDone) return;
        emit(state.copyWith(shipToInfoList: shipToInfos));
      },
      transformer: restartable(),
    );
  }

  @override
  void onChange(Change<ShipToCodeState> change) {
    super.onChange(change);
    // print(change);
  }
}
