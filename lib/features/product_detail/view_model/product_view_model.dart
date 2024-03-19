import 'package:ecommerce/core.dart';
import 'package:ecommerce/features/home/model/product_list.dart';
import 'package:ecommerce/features/product_detail/repository/product_detail_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/response/api_response.dart';

class ProductViewModel with ChangeNotifier {
  Set<int> favIds = {};
  late int productId;
  final _myRepo = ProductRepository();

  ApiResponse<ProductListingModel> product = ApiResponse.loading();

  void init() async{
    loadFavorites();
  }

  setProduct(ApiResponse<ProductListingModel> response) {
    product = response;
  }

  Future<void> fetchProductApi() async {
    setProduct(ApiResponse.loading());

    var response = await _myRepo.fetchProduct(productId);

    response
        .fold((failure) => setProduct(ApiResponse.error(failure.message)),
            (data) async {
      setProduct(ApiResponse.completed(data));
    });
    notifyListeners();
  }

  void loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favIds = prefs.getStringList('favIds')?.map(int.parse).toSet() ?? {};
  }

  void saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favIds', favIds.map((id) => id.toString()).toList());
  }

  void toggleFavorite(int id) {
    if (favIds.contains(id)) {
      favIds.remove(id);
      Utils.toastMessage("Removed From Favourites");
    } else {
      favIds.add(id);
      Utils.toastMessage("Added to Favourites");
    }
    saveFavorites();
    notifyListeners();
  }
}
