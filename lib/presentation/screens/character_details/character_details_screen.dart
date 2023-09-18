part of 'character_details_part.dart';

@RoutePage()
class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return CustomPageBuilder(
      builder: (context, _, __) {
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
            body: buildDesktop(context),
          ),
        );
      },
    );
  }

  Widget buildDesktop(BuildContext context) {
    final width = context.screenSize.width * .8;
    final height = width / 1.87;
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            41,
          ),
        ),
        child: Row(
          children: [
            if (character.image != null)
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 0, 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.toxicGreen,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.black),
                    ),
                    child: ExtendedImage.network(
                      character.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        decoration: BoxDecoration(
                          color: AppColors.toxicGreen,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          children: [
                            Text('Рик санрчез'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.toxicGreen,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ExtendedImage.asset(
                              'assets/images/gun.png',
                              width: 50,
                              height: 70,
                              color: Colors.red,
                            ),
                            ExtendedImage.asset(
                              'assets/images/astrofisica.png',
                              width: 40,
                            ),
                            ExtendedImage.asset(
                              'assets/images/neptuno.png',
                              width: 40,
                            ),
                            ExtendedImage.asset(
                              'assets/images/space.png',
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobile() {
    return Container();
  }
}
