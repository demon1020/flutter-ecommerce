import '../../../core.dart';
import '../../../widgets/app_chip.dart';

class HomeViewSkeleton extends StatelessWidget {
  const HomeViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children:
            List.generate(20, (index) {

              return Card(
                elevation: 0.2,
                child: Container(
                  height: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.image, size: 150,),
                      Text("item.title",overflow: TextOverflow.ellipsis),
                      Text("{item.price}"),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}