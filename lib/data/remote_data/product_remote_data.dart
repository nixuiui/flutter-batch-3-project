import 'package:flutter_batch_3_project/data/remote_data/network_service/network_service.dart';
import 'package:flutter_batch_3_project/models/product_model.dart';

abstract class ProductRemoteData {
  Future<List<Product>> getProduct({
    int? page,
    int? size,
  });
}

class ProductRemoteDataImpl implements ProductRemoteData {

  late final NetworkService networkService;

  ProductRemoteDataImpl(this.networkService);

  @override
  Future<List<Product>> getProduct({int? page, int? size}) async {
    final response = await networkService.get(
      url: "/api/product/list"
    );

    return List<Product>.from(response.data['data']['data'].map((x) => Product.fromJson(x)));
  }

}