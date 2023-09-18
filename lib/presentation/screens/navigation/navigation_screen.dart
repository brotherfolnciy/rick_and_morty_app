part of 'navigation_part.dart';

@RoutePage()
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,
      routes: [
        const PreHomeRoute(),
        const HomeRoute(),
        const FavoriteRoute(),
        const ContactRoute(),
        PlanetDetailRoute(),
      ],
      bottomNavigationBuilder: (context, router) => CustomNavigationBar(
        onSelected: (index) => router.setActiveIndex(index + 1),
      ),
    );
  }
}
