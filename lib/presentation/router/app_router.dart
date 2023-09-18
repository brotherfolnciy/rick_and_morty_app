import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/domain/domain.dart';
import 'package:rick_and_morty_app/presentation/models/models.dart';
import 'package:rick_and_morty_app/presentation/screens/character_details/character_details_part.dart';
import 'package:rick_and_morty_app/presentation/screens/contact/contact_part.dart';
import 'package:rick_and_morty_app/presentation/screens/favorite/favorite_part.dart';
import 'package:rick_and_morty_app/presentation/screens/home/home_part.dart';
import 'package:rick_and_morty_app/presentation/screens/navigation/navigation_part.dart';
import 'package:rick_and_morty_app/presentation/screens/planet_detail/planet_detail_part.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/navigation',
          page: NavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(
              path: 'prehome',
              page: PreHomeRoute.page,
            ),
            AutoRoute(
              path: 'home_navigatiom',
              page: HomeNavigationRoute.page,
              children: [
                AutoRoute(
                  path: 'home',
                  page: HomeRoute.page,
                ),
                AutoRoute(
                  path: 'planet_details',
                  page: PlanetDetailRoute.page,
                ),
                AutoRoute(
                  path: 'character_details',
                  page: CharacterDetailsRoute.page,
                )
              ],
            ),
            AutoRoute(
              path: 'favorite',
              page: FavoriteRoute.page,
            ),
            AutoRoute(
              path: 'contact',
              page: ContactRoute.page,
            ),
          ],
        ),
      ];
}
