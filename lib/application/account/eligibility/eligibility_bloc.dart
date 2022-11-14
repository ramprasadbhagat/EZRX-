import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'eligibility_event.dart';
part 'eligibility_state.dart';
part 'eligibility_bloc.freezed.dart';

class EligibilityBloc extends Bloc<EligibilityEvent, EligibilityState> {
  EligibilityBloc() : super(EligibilityState.initial()) {
    on<EligibilityEvent>(_onEvent);
  }

  Future<void> _onEvent(
    EligibilityEvent event,
    Emitter<EligibilityState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(EligibilityState.initial()),
      update: (e) async {
        emit(state.copyWith(
          user: e.user,
          salesOrganisation: e.salesOrganisation,
          salesOrgConfigs: e.salesOrgConfigs,
          customerCodeInfo: e.customerCodeInfo,
        ));
      },
    );
  }

  @override
  void onChange(Change<EligibilityState> change) {
    super.onChange(change);
    // print(change);
  }
}
