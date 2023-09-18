part of 'widgets_part.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    this.imageUrl,
    this.name = '',
    this.status = '',
    this.rating = 0,
    this.onFavoriteChange,
    this.onGoPressed,
    this.minimazed = false,
  });

  final String? imageUrl;
  final String name;
  final String status;
  final int rating;
  final ValueChanged<bool>? onFavoriteChange;
  final VoidCallback? onGoPressed;
  final bool minimazed;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: DefaultTextStyle(
        style: TextStyle(
          color: AppColors.dirtyGrey,
        ),
        child: Container(
          height: minimazed ? 515 : 580,
          width: 310,
          decoration: BoxDecoration(
            color: AppColors.toxicGreen,
            borderRadius: BorderRadius.circular(characterCardBorderRadius),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: imageUrl != null
                        ? ExtendedImage.network(
                            imageUrl!,
                            printError: false,
                            cache: true,
                            fit: BoxFit.cover,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(characterCardBorderRadius),
                              topRight: Radius.circular(characterCardBorderRadius),
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                  Container(
                    height: minimazed ? 135 : 195,
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(characterRatingBorderRadius),
                        bottomRight: Radius.circular(characterRatingBorderRadius),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name:',
                            style: AppTextStyles.bold.copyWith(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            name,
                            style: AppTextStyles.light.copyWith(
                              height: 1,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            'Status:',
                            style: AppTextStyles.bold.copyWith(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            status,
                            style: AppTextStyles.light.copyWith(
                              height: 1,
                              fontSize: 24,
                            ),
                          ),
                          Spacer(),
                          if (!minimazed)
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 48),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.dirtyGrey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(characterRatingBorderRadius),
                                    topRight: Radius.circular(characterRatingBorderRadius),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/bluster.svg',
                                      width: 44,
                                    ),
                                    Rating(
                                      value: rating,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 7),
                child: FavoriteButton(
                  onChanged: onFavoriteChange,
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(),
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(bottom: 144, right: 7),
                child: MaterialButton(
                  elevation: 10,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: AppColors.toxicGreen,
                      width: 4,
                    ),
                  ),
                  height: 94,
                  minWidth: 94,
                  onPressed: onGoPressed,
                  color: AppColors.dirtyGrey,
                  child: Text(
                    'Go',
                    style: AppTextStyles.main.copyWith(color: AppColors.toxicGreen, fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
