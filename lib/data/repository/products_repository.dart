import 'package:vendor/data/models/products_list_model.dart';
import 'package:vendor/services/http_services.dart';

class ProductsRepository {
  HttpService httpService = HttpService();

  Future<dynamic> fetchProductsList(String url) async {
    var response = await httpService.get(url);

    return ProductsListModel.fromJson(response);
  }
}
