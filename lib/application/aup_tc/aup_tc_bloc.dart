import 'dart:async';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/aup_tc/repository/i_aup_tc_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aup_tc_bloc.freezed.dart';
part 'aup_tc_event.dart';
part 'aup_tc_state.dart';

class AupTcBloc extends Bloc<AupTcEvent, AupTcState> {
  final IAupTcRepository aupTcRepository;
  final Config config;

  AupTcBloc({
    required this.aupTcRepository,
    required this.config,
  }) : super(AupTcState.initial()) {
    on<AupTcEvent>(_onEvent);
  }
  Future<void> _onEvent(AupTcEvent event, Emitter<AupTcState> emit) async {
    await event.map(
      show: (e) async {
        emit(
          state.copyWith(
            initialFile: _getInitialFile(e.salesOrg),
            showTermsAndConditon: await _showTermsAndConditon(e.user),
            url: _getLink(e.salesOrg),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }

  String? _getInitialFile(SalesOrg salesOrg) {
    final salesOrgCountry = salesOrg.country;

    switch (salesOrgCountry) {
      case 'VN':
        return config.getTCVNFile;
      case 'TH':
        return config.getTCTHFile;
      case 'KH':
        return config.getTCKHFile;
      case 'MM':
        return config.getTCMMFile;
      case 'TW':
        return config.getTCTWFile;
      default:
        return config.getTCENFile;
    }
  }

  String _getLink(SalesOrg salesOrg) {
    final salesOrgCountry = salesOrg.country;

    switch (salesOrgCountry) {
      case 'VN':
        return config.getTCVNUrl;
      case 'TH':
        return config.getTCTHUrl;
      case 'KH':
        return config.getTCKHUrl;
      case 'MM':
        return config.getTCMMUrl;
      case 'TW':
        return config.getTCTWUrl;
      default:
        return config.getTCENUrl;
    }
  }

  Future<bool> _showTermsAndConditon(User user) async {
    final isTncEnabled = aupTcRepository.getTncConfig();
    if (!isTncEnabled) return false;

    final acceptPrivacyPolicy = user.settingTc.acceptPrivacyPolicy;

    return acceptPrivacyPolicy ? false : true;
  }
}
