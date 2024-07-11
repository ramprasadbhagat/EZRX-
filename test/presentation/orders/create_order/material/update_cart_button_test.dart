///Todo: Write again
library;
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTenderContractBloc
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockOrderDocumentTypeBloc
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TenderContractBloc tenderContractBlocMock;
  late CartBloc cartBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;

  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
  });

  setUp(() {
    tenderContractBlocMock = MockTenderContractBloc();
    cartBlocMock = MockCartBloc();
    eligibilityBlocMock = MockEligibilityBloc();
    orderDocumentTypeBlocMock = MockOrderDocumentTypeBloc();
    when(() => tenderContractBlocMock.state)
        .thenReturn(TenderContractState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => orderDocumentTypeBlocMock.state)
        .thenReturn(OrderDocumentTypeState.initial());
  });
}
