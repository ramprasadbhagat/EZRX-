import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

class MixpanelServiceMock extends Mock implements MixpanelService {}

class AutoRouteMock extends Mock implements AppRouter {}
