import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/home/model/product_list.dart';
import 'package:ecommerce/features/product_detail/view/product_view_skeleton.dart';
import 'package:ecommerce/features/product_detail/view_model/product_view_model.dart';
import 'package:ecommerce/widgets/app_button.dart';

import '../../../widgets/app_chip.dart';
import '/core.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailView extends StatefulWidget {
  final int id;

  const ProductDetailView({super.key, required this.id});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProductViewModel>(context, listen: false);
    provider.productId = widget.id;
    provider.init();
    provider.fetchProductApi();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            provider.product.data == null ? "" : provider.product.data!.title),
      ),
      body: buildProductScreen(provider),
      bottomNavigationBar: Visibility(
        visible: provider.product.data == null ? false : true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 3, child: AppButton(text: "Add To Cart", onTap: () {})),
              const SizedBox(width: 10),
              SizedBox(
                height: 60,
                child: AppChip(
                  child: IconButton(
                    onPressed: () {
                      provider.toggleFavorite(provider.productId);
                    },
                    icon: provider.favIds.contains(provider.productId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border,
                          ),
                    iconSize: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildProductScreen(ProductViewModel provider) {
    switch (provider.product.status) {
      case Status.loading:
        return const ProductViewSkeleton();
      case Status.error:
        return Center(child: Text(provider.product.message.toString()));
      case Status.completed:
        return buildProductView(provider.product.data!);
      default:
        return const Text('No Data');
    }
  }

  buildProductView(ProductListingModel item) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      // alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.primaries[5 % 10].withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: item.image,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              item.title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: item.rating.rate,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(width: 20),
                Text(
                  '${item.rating.rate} (${item.rating.count} Reviews)',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '\$${item.price}',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            ReadMoreText(
              item.description,
              trimLines: 2,
              trimMode: TrimMode.Length,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              lessStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
