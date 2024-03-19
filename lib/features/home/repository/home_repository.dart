
import '../../../data/network/base_api_services.dart';
import '../../../data/network/network_api_service.dart';
import '../../../data/response/api_response.dart';
import '../../../resources/app_url.dart';

class HomeRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<dynamic> fetchMoviesList() async {
    return await _apiServices.callGetAPI(
        AppUrl.productListEndpoint, {}, Parser.parseProductListResponse,disableTokenValidityCheck: true);
  }
}