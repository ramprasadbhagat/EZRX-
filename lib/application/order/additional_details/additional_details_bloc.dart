import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
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
        AdditionalDetailsState.initial().copyWith.additionalDetailsData(
              contactNumber: ContactNumber(
                value.customerCodeInfo.telephoneNumber.displayTelephoneNumber,
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
      removeAllPoDocument: (value) async => emit(
        state.copyWith(
          additionalDetailsData:
              state.additionalDetailsData.copyWith(poDocuments: []),
        ),
      ),
      toggleGreenDelivery: (value) async => emit(
        state.copyWith(
          additionalDetailsData: state.additionalDetailsData
              .copyWith(greenDeliveryEnabled: value.value),
        ),
      ),
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

        await failureOrSuccess.fold(
          (failure) async {
            emit(
              state.copyWith(
                additionalDetailsData: AdditionalDetailsData.empty().copyWith(
                  contactNumber: ContactNumber(
                    value.customerCodeInfo.telephoneNumber
                        .displayTelephoneNumber,
                  ),
                ),
                isLoading: false,
              ),
            );
          },
          (orderDetail) async {
            emit(
              state.copyWith(
                additionalDetailsData: AdditionalDetailsData.fromSavedOrder(
                  orderDetail: orderDetail,
                  customerCodeInfo: value.customerCodeInfo,
                ),
                isLoading: false,
              ),
            );
          },
        );
      },
      initiateFromHistory: (value) async {
        emit(
          AdditionalDetailsState.initial().copyWith(
            additionalDetailsData: value.data.copyWith(
              contactNumber: ContactNumber(
                value.customerCodeInfo.telephoneNumber.displayTelephoneNumber,
              ),
            ),
          ),
        );
      },
      clearSavedOrderId: (e) async {
        emit(
          state.copyWith(orderId: ''),
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
    final isCustomerPoReferenceValid = config.poNumberRequired
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
