import 'dart:convert';

import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/infrastructure/contact_us/dtos/contact_us_details_dto.dart';
import 'package:flutter/services.dart';

class ContactUsDetailsLocalDataSource {
  Future<ContactUsDetails> getContactUsDetails() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/contactUsDetailsResponse.json'),
    );

    return ContactUsDetailsDto.fromJson(
      res['data']['item'],
    ).toDomain;
  }
}
