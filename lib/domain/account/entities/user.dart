import 'package:ezrxmobile/domain/account/entities/setting_aup.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/settings.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String id,
    required Username username,
    required EmailAddress email,
    required FullName fullName,
    required Role role,
    required CustomerCode customerCode,
    required List<SalesOrganisation> userSalesOrganisations,
    required Settings settings,
    required SettingTc settingTc,
    required SettingAup settingAup,
    required bool enableOrderType,
  }) = _User;

  factory User.empty() => User(
        id: '',
        username: Username(''),
        email: EmailAddress(''),
        fullName: const FullName(firstName: '', lastName: ''),
        role: Role(id: '', name: '', type: RoleType(''), description: ''),
        customerCode: CustomerCode(''),
        userSalesOrganisations: <SalesOrganisation>[],
        settings: const Settings(
          emailNotifications: false,
          mobileNotifications: false,
          languagePreference: '',
        ),
        settingTc: SettingTc(
          acceptTC: false,
          acceptTCTimestamp: DateTime.parse('1970-01-01 00:00:00'),
        ),
        settingAup: SettingAup(
          acceptAUP: false,
          acceptAUPTimestamp: DateTime.parse('1970-01-01 00:00:00'),
        ),
        enableOrderType: false,
      );
}
