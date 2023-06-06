import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/add_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer_data.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_header_logo.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class IPaymentAdviceFooterRepository {
  Future<Either<ApiFailure, List<PaymentAdviceFooter>>> getPaymentAdvice();

  Future<Either<ApiFailure, PermissionStatus>> getPermission({
    required PickFrom pickFrom,
  });

  Future<Either<ApiFailure, List<PlatformFile>>> pickFiles({
    required PickFrom pickFrom,
  });

  Future<Either<ApiFailure, AddPaymentAdviceFooterResponse>> addPaymentAdvice({
    required PaymentAdviceFooterData paymentAdviceFooterData,
    required PaymentAdviceHeaderLogo headerLogo,
  });

  Future<Either<ApiFailure, PaymentAdviceHeaderLogo>> uploadHeaderLogo({
    required PlatformFile file,
  });
}
