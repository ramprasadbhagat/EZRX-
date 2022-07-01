import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/user/entities/full_name.dart';
import 'package:ezrxmobile/domain/user/entities/role.dart';
import 'package:ezrxmobile/domain/user/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/user/entities/settings.dart';
import 'package:ezrxmobile/domain/user/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required Username username,
    required EmailAddress email,
    required FullName fullName,
    required Role role,
    required CustomerCode customerCode,
    required List<SalesOrganisation> userSalesOrganisations,
    required Settings settings,
  }) = _User;

  factory User.empty() => User(
        username: Username(''),
        email: EmailAddress(''),
        fullName: const FullName(firstName: '', lastName: ''),
        role: const Role(id: '', name: '', description: ''),
        customerCode: CustomerCode(''),
        userSalesOrganisations: <SalesOrganisation>[],
        settings: const Settings(
          emailNotifications: false,
          mobileNotifications: false,
          languagePreference: '',
        ),
      );
}
