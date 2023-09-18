part of 'home_part.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final items = List.generate(80, (index) => index);

    return CustomPageBuilder(
      builder: (context, isDesktop, size) {
        final scrollViewSize = Size(
          isDesktop ? size.width * (items.length / 15) : size.width,
          isDesktop ? size.height : size.height * (items.length / 15),
        );
        return NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              toolbarHeight: context.isDesktop ? 150 : 120,
              flexibleSpace: buildCustomAppBar(context),
            ),
          ],
          body: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    scrollDirection: isDesktop ? Axis.horizontal : Axis.vertical,
                    child: Container(
                      width: scrollViewSize.width,
                      height: scrollViewSize.height,
                      child: BlocBuilder<PlanetsCubit, PlanetsState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => SizedBox.shrink(),
                            success: (items) => PlanetsGenerator(
                              onTap: (shape) {
                                final location = items[shape.index];
                                context.read<CharactersCubit>().fetchCharactersByPlanet(location.id);
                                context.router.push(
                                  PlanetDetailRoute(
                                    planet: (
                                      location,
                                      shape,
                                    ),
                                  ),
                                );
                              },
                              count: items.length,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
