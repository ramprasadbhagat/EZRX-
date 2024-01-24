import 'dart:io';

import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/infrastructure/core/chatbot/chatbot_service.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/deep_linking/deep_linking_service.dart';

class MixpanelServiceMock extends Mock implements MixpanelService {}

class AutoRouteMock extends Mock implements AppRouter {}

class UniversalLinkServiceMock extends Mock implements DeepLinkingService {}

class ChatBotServiceMock extends Mock implements ChatBotService {}

class ConfigMock extends Mock implements Config {}

class FileMock extends Mock implements File {}
