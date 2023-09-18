part of 'favorite_part.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersCubit>().fetchFavoriteCharacters();
    context.read<PlanetsCubit>().fetchAllPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder(
      builder: (context, _, __) => NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            toolbarHeight: context.isDesktop ? 150 : 120,
            flexibleSpace: buildCustomAppBar(context),
          ),
        ],
        body: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Favorites',
            style: AppTextStyles.main.copyWith(
              color: AppColors.toxicGreen,
              fontSize: context.isDesktop ? 100 : 50,
              fontFamily: 'RickAndMorty',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: BlocBuilder<PlanetsCubit, PlanetsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => Loader(),
                  success: (planets) => PlanetsFilter(
                    items: planets.map((e) => e.name).toList(),
                    onSelected: (planet) {
                      context.read<CharactersCubit>().fetchFavoriteCharacters();
                    },
                  ),
                );
              },
            ),
          ),
          BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Loader(),
                success: (characters) => CharactersCarousel(
                  width: context.isDesktop ? context.screenSize.width * .5 : context.screenSize.width * .85,
                  onPressed: (character) {
                    context.router.push(
                      CharacterDetailsRoute(character: character),
                    );
                  },
                  characters: characters,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
