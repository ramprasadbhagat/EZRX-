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
    event.map(
      show: (e) async {
        emit(
          state.copyWith(
            showTermsAndCondition: await _showTermsAndConditon(e.user),
            tncFile: config.getTnCFile,
            privacyFile: config.getPrivacyPolicyFile,
            tncConsent: false,
            privacyConsent: false,
          ),
        );
      },
      termsOfUseConsent: (e) => emit(
        state.copyWith(
          tncConsent: e.newValue,
        ),
      ),
      privacyPolicyConsent: (e) => emit(
        state.copyWith(
          privacyConsent: e.newValue,
        ),
      ),
    );
  }

  Future<bool> _showTermsAndConditon(User user) async {
    final isTncEnabled = aupTcRepository.getTncConfig();
    if (!isTncEnabled) return false;

    return !user.acceptPrivacyPolicy;
  }
}
