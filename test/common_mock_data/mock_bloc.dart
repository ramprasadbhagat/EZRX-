
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class DownloadPaymentAttachmentsBlocMock extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

//////////////////////Product//////////////////////////////////////////////
class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}
///////////////////////////////////////////////////////////////////////////

///////////////////////Payment///////////////////////////////////////////////
class BankInAccountBlocMock
    extends MockBloc<BankInAccountsEvent, BankInAccountsState>
    implements BankInAccountsBloc {}

class PaymentSummaryDetailsBlocMock
    extends MockBloc<PaymentSummaryDetailsEvent, PaymentSummaryDetailsState>
    implements PaymentSummaryDetailsBloc {}

class AccountSummaryBlocMock
    extends MockBloc<AccountSummaryEvent, AccountSummaryState>
    implements AccountSummaryBloc {}

class OutstandingInvoicesBlocMock
    extends MockBloc<OutstandingInvoicesEvent, OutstandingInvoicesState>
    implements OutstandingInvoicesBloc {}

class OutstandingInvoiceFilterBlocMock extends MockBloc<
    OutstandingInvoiceFilterEvent,
    OutstandingInvoiceFilterState> implements OutstandingInvoiceFilterBloc {}

class AvailableCreditsBlocMock
    extends MockBloc<AvailableCreditsEvent, AvailableCreditsState>
    implements AvailableCreditsBloc {}

class AvailableCreditFilterBlocMock
    extends MockBloc<AvailableCreditFilterEvent, AvailableCreditFilterState>
    implements AvailableCreditFilterBloc {}

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}


class PaymentInProgressBlocMock
    extends MockBloc<PaymentInProgressEvent, PaymentInProgressState>
    implements PaymentInProgressBloc {}

class PaymentSummaryBlocMock
    extends MockBloc<PaymentSummaryEvent, PaymentSummaryState>
    implements PaymentSummaryBloc {}

class PaymentSummaryFilterBlocMock
    extends MockBloc<PaymentSummaryFilterEvent, PaymentSummaryFilterState>
    implements PaymentSummaryFilterBloc {}

//////////////////////////////////////////////////////////////////////////////

///////////////////////Return///////////////////////////////////////////////
class NewRequestMockBloc extends MockBloc<NewRequestEvent, NewRequestState>
    implements NewRequestBloc {}

class ReturnRequestAttachmentBlocMock
    extends MockBloc<ReturnRequestAttachmentEvent, ReturnRequestAttachmentState>
    implements ReturnRequestAttachmentBloc {}

class UsageCodeBlocMock extends MockBloc<UsageCodeEvent, UsageCodeState>
    implements UsageCodeBloc {}
/////////////////////////////////////////////////////////////////////////////