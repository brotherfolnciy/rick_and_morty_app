part of 'home_part.dart';

@RoutePage()
class PreHomeScreen extends StatelessWidget {
  const PreHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder(
      appBar: buildCustomAppBar(context, showNavigation: false),
      builder: (context, isDesktop, size) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: WarpSpeedDrawer(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 100),
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * (context.isDesktop ? 0.5 : 0.85),
                child: Ufo(),
              ),
            ),
          ],
        );
      },
    );
  }
}
