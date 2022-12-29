import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/approver_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/is_approver_dto.dart';
import 'package:ezrxmobile/infrastructure/account/repository/approver_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ApproverRemoteDataSourceMock extends Mock
    implements ApproverRemoteDataSource {}

class ApproverLocalDataSourceMock extends Mock
    implements ApproverLocalDataSource {}

class ConfigMock extends Mock implements Config {}

class RemoteConfigServiceMock extends Mock implements RemoteConfigService {}

void main() {
  late User mockUser;
  late Config configMock;
  late IsApproverDto mockApproverDto;
  late ApproverRepository repository;
  late RemoteConfigService remoteConfigServiceMock;
  late ApproverLocalDataSource approverLocalDataSourceMock;
  late ApproverRemoteDataSource approverRemoteDataSourceMock;

  setUpAll(() async {
    configMock = ConfigMock();
    mockApproverDto = IsApproverDto(isApprover: true);
    remoteConfigServiceMock = RemoteConfigServiceMock();
    approverLocalDataSourceMock = ApproverLocalDataSourceMock();
    approverRemoteDataSourceMock = ApproverRemoteDataSourceMock();

    mockUser = User.empty().copyWith(username: Username('mockUserName'));

    repository = ApproverRepository(
      config: configMock,
      localDataSource: approverLocalDataSourceMock,
      remoteConfigService: remoteConfigServiceMock,
      remoteDataSource: approverRemoteDataSourceMock,
    );
  });

  group('Approver Repository Test', () {
    test('Fetch Is Approver data from local data source successfully',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => approverLocalDataSourceMock.fetch())
          .thenAnswer((invocation) async => mockApproverDto);

      final result = await repository.getIsApprover(mockUser);

      expect(result.isRight(), true);
    });

    test('Fetch Is Approver data from local data source failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => approverLocalDataSourceMock.fetch())
          .thenThrow((invocation) async => MockException());

      final result = await repository.getIsApprover(mockUser);

      expect(result.isLeft(), true);
    });

    test('Fetch Is Approver data from remote data source successfully',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(() => approverRemoteDataSourceMock.fetch(
            username: mockUser.username.getOrCrash(),
          )).thenAnswer((invocation) async => mockApproverDto);

      final result = await repository.getIsApprover(mockUser);

      expect(result.isRight(), true);
    });

    test('Fetch Is Approver data from remote data source failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(() => approverRemoteDataSourceMock.fetch(
            username: mockUser.username.getOrCrash(),
          )).thenThrow((invocation) async => MockException());

      final result = await repository.getIsApprover(mockUser);

      expect(result.isLeft(), true);
    });

    test('Remote config show returns is true for mock', () {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      final returnsConfigResult = repository.getReturnsConfig();

      expect(returnsConfigResult, true);
    });

    test('Remote config show returns is true', () {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(() => remoteConfigServiceMock.getReturnsConfig()).thenReturn(true);

      final returnsConfigResult = repository.getReturnsConfig();

      expect(returnsConfigResult, true);
    });
  });
}
