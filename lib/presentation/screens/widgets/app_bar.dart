part of 'widgets_part.dart';

PreferredSizeWidget buildCustomAppBar(
  BuildContext context, {
  bool showNavigation = true,
}) =>
    CustomAppBar(
      height: context.isDesktop ? desktopAppBarHeight : phoneAppBarHeight,
      showNavigation: showNavigation,
    );

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.height,
    required this.showNavigation,
  });

  final double height;
  final bool showNavigation;

  @override
  Widget build(BuildContext context) {
    return showNavigation ? buildWithNavigation(context) : buildWithoutNavigation(context);
  }

  Widget buildWithNavigation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: context.isDesktop ? 3 : 5,
          child: Container(
            padding: EdgeInsets.all(12),
            child: Image.asset('assets/images/label_glow.png'),
          ),
        ),
        if (context.isDesktop && showNavigation)
          Flexible(
            flex: 1,
            child: NavigationItems(
              items: tabs,
              onSelected: (index) {
                context.tabsRouter.setActiveIndex(index + 1);
              },
              color: AppColors.toxicGreen,
            ),
          ),
      ],
    );
  }

  Widget buildWithoutNavigation(BuildContext contex) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Image.asset(
        'assets/images/label_glow.png',
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
