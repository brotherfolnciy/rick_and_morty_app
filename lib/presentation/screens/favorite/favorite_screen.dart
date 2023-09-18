part of 'favorite_part.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
            child: PlanetsFilter(
              items: [],
              onSelected: (value) {},
            ),
          ),
          CharactersCarousel(
            width: context.isDesktop ? context.screenSize.width * .5 : context.screenSize.width * .85,
            onPressed: (character) {},
            characters: [
              Character(id: 2, name: 'name'),
            ],
          )
        ],
      ),
    );
  }
}
