import 'package:flutter_batch_3_project/data/remote_data/network_service/network_service.dart';
import 'package:flutter_batch_3_project/models/sales_model.dart';

import '../../models/order_model.dart';

abstract class SalesRemoteData {
  Future<List<SalesInvoice>> getSalesInvoices({
    int? page,
    int? size,
  });

  Future<void> postCreateSales(OrderModel data);

}

class SalesRemoteDataImpl implements SalesRemoteData {

  late final NetworkService networkService;

  SalesRemoteDataImpl(this.networkService);

  @override
  Future<List<SalesInvoice>> getSalesInvoices({
    int? page,
    int? size,
  }) async {
    final response = await networkService.get(
      url: "/api/sales/list?age=1&size=100"
    );

    return List<SalesInvoice>.from(response.data['data']['data'].map((x) => SalesInvoice.fromJson(x)));
  }

  @override
  Future<void> postCreateSales(OrderModel data) async {
    await networkService.post(
      url: "/api/sales/create",
      data: data.toJson()
    );
  }

}