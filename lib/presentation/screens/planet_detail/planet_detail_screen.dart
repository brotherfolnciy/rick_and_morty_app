part of 'planet_detail_part.dart';

@RoutePage()
class PlanetDetailScreen extends StatelessWidget {
  const PlanetDetailScreen({
    super.key,
    this.planet,
  });

  final (Location, PlanetShape)? planet;

  @override
  Widget build(BuildContext context) {
    return planet == null
        ? SizedBox.shrink()
        : CustomPageBuilder(
            builder: (context, isDesktop, size) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    toolbarHeight: context.isDesktop ? 150 : 120,
                    flexibleSpace: buildCustomAppBar(context),
                  ),
                ],
                body: context.isDesktop ? buildDesktopScreen(context) : buildMobileScreen(context),
              );
            },
          );
  }

  Widget buildDesktopScreen(BuildContext context) {
    final screenSize = context.screenSize;
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: screenSize.height,
                  width: screenSize.width / 3,
                  alignment: Alignment(-.3, 0),
                  child: Container(
                    height: 1,
                    width: 1,
                    child: OverflowBox(
                      maxWidth: screenSize.width,
                      maxHeight: 1000,
                      child: UnconstrainedBox(
                        child: Container(
                          height: screenSize.height,
                          alignment: Alignment.center,
                          child: Container(
                            width: context.screenSize.width / 1.8,
                            decoration: BoxDecoration(
                              color: planet!.$2.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: 400,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InfoTile(
                            tittle: 'Planet:',
                            info: planet!.$1.name,
                          ),
                          InfoTile(
                            tittle: 'Type:',
                            info: planet!.$1.name,
                          ),
                          InfoTile(
                            tittle: 'Dimension:',
                            info: planet!.$1.name,
                          ),
                          InfoTile(
                            tittle: 'Created:',
                            info: DateTime.now().toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height - 50,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 30),
              child: CharactersCarousel(
                width: screenSize.width * .75,
                characters: [
                  Character(
                    id: 123,
                    name: 'lois',
                    image: 'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
                  ),
                  Character(
                    id: 123,
                    name: 'lois',
                    image: 'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
                  ),
                  Character(
                    id: 123,
                    name: 'lois',
                    image: 'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
                  ),
                ],
                onPressed: (character) => context.router.push(
                  CharacterDetailsRoute(
                    character: Character(
                      id: 123,
                      name: 'lois',
                      image: 'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileScreen(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
      ),
      child: ListView(
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            child: Container(
              width: context.screenSize.width / 1.8,
              decoration: BoxDecoration(
                color: planet!.$2.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoTile(
                  tittle: 'Planet:',
                  info: planet!.$1.name,
                  fontSize: 24,
                ),
                InfoTile(
                  tittle: 'Type:',
                  info: planet!.$1.name,
                  fontSize: 24,
                ),
                InfoTile(
                  tittle: 'Dimension:',
                  info: planet!.$1.name,
                  fontSize: 24,
                ),
                InfoTile(
                  tittle: 'Created:',
                  info: DateTime.now().toString(),
                  fontSize: 24,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 17),
            child: CharactersCarousel(
              width: context.screenSize.width * .9,
              minimazedCards: !context.isDesktop,
              characters: [
                Character(
                  id: 123,
                  name: 'lois',
                  image: 'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
                ),
                Character(
                  id: 123,
                  name: 'lois',
                  image: 'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
                ),
                Character(
                  id: 123,
                  name: 'lois',
                  image: 'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
                ),
              ],
              onPressed: (character) => context.router.push(
                CharacterDetailsRoute(
                  character: Character(
                    id: 123,
                    name: 'lois',
                    image: 'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
