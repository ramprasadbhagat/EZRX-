import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode_capture.dart';
// ignore: depend_on_referenced_packages
import 'package:scandit_flutter_datacapture_core/scandit_flutter_datacapture_core.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/order/repository/i_scan_material_info_repository.dart';

part 'scan_material_info_event.dart';
part 'scan_material_info_state.dart';
part 'scan_material_info_bloc.freezed.dart';

class ScanMaterialInfoBloc
    extends Bloc<ScanMaterialInfoEvent, ScanMaterialInfoState>
    implements BarcodeCaptureListener {
  final IScanMaterialInfoRepository scanInfoRepository;
  final IMaterialListRepository materialListRepository;
  late StreamController scanResultController;
  ScanMaterialInfoBloc({
    required this.scanInfoRepository,
    required this.materialListRepository,
  }) : super(ScanMaterialInfoState.initial()) {
    on<ScanMaterialInfoEvent>(_onEvent);
    scanResultController = StreamController<String>();
    scanResultController.stream.listen((scannedData) {
      add(ScanMaterialInfoEvent.emitScannedData(scannedRes: scannedData));
    });
  }

  Future<void> _onEvent(
    ScanMaterialInfoEvent event,
    Emitter<ScanMaterialInfoState> emit,
  ) async {
    await event.map(
      initialized: (e) async {
        scanInfoRepository.fetchBarcodeCapture().addListener(this);
        emit(ScanMaterialInfoState.initial());
      },
      scanMaterialNumberFromCamera: (e) async {
        emit(ScanMaterialInfoState.initial().copyWith(
          salesOrganisation: e.salesOrganisation,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          user: e.user,
        ));
        final permissionsResult = await Permission.camera.request();
        if (permissionsResult.isGranted) {
          final failureOrSuccess =
              await scanInfoRepository.scanMaterialNumberFromDeviceCamera();
          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
            (scanMaterialNumberFromCamera) {},
          );
        }
      },
      scanImageFromDeviceStorage: (e) async {
        emit(
          ScanMaterialInfoState.initial().copyWith(
            salesOrganisation: e.salesOrganisation,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            user: e.user,
          ),
        );
        final failureOrSuccess =
            await scanInfoRepository.scanImageFromDeviceStorage();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(
                  failureOrSuccess,
                ),
              ),
            );
          },
          (scanImageFromDeviceStorage) {},
        );
      },
      disableScan: (e) async {
        final failureOrSuccess = await scanInfoRepository.disableMaterialScan();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(
                  failureOrSuccess,
                ),
              ),
            );
          },
          (disableMaterialScan) {},
        );
      },
      emitScannedData: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await materialListRepository.getScanMaterial(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          ean: Ean(e.scannedRes),
          user: state.user,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(
                failureOrSuccess,
              ),
              isFetching: false,
            ),
          ),
          (material) => emit(
            state.copyWith(
              material: material,
              isFetching: false,
            ),
          ),
        );
        await scanInfoRepository.disableMaterialScan();
      },
    );
  }

  @override
  void didScan(BarcodeCapture barcodeCapture, BarcodeCaptureSession session) {
    scanInfoRepository.disableMaterialScan();

    final barcode = session.newlyRecognizedBarcodes.first;
    final scannedMessage = barcode.data ?? '';

    scanResultController.sink.add(scannedMessage);
  }

  DataCaptureView get dataCaptureView {
    return scanInfoRepository.dataCaptureView();
  }

  @override
  void didUpdateSession(
    BarcodeCapture barcodeCapture,
    BarcodeCaptureSession session,
  ) {}

  @override
  Future<void> close() {
    scanResultController.close();

    return super.close();
  }
}
