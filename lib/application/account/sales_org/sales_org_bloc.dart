import 'dart:async';

import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_org_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_org_event.dart';
part 'sales_org_state.dart';
part 'sales_org_bloc.freezed.dart';

class SalesOrgBloc extends Bloc<SalesOrgEvent, SalesOrgState> {
  final UserBloc userBloc;
  final ISalesOrgRepository salesOrgRepository;
  late final StreamSubscription userBlocSubscription;
  SalesOrgBloc({
    required this.userBloc,
    required this.salesOrgRepository,
  }) : super(SalesOrgState.initial()) {
    on<SalesOrgEvent>(_onEvent);

    userBlocSubscription = userBloc.stream.listen((userState) {
      // Always set first available SalesOrganisations as default selected Sales Org
      if (userState.user.userSalesOrganisations.isNotEmpty) {
        add(SalesOrgEvent.selected(
          salesOrganisation: userState.user.userSalesOrganisations.first,
        ));
      }
    });
  }

  Future<void> _onEvent(
    SalesOrgEvent event,
    Emitter<SalesOrgState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(SalesOrgState.initial()),
      selected: (e) async {
        emit(
          state.copyWith(salesOrganisation: e.salesOrganisation),
        );
        final failureOrSuccess = await salesOrgRepository
            .getSalesOrganisationConfigs(e.salesOrganisation);
        failureOrSuccess.fold(
          (failure) {},
          (salesOrganisationConfigs) => emit(state.copyWith(
            config: salesOrganisationConfigs,
          )),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await userBlocSubscription.cancel();

    return super.close();
  }

  @override
  void onChange(Change<SalesOrgState> change) {
    super.onChange(change);
    // print(change);
  }
}
