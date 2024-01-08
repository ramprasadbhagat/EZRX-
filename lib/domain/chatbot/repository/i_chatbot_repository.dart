import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:html_editor_enhanced/utils/shims/dart_ui_real.dart';

abstract class IChatBotRepository {
  Future<Either<ApiFailure, bool>> startChatbot();

  StreamSubscription processDeepLinkOnIncomingEvent();

  Future<Either<ApiFailure, bool>> passPayloadToChatbot({
    required SalesOrganisation salesOrganisation,
    required User user,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required Locale locale,
  });

  Future<Either<ApiFailure, bool>> resetChatbot();
}
