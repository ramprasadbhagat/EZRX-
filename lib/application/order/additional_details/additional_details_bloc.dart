import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'additional_details_bloc.freezed.dart';
part 'additional_details_event.dart';
part 'additional_details_state.dart';

class AdditionalDetailsBloc
    extends Bloc<AdditionalDetailsEvent, AdditionalDetailsState> {
  final IOrderRepository savedOrderRepository;

  AdditionalDetailsBloc({
    required this.savedOrderRepository,
  }) : super(AdditionalDetailsState.initial()) {
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
      ),
      addPoDocument: (value) async => emit(
        state.copyWith(
          deliveryInfoData: state.deliveryInfoData.copyWith(
            poDocuments: List.from(state.deliveryInfoData.poDocuments)
              ..addAll(value.poDocuments),
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
      initFromSavedOrder: (value) async {
        emit(
          AdditionalDetailsState.initial().copyWith(
            isLoading: true,
            orderId: value.orderId,
          ),
        );

        final failureOrSuccess = await savedOrderRepository.getSavedOrderDetail(
          orderId: value.orderId,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                deliveryInfoData: DeliveryInfoData.empty().copyWith(
                  mobileNumber: MobileNumber(
                    value.customerCodeInfo.telephoneNumber
                        .displayTelephoneNumber,
                  ),
                ),
                isLoading: false,
              ),
            );
          },
          (orderDetail) {
            emit(
              state.copyWith(
                deliveryInfoData: DeliveryInfoData.fromSavedOrder(
                  orderDetail: orderDetail,
                  customerCodeInfo: value.customerCodeInfo,
                ),
                isLoading: false,
              ),
            );
          },
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
      clearSavedOrderId: (e) {
        emit(
          state.copyWith(orderId: ''),
        );
      },
    );
  }

  void _validateAdditionalDetails({
    required Emitter<AdditionalDetailsState> emit,
  }) {
    emit(
      state.copyWith(
        isValidated: false,
        showErrorMessages: false,
      ),
    );
    final isCustomerPoReferenceValid =
        state.deliveryInfoData.poReference.isValid();
    final isReferenceNoteValid = state.deliveryInfoData.referenceNote.isValid();
    final isContactPersonValid = state.deliveryInfoData.contactPerson.isValid();
    final isContactNumberValid = state.deliveryInfoData.mobileNumber.isValid();
    final isPaymentTermValid = state.deliveryInfoData.paymentTerm.isValid();
    final isDeliveryInstructionsValid =
        state.deliveryInfoData.deliveryInstruction.isValid();
    final isFormValid = isCustomerPoReferenceValid &&
        isReferenceNoteValid &&
        isContactPersonValid &&
        isContactNumberValid &&
        isPaymentTermValid &&
        isDeliveryInstructionsValid;

    emit(
      state.copyWith(
        isValidated: isFormValid,
        showErrorMessages: !isFormValid,
        focusTo: !isCustomerPoReferenceValid
            ? DeliveryInfoLabel.poReference
            : !isReferenceNoteValid
                ? DeliveryInfoLabel.referenceNote
                : !isContactPersonValid
                    ? DeliveryInfoLabel.contactPerson
                    : !isContactNumberValid
                        ? DeliveryInfoLabel.mobileNumber
                        : !isDeliveryInstructionsValid
                            ? DeliveryInfoLabel.deliveryInstruction
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
            deliveryDate: DeliveryDate(newValue),
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
