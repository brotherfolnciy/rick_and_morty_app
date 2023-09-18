part of 'widgets_part.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    this.onChanged,
    this.initial = false,
    this.size = 64,
    super.key,
  });

  final bool initial;
  final ValueChanged<bool>? onChanged;
  final double size;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          flag = !flag;
          widget.onChanged?.call(flag);
        });
      },
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          color: AppColors.dirtyGrey,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.star,
          color: flag ? AppColors.toxicGreen : Colors.white,
          size: widget.size * .85,
        ),
      ),
    );
  }
}
