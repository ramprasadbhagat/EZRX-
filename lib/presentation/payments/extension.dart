import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension PaymentBuildContext on BuildContext {
  PaymentInProgressBloc paymentInProgressBloc(bool isMarketPlace) =>
      isMarketPlace
          ? read<MPPaymentInProgressBloc>()
          : read<ZPPaymentInProgressBloc>();

  AccountSummaryBloc accountSummaryBloc(bool isMarketPlace) => isMarketPlace
      ? read<MPAccountSummaryBloc>()
      : read<ZPAccountSummaryBloc>();

  SoaBloc soaBloc(bool isMarketPlace) =>
      isMarketPlace ? read<MPSoaBloc>() : read<ZPSoaBloc>();
}
