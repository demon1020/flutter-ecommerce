import 'package:ecommerce/features/home/model/product_list.dart';
import 'package:flutter/material.dart';

import '../../../data/response/api_response.dart';
import '../repository/home_repository.dart';
import '../model/movies_model.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<List<ProductListingModel>> productList = ApiResponse.loading();

  setProductList(ApiResponse<List<ProductListingModel>> response) {
    productList = response;
  }

  Future<void> fetchProductListApi() async {
    setProductList(ApiResponse.loading());

    var response = await _myRepo.fetchMoviesList();

    response
        .fold((failure) => setProductList(ApiResponse.error(failure.message)),
            (data) async {
      setProductList(ApiResponse.completed(data));
    });
    notifyListeners();
  }
}
