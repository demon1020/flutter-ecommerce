import '../../../data/network/base_api_services.dart';
import '../../../data/network/network_api_service.dart';
import '../../../data/response/api_response.dart';
import '../../../resources/app_url.dart';

class ProductRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<dynamic> fetchProduct(int id) async {
    return await _apiServices.callGetAPI(
        "${AppUrl.productEndpoint}$id", {}, Parser.parseProductResponse,disableTokenValidityCheck: true);
  }
}