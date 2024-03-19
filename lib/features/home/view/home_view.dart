import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../utils/enums/status.dart';
import '../../../utils/global.dart';
import '../../../utils/routes/routes_name.dart';
import '../model/product_list.dart';
import '../view_model/home_view_model.dart';
import 'home_view_skeleton.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<HomeViewViewModel>(context, listen: false);
    provider.fetchProductListApi();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop X'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.profileView);
            },
            icon: Icon(
              Icons.person_pin,
            ),
          ),

          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: buildHomeScreen(provider),
    );
  }

  buildHomeScreen(HomeViewViewModel provider) {
    switch (provider.productList.status) {
      case Status.loading:
        return const HomeViewSkeleton();
      case Status.error:
        return Center(child: Text(provider.productList.message.toString()));
      case Status.completed:
        return buildProductListView(provider.productList.data!);
      default:
        return const Text('No Data');
    }
  }

  Widget buildProductListView(List<ProductListingModel> productList) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: List.generate(productList.length, (index) {
            var item = productList[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  arguments: item.id,
                  navigatorKey.currentContext!,
                  RoutesName.productDetailView,
                );
              },
              child: Card(
                elevation: 0.2,
                child: Container(
                  height: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CachedNetworkImage(
                          height: 250,
                          imageUrl: item.image,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        Text(item.title, overflow: TextOverflow.ellipsis),
                        Text("\$ ${item.price}"),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
