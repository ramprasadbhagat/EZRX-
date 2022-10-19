import 'dart:async';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/aup_tc/repository/i_aup_tc_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aup_tc_event.dart';
part 'aup_tc_state.dart';
part 'aup_tc_bloc.freezed.dart';

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
            title: e.user.role.type.isAupAudience
                ? 'Acceptable Use Policy'
                : 'TERMS OF USE',
            initialFile: _getInitialFile(e.user, e.salesOrg),
            showTermsAndConditon: await _showTermsAndConditon(e.user),
            url: _getLink(e.user, e.salesOrg),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }

  String? _getInitialFile(User user, SalesOrg salesOrg) {
    final salesOrgIsVN = salesOrg.isVN;

    return user.role.type.isAupAudience
        ? (salesOrgIsVN ? config.getAUPVNFile : config.getAUPFile)
        : (salesOrgIsVN ? config.getTCVNFile : config.getTCFile);
  }

  String _getLink(User user, SalesOrg salesOrg) {
    final salesOrgIsVN = salesOrg.isVN;

    return user.role.type.isAupAudience
        ? (salesOrgIsVN ? config.getAUPVNUrl : config.getAUPUrl)
        : (salesOrgIsVN ? config.getTCVNUrl : config.getTCUrl);
  }

  Future<bool> _showTermsAndConditon(User user) async {
    final failureOrSuccess = await aupTcRepository.getTncDate();

    return failureOrSuccess.fold(
      (failure) => false,
      (aupTcAcceptDate) {
        if (user.role.type.isAupAudience) {
          final acceptAUP = user.settingAup.acceptAUP;
          final acceptAUPTimestamp = user.settingAup.acceptAUPTimestamp;
          if (!acceptAUP || acceptAUPTimestamp.isBefore(aupTcAcceptDate.date)) {
            return true;
          }

          return false;
        } else {
          final acceptTC = user.settingTc.acceptTC;
          final acceptTCTimestamp = user.settingTc.acceptTCTimestamp;
          if (!acceptTC || acceptTCTimestamp.isBefore(aupTcAcceptDate.date)) {
            return true;
          }

          return false;
        }
      },
    );
  }
}
