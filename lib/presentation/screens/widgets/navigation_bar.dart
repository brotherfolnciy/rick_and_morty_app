part of 'widgets_part.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    this.onSelected,
  });

  final Function(int)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.isDesktop ? desktopNavBarHeight : phoneNavBarHeight,
      color: AppColors.dirtyGrey,
      child: context.isDesktop
          ? Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Image.asset('assets/images/label.png'),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  width: 0.7,
                  height: desktopNavBarHeight * 0.8,
                  color: Colors.white,
                ),
                Container(
                  width: context.screenSize.width * .3,
                  child: NavigationItems(
                    items: tabs,
                    onSelected: onSelected,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Container(
                  height: phoneNavBarHeight * 0.6,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Image.asset('assets/images/label.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                NavigationItems(
                  items: tabs,
                  onSelected: onSelected,
                  color: Colors.white,
                ),
              ],
            ),
    );
  }
}
