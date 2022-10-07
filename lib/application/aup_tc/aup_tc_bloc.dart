import 'dart:async';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/aup_tc/repository/i_aup_tc_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aup_tc_event.dart';
part 'aup_tc_state.dart';
part 'aup_tc_bloc.freezed.dart';

class AupTcBloc extends Bloc<AupTcEvent, AupTcState> {
  final IAupTcRepository aupTcRepository;
  final UserBloc userBloc;
  final SalesOrgBloc salesOrgBloc;
  final Config config;
  late final StreamSubscription _userBlocSubscription;

  AupTcBloc({
    required this.aupTcRepository,
    required this.userBloc,
    required this.salesOrgBloc,
    required this.config,
  }) : super(AupTcState.initial()) {
    on<AupTcEvent>(_onEvent);
    _userBlocSubscription = userBloc.stream.listen((userState) {
      if (userState.user != User.empty()) {
        add(const AupTcEvent.show());
      }
    });
  }
  Future<void> _onEvent(AupTcEvent event, Emitter<AupTcState> emit) async {
    await event.map(
      show: (e) async {
        emit(
          state.copyWith(
            title: userBloc.state.user.role.type.isAupAudience
                ? 'Acceptable Use Policy'
                : 'TERMS OF USE',
            initialFile: _getInitialFile(),
            showTermsAndConditon: await _showTermsAndConditon(),
            url: _getLink(),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _userBlocSubscription.cancel();

    return super.close();
  }

  String? _getInitialFile() {
    final salesOrgIsVN = salesOrgBloc.state.salesOrganisation.salesOrg.isVN;

    return userBloc.state.user.role.type.isAupAudience
        ? (salesOrgIsVN ? config.getAUPVNFile : config.getAUPFile)
        : (salesOrgIsVN ? config.getTCVNFile : config.getTCFile);
  }

  String _getLink() {
    final salesOrgIsVN = salesOrgBloc.state.salesOrganisation.salesOrg.isVN;

    return userBloc.state.user.role.type.isAupAudience
        ? (salesOrgIsVN ? config.getAUPVNUrl : config.getAUPUrl)
        : (salesOrgIsVN ? config.getTCVNUrl : config.getTCUrl);
  }

  Future<bool> _showTermsAndConditon() async {
    final failureOrSuccess = await aupTcRepository.getTncDate();

    return failureOrSuccess.fold(
      (failure) => false,
      (aupTcAcceptDate) {
        if (userBloc.state.user.role.type.isAupAudience) {
          final acceptAUP = userBloc.state.user.settingAup.acceptAUP;
          final acceptAUPTimestamp =
              userBloc.state.user.settingAup.acceptAUPTimestamp;
          if (!acceptAUP || acceptAUPTimestamp.isBefore(aupTcAcceptDate.date)) {
            return true;
          }

          return false;
        } else {
          final acceptTC = userBloc.state.user.settingTc.acceptTC;
          final acceptTCTimestamp =
              userBloc.state.user.settingTc.acceptTCTimestamp;
          if (!acceptTC || acceptTCTimestamp.isBefore(aupTcAcceptDate.date)) {
            return true;
          }

          return false;
        }
      },
    );
  }
}
