import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'additional_details_bloc.freezed.dart';
part 'additional_details_event.dart';
part 'additional_details_state.dart';

class AdditionalDetailsBloc
    extends Bloc<AdditionalDetailsEvent, AdditionalDetailsState> {
  AdditionalDetailsBloc() : super(AdditionalDetailsState.initial()) {
    on<AdditionalDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AdditionalDetailsEvent event,
    Emitter<AdditionalDetailsState> emit,
  ) async {
    await event.map(
      initialized: (value) async => emit(
        AdditionalDetailsState.initial().copyWith.deliveryInfoData(
              mobileNumber: MobileNumber(
                value.customerCodeInfo.telephoneNumber.getValue(),
              ),
            ),
      ),
      onTextChange: (value) async => _onTextChange(
        label: value.label,
        newValue: value.newValue,
        emit: emit,
      ),
      validateForm: (value) async => _validateAdditionalDetails(
        emit: emit,
        config: value.config,
      ),
      addPoDocument: (value) async => emit(
        state.copyWith(
          deliveryInfoData: state.deliveryInfoData.copyWith(
            poDocuments: value.poDocuments,
          ),
        ),
      ),
      removePoDocument: (value) async => emit(
        state.copyWith(
          deliveryInfoData: state.deliveryInfoData.copyWith(
            poDocuments: List.from(state.deliveryInfoData.poDocuments)
              ..removeWhere(
                (PoDocuments element) => element == value.poDocument,
              ),
          ),
        ),
      ),
      removeAllPoDocument: (value) async => emit(
        state.copyWith(
          deliveryInfoData:
              state.deliveryInfoData.copyWith(poDocuments: <PoDocuments>[]),
        ),
      ),
      toggleGreenDelivery: (value) {
        final currentValue = state.deliveryInfoData.greenDeliveryEnabled;

        emit(
          state.copyWith(
            deliveryInfoData: state.deliveryInfoData.copyWith(
              greenDeliveryEnabled: !currentValue,
            ),
          ),
        );
      },
      initiateFromHistory: (value) {
        emit(
          AdditionalDetailsState.initial().copyWith(
            deliveryInfoData: value.data.copyWith(
              mobileNumber: MobileNumber(
                value.customerCodeInfo.telephoneNumber.displayTelephoneNumber,
              ),
            ),
          ),
        );
      },
    );
  }

  void _validateAdditionalDetails({
    required Emitter<AdditionalDetailsState> emit,
    required SalesOrganisationConfigs config,
  }) {
    emit(
      state.copyWith(
        isValidated: false,
        showErrorMessages: false,
      ),
    );
    final isCustomerPoReferenceValid = config.poNumberRequired.getValue()
        ? state.deliveryInfoData.poReference.isValid()
        : true;

    final isReferenceNoteValid = config.enableReferenceNote
        ? state.deliveryInfoData.referenceNote.isValid()
        : true;
    final isContactPersonValid = config.enableMobileNumber
        ? state.deliveryInfoData.contactPerson.isValid()
        : true;
    final isContactNumberValid = config.enableMobileNumber
        ? state.deliveryInfoData.mobileNumber.isValid()
        : true;
    final isPaymentTermValid = config.enablePaymentTerms
        ? state.deliveryInfoData.paymentTerm.isValid()
        : true;
    final isPoUploadAttachment =
        config.enablePOAttachmentRequired && config.showPOAttachment
            ? state.deliveryInfoData.poDocuments.isNotEmpty
            : true;

    final isFormValid = isCustomerPoReferenceValid &&
        isReferenceNoteValid &&
        isContactPersonValid &&
        isContactNumberValid &&
        isPoUploadAttachment &&
        isPaymentTermValid;

    emit(
      state.copyWith(
        isValidated: isFormValid,
        isPoAttachmentValidated: isPoUploadAttachment,
        showErrorMessages: !isFormValid,
        focusTo: !isCustomerPoReferenceValid
            ? DeliveryInfoLabel.poReference
            : !isReferenceNoteValid
                ? DeliveryInfoLabel.referenceNote
                : !isContactPersonValid
                    ? DeliveryInfoLabel.contactPerson
                    : !isContactNumberValid
                        ? DeliveryInfoLabel.mobileNumber
                        : !isPaymentTermValid
                            ? DeliveryInfoLabel.paymentTerm
                            : null,
      ),
    );
  }

  void _emitAfterOnTextChange({
    required Emitter<AdditionalDetailsState> emit,
    required DeliveryInfoData deliveryInfoData,
  }) {
    emit(
      state.copyWith(
        deliveryInfoData: deliveryInfoData,
      ),
    );
  }

  void _onTextChange({
    required DeliveryInfoLabel label,
    required String newValue,
    required Emitter<AdditionalDetailsState> emit,
  }) {
    switch (label) {
      case DeliveryInfoLabel.poReference:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            poReference: PoReference(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.mobileNumber:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            mobileNumber: MobileNumber(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.contactPerson:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            contactPerson: ContactPerson(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.deliveryDate:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            deliveryDate: DateTimeStringValue(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.paymentTerm:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            paymentTerm: PaymentTerm(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.referenceNote:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            referenceNote: ReferenceNote(newValue),
          ),
        );
        break;
      case DeliveryInfoLabel.deliveryInstruction:
        _emitAfterOnTextChange(
          emit: emit,
          deliveryInfoData: state.deliveryInfoData.copyWith(
            deliveryInstruction: DeliveryInstruction(newValue),
          ),
        );
        break;
    }
  }
}
