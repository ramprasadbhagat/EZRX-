import 'dart:convert';
import 'package:ezrxmobile/domain/order/entities/invoice_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/invoice_data_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/product_meta_data_dto.dart';
import 'package:flutter/services.dart';

class ViewByItemLocalDataSource {
  ViewByItemLocalDataSource();
  Future<OrderHistory> getViewByItems() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/getorderHistoryFetchByItemsResponse.json'),
    );

    final finalData =
        data['data']['orderHistoryFetchByItems']['OrderHistory'][0];

    return OrderHistoryDto.fromJson(finalData).toDomain();
  }

  Future<ProductMetaData> getItemProductDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getProductQueryResponse.json',
      ),
    );

    return ProductMetaDataDto.fromJson(data['data']['getProduct']).toDomain;
  }

  Future<List<InvoiceData>> getInvoiceDataForOrders() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/getInvoiceForOrdersResponse.json',
      ),
    );
    final finalData = data['data']['getInvoiceIdForOrders'];

    return List.from(finalData)
        .map((e) => InvoiceDataDto.fromJson(e).toDomain())
        .toList();
  }
}
