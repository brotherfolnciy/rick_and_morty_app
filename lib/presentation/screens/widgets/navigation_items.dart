part of 'widgets_part.dart';

class NavigationItems extends StatelessWidget {
  const NavigationItems({
    super.key,
    required this.items,
    required this.onSelected,
    required this.color,
  });

  final List<String> items;
  final Function(int)? onSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          items.length,
          (index) => GestureDetector(
            onTap: () => onSelected?.call(index),
            child: Text(
              items[index],
              style: AppTextStyles.light.copyWith(
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
