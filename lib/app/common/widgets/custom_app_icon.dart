import '../util/exports.dart';

class CustomAppIcon extends StatelessWidget {
  const CustomAppIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          "R",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.colorPrimary,
          ),
        ),
      ),
    );
  }
}
