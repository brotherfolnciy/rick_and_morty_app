part of 'widgets_part.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    this.value = 0,
    this.size = 12,
  });

  final int value;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: index < value ? AppColors.toxicGreen : Colors.white10,
          size: size,
        ),
      ),
    );
  }
}
