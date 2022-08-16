import 'dart:async';

import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_org_event.dart';
part 'sales_org_state.dart';
part 'sales_org_bloc.freezed.dart';

class SalesOrgBloc extends Bloc<SalesOrgEvent, SalesOrgState> {
  final UserBloc userBloc;
  late final StreamSubscription userBlocSubscription;
  SalesOrgBloc({required this.userBloc}) : super(SalesOrgState.initial()) {
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
      selected: (e) async => emit(
        state.copyWith(salesOrganisation: e.salesOrganisation),
      ),
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
