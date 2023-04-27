import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_right_dto.freezed.dart';
part 'access_right_dto.g.dart';

@freezed
class AccessRightDto with _$AccessRightDto {
  const AccessRightDto._();

  const factory AccessRightDto({
    @JsonKey(name: 'Users', defaultValue: false) required bool users,
    @JsonKey(name: 'Orders', defaultValue: false) required bool orders,
    @JsonKey(name: 'Promos', defaultValue: false) required bool promos,
    @JsonKey(name: 'HCPHUB', defaultValue: false) required bool hCPHUB,
    @JsonKey(name: 'Products', defaultValue: false) required bool products,
    @JsonKey(name: 'Services', defaultValue: false) required bool services,
    @JsonKey(name: 'Analytics', defaultValue: false) required bool analytics,
    @JsonKey(name: 'LoyaltyScheme', defaultValue: false)
        required bool loyaltyScheme,
  }) = _AccessRightDto;

  AccessRight toDomain() {
    return AccessRight(
      users: users,
      orders: orders,
      promos: promos,
      hCPHUB: hCPHUB,
      products: products,
      services: services,
      analytics: analytics,
      loyaltyScheme: loyaltyScheme,
    );
  }

  factory AccessRightDto.fromDomain(AccessRight accessRight) {
    return AccessRightDto(
      users: accessRight.users,
      orders: accessRight.orders,
      promos: accessRight.promos,
      hCPHUB: accessRight.hCPHUB,
      products: accessRight.products,
      services: accessRight.services,
      analytics: accessRight.analytics,
      loyaltyScheme: accessRight.loyaltyScheme,
    );
  }

  factory AccessRightDto.fromJson(Map<String, dynamic> json) =>
      _$AccessRightDtoFromJson(json);
}
