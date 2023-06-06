import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/view_deduction_code/deduction_code_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/add_payment_method/add_payment_method_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/manage_payment_method/manage_payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/add_sales_district/add_sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/admin_po_attachment_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_principle_detail_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/invoice_details/invoice_details_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary/return_summary_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return_filter/request_return_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/returns_overview/returns_overview_bloc.dart';
import 'package:ezrxmobile/domain/order/repository/i_combo_deal_repository.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/update_sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/admin_po_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/deduction_code_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/update_sales_org_repository.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/repository/payment_methods_repository.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/application/returns/return_request_type_code/return_request_type_code_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/setting_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/order_storage.dart';
import 'package:ezrxmobile/infrastructure/deep_linking/repository/deep_linking_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_org_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_rep_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_org_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_rep_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ship_to_code_repository.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement/repository/announcement_repository.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_local.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/datasource/tncdate_remote.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/repository/aup_tc_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/change_password_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/auth_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/change_password_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/dynamic_links.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/performance_monitor.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/auth_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/http/interceptor/performance_interceptor.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/secure_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_remote.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourites_local.dart';
import 'package:ezrxmobile/infrastructure/favourites/repository/favourite_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/additional_bonus/bonus_material_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_template_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_querymutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_customer_information_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/payment_term_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/price_override/price_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_query.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/tender_contract_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_material_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/valid_customer_materials_query.dart';
import 'package:ezrxmobile/infrastructure/order/repository/bonus_material_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/combo_deal_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/discount_override_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_bundle_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_filter_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_detail_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_document_type_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_template_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_customer_information_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/payment_term_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/price_override_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/tender_contract_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/valid_customer_material_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/payment_advice_footer_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/invoice_details_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/invoice_details_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_information_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_list_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_request_by_user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/returns_overview_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/returns_overview_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/returns_overview_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_remote.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/all_credits_and_invoices_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/policy_configuration_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/request_return_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_approver_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_details_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/returns_overview_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/usage_code_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/user_restriction_repository.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_type_code_repository.dart';
import 'package:ezrxmobile/application/returns/user_restriction_details/user_restriction_details_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/repository/scan_material_info_repository.dart';
import 'package:ezrxmobile/infrastructure/core/material_info_scanner/material_info_scanner.dart';
import 'package:ezrxmobile/application/returns/return_price/return_price_bloc.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_price_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_query.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_mutation.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/submit_return_request_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_remote_datasource.dart';
import 'package:ezrxmobile/application/returns/submit_return/submit_return_bloc.dart';
import 'package:ezrxmobile/application/payments/paymant_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_query.dart';
import 'package:ezrxmobile/infrastructure/account/repository/bank_beneficiary_repository.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_district_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_district_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/sales_district_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_district_repository.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';

import 'package:ezrxmobile/application/account/payment_notification/payment_notification_bloc.dart';

import 'package:ezrxmobile/infrastructure/account/repository/update_payment_notification_repository.dart';

import 'package:ezrxmobile/infrastructure/account/datasource/update_payment_notification_local_datasource.dart';

import 'package:ezrxmobile/infrastructure/account/datasource/update_payment_notification_mutation.dart';

import 'package:ezrxmobile/infrastructure/account/datasource/update_payment_notification_remote_datasource.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //============================================================
  //  CORE
  //
  //============================================================

  locator.registerLazySingleton(() => Config());
  locator.registerLazySingleton(() => PackageInfoService());
  locator.registerLazySingleton(() => AppRouter());

  locator.registerLazySingleton(
    () => PushNotificationService(appRouter: locator<AppRouter>()),
  );

  locator.registerLazySingleton(
    () => OktaLoginServices(config: locator<Config>()),
  );

  locator.registerLazySingleton(() => PerformanceMonitorService());
  locator.registerLazySingleton(() => FirebaseAnalyticsService(
        analytics: FirebaseAnalytics.instance,
        observer:
            FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ));
  locator.registerLazySingleton(() => FirebaseCrashlyticsService(
        crashlytics: FirebaseCrashlytics.instance,
      ));
  locator.registerLazySingleton(
    () => RemoteConfigService(),
  );

  locator.registerLazySingleton(
    () => RouterObserver(
      firebaseAnalyticsService: locator<FirebaseAnalyticsService>(),
      mixpanelService: locator<MixpanelService>(),
    ),
  );
  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(
    () => TokenStorage(secureStorage: locator<SecureStorage>()),
  );
  locator.registerLazySingleton(
    () => CredStorage(secureStorage: locator<SecureStorage>()),
  );
  locator.registerLazySingleton(() => CartStorage());
  locator.registerLazySingleton(() => SettingStorage());
  locator.registerLazySingleton(() => OrderStorage());
  locator.registerLazySingleton(
    () => MaterialInfoScanner(config: locator<Config>()),
  );

  locator.registerLazySingleton(
    () => AuthInterceptor(
      tokenStorage: locator<TokenStorage>(),
      packageInfoService: locator<PackageInfoService>(),
      oktaLoginServices: locator<OktaLoginServices>(),
      config: locator<Config>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      pushNotificationService: locator<PushNotificationService>(),
    ),
  );
  locator.registerLazySingleton(
    () => PerformanceInterceptor(
      performanceMonitorService: locator<PerformanceMonitorService>(),
    ),
  );
  locator.registerLazySingleton(
    () => HttpService(
      config: locator<Config>(),
      interceptors: [
        locator<AuthInterceptor>(),
        locator<PerformanceInterceptor>(),
      ],
    ),
  );

  locator.registerLazySingleton(
    () => HttpService(
      config: locator<Config>(),
      interceptors: [
        locator<AuthInterceptor>(),
        locator<PerformanceInterceptor>(),
      ],
    ),
    instanceName: 'eZReachHttpService',
  );

  locator.registerLazySingleton(() => DataSourceExceptionHandler());

  locator.registerLazySingleton(() => LocalAuthentication());

  //============================================================
  //  Auth
  //
  //============================================================
  locator.registerLazySingleton(() => AuthQueryMutation());
  locator.registerLazySingleton(() => AuthLocalDataSource());
  locator.registerLazySingleton(
    () => AuthRemoteDataSource(
      httpService: locator<HttpService>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ClevertapService(
      config: locator<Config>(),
      pushNotificationService: locator<PushNotificationService>(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthRepository(
      accountSelectorStorage: locator<AccountSelectorStorage>(),
      config: locator<Config>(),
      remoteDataSource: locator<AuthRemoteDataSource>(),
      localDataSource: locator<AuthLocalDataSource>(),
      tokenStorage: locator<TokenStorage>(),
      credStorage: locator<CredStorage>(),
      cartStorage: locator<CartStorage>(),
      settingStorage: locator<SettingStorage>(),
      oktaLoginServices: locator<OktaLoginServices>(),
      pushNotificationService: locator<PushNotificationService>(),
      localAuthentication: locator<LocalAuthentication>(),
      mixpanelService: locator<MixpanelService>(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthBloc(
      authRepository: locator<AuthRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => LoginFormBloc(authRepository: locator<AuthRepository>()),
  );

  locator.registerLazySingleton(
    () => ProxyLoginFormBloc(authRepository: locator<AuthRepository>()),
  );

  //============================================================
  // Returns - User Restriction
  //
  //============================================================

  locator.registerLazySingleton(() => UserRestrictionMutation());

  locator.registerLazySingleton(() => UserRestrictionLocalDataSource());

  locator.registerLazySingleton(
    () => UserRestrictionRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      userRestrictionMutation: locator<UserRestrictionMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserRestrictionRepository(
      config: locator<Config>(),
      localDataSource: locator<UserRestrictionLocalDataSource>(),
      remoteDataSource: locator<UserRestrictionRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserRestrictionListBloc(
      userRestrictionRepository: locator<UserRestrictionRepository>(),
    ),
  );

  //============================================================
  // Returns - Returns Overview
  //
  //============================================================

  locator.registerLazySingleton(() => ReturnsOverviewMutation());

  locator.registerLazySingleton(() => ReturnsOverviewLocalDataSource());

  locator.registerLazySingleton(
    () => ReturnsOverviewRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      returnsOverviewMutation: locator<ReturnsOverviewMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnsOverviewRepository(
      config: locator<Config>(),
      localDataSource: locator<ReturnsOverviewLocalDataSource>(),
      remoteDataSource: locator<ReturnsOverviewRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnsOverviewBloc(
      returnsOverviewRepository: locator<ReturnsOverviewRepository>(),
    ),
  );

  //============================================================
  //  User
  //
  //============================================================

  locator.registerLazySingleton(() => UserQueryMutation());
  locator.registerLazySingleton(
    () => UserLocalDataSource(tokenStorage: locator<TokenStorage>()),
  );
  locator.registerLazySingleton(
    () => UserRemoteDataSource(
      httpService: locator<HttpService>(),
      userQueryMutation: locator<UserQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserRepository(
      clevertapService: locator<ClevertapService>(),
      config: locator<Config>(),
      remoteDataSource: locator<UserRemoteDataSource>(),
      localDataSource: locator<UserLocalDataSource>(),
      firebaseAnalyticsService: locator<FirebaseAnalyticsService>(),
      firebaseCrashlyticsService: locator<FirebaseCrashlyticsService>(),
      tokenStorage: locator<TokenStorage>(),
      mixpanelService: locator<MixpanelService>(),
    ),
  );

  locator.registerLazySingleton(
    () => UserBloc(
      userRepository: locator<UserRepository>(),
    ),
  );

  //============================================================
  //  Banner
  //
  //============================================================
  locator.registerLazySingleton(() => BannerQueryMutation());

  locator.registerLazySingleton(() => BannerLocalDataSource());

  locator.registerLazySingleton(
    () => BannerRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      eZReachHttpService:
          locator.get<HttpService>(instanceName: 'eZReachHttpService'),
      bannerQueryMutation: locator<BannerQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => BannerRepository(
      config: locator<Config>(),
      localDataSource: locator<BannerLocalDataSource>(),
      remoteDataSource: locator<BannerRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => BannerBloc(
      bannerRepository: locator<BannerRepository>(),
    ),
  );

  //============================================================
  //  Additional bonus
  //
  //============================================================
  locator.registerLazySingleton(
    () => BonusMaterialLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => BonusMaterialRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      bonusQueryMutation: locator<BonusMaterialQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => BonusMaterialQueryMutation(),
  );

  locator.registerLazySingleton(
    () => BonusMaterialRepository(
      remoteDataSource: locator<BonusMaterialRemoteDataSource>(),
      config: locator<Config>(),
      localDataSource: locator<BonusMaterialLocalDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => BonusMaterialBloc(
      bonusMaterialRepository: locator<BonusMaterialRepository>(),
    ),
  );
  //============================================================
  //  Price Override
  //
  //============================================================
  locator.registerLazySingleton(
    () => PriceOverrideLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => PriceOverrideRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      priceOverrideQueryMutation: locator<PriceOverrideQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PriceOverrideQueryMutation(),
  );

  locator.registerLazySingleton(
    () => PriceOverrideRepository(
      remoteDataSource: locator<PriceOverrideRemoteDataSource>(),
      config: locator<Config>(),
      localDataSource: locator<PriceOverrideLocalDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => PriceOverrideBloc(
      priceOverrideRepository: locator<PriceOverrideRepository>(),
    ),
  );
  //============================================================
  //  Favourite
  //
  //============================================================

  locator.registerLazySingleton(
    () => FavouriteLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => FavouriteQueryMutation(),
  );
  locator.registerLazySingleton(
    () => FavouriteRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      favouriteQueryMutation: locator<FavouriteQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => FavouriteRepository(
      config: locator<Config>(),
      localDataSource: locator<FavouriteLocalDataSource>(),
      remoteDataSource: locator<FavouriteRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => FavouriteBloc(
      favouriteRepository: locator<FavouriteRepository>(),
    ),
  );
  //============================================================
  //  Sales Org
  //
  //============================================================

  locator.registerLazySingleton(() => SalesOrgQueryMutation());

  locator.registerLazySingleton(() => SalesOrgLocalDataSource());

  locator.registerLazySingleton(() => AccountSelectorStorage(hive: Hive));

  locator.registerLazySingleton(
    () => SalesOrgRemoteDataSource(
      httpService: locator<HttpService>(),
      salesOrgQueryMutation: locator<SalesOrgQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesOrgRepository(
      accountSelectorStorage: locator<AccountSelectorStorage>(),
      config: locator<Config>(),
      localDataSource: locator<SalesOrgLocalDataSource>(),
      remoteDataSource: locator<SalesOrgRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesOrgBloc(
      salesOrgRepository: locator<SalesOrgRepository>(),
    ),
  );

  //============================================================
  //  Customer Code
  //
  //============================================================
  locator.registerLazySingleton(() => CustomerCodeQueryMutation());

  locator.registerLazySingleton(() => CustomerCodeLocalDataSource());

  locator.registerLazySingleton(
    () => CustomerCodeRemoteDataSource(
      httpService: locator<HttpService>(),
      customerCodeQueryMutation: locator<CustomerCodeQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => CustomerCodeRepository(
      config: locator<Config>(),
      remoteDataSource: locator<CustomerCodeRemoteDataSource>(),
      localCustomerCodeDataSource: locator<CustomerCodeLocalDataSource>(),
      accountSelectorStorage: locator<AccountSelectorStorage>(),
    ),
  );

  locator.registerFactory(
    () => CustomerCodeBloc(
      customerCodeRepository: locator<CustomerCodeRepository>(),
    ),
  );

  //============================================================
  //  Ship To Code
  //
  //============================================================

  locator.registerLazySingleton(
    () => ShipToCodeRepository(
      accountSelectorStorage: locator<AccountSelectorStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => ShipToCodeBloc(
      shipToCodeRepository: locator<ShipToCodeRepository>(),
    ),
  );

  //============================================================
  //  Eligibility
  //
  //============================================================

  locator.registerLazySingleton(
    () => EligibilityBloc(),
  );

  //============================================================
  //  Announcement
  //
  //============================================================

  locator.registerLazySingleton(() => AnnouncementQueryMutation());

  locator.registerLazySingleton(
    () => AnnouncementRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<AnnouncementQueryMutation>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(() => AnnouncementLocalDataSource());

  locator.registerLazySingleton(
    () => AnnouncementRepository(
      config: locator<Config>(),
      remoteDataSource: locator<AnnouncementRemoteDataSource>(),
      localDataSource: locator<AnnouncementLocalDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => AnnouncementBloc(
      announcementRepository: locator<AnnouncementRepository>(),
    ),
  );

  //============================================================
  //  Order
  //
  //============================================================

  locator.registerLazySingleton(() => OrderQueryMutation());

  locator.registerLazySingleton(() => OrderLocalDataSource());

  locator.registerLazySingleton(
    () => OrderRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<OrderQueryMutation>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderRepository(
      config: locator<Config>(),
      localDataSource: locator<OrderLocalDataSource>(),
      remoteDataSource: locator<OrderRemoteDataSource>(),
      mixpanelService: locator<MixpanelService>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderSummaryBloc(repository: locator<OrderRepository>()),
  );

  locator.registerLazySingleton(
    () => AdditionalDetailsBloc(
      savedOrderRepository: locator<OrderRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderEligibilityBloc(),
  );

  //============================================================
  // Saved Orders
  //
  //============================================================
  locator.registerLazySingleton(
    () => SavedOrderListBloc(
      repository: locator<OrderRepository>(),
    ),
  );

  //============================================================
  //  Sales Rep
  //
  //============================================================

  locator.registerLazySingleton(() => SalesRepQueryMutation());

  locator.registerLazySingleton(() => SalesRepLocalDataSource());

  locator.registerLazySingleton(
    () => SalesRepRemoteDataSource(
      httpService: locator<HttpService>(),
      salesRepQueryMutation: locator<SalesRepQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesRepRepository(
      config: locator<Config>(),
      remoteDataSource: locator<SalesRepRemoteDataSource>(),
      localDataSource: locator<SalesRepLocalDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesRepBloc(
      salesRepRepository: locator<SalesRepRepository>(),
    ),
  );

  //============================================================
  //  Material List
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialsWithMetaQuery());

  locator.registerLazySingleton(() => MaterialListLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialListRemoteDataSource(
      httpService: locator<HttpService>(),
      materialListQuery: locator<MaterialsWithMetaQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialListRepository(
      config: locator<Config>(),
      materialListLocalDataSource: locator<MaterialListLocalDataSource>(),
      materialListRemoteDataSource: locator<MaterialListRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialListBloc(
      materialListRepository: locator<MaterialListRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => CovidMaterialListBloc(
      materialListRepository: locator<MaterialListRepository>(),
    ),
  );

  locator.registerLazySingleton(() => MaterialBundleQuery());

  locator.registerLazySingleton(() => MaterialBundleListLocalDatasource());

  locator.registerLazySingleton(
    () => MaterialBundleListRemoteDataSource(
      httpService: locator<HttpService>(),
      materialBundleQuery: locator<MaterialBundleQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialBundleListRepository(
      config: locator<Config>(),
      materialBundleListLocalDatasource:
          locator<MaterialBundleListLocalDatasource>(),
      materialBundleListRemoteDatasource:
          locator<MaterialBundleListRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialBundleListBloc(
      materialBundleListRepository: locator<MaterialBundleListRepository>(),
      customerMaterialPriceDetailsRepository:
          locator<MaterialPriceDetailRepository>(),
    ),
  );

  //============================================================
  //  Order Template List
  //
  //============================================================

  locator.registerLazySingleton(() => OrderTemplateQueries());

  locator.registerLazySingleton(() => OrderTemplateLocalDataSource());

  locator.registerLazySingleton(() => OrderTemplateRemoteDataSource(
        httpService: locator<HttpService>(),
        orderTemplateQueries: locator<OrderTemplateQueries>(),
        dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
        config: locator<Config>(),
      ));

  locator.registerLazySingleton(
    () => OrderTemplateRepository(
      config: locator<Config>(),
      orderTemplateLocalDataSource: locator<OrderTemplateLocalDataSource>(),
      orderTemplateRemoteDataSource: locator<OrderTemplateRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderTemplateListBloc(
      orderTemplateRepository: locator<OrderTemplateRepository>(),
    ),
  );

  //============================================================
  //  Reset Password
  //
  //============================================================
  locator.registerLazySingleton(() => ChangePasswordLocalDataSource());

  locator.registerLazySingleton(
    () => ChangePasswordRemoteDataSource(
      httpService: locator<HttpService>(),
      authQueryMutation: locator<AuthQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ChangePasswordRepository(
      config: locator<Config>(),
      localDataSource: locator<ChangePasswordLocalDataSource>(),
      changePasswordRemoteDataSource: locator<ChangePasswordRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ResetPasswordBloc(
      changePasswordRepository: locator<ChangePasswordRepository>(),
    ),
  );

  //============================================================
  //  Order History
  //
  //============================================================

  locator.registerLazySingleton(() => OrderHistoryLocalDataSource());
  locator.registerLazySingleton(() => OrderHistoryQueryMutation());
  locator.registerLazySingleton(
    () => OrderHistoryRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      orderHistoryQueryMutation: locator<OrderHistoryQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderHistoryRepository(
      config: locator<Config>(),
      localDataSource: locator<OrderHistoryLocalDataSource>(),
      orderHistoryRemoteDataSource: locator<OrderHistoryRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => OrderHistoryListBloc(
      orderHistoryRepository: locator<OrderHistoryRepository>(),
    ),
  );
  //============================================================
  //  Order History Filter
  //
  //============================================================

  locator.registerLazySingleton(
    () => OrderHistoryFilterBloc(),
  );
  //============================================================
  //  Order History Filter By Status
  //
  //============================================================

  locator.registerLazySingleton(
    () => OrderHistoryFilterByStatusBloc(),
  );
  //============================================================
  //  Order History Details
  //
  //============================================================

  locator.registerLazySingleton(() => OrderHistoryDetailsLocalDataSource());

  locator.registerLazySingleton(() => OrderHistoryDetailsQueryMutation());

  locator.registerLazySingleton(
    () => OrderHistoryDetailsRepository(
      config: locator<Config>(),
      localDataSource: locator<OrderHistoryDetailsLocalDataSource>(),
      orderHistoryDetailsRemoteDataSource:
          locator<OrderHistoryDetailsRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderHistoryDetailsBloc(
      orderHistoryDetailsRepository: locator<OrderHistoryDetailsRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderHistoryDetailsRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      orderHistoryDetailsQueryMutation:
          locator<OrderHistoryDetailsQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  //============================================================
  //  Payment Customer Information
  //
  //============================================================

  locator.registerLazySingleton(
    () => PaymentCustomerInformationLocalDataSource(),
  );

  locator
      .registerLazySingleton(() => PaymentCustomerInformationQueryMutation());

  locator.registerLazySingleton(
    () => PaymentCustomerInformationRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      paymentCustomerInformationQueryMutation:
          locator<PaymentCustomerInformationQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentCustomerInformationRepository(
      config: locator<Config>(),
      remoteDataSource: locator<PaymentCustomerInformationRemoteDataSource>(),
      localDataSource: locator<PaymentCustomerInformationLocalDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => PaymentCustomerInformationBloc(
      paymentCustomerInformationRepository:
          locator<PaymentCustomerInformationRepository>(),
    ),
  );

  //============================================================
  //  T&C
  //
  //============================================================

  locator.registerLazySingleton(
    () => AcceptanceDateLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => AcceptanceDateRemoteDataSource(
      httpService: locator<HttpService>(),
      exceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => AupTcRepository(
      config: locator<Config>(),
      localDataSource: locator<AcceptanceDateLocalDataSource>(),
      remoteDataSource: locator<AcceptanceDateRemoteDataSource>(),
      remoteConfigService: locator<RemoteConfigService>(),
    ),
  );

  locator.registerLazySingleton(
    () => AupTcBloc(
      aupTcRepository: locator<AupTcRepository>(),
      config: locator<Config>(),
    ),
  );

  //============================================================
  //  Payment Terms
  //
  //============================================================

  locator.registerLazySingleton(() => PaymentTermsQueryMutation());

  locator.registerLazySingleton(() => PaymentTermLocalDataSource());

  locator.registerLazySingleton(
    () => PaymentTermsRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      payemttTermsQueryMutation: locator<PaymentTermsQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentTermsRepository(
      config: locator<Config>(),
      localDataSource: locator<PaymentTermLocalDataSource>(),
      remoteDataSource: locator<PaymentTermsRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentTermBloc(
      paymentTermRepository: locator<PaymentTermsRepository>(),
    ),
  );

  //============================================================
  //  Material Price
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialPriceQueryMutation());

  locator.registerLazySingleton(() => MaterialPriceLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialPriceRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<MaterialPriceQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialPriceRepository(
      config: locator<Config>(),
      localDataSource: locator<MaterialPriceLocalDataSource>(),
      remoteDataSource: locator<MaterialPriceRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialPriceBloc(
      repository: locator<MaterialPriceRepository>(),
    ),
  );

  //============================================================
  //  Material Price Detail
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialPriceDetailQueryMutation());

  locator.registerLazySingleton(() => MaterialPriceDetailLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialPriceDetailRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      queryMutation: locator<MaterialPriceDetailQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialPriceDetailRepository(
      config: locator<Config>(),
      localDataSource: locator<MaterialPriceDetailLocalDataSource>(),
      remoteDataSource: locator<MaterialPriceDetailRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => MaterialPriceDetailBloc(
      priceRepository: locator<MaterialPriceDetailRepository>(),
      validateRepository: locator<ValidCustomerMaterialRepository>(),
    ),
  );

  //============================================================
  //  Valid Customer Material
  //
  //============================================================

  locator.registerLazySingleton(
    () => ValidCustomMaterialQuery(),
  );

  locator.registerLazySingleton(
    () => ValidCustomerMaterialLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => ValidCustomerMaterialRemoteDataSource(
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      validCustomMaterialQuery: ValidCustomMaterialQuery(),
      config: locator<Config>(),
    ),
  );

  locator.registerLazySingleton(
    () => ValidCustomerMaterialRepository(
      config: locator<Config>(),
      localDataSource: locator<ValidCustomerMaterialLocalDataSource>(),
      remoteDataSource: locator<ValidCustomerMaterialRemoteDataSource>(),
    ),
  );

  //============================================================
  //  Material Filter
  //
  //============================================================

  locator.registerLazySingleton(() => MaterialFilterQueryMutation());
  locator.registerLazySingleton(() => MaterialFilterLocalDataSource());

  locator.registerLazySingleton(
    () => MaterialFilterRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      materialFilterQueryMutation: locator<MaterialFilterQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialFilterRepository(
      config: locator<Config>(),
      filterMaterialRemoteDataSource: locator<MaterialFilterRemoteDataSource>(),
      filterMaterialLocalDataSource: locator<MaterialFilterLocalDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => MaterialFilterBloc(
      materialFilterRepository: locator<MaterialFilterRepository>(),
    ),
  );

  //============================================================
  //  Order Document Type
  //
  //============================================================

  locator.registerLazySingleton(() => OrderDocumentTypeLocalDataSource());
  locator.registerLazySingleton(() => OrderDocumentTypeQueryMutation());

  locator.registerLazySingleton(
    () => OrderDocumentTypeRemoteDataSource(
      httpService: locator<HttpService>(),
      config: locator<Config>(),
      queryMutation: locator<OrderDocumentTypeQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderDocumentTypeRepository(
      config: locator<Config>(),
      orderDocumentTypLocalDataSource:
          locator<OrderDocumentTypeLocalDataSource>(),
      orderDocumentTypRemoteDataSource:
          locator<OrderDocumentTypeRemoteDataSource>(),
      orderStorage: locator<OrderStorage>(),
    ),
  );

  locator.registerLazySingleton(
    () => OrderDocumentTypeBloc(
      orderDocumentTypeRepository: locator<OrderDocumentTypeRepository>(),
    ),
  );

  //============================================================
  //  Order History Details Po Document Type
  //
  //============================================================

  locator.registerLazySingleton(
    () => FilePickerService(),
  );
  locator.registerLazySingleton(
    () => PermissionService(),
  );

  locator.registerLazySingleton(
    () => DeviceInfo(),
  );

  locator.registerLazySingleton(
    () => FileSystemHelper(),
  );

  locator.registerLazySingleton(
    () => PoDocumentLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => PoDocumentRemoteDataSource(
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PoAttachmentRepository(
      config: locator<Config>(),
      remoteDataSource: locator<PoDocumentRemoteDataSource>(),
      localDataSource: locator<PoDocumentLocalDataSource>(),
      permissionService: locator<PermissionService>(),
      deviceInfo: locator<DeviceInfo>(),
      filePickerService: locator<FilePickerService>(),
      fileSystemHelper: locator<FileSystemHelper>(),
    ),
  );

  locator.registerFactory(
    () => PoAttachmentBloc(
      poAttachmentRepository: locator<PoAttachmentRepository>(),
    ),
  );

  //============================================================
  //  Tender Contract
  //
  //============================================================

  locator.registerLazySingleton(() => TenderContractQuery());

  locator.registerLazySingleton(() => TenderContractLocalDataSource());

  locator.registerLazySingleton(
    () => TenderContractRemoteDataSource(
      httpService: locator<HttpService>(),
      tenderContractQuery: locator<TenderContractQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => TenderContractRepository(
      config: locator<Config>(),
      tenderContractLocalDataSource: locator<TenderContractLocalDataSource>(),
      tenderContractRemoteDataSource: locator<TenderContractRemoteDataSource>(),
    ),
  );

  locator.registerFactory(
    () => TenderContractBloc(
      tenderContractRepository: locator<TenderContractRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => TenderContractListBloc(
      tenderContractRepository: locator<TenderContractRepository>(),
    ),
  );

  //============================================================
  //  Discount Override
  //
  //============================================================

  locator.registerLazySingleton(() => DiscountOverrideLocalDataSource());

  locator.registerLazySingleton(
    () => DiscountOverrideRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<MaterialPriceQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => DiscountOverrideRepository(
      config: locator<Config>(),
      localDataSource: locator<DiscountOverrideLocalDataSource>(),
      remoteDataSource: locator<DiscountOverrideRemoteDataSource>(),
    ),
  );

  // Using registerFactory here because we need multiple instances of DiscountOverrideBloc
  locator.registerFactory(
    () => DiscountOverrideBloc(
      repository: locator<DiscountOverrideRepository>(),
    ),
  );

  //============================================================
  //  Return Request Code Type
  //
  //============================================================

  locator.registerLazySingleton(() => ReturnRequestTypeCodeLocalDataSource());

  locator.registerLazySingleton(() => ReturnRequestTypeCodeQuery());

  locator.registerLazySingleton(
    () => ReturnRequestTypeCodeRemoteDataSource(
      httpService: locator<HttpService>(),
      queryMutation: locator<ReturnRequestTypeCodeQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnRequestTypeCodeRepository(
      config: locator<Config>(),
      localDataSource: locator<ReturnRequestTypeCodeLocalDataSource>(),
      remoteDataSource: locator<ReturnRequestTypeCodeRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnRequestTypeCodeBloc(
      returnRequestTypeCodeRepository:
          locator<ReturnRequestTypeCodeRepository>(),
    ),
  );

  //============================================================
  //  Return Request List
  //
  //============================================================

  locator.registerLazySingleton(() => RequestReturnLocalDatasource());

  locator.registerLazySingleton(() => ReturnRequestListQuery());

  locator.registerLazySingleton(
    () => RequestReturnRemoteDatasource(
      httpService: locator<HttpService>(),
      query: locator<ReturnRequestListQuery>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => RequestReturnRepository(
      config: locator<Config>(),
      localDataSource: locator<RequestReturnLocalDatasource>(),
      remoteDataSource: locator<RequestReturnRemoteDatasource>(),
    ),
  );

  locator.registerLazySingleton(
    () => RequestReturnBloc(
      returnRequestRepository: locator<RequestReturnRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => RequestReturnFilterBloc(),
  );

  //============================================================
  //  Cart
  //
  //============================================================

  locator.registerFactory(
    () => AddToCartBloc(
      materialPriceDetailRepository: locator<MaterialPriceDetailRepository>(),
    ),
  );

  locator.registerLazySingleton(() => StockInfoLocalDataSource());
  locator.registerLazySingleton(() => StockInfoQueryMutation());

  locator.registerLazySingleton(
    () => StockInfoRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      stockInfoQueryMutation: locator<StockInfoQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => CartRepository(
      mixpanelService: locator<MixpanelService>(),
      cartStorage: locator<CartStorage>(),
      config: locator<Config>(),
      stockInfoLocalDataSource: locator<StockInfoLocalDataSource>(),
      stockInfoRemoteDataSource: locator<StockInfoRemoteDataSource>(),
      discountOverrideRemoteDataSource:
          locator<DiscountOverrideRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => CartBloc(locator<CartRepository>()),
  );

  //============================================================
  //  Policy Configuration
  //
  //============================================================

  locator.registerLazySingleton(
    () => PolicyConfigurationLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => PolicyConfigurationQueryMutation(),
  );

  locator.registerLazySingleton(
    () => PolicyConfigurationRemoteDataSource(
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
      policyConfigurationQueryMutation:
          locator<PolicyConfigurationQueryMutation>(),
    ),
  );

  locator.registerLazySingleton(
    () => PolicyConfigurationRepository(
      config: locator<Config>(),
      localDataSource: locator<PolicyConfigurationLocalDataSource>(),
      remoteDataSource: locator<PolicyConfigurationRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => PolicyConfigurationBloc(
      policyConfigurationRepository: locator<PolicyConfigurationRepository>(),
    ),
  );

  //============================================================
  //  User Restriction Deatils
  //
  //============================================================

  locator.registerLazySingleton(
    () => UserRestrictionDetailsBloc(
      userRestrictionRepository: locator<UserRestrictionRepository>(),
    ),
  );

  //============================================================
  //  Usage
  //
  //============================================================

  locator.registerLazySingleton(
    () => UsageCodeBloc(usageRepository: locator<UsageRepository>()),
  );
  locator.registerLazySingleton(
    () => UsageCodeLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => UsageCodeQueryMutation(),
  );
  locator.registerLazySingleton(
    () => UsageCodeRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      usageCodeQueryMutation: locator<UsageCodeQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => UsageRepository(
      config: locator<Config>(),
      usageLocalDataSource: locator<UsageCodeLocalDataSource>(),
      usageRemoteDataSource: locator<UsageCodeRemoteDataSource>(),
    ),
  );

  //============================================================
  //  Return Approver Actions
  //
  //============================================================

  locator.registerLazySingleton(
    () => ApproverReturnRequestQuery(),
  );
  locator.registerLazySingleton(
    () => RequestInformationQuery(),
  );
  locator.registerLazySingleton(
    () => ApproverReturnRequestsLocal(),
  );
  locator.registerLazySingleton(
    () => ApproverReturnRequestsRemote(
      approverReturnRequestQuery: locator<ApproverReturnRequestQuery>(),
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => ApproverReturnRequestInformationLocal(),
  );
  locator.registerLazySingleton(
    () => ApproverReturnRequestInformationRemote(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      approverReturnRequestInformationQuery: locator<RequestInformationQuery>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnApproverRepository(
      config: locator<Config>(),
      returnRequestLocalDataSource: locator<ApproverReturnRequestsLocal>(),
      returnRequestRemoteDataSource: locator<ApproverReturnRequestsRemote>(),
      returnRequestInformationLocalDataSource:
          locator<ApproverReturnRequestInformationLocal>(),
      returnRequestInformationRemoteDataSource:
          locator<ApproverReturnRequestInformationRemote>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnApproverBloc(
      returnApproverRepository: locator<ReturnApproverRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnApproverFilterBloc(),
  );

  //============================================================
  //  Return Summary
  //
  //============================================================

  locator.registerLazySingleton(
    () => ReturnSummaryBloc(
      returnSummaryRepository: locator<ReturnSummaryRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => ReturnSummaryLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => ReturnSummaryQueryMutation(),
  );
  locator.registerLazySingleton(
    () => ReturnSummaryRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      returnSummaryQueryMutation: locator<ReturnSummaryQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => ReturnSummaryRepository(
      config: locator<Config>(),
      returnSummaryLocalDataSource: locator<ReturnSummaryLocalDataSource>(),
      returnSummaryRemoteDataSource: locator<ReturnSummaryRemoteDataSource>(),
    ),
  );
  //============================================================
  //  Return Summary Filter
  //
  //============================================================

  locator.registerLazySingleton(
    () => ReturnSummaryFilterBloc(),
  );

  //Mixpanel

  locator.registerLazySingleton(
    () => MixpanelService(),
  );

  //============================================================
  //  Payment Summary
  //
  //============================================================

  locator.registerLazySingleton(
    () => PaymentSummaryBloc(
      paymentSummaryRepository: locator<PaymentSummaryRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryQuery(),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      paymentSummaryQuery: locator<PaymentSummaryQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentSummaryRepository(
      config: locator<Config>(),
      localDataSource: locator<PaymentSummaryLocalDataSource>(),
      remoteDataSource: locator<PaymentSummaryRemoteDataSource>(),
    ),
  );

  //============================================================
  //  Combo Deals
  //
  //============================================================
  locator.registerLazySingleton(
    () => ComboDealQueryMutation(),
  );

  locator.registerLazySingleton(
    () => ComboDealLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => ComboDealRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      queryMutation: locator<ComboDealQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton<IComboDealRepository>(
    () => ComboDealRepository(
      config: locator<Config>(),
      localDataSource: locator<ComboDealLocalDataSource>(),
      remoteDataSource: locator<ComboDealRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ComboDealListBloc(
      repository: locator<IComboDealRepository>(),
    ),
  );

  locator.registerFactory(
    () => ComboDealMaterialDetailBloc(),
  );

  locator.registerFactory(
    () => ComboDealPrincipleDetailBloc(
      repository: locator<MaterialListRepository>(),
    ),
  );

  //============================================================
  //  Scan Material Information
  //
  //============================================================
  locator.registerLazySingleton(
    () => ScanMaterialInfoRepository(
      mixpanelService: locator<MixpanelService>(),
      materialInfoScanner: locator<MaterialInfoScanner>(),
      filePickerService: locator<FilePickerService>(),
    ),
  );
  locator.registerLazySingleton(
    () => ScanMaterialInfoBloc(
      scanInfoRepository: locator<ScanMaterialInfoRepository>(),
      materialListRepository: locator<MaterialListRepository>(),
    ),
  );

  //============================================================
  //  Return Summary Details
  //
  //============================================================

  locator.registerLazySingleton(
    () => ReturnSummaryDetailsRequestInformationLocal(),
  );

  locator.registerLazySingleton(
    () => ReturnSummaryDetailsRepository(
      config: locator<Config>(),
      returnSummaryDetailsRequestInformationLocal:
          locator<ReturnSummaryDetailsRequestInformationLocal>(),
      returnSummaryDetailsRequestInformationRemote:
          locator<ReturnSummaryDetailsRequestInformationRemote>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnSummaryDetailsBloc(
      returnSummaryDetailsRepository: locator<ReturnSummaryDetailsRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnSummaryDetailsRequestInformationRemote(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      requestInformationQuery: locator<RequestInformationQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  //============================================================
  // Deep Linking
  //
  //============================================================
  locator.registerLazySingleton(
    () => DynamicLinksService(
      config: locator<Config>(),
      appRouter: locator<AppRouter>(),
    ),
  );

  locator.registerLazySingleton(
    () => DeepLinkingRepository(),
  );

  locator.registerLazySingleton(
    () => DeepLinkingBloc(
      repository: locator<DeepLinkingRepository>(),
      service: locator<DynamicLinksService>(),
    ),
  );

  //============================================================
  //  Return Request price
  //
  //============================================================

  locator.registerLazySingleton(
    () => ReturnPriceQuery(),
  );

  locator.registerLazySingleton(
    () => ReturnPriceLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => ReturnPriceRepository(
      config: locator<Config>(),
      localDataSource: locator<ReturnPriceLocalDataSource>(),
      remoteDataSource: locator<ReturnPriceRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnPriceRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      queryMutation: locator<ReturnPriceQuery>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => ReturnPriceBloc(
      returnPriceRepository: locator<ReturnPriceRepository>(),
    ),
  );

  //============================================================
  //  Submit Return
  //
  //============================================================

  locator.registerLazySingleton(
    () => SubmitReturnRequestMutation(),
  );

  locator.registerLazySingleton(
    () => SubmitReturnRequestLocalDataSource(),
  );

  locator.registerLazySingleton(
    () => SubmitRequestReturnRepository(
      config: locator<Config>(),
      localDataSource: locator<SubmitReturnRequestLocalDataSource>(),
      remoteDataSource: locator<SubmitReturnRequestRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => SubmitReturnRequestRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      returnRequestMutation: locator<SubmitReturnRequestMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => SubmitReturnBloc(
      submitRequestRepository: locator<SubmitRequestReturnRepository>(),
    ),
  );

  //============================================================
  //  Admin Po Attachment
  //============================================================

  locator.registerLazySingleton(
    () => AdminPoAttachmentLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => AdminPoAttachmentQueryMutation(),
  );

  locator.registerLazySingleton(
    () => AdminPoAttachmentRemoteDataSource(
      config: locator<Config>(),
      adminPoAttachmentQueryMutation: locator<AdminPoAttachmentQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
      httpService: locator<HttpService>(),
    ),
  );

  locator.registerLazySingleton(
    () => AdminPoAttachmentRepository(
      config: locator<Config>(),
      localDataSource: locator<AdminPoAttachmentLocalDataSource>(),
      remoteDataSource: locator<AdminPoAttachmentRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => AdminPoAttachmentBloc(
      repository: locator<AdminPoAttachmentRepository>(),
    ),
  );

  //============================================================
  //  Po Attachment Filter
  //
  //============================================================

  locator.registerLazySingleton(
    () => AdminPoAttachmentFilterBloc(),
  );

  //============================================================
  //  Payment Configuration
  //
  //============================================================

  locator.registerLazySingleton(() => PaymentMethodsLocalDataSource());

  locator.registerLazySingleton(() => PaymentMethodsQueryMutation());

  locator.registerLazySingleton(
    () => PaymentMethodsRemoteDataSource(
      httpService: locator<HttpService>(),
      paymentMethodsQueryMutation: locator<PaymentMethodsQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentMethodsRepository(
      config: locator<Config>(),
      localDataSource: locator<PaymentMethodsLocalDataSource>(),
      remoteDataSource: locator<PaymentMethodsRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentMethodsBloc(
      paymentMethodsRepository: locator<PaymentMethodsRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => ManagePaymentMethodsBloc(
      paymentMethodsRepository: locator<PaymentMethodsRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => AddPaymentMethodBloc(
      paymentMethodsRepository: locator<PaymentMethodsRepository>(),
    ),
  );

  //============================================================
  // Update Payment Notification
  //
  //============================================================

  locator.registerLazySingleton(
    () => PaymentNotificationBloc(
      updatePaymentNotificationRepository:
          locator<UpdatePaymentNotificationRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => UpdatePaymentNotificationLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => UpdatePaymentNotificationMutation(),
  );
  locator.registerLazySingleton(
    () => UpdatePaymentNotificationRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      updatePaymentNotificationMutation:
          locator<UpdatePaymentNotificationMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => UpdatePaymentNotificationRepository(
      config: locator<Config>(),
      localDataSource: locator<UpdatePaymentNotificationLocalDataSource>(),
      remoteDataSource: locator<UpdatePaymentNotificationRemoteDataSource>(),
    ),
  );
  //============================================================

  //  Manage Bank Beneficiary
  //
  //============================================================

  locator.registerLazySingleton(() => BankBeneficiaryLocalDataSource());

  locator.registerLazySingleton(() => BankBeneficiaryQueryMutation());

  locator.registerLazySingleton(() => BankBeneficiaryRemoteDataSource(
        httpService: locator<HttpService>(),
        config: locator<Config>(),
        dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
        bankBeneficiaryQueryMutation: locator<BankBeneficiaryQueryMutation>(),
      ));

  locator.registerLazySingleton(() => BankBeneficiaryRepository(
        config: locator<Config>(),
        localDataSource: locator<BankBeneficiaryLocalDataSource>(),
        remoteDataSource: locator<BankBeneficiaryRemoteDataSource>(),
      ));

  locator.registerLazySingleton(
    () => ManageBankBeneficiaryBloc(
      bankBeneficiaryRepository: locator<BankBeneficiaryRepository>(),
    ),
  );


  //============================================================
  //  Sales District (Payment Configuration)
  //
  //============================================================

  locator.registerLazySingleton(() => SalesDistrictLocalDataSource());

  locator.registerLazySingleton(() => SalesDistrictQueryMutation());

  locator.registerLazySingleton(
    () => SalesDistrictRemoteDataSource(
      httpService: locator<HttpService>(),
      salesDistrictQueryMutation: locator<SalesDistrictQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesDistrictRepository(
      config: locator<Config>(),
      localDataSource: locator<SalesDistrictLocalDataSource>(),
      remoteDataSource: locator<SalesDistrictRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => SalesDistrictBloc(
      salesDistrictRepository: locator<SalesDistrictRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => AddSalesDistrictBloc(
      salesDistrictRepository: locator<SalesDistrictRepository>(),
    ),
  );

  //============================================================
  //  All Invoices and Credits
  //
  //============================================================
  locator.registerLazySingleton(
    () => AllInvoicesFilterBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => AllInvoicesBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => AllCreditsAndInvoicesLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => AllCreditsAndInvoicesQueryMutation(),
  );
  locator.registerLazySingleton(
    () => AllCreditsAndInvoicesRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      allCreditsAndInvoicesQueryMutation:
          locator<AllCreditsAndInvoicesQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );
  locator.registerLazySingleton(
    () => AllCreditsAndInvoicesRepository(
      config: locator<Config>(),
      localDataSource: locator<AllCreditsAndInvoicesLocalDataSource>(),
      remoteDataSource: locator<AllCreditsAndInvoicesRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => AllCreditsBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => AllCreditsFilterBloc(
      allCreditsAndInvoicesRepository:
          locator<AllCreditsAndInvoicesRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => InvoiceDetailsRepository(
      config: locator<Config>(),
      localDataSource: locator<InvoiceDetailsLocalDataSource>(),
      remoteDataSource: locator<InvoiceDetailsRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton(
    () => InvoiceDetailsBloc(
      invoiceDetailsRepository: locator<InvoiceDetailsRepository>(),
    ),
  );
  locator.registerLazySingleton(
    () => InvoiceDetailsLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => InvoiceDetailsQueryMutation(),
  );
  locator.registerLazySingleton(
    () => InvoiceDetailsRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      invoiceDetailsQueryMutation: locator<InvoiceDetailsQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  //============================================================
  //  Payment Advice footer
  //
  //============================================================

  locator.registerLazySingleton(
    () => PaymentAdviceFooterLocalDataSource(),
  );
  locator.registerLazySingleton(
    () => PaymentAdviceQueryMutation(),
  );


  locator.registerLazySingleton(
    () => PaymentAdviceFooterRemoteDataSource(
      config: locator<Config>(),
      httpService: locator<HttpService>(),
      paymentAdviceQueryMutation: locator<PaymentAdviceQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentAdviceFooterRepository(
      config: locator<Config>(),
      localDataSource: locator<PaymentAdviceFooterLocalDataSource>(),
      remoteDataSource: locator<PaymentAdviceFooterRemoteDataSource>(),
      permissionService: locator<PermissionService>(),
      deviceInfo: locator<DeviceInfo>(),
      filePickerService: locator<FilePickerService>(),
    ),
  );

  locator.registerLazySingleton(
    () => PaymentAdviceFooterBloc(
      paymentAdviceFooterRepository: locator<PaymentAdviceFooterRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => ManagePaymentAdviceFooterBloc(
      paymentAdviceFooterRepository: locator<PaymentAdviceFooterRepository>(),
    ),
  );

  //============================================================
  //  Update Sales Org Config
  //
  //============================================================

  locator.registerLazySingleton(() => UpdateSalesOrgQueryMutation());

  locator.registerLazySingleton(
    () => UpdateSalesOrgRemoteDataSource(
      httpService: locator<HttpService>(),
      updateSalesOrgQueryMutation: locator<UpdateSalesOrgQueryMutation>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(() => UpdateSalesOrgLocalDataSource());

  locator.registerLazySingleton(
    () => UpdateSalesOrgRepository(
      config: locator<Config>(),
      remoteDataSource: locator<UpdateSalesOrgRemoteDataSource>(),
      localDataSource: locator<UpdateSalesOrgLocalDataSource>(),
    ),
  );

  //============================================================
  //  Settings
  //
  //============================================================

  locator.registerLazySingleton(
    () => SettingBloc(
      authRepository: locator<AuthRepository>(),
    ),
  );

  //============================================================
  //  Deduction Code
  //
  //============================================================

  locator.registerLazySingleton(() => DeductionCodeLocalDataSource());

  locator.registerLazySingleton(() => DeductionCodeQueryMutation());

  locator.registerLazySingleton(
    () => DeductionCodeRemoteDataSource(
      httpService: locator<HttpService>(),
      deductionCodeQueryMutation: locator<DeductionCodeQueryMutation>(),
      config: locator<Config>(),
      dataSourceExceptionHandler: locator<DataSourceExceptionHandler>(),
    ),
  );

  locator.registerLazySingleton(
    () => DeductionCodeRepository(
      config: locator<Config>(),
      localDataSource: locator<DeductionCodeLocalDataSource>(),
      remoteDataSource: locator<DeductionCodeRemoteDataSource>(),
    ),
  );

  locator.registerLazySingleton(
    () => DeductionCodeBloc(
      deductionCodeRepository: locator<DeductionCodeRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => ManageDeductionCodeBloc(
      deductionCodeRepository: locator<DeductionCodeRepository>(),
    ),
  );
}
