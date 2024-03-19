import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_chip.dart';

class ProductViewSkeleton extends StatelessWidget {
  const ProductViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
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
                    child: const ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Icon(Icons.image, size: 400,),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "item.title",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              FittedBox(
                child: Row(
                  children: [
                    RatingBar.builder(
                      itemSize: 20,
                      initialRating: 4,
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
                    const Text(
                      'item.rating.rate (item.rating.count Reviews)',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '\$66',
                textAlign: TextAlign.left,
                style: TextStyle(
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
              const ReadMoreText(
                "item.description",
                trimLines: 2,
                trimMode: TrimMode.Length,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                lessStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(flex:3,child: AppButton(text: "Add To Cart", onTap: () {})),
                  const SizedBox(width: 10),

                  SizedBox(
                    height: 60,
                    child: AppChip(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                        ),
                        iconSize: 30,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
