part of 'contact_part.dart';

@RoutePage()
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.screenSize.width * .25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'About us',
                style: AppTextStyles.main.copyWith(
                  color: AppColors.toxicGreen,
                  fontSize: 100,
                  fontFamily: 'RickAndMorty',
                ),
              ),
              Text(
                "You're talking about Inception? Wubba lubba dub dub! This isn't Game of Thrones, Morty. Awwww thankss your preferences better that way. Plus, if you get in kind of a cool enough relationship, you can sort of follow each bies for 25 schmeckles!",
                style: AppTextStyles.main.copyWith(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'rickyandmortytravieso@gmail.com',
                  style: AppTextStyles.main.copyWith(
                    color: AppColors.toxicGreen,
                    fontSize: 20,
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
