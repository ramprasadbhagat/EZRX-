part of 'aup_tc_bloc.dart';

@freezed
class AupTcEvent with _$AupTcEvent {
  const factory AupTcEvent.show(User user, SalesOrg salesOrg) = _Show;
}
