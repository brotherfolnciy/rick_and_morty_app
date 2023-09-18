part of 'widgets_part.dart';

class CharactersCarousel extends StatefulWidget {
  const CharactersCarousel({
    required this.onPressed,
    required this.characters,
    this.width = 300,
    this.minimazedCards = false,
    super.key,
  });

  final Function(Character) onPressed;
  final List<Character> characters;
  final double width;
  final bool minimazedCards;

  @override
  State<CharactersCarousel> createState() => _CharactersCarouselState();
}

class _CharactersCarouselState extends State<CharactersCarousel> {
  final controller = InfiniteScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.nextItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    if (widget.characters.isEmpty) {
      return Text(
        'Characters missing',
        style: AppTextStyles.bold.copyWith(color: AppColors.toxicGreen),
      );
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (context.isDesktop)
              buildArrowButton(
                context,
                true,
                () => controller.previousItem(),
              ),
            Padding(
              padding: context.isDesktop ? EdgeInsets.symmetric(horizontal: screenSize.width / 30) : EdgeInsets.zero,
              child: SizedBox(
                height: 515,
                width: widget.width,
                child: InfiniteCarousel.builder(
                  anchor: 2,
                  loop: true,
                  controller: controller,
                  itemCount: widget.characters.length,
                  itemExtent: widget.width / (context.isDesktop ? 3 : 1),
                  itemBuilder: (context, index, _) {
                    final character = widget.characters[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CharacterCard(
                        imageUrl: character.image,
                        name: character.name,
                        status: character.status ?? 'fds',
                        rating: 3,
                        minimazed: widget.minimazedCards,
                        onGoPressed: () => widget.onPressed(character),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (context.isDesktop)
              buildArrowButton(
                context,
                false,
                () => controller.nextItem(),
              ),
          ],
        ),
        if (!context.isDesktop) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildArrowButton(
                  context,
                  true,
                  () => controller.previousItem(),
                ),
                SizedBox(
                  width: 70,
                ),
                buildArrowButton(
                  context,
                  false,
                  () => controller.nextItem(),
                ),
              ],
            ),
          ),
        ]
      ],
    );
  }

  Widget buildArrowButton(BuildContext context, bool rotate, VoidCallback onPressed) {
    return RotatedBox(
      quarterTurns: rotate ? 2 : 0,
      child: GestureDetector(
        onTap: onPressed,
        child: SvgPicture.asset(
          'assets/icons/arrow.svg',
          width: context.screenSize.width / 20,
        ),
      ),
    );
  }
}
