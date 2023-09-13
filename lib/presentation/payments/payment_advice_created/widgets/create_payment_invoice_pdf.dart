import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:typed_data';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';

class CreatePaymentInvoicePdf {
  DateTimeStringValue expiryDate({required DateTimeStringValue valueDate}) =>
      DateTimeStringValue(
        DateFormat(DateTimeFormatString.apiDateWithDashFormat).format(
          DateTime.parse(valueDate.getValue()).add(const Duration(days: 30)),
        ),
      );

  Future<pw.MemoryImage> _captureImageDescription({
    required String pleaseNote,
  }) async {
    final imageData = await ScreenshotController().captureFromWidget(
      MediaQuery(
        data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
        child: Html(
          data: pleaseNote,
        ),
      ),
    );

    return pw.MemoryImage(imageData);
  }

  pw.TableRow _invoiceItem(
    List<String> cells, {
    bool isHeader = false,
  }) =>
      pw.TableRow(
        decoration: pw.BoxDecoration(
          border: pw.Border(
            bottom: pw.BorderSide(
              width: 2,
              color: PdfColor.fromInt(ZPColors.extraLightGrey3.value),
            ),
          ),
        ),
        children: cells.map((cell) {
          return pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 8.0),
            child: pw.Text(
              cell,
              style: isHeader
                  ? pw.TextStyle(
                      fontSize: 16,
                      color: PdfColor.fromInt(ZPColors.neutralsBlack.value),
                      fontWeight: pw.FontWeight.bold,
                      letterSpacing: 0.25,
                    )
                  : pw.TextStyle(
                      fontSize: 14,
                      color: PdfColor.fromInt(ZPColors.neutralsBlack.value),
                      letterSpacing: 0.25,
                    ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          );
        }).toList(),
      );

  Future<pw.Widget> _headerInvoice({
    required String headerLogoPath,
    required String zzAdvice,
  }) async {
    final netImage =
        headerLogoPath.isNotEmpty ? await networkImage(headerLogoPath) : null;

    return pw.Container(
      padding: const pw.EdgeInsets.all(16.0),
      decoration: pw.BoxDecoration(
        borderRadius:
            const pw.BorderRadius.vertical(top: pw.Radius.circular(16.0)),
        color: PdfColor.fromInt(ZPColors.primary.value),
      ),
      child: pw.Row(
        children: [
          pw.Flexible(
            flex: 1,
            child: netImage != null ? pw.Image(netImage) : pw.SizedBox.shrink(),
          ),
          pw.SizedBox(width: 16.0),
          pw.Flexible(
            flex: 2,
            child: pw.Text(
              '${'Payment Advice'.tr()} $zzAdvice',
              style: pw.TextStyle(
                fontSize: 16,
                color: PdfColor.fromInt(ZPColors.white.value),
                fontWeight: pw.FontWeight.bold,
                letterSpacing: 0.25,
              ),
              overflow: pw.TextOverflow.clip,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _infoCustomerAndAmount({
    required ShipToInfo shipToInfo,
    required String customerName,
    required String payer,
    required List<PaymentItem> paymentItems,
  }) =>
      pw.Stack(
        alignment: pw.Alignment.center,
        children: [
          pw.SizedBox(
            height: 150,
            width: double.infinity,
            child: pw.Column(
              children: [
                pw.Expanded(
                  child: pw.Container(
                    color: PdfColor.fromInt(ZPColors.primary.value),
                  ),
                ),
                pw.Expanded(
                  child: pw.Container(
                    color: PdfColor.fromInt(ZPColors.white.value),
                  ),
                ),
              ],
            ),
          ),
          pw.Container(
            padding: const pw.EdgeInsets.all(16.0),
            margin: const pw.EdgeInsets.symmetric(horizontal: 16.0),
            decoration: pw.BoxDecoration(
              color: PdfColor.fromInt(ZPColors.white.value),
              borderRadius: const pw.BorderRadius.all(pw.Radius.circular(12.0)),
              boxShadow: [
                pw.BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 7,
                  color: PdfColor.fromInt(
                    ZPColors.black.withOpacity(0.5).value,
                  ),
                ),
              ],
            ),
            child: pw.Row(
              children: [
                _infoCustomer(
                  shipToInfo: shipToInfo,
                  customerName: customerName,
                  payer: payer,
                ),
                pw.VerticalDivider(
                  indent: 0,
                  thickness: 1,
                  endIndent: 0,
                  width: 10,
                  color: PdfColor.fromInt(ZPColors.extraLightGrey3.value),
                ),
                _amountInvoice(paymentItems: paymentItems),
              ],
            ),
          ),
        ],
      );

  pw.Widget _infoCustomer({
    required ShipToInfo shipToInfo,
    required String customerName,
    required String payer,
  }) =>
      pw.Flexible(
        flex: 5,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              customerName,
              style: pw.TextStyle(
                fontSize: 16,
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
                letterSpacing: 0.25,
              ),
            ),
            pw.SizedBox(height: 4.0),
            pw.Text(
              shipToInfo.deliveryAddress,
              style: pw.TextStyle(
                fontSize: 14,
                color: PdfColor.fromInt(ZPColors.primary.value),
                letterSpacing: 0.25,
              ),
              maxLines: 2,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              '${'Customer Code'.tr()}: $payer',
              style: pw.TextStyle(
                fontSize: 14,
                color: PdfColor.fromInt(ZPColors.primary.value),
                letterSpacing: 0.25,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _amountInvoice({required List<PaymentItem> paymentItems}) =>
      pw.Flexible(
        flex: 3,
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              '${'Payment Amount'.tr()} (${paymentItems.first.transactionCurrency})',
              style: pw.TextStyle(
                fontSize: 14,
                color: PdfColor.fromInt(ZPColors.primary.value),
                letterSpacing: 0.25,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              paymentItems.totalInInvoice.toStringAsFixed(2),
              style: pw.TextStyle(
                fontSize: 16,
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
                letterSpacing: 0.25,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _expireInvoice({
    required DateTimeStringValue valueDate,
    required DateTimeStringValue expiryDate,
    required String paymentMethod,
  }) =>
      pw.Table(
        columnWidths: {
          0: const pw.FractionColumnWidth(1 / 3),
          1: const pw.FractionColumnWidth(1 / 3),
          2: const pw.FractionColumnWidth(1 / 3),
        },
        children: [
          pw.TableRow(
            decoration: pw.BoxDecoration(
              border: pw.Border(
                bottom: pw.BorderSide(
                  width: 2,
                  color: PdfColor.fromInt(ZPColors.extraLightGrey3.value),
                ),
              ),
            ),
            children: [
              _dateCreated(valueDate: valueDate),
              _dateExpiry(expiryDate: expiryDate),
              _paymentMethod(paymentMethod: paymentMethod),
            ],
          ),
        ],
      );

  pw.Widget _dateCreated({
    required DateTimeStringValue valueDate,
  }) =>
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Date created'.tr(),
              style: pw.TextStyle(
                fontSize: 14,
                color: PdfColor.fromInt(ZPColors.primary.value),
                letterSpacing: 0.25,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              valueDate.dateString,
              style: pw.TextStyle(
                fontSize: 16,
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
                letterSpacing: 0.25,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _dateExpiry({
    required DateTimeStringValue expiryDate,
  }) =>
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Payment advice expiry date'.tr(),
              style: pw.TextStyle(
                fontSize: 14,
                color: PdfColor.fromInt(ZPColors.primary.value),
                letterSpacing: 0.25,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              expiryDate.dateString,
              style: pw.TextStyle(
                fontSize: 16,
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
                letterSpacing: 0.25,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _paymentMethod({required String paymentMethod}) => pw.Padding(
        padding: const pw.EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Payment Method'.tr(),
              style: pw.TextStyle(
                fontSize: 14,
                color: PdfColor.fromInt(ZPColors.primary.value),
                letterSpacing: 0.25,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
            pw.Text(
              paymentMethod,
              style: pw.TextStyle(
                fontSize: 16,
                color: PdfColor.fromInt(ZPColors.primary.value),
                fontWeight: pw.FontWeight.bold,
                letterSpacing: 0.25,
              ),
              maxLines: 1,
              overflow: pw.TextOverflow.clip,
            ),
          ],
        ),
      );

  pw.Widget _item({required List<PaymentItem> paymentItems}) => pw.Table(
        children: [
          _invoiceItem(
            [
              'Document Date'.tr(),
              'Document Type'.tr(),
              'Document No.'.tr(),
              '${'Amount'.tr()} (${paymentItems.first.transactionCurrency}).',
            ],
            isHeader: true,
          ),
          ...paymentItems
              .map(
                (e) => _invoiceItem([
                  e.documentDate.dateString,
                  e.postingKeyName,
                  e.searchKey,
                  e.paymentAmountInDisplayCrcy.toStringAsFixed(2),
                ]),
              )
              .toList(),
        ],
      );

  Future<pw.Widget> _description({required String pleaseNote}) async {
    final image = await _captureImageDescription(pleaseNote: pleaseNote);

    return pw.Container(
      width: double.infinity,
      color: PdfColor.fromInt(ZPColors.extraLightGrey2.value),
      padding: const pw.EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      child: pw.Image(
        image,
      ),
    );
  }

  pw.Widget _footerInvoice({required String footer}) => pw.Container(
        padding: const pw.EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        decoration: pw.BoxDecoration(
          borderRadius: const pw.BorderRadius.vertical(
            bottom: pw.Radius.circular(16.0),
          ),
          color: PdfColor.fromInt(ZPColors.extraLightGrey4.value),
        ),
        child: pw.Center(
          child: pw.Text(
            footer,
            style: pw.TextStyle(
              fontSize: 14,
              color: PdfColor.fromInt(ZPColors.primary.value),
              letterSpacing: 0.25,
            ),
          ),
        ),
      );

  Future<Uint8List> createInvoicePdf({
    required PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
    required ShipToInfo shipToInfo,
  }) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5);
    final headerInvoice = await _headerInvoice(
      headerLogoPath: paymentInvoiceInfoPdf.headerLogoPath,
      zzAdvice: paymentInvoiceInfoPdf.zzAdvice,
    );
    final description = await _description(
      pleaseNote: paymentInvoiceInfoPdf.pleaseNote,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(16.0),
        build: (context) {
          return pw.Column(
            children: [
              headerInvoice,
              _infoCustomerAndAmount(
                shipToInfo: shipToInfo,
                payer: paymentInvoiceInfoPdf.payer,
                paymentItems: paymentInvoiceInfoPdf.paymentItems,
                customerName: paymentInvoiceInfoPdf.customerName,
              ),
              _expireInvoice(
                paymentMethod: paymentInvoiceInfoPdf.paymentMethod,
                expiryDate: expiryDate(
                  valueDate: paymentInvoiceInfoPdf.valueDate,
                ),
                valueDate: paymentInvoiceInfoPdf.valueDate,
              ),
              _item(paymentItems: paymentInvoiceInfoPdf.paymentItems),
              pw.Spacer(),
              description,
              _footerInvoice(footer: paymentInvoiceInfoPdf.footer),
            ],
          );
        },
      ),
    );

    return await pdf.save();
  }
}
