import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'additional_details_event.dart';
part 'additional_details_state.dart';
part 'additional_details_bloc.freezed.dart';

class AdditionalDetailsBloc
    extends Bloc<AdditionalDetailsEvent, AdditionalDetailsState> {
  AdditionalDetailsBloc() : super(AdditionalDetailsState.initial()) {
    on<AdditionalDetailsEvent>(_onEvent);
  }
  String _initialDate({
    required String futureDeliveryDay,
    required String stateDate,
  }) {
    return stateDate.isEmpty
        ? DateFormat('yyyy-MM-dd')
            .format(DateTime.now().add(const Duration(days: 1)))
        : stateDate;
  }

  Future<void> _onEvent(
    AdditionalDetailsEvent event,
    Emitter<AdditionalDetailsState> emit,
  ) async {
    event.map(
      initialized: (value) async => emit(
        AdditionalDetailsState.initial().copyWith(
          additionalDetailsData:
              AdditionalDetailsState.initial().additionalDetailsData.copyWith(
                    deliveryDate: DeliveryDate(
                      _initialDate(
                        futureDeliveryDay: value.config.futureDeliveryDay
                            .validatedFutureDeliveryDate,
                        stateDate: AdditionalDetailsState.initial()
                            .additionalDetailsData
                            .deliveryDate
                            .getOrDefaultValue(''),
                      ),
                    ),
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
          additionalDetailsData: state.additionalDetailsData.copyWith(
            poDocuments: List.from(state.additionalDetailsData.poDocuments)
              ..addAll(value.poDocuments),
          ),
        ),
      ),
      removePoDocument: (value) async => emit(
        state.copyWith(
          additionalDetailsData: state.additionalDetailsData.copyWith(
            poDocuments: List.from(state.additionalDetailsData.poDocuments)
              ..removeWhere(
                (PoDocuments element) => element == value.poDocument,
              ),
          ),
        ),
      ),
      removeAllPoDocument: (value) => emit(
        state.copyWith(
          additionalDetailsData:
              state.additionalDetailsData.copyWith(poDocuments: []),
        ),
      ),
    );
  }

  void _validateAdditionalDetails({
    required Emitter<AdditionalDetailsState> emit,
    required SalesOrganisationConfigs config,
  }) {
    final isCustomerPoReferenceValid = config.ponRequired
        ? state.additionalDetailsData.customerPoReference.isValid()
        : true;
    final isContactPersonValid = config.enableMobileNumber
        ? state.additionalDetailsData.contactPerson.isValid()
        : true;
    final isContactNumberValid = config.enableMobileNumber
        ? state.additionalDetailsData.contactNumber.isValid()
        : true;
    final isPaymentTermValid = config.enablePaymentTerms
        ? state.additionalDetailsData.paymentTerm.isValid()
        : true;
    final isFormValid = isCustomerPoReferenceValid &&
        isContactPersonValid &&
        isContactNumberValid &&
        isPaymentTermValid;

    emit(
      state.copyWith(
        isValidated: isFormValid,
        showErrorMessages: !isFormValid,
      ),
    );
  }

  void _emitAfterOnTextChange({
    required Emitter<AdditionalDetailsState> emit,
    required AdditionalDetailsData additionalDetailsData,
  }) {
    emit(
      state.copyWith(
        additionalDetailsData: additionalDetailsData,
      ),
    );
  }

  void _onTextChange({
    required AdditionalDetailsLabel label,
    required String newValue,
    required Emitter<AdditionalDetailsState> emit,
  }) {
    switch (label) {
      case AdditionalDetailsLabel.customerPoReference:
        _emitAfterOnTextChange(
          emit: emit,
          additionalDetailsData: state.additionalDetailsData.copyWith(
            customerPoReference: CustomerPoReference(newValue),
          ),
        );
        break;
      case AdditionalDetailsLabel.collectiveNumber:
        _emitAfterOnTextChange(
          emit: emit,
          additionalDetailsData: state.additionalDetailsData.copyWith(
            collectiveNumber: CollectiveNumber(newValue),
          ),
        );
        break;
      case AdditionalDetailsLabel.contactNumber:
        _emitAfterOnTextChange(
          emit: emit,
          additionalDetailsData: state.additionalDetailsData.copyWith(
            contactNumber: ContactNumber(newValue),
          ),
        );
        break;
      case AdditionalDetailsLabel.contactPerson:
        _emitAfterOnTextChange(
          emit: emit,
          additionalDetailsData: state.additionalDetailsData.copyWith(
            contactPerson: ContactPerson(newValue),
          ),
        );
        break;
      case AdditionalDetailsLabel.deliveryDate:
        _emitAfterOnTextChange(
          emit: emit,
          additionalDetailsData: state.additionalDetailsData.copyWith(
            deliveryDate: DeliveryDate(newValue),
          ),
        );
        break;
      case AdditionalDetailsLabel.paymentTerm:
        _emitAfterOnTextChange(
          emit: emit,
          additionalDetailsData: state.additionalDetailsData.copyWith(
            paymentTerm: PaymentTerm(newValue),
          ),
        );
        break;
      case AdditionalDetailsLabel.referenceNote:
        _emitAfterOnTextChange(
          emit: emit,
          additionalDetailsData: state.additionalDetailsData.copyWith(
            referenceNote: ReferenceNote(newValue),
          ),
        );
        break;
      case AdditionalDetailsLabel.specialInstruction:
        _emitAfterOnTextChange(
          emit: emit,
          additionalDetailsData: state.additionalDetailsData.copyWith(
            specialInstruction: SpecialInstruction(newValue),
          ),
        );
        break;
    }
  }
}
