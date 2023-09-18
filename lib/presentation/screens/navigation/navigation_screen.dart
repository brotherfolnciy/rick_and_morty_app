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
    context.read<PlanetsCubit>().fetchAllPlanets();
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
      bottomNavigationBuilder: (context, router) => BlocBuilder<PlanetsCubit, PlanetsState>(
        builder: (context, state) {
          final canNavigate = state.maybeWhen(
            success: (_) => true,
            orElse: () => false,
          );
          return AnimatedOpacity(
            duration: Duration(seconds: 1),
            curve: Curves.easeOutSine,
            opacity: canNavigate ? 1 : 0,
            child: CustomNavigationBar(
              onSelected: (index) {
                if (canNavigate) {
                  if ((index + 1) == router.activeIndex) {
                    context.router.popTop();
                  }
                  router.setActiveIndex(index + 1);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
