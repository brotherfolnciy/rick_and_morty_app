part of 'widgets_part.dart';

class PlanetsFilter extends StatelessWidget {
  const PlanetsFilter({
    super.key,
    required this.items,
    required this.onSelected,
  });

  final List<String> items;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.toxicGreen,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownMenu(
        hintText: 'Search by Planet',
        width: 300,
        leadingIcon: Image.asset(
          'assets/images/neptuno.png',
          scale: 3,
        ),
        enableSearch: false,
        inputDecorationTheme: InputDecorationTheme(
          hoverColor: Colors.red,
          focusColor: Colors.red,
          contentPadding: EdgeInsets.only(left: 20),
          border: InputBorder.none,
        ),
        onSelected: onSelected,
        dropdownMenuEntries: items
            .map(
              (e) => DropdownMenuEntry(value: e, label: e),
            )
            .toList(),
      ),
    );
  }
}
