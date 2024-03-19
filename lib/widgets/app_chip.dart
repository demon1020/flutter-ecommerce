import '/core.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    this.place,
    this.value,
    this.child,
  });

  final String? place;
  final String? value;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColor.lightGrey.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      alignment: Alignment.center,
      child: child ?? Text(
        "$place$value",
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}