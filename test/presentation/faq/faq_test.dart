import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/faq/faq_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_local.dart';
import 'package:ezrxmobile/presentation/faq/faq.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class FaqBlocMock extends MockBloc<FaqEvent, FaqState> implements FaqBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  final mockSalesOrgBloc = SalesOrgMockBloc();
  late FaqBloc faqBlocMock;
  late FAQInfo faqList;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory<FaqBloc>(() => faqBlocMock);
    faqList = await FAQInfoLocalDataSource().getFAQInfo();
  });
  group('FAQ Screen', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      autoRouterMock = locator<AppRouter>();
      faqBlocMock = FaqBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => faqBlocMock.state).thenReturn(FaqState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
    });
    Widget getScopedWidget() {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
            BlocProvider<FaqBloc>(create: (context) => faqBlocMock),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
          ],
          child: const Scaffold(
            body: FAQPage(),
          ),
        ),
      );
    }

    testWidgets(
      'Test "Search results for: " text',
      (tester) async {
        when(() => faqBlocMock.state).thenReturn(
          FaqState.initial().copyWith(
            faqInfo: faqList,
            searchKey: SearchKey('Order created'),
            isFetching: false,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final result = find.text(
          '${'Search results for:'.tr()} ${SearchKey('Order created').getOrDefaultValue('')}',
        );
        expect(result, findsOneWidget);
      },
    );
  });
}
