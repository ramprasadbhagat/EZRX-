import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/manage_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/payment_advice_footer_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class PaymentAdviceFooterRepositoryMock extends Mock
    implements PaymentAdviceFooterRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late PaymentAdviceFooterRepository paymentAdviceFooterRepositoryMock;
  late ManagePaymentAdviceFooterResponse addPaymentAdviceFooter;
  late ManagePaymentAdviceFooterResponse deletePaymentAdviceFooter;
  late List<PaymentAdviceFooter> paymentAdviceFooters;

  final fakePaymentAdviceFooters = [
    PaymentAdviceFooter.empty().copyWith(
      key: 0,
    ),
    PaymentAdviceFooter.empty().copyWith(
      key: 1,
    ),
    PaymentAdviceFooter.empty().copyWith(
      key: 2,
    ),
  ];
  final fakeValidPaymentAdviceFooter = PaymentAdviceFooter.empty().copyWith(
    key: 4,
    salesOrg: SalesOrg('fake-sale-org'),
    footer: StringValue('fake-footer'),
    headerTextActive: true,
    header: StringValue('fake-header'),
  );
  final fakePlatformFiles = <PlatformFile>[
    PlatformFile(
      name: 'fake-file',
      size: 0,
    )
  ];
  final fakePaymentAdviceLogoNetworkFile =
      PaymentAdviceLogoNetworkFile.empty().copyWith(
    url: StringValue('fake-url'),
    fileName: StringValue('fake-fileName'),
  );

  group(
    'Manage PaymentAdviceFooter Bloc Testing',
    () {
      setUp(() async {
        paymentAdviceFooterRepositoryMock = PaymentAdviceFooterRepositoryMock();
        paymentAdviceFooters =
            await PaymentAdviceFooterLocalDataSource().getPaymentAdvice();
        addPaymentAdviceFooter =
            await PaymentAdviceFooterLocalDataSource().addPaymentAdvice();
        deletePaymentAdviceFooter =
            await PaymentAdviceFooterLocalDataSource().deletePaymentAdvice();
      });

      blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
        ' -> For "initialized" Event',
        build: () => ManagePaymentAdviceFooterBloc(
          paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ManagePaymentAdviceFooterEvent.initialized(),
        ),
        expect: () => [
          ManagePaymentAdviceFooterState.initial(),
        ],
      );

      group(' -> "headerTextToggle" Event', () {
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "headerTextToggle" Event with TRUE value',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData:
                fakeValidPaymentAdviceFooter.copyWith(headerTextActive: false),
          ),
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.headerTextToggle(true),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                headerTextActive: true,
                paymentAdviceLogo: PaymentAdviceLogo.empty(),
                header: StringValue(''),
              ),
            ),
          ],
        );
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "headerTextToggle" Event with FALSE value',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData:
                fakeValidPaymentAdviceFooter.copyWith(headerTextActive: true),
          ),
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.headerTextToggle(false),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                headerTextActive: false,
                paymentAdviceLogo: PaymentAdviceLogo.empty(),
                header: StringValue(''),
              ),
            ),
          ],
        );
      });
      group(' -> Fetch Event Testing', () {
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "fetch" Event with Success',
          setUp: () =>
              when(() => paymentAdviceFooterRepositoryMock.getPaymentAdvice())
                  .thenAnswer(
            (invocation) async => Right(paymentAdviceFooters),
          ),
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(const ManagePaymentAdviceFooterEvent.fetch()),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              isFetching: true,
            ),
            ManagePaymentAdviceFooterState.initial().copyWith(
              isFetching: false,
              paymentAdviceFooters: paymentAdviceFooters,
            ),
          ],
        );

        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "fetch" Event with Failure',
          setUp: () =>
              when(() => paymentAdviceFooterRepositoryMock.getPaymentAdvice())
                  .thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake Error'),
            ),
          ),
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(const ManagePaymentAdviceFooterEvent.fetch()),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              isFetching: true,
            ),
            ManagePaymentAdviceFooterState.initial().copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('Fake Error'),
                ),
              ),
            ),
          ],
        );
      });

      blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
        ' -> For "onValueChange" Event',
        build: () => ManagePaymentAdviceFooterBloc(
          paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
        ),
        act: (bloc) => bloc
          ..add(
            const ManagePaymentAdviceFooterEvent.onValueChange(
              label: ManagePaymentAdviceFooterLabel.headerText,
              newValue: 'fake-headerText',
            ),
          )
          ..add(
            const ManagePaymentAdviceFooterEvent.onValueChange(
              label: ManagePaymentAdviceFooterLabel.footer,
              newValue: 'fake-footer',
            ),
          )
          ..add(
            const ManagePaymentAdviceFooterEvent.onValueChange(
              label: ManagePaymentAdviceFooterLabel.note,
              newValue: 'fake-note',
            ),
          ),
        expect: () => [
          ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: PaymentAdviceFooter.empty().copyWith(
              header: StringValue('fake-headerText'),
            ),
          ),
          ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: PaymentAdviceFooter.empty().copyWith(
              header: StringValue('fake-headerText'),
              footer: StringValue('fake-footer'),
            ),
          ),
          ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: PaymentAdviceFooter.empty().copyWith(
              header: StringValue('fake-headerText'),
              footer: StringValue('fake-footer'),
              pleaseNote: StringValue('fake-note'),
            ),
          ),
        ],
      );
      blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
        ' -> For "setPaymentAdvice" Event',
        build: () => ManagePaymentAdviceFooterBloc(
          paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManagePaymentAdviceFooterEvent.setPaymentAdvice(
            paymentAdviceFooterData: PaymentAdviceFooter.empty(),
          ),
        ),
        expect: () => [
          ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: PaymentAdviceFooter.empty(),
          ),
        ],
      );
      blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
        ' -> For "salesDistrictOnChange" Event',
        seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
          paymentAdviceFooterData: fakeValidPaymentAdviceFooter,
        ),
        build: () => ManagePaymentAdviceFooterBloc(
          paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManagePaymentAdviceFooterEvent.salesDistrictOnChange(
            salesDistrictInfo: SalesDistrictInfo.empty().copyWith(
              id: 1,
              salesDistrictHeader: StringValue('fake-salesDistrictHeader'),
              salesDistrictLabel: StringValue('fake-salesDistrictLabel'),
            ),
          ),
        ),
        expect: () => [
          ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
              salesDistrict: SalesDistrictInfo.empty().copyWith(
                id: 1,
                salesDistrictHeader: StringValue('fake-salesDistrictHeader'),
                salesDistrictLabel: StringValue('fake-salesDistrictLabel'),
              ),
            ),
          ),
        ],
      );
      blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
        ' -> For "salesOrgOnChange" Event',
        seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
          paymentAdviceFooterData: fakeValidPaymentAdviceFooter,
        ),
        build: () => ManagePaymentAdviceFooterBloc(
          paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManagePaymentAdviceFooterEvent.salesOrgOnChange(
            salesOrg: SalesOrg('fake-salesOrg'),
          ),
        ),
        expect: () => [
          ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
              salesOrg: SalesOrg('fake-salesOrg'),
              salesDistrict: SalesDistrictInfo.empty(),
            ),
          ),
        ],
      );

      group(' -> file handle Testing', () {
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addFile" Event with Permission fail',
          setUp: () {
            when(
              () => paymentAdviceFooterRepositoryMock.pickFiles(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => const Left(
                ApiFailure.storagePermissionFailed(),
              ),
            );
            when(
              () => paymentAdviceFooterRepositoryMock.getPermission(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => const Right(
                PermissionStatus.granted,
              ),
            );
          },
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addFile(
              pickFrom: PickFrom.file,
            ),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.storagePermissionFailed(),
                ),
              ),
            ),
          ],
        );

        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addFile" Event with Invalid format choose',
          setUp: () {
            when(
              () => paymentAdviceFooterRepositoryMock.pickFiles(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => const Left(
                ApiFailure.invalidFileFormat(),
              ),
            );
            when(
              () => paymentAdviceFooterRepositoryMock.getPermission(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => const Right(
                PermissionStatus.granted,
              ),
            );
          },
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addFile(
              pickFrom: PickFrom.file,
            ),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.invalidFileFormat(),
                ),
              ),
            ),
          ],
        );

        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addFile" Event with no file selected',
          setUp: () {
            when(
              () => paymentAdviceFooterRepositoryMock.pickFiles(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => const Right([]),
            );
            when(
              () => paymentAdviceFooterRepositoryMock.getPermission(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => const Right(
                PermissionStatus.granted,
              ),
            );
          },
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addFile(
              pickFrom: PickFrom.file,
            ),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial(),
          ],
        );
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addFile" Event fail',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter,
          ),
          setUp: () {
            when(
              () => paymentAdviceFooterRepositoryMock.getPermission(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => const Left(
                ApiFailure.storagePermissionFailed(),
              ),
            );
            when(
              () => paymentAdviceFooterRepositoryMock.pickFiles(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => Right(
                fakePlatformFiles,
              ),
            );
          },
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addFile(
              pickFrom: PickFrom.file,
            ),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter,
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.storagePermissionFailed(),
                ),
              ),
            ),
          ],
        );
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addFile" Event success',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter,
          ),
          setUp: () {
            when(
              () => paymentAdviceFooterRepositoryMock.getPermission(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => const Right(
                PermissionStatus.granted,
              ),
            );
            when(
              () => paymentAdviceFooterRepositoryMock.pickFiles(
                pickFrom: PickFrom.file,
              ),
            ).thenAnswer(
              (invocation) async => Right(
                fakePlatformFiles,
              ),
            );
          },
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addFile(
              pickFrom: PickFrom.file,
            ),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                  logoLocalFile: fakePlatformFiles,
                ),
              ),
            ),
          ],
        );

        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "removePickedFile" Event',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
              paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                logoLocalFile: fakePlatformFiles,
              ),
            ),
          ),
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.removePickedFile(),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                  logoLocalFile: <PlatformFile>[],
                ),
              ),
            ),
          ],
        );
      });

      group(' -> delete Event Testing', () {
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "deletePaymentAdviceFooter" Event with SUCCESS',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooters: fakePaymentAdviceFooters,
          ),
          setUp: () => when(
            () => paymentAdviceFooterRepositoryMock.deletePaymentAdvice(
              paymentAdviceFooter: fakePaymentAdviceFooters[0],
            ),
          ).thenAnswer(
            (invocation) async => Right(deletePaymentAdviceFooter),
          ),
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            ManagePaymentAdviceFooterEvent.delete(
              paymentAdviceFooter: PaymentAdviceFooter.empty().copyWith(
                key: 0,
              ),
            ),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: true,
              paymentAdviceFooters: [
                PaymentAdviceFooter.empty().copyWith(
                  key: 0,
                  isDeleteInProgress: true,
                ),
                fakePaymentAdviceFooters[1],
                fakePaymentAdviceFooters[2],
              ],
            ),
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: false,
              response: deletePaymentAdviceFooter,
              paymentAdviceFooters: [
                fakePaymentAdviceFooters[1],
                fakePaymentAdviceFooters[2],
              ],
            ),
          ],
        );
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "deletePaymentAdviceFooter" Event with FAILURE',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooters: fakePaymentAdviceFooters,
          ),
          setUp: () => when(
            () => paymentAdviceFooterRepositoryMock.deletePaymentAdvice(
              paymentAdviceFooter: fakePaymentAdviceFooters[0],
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('FAKE-ERROR')),
          ),
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            ManagePaymentAdviceFooterEvent.delete(
              paymentAdviceFooter: fakePaymentAdviceFooters[0],
            ),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: true,
              paymentAdviceFooters: [
                PaymentAdviceFooter.empty().copyWith(
                  key: 0,
                  isDeleteInProgress: true,
                ),
                fakePaymentAdviceFooters[1],
                fakePaymentAdviceFooters[2],
              ],
            ),
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: false,
              response: ManagePaymentAdviceFooterResponse.empty(),
              paymentAdviceFooters: fakePaymentAdviceFooters,
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('FAKE-ERROR'),
                ),
              ),
            ),
          ],
        );
      });

      group(' -> add Event Testing', () {
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addOrUpdate" for add Event with SUCCESS',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
              paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                logoLocalFile: fakePlatformFiles,
              ),
            ),
            paymentAdviceFooters: fakePaymentAdviceFooters,
          ),
          setUp: () {
            when(
              () => paymentAdviceFooterRepositoryMock.addPaymentAdvice(
                paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                  paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                    logoLocalFile: fakePlatformFiles,
                    logoNetworkFile: fakePaymentAdviceLogoNetworkFile,
                  ),
                ),
              ),
            ).thenAnswer(
              (invocation) async => Right(addPaymentAdviceFooter),
            );
            when(
              () => paymentAdviceFooterRepositoryMock.uploadHeaderLogo(
                file: fakePlatformFiles.first,
              ),
            ).thenAnswer(
              (invocation) async => Right(
                fakePaymentAdviceLogoNetworkFile,
              ),
            );
          },
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addOrUpdate(),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: true,
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                  logoLocalFile: fakePlatformFiles,
                ),
              ),
              paymentAdviceFooters: fakePaymentAdviceFooters,
            ),
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: false,
              paymentAdviceFooterData: PaymentAdviceFooter.empty(),
              paymentAdviceFooters: [
                ...fakePaymentAdviceFooters,
                fakeValidPaymentAdviceFooter.copyWith(
                  paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                    logoLocalFile: fakePlatformFiles,
                    logoNetworkFile: fakePaymentAdviceLogoNetworkFile,
                  ),
                ),
              ],
              response: addPaymentAdviceFooter,
            ),
          ],
        );

        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addOrUpdate" for add Event with Validation ERROR',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
              footer: StringValue(''),
            ),
            paymentAdviceFooters: fakePaymentAdviceFooters,
          ),
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addOrUpdate(),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                footer: StringValue(''),
              ),
              paymentAdviceFooters: fakePaymentAdviceFooters,
              showErrorMessages: true,
            ),
          ],
        );

        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addOrUpdate" for add Event with ERROR',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
              paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                logoLocalFile: fakePlatformFiles,
              ),
            ),
            paymentAdviceFooters: fakePaymentAdviceFooters,
          ),
          setUp: () {
            when(
              () => paymentAdviceFooterRepositoryMock.addPaymentAdvice(
                paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                  paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                    logoLocalFile: fakePlatformFiles,
                  ),
                ),
              ),
            ).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('FAKE-ERROR')),
            );
            when(
              () => paymentAdviceFooterRepositoryMock.uploadHeaderLogo(
                file: fakePlatformFiles.first,
              ),
            ).thenAnswer(
              (invocation) async => const Left(
                ApiFailure.other('fake-error'),
              ),
            );
          },
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addOrUpdate(),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: true,
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                  logoLocalFile: fakePlatformFiles,
                ),
              ),
              paymentAdviceFooters: fakePaymentAdviceFooters,
            ),
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: false,
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                  logoLocalFile: fakePlatformFiles,
                ),
              ),
              paymentAdviceFooters: fakePaymentAdviceFooters,
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('FAKE-ERROR'),
                ),
              ),
            ),
          ],
        );
      });

      group(' -> edit Event Testing', () {
        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addOrUpdate" for edit Event with SUCCESS',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
              header: StringValue('updated-fake-headerText'),
            ),
            paymentAdviceFooters: [
              ...fakePaymentAdviceFooters,
              fakeValidPaymentAdviceFooter,
            ],
          ),
          setUp: () {
            when(
              () => paymentAdviceFooterRepositoryMock.addPaymentAdvice(
                paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                  header: StringValue('updated-fake-headerText'),
                ),
              ),
            ).thenAnswer(
              (invocation) async => Right(addPaymentAdviceFooter),
            );
            when(
              () => paymentAdviceFooterRepositoryMock.uploadHeaderLogo(
                file: fakePlatformFiles.first,
              ),
            ).thenAnswer(
              (invocation) async => Right(PaymentAdviceLogoNetworkFile.empty()),
            );
          },
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addOrUpdate(),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: true,
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                header: StringValue('updated-fake-headerText'),
              ),
              paymentAdviceFooters: [
                ...fakePaymentAdviceFooters,
                fakeValidPaymentAdviceFooter,
              ],
            ),
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: false,
              paymentAdviceFooterData: PaymentAdviceFooter.empty(),
              paymentAdviceFooters: [
                ...fakePaymentAdviceFooters,
                fakeValidPaymentAdviceFooter.copyWith(
                  header: StringValue('updated-fake-headerText'),
                ),
              ],
              response: addPaymentAdviceFooter,
            ),
          ],
        );

        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addOrUpdate" for edit Event with Validation ERROR',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
              footer: StringValue(''),
            ),
            paymentAdviceFooters: fakePaymentAdviceFooters,
          ),
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addOrUpdate(),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter.copyWith(
                footer: StringValue(''),
              ),
              paymentAdviceFooters: fakePaymentAdviceFooters,
              showErrorMessages: true,
            ),
          ],
        );

        blocTest<ManagePaymentAdviceFooterBloc, ManagePaymentAdviceFooterState>(
          ' -> For "addOrUpdate" for edit Event with ERROR',
          seed: () => ManagePaymentAdviceFooterState.initial().copyWith(
            paymentAdviceFooterData: fakeValidPaymentAdviceFooter,
            paymentAdviceFooters: [
              ...fakePaymentAdviceFooters,
              fakeValidPaymentAdviceFooter,
            ],
          ),
          setUp: () {
            when(
              () => paymentAdviceFooterRepositoryMock.addPaymentAdvice(
                paymentAdviceFooterData: fakeValidPaymentAdviceFooter,
              ),
            ).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('FAKE-ERROR')),
            );
            when(
              () => paymentAdviceFooterRepositoryMock.uploadHeaderLogo(
                file: fakePlatformFiles.first,
              ),
            ).thenAnswer(
              (invocation) async => const Left(
                ApiFailure.other('fake-error'),
              ),
            );
          },
          build: () => ManagePaymentAdviceFooterBloc(
            paymentAdviceFooterRepository: paymentAdviceFooterRepositoryMock,
          ),
          act: (bloc) => bloc.add(
            const ManagePaymentAdviceFooterEvent.addOrUpdate(),
          ),
          expect: () => [
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: true,
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter,
              paymentAdviceFooters: [
                ...fakePaymentAdviceFooters,
                fakeValidPaymentAdviceFooter,
              ],
            ),
            ManagePaymentAdviceFooterState.initial().copyWith(
              isSubmitting: false,
              paymentAdviceFooterData: fakeValidPaymentAdviceFooter,
              paymentAdviceFooters: [
                ...fakePaymentAdviceFooters,
                fakeValidPaymentAdviceFooter,
              ],
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('FAKE-ERROR'),
                ),
              ),
            ),
          ],
        );
      });
    },
  );
}
