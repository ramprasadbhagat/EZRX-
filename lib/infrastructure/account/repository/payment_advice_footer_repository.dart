import 'package:dio/dio.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/add_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer_data.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_header_logo.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/account/repository/i_payment_advice_footer_repository.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_remote.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PaymentAdviceFooterRepository extends IPaymentAdviceFooterRepository {
  final Config config;
  final PaymentAdviceFooterLocalDataSource localDataSource;
  final PaymentAdviceFooterRemoteDataSource remoteDataSource;
  final PermissionService permissionService;
  final FilePickerService filePickerService;
  final DeviceInfo deviceInfo;

  PaymentAdviceFooterRepository({
    required this.config,
    required this.localDataSource,
    required this.remoteDataSource,
    required this.deviceInfo,
    required this.permissionService,
    required this.filePickerService,
  });

  @override
  Future<Either<ApiFailure, List<PaymentAdviceFooter>>>
      getPaymentAdvice() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final response = await localDataSource.getPaymentAdvice();

        return Right(response);
      } catch (e) {
        return Left(
          FailureHandler.handleFailure(e),
        );
      }
    }
    try {
      final response = await remoteDataSource.getPaymentAdvice();

      return Right(response);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, AddPaymentAdviceFooterResponse>> addPaymentAdvice({
    required PaymentAdviceFooterData paymentAdviceFooterData,
    required PaymentAdviceHeaderLogo headerLogo,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        return Right(await localDataSource.addPaymentAdvice());
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final addPaymentAdvice = await remoteDataSource.addPaymentAdvice(
        salesOrg: paymentAdviceFooterData.salesOrg.getOrCrash(),
        salesDistrict:
            paymentAdviceFooterData.salesDistrict.salesDistrictHeader
            .getOrDefaultValue(''),
        footer: paymentAdviceFooterData.footer.getOrCrash(),
        header: paymentAdviceFooterData.headerTextActive
            ? paymentAdviceFooterData.header.getOrCrash()
            : paymentAdviceFooterData.header.getOrDefaultValue(''),
        headerLogoPath: headerLogo.url,
        pleaseNote: paymentAdviceFooterData.note.getOrDefaultValue(''),
      );

      return Right(addPaymentAdvice);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, List<PlatformFile>>> pickFiles({
    required PickFrom pickFrom,
  }) async {
    try {
      final result = await filePickerService.pickFiles(
        allowMultiple: false,
        fileType: pickFrom == PickFrom.file
            ? FileType.custom
            : FileType.image,
        allowedExtensions: pickFrom == PickFrom.file
            ? locator<Config>().allowedExtensionsPaymentAdviceLogo
            : null,
      );
      final files = List<PlatformFile>.from(result?.files ?? [])
        ..removeWhere((element) => (element.path ?? '').isEmpty);

      return right(files);
    } catch (e) {
      return const Left(
        ApiFailure.invalidFileFormat(),
      );
    }
  }

  @override
  Future<Either<ApiFailure, PermissionStatus>> getPermission({
    required PickFrom pickFrom,
  }) async {
    try {
      if (await deviceInfo.checkIfDeviceIsAndroidWithSDK33()) {
        return const Right(PermissionStatus.granted);
      }

      final isIos = defaultTargetPlatform == TargetPlatform.iOS;
      if (isIos && pickFrom == PickFrom.file) {
        return const Right(PermissionStatus.granted);
      }

      final permissionStatus = isIos
          ? await permissionService.requestPhotoPermission()
          : await permissionService.requestStoragePermission();

      return permissionStatus == PermissionStatus.granted ||
              permissionStatus == PermissionStatus.limited
          ? Right(permissionStatus)
          : Left(
              isIos
                  ? const ApiFailure.photoPermissionFailed()
                  : const ApiFailure.storagePermissionFailed(),
            );
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }

  @override
  Future<Either<ApiFailure, PaymentAdviceHeaderLogo>> uploadHeaderLogo({
    required PlatformFile file,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = await localDataSource.headerLogoUpload();

        return Right(localFile);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final localFile = await remoteDataSource.headerLogoUpload(
        file: MultipartFile.fromFileSync(
          file.path ?? '',
          filename: file.name,
        ),
      );

      return Right(localFile);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
