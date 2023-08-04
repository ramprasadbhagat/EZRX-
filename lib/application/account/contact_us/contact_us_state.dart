part of 'contact_us_bloc.dart';

@freezed
class ContactUsState with _$ContactUsState {
  const ContactUsState._();

  const factory ContactUsState({
    required ContactUs contactUs,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isSubmitting,
    required bool showErrorMessage,
    required bool responseFlag,
  }) = _ContactUsState;

  factory ContactUsState.initial() => ContactUsState(
        contactUs: ContactUs.empty(),
        apiFailureOrSuccessOption: none(),
        isSubmitting: false,
        showErrorMessage: false,
        responseFlag: false,
      );
}
