// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CharacterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CharacterDetailsScreen(
          character: args.character,
          key: args.key,
        ),
      );
    },
    ContactRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteScreen(),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeNavigationScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    NavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavigationScreen(),
      );
    },
    PlanetDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PlanetDetailRouteArgs>(
          orElse: () => const PlanetDetailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlanetDetailScreen(
          key: args.key,
          planet: args.planet,
        ),
      );
    },
    PreHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PreHomeScreen(),
      );
    },
  };
}

/// generated route for
/// [CharacterDetailsScreen]
class CharacterDetailsRoute extends PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({
    required Character character,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CharacterDetailsRoute.name,
          args: CharacterDetailsRouteArgs(
            character: character,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDetailsRoute';

  static const PageInfo<CharacterDetailsRouteArgs> page =
      PageInfo<CharacterDetailsRouteArgs>(name);
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({
    required this.character,
    this.key,
  });

  final Character character;

  final Key? key;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{character: $character, key: $key}';
  }
}

/// generated route for
/// [ContactScreen]
class ContactRoute extends PageRouteInfo<void> {
  const ContactRoute({List<PageRouteInfo>? children})
      : super(
          ContactRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteScreen]
class FavoriteRoute extends PageRouteInfo<void> {
  const FavoriteRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeNavigationScreen]
class HomeNavigationRoute extends PageRouteInfo<void> {
  const HomeNavigationRoute({List<PageRouteInfo>? children})
      : super(
          HomeNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NavigationScreen]
class NavigationRoute extends PageRouteInfo<void> {
  const NavigationRoute({List<PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlanetDetailScreen]
class PlanetDetailRoute extends PageRouteInfo<PlanetDetailRouteArgs> {
  PlanetDetailRoute({
    Key? key,
    (Location, PlanetShape)? planet,
    List<PageRouteInfo>? children,
  }) : super(
          PlanetDetailRoute.name,
          args: PlanetDetailRouteArgs(
            key: key,
            planet: planet,
          ),
          initialChildren: children,
        );

  static const String name = 'PlanetDetailRoute';

  static const PageInfo<PlanetDetailRouteArgs> page =
      PageInfo<PlanetDetailRouteArgs>(name);
}

class PlanetDetailRouteArgs {
  const PlanetDetailRouteArgs({
    this.key,
    this.planet,
  });

  final Key? key;

  final (Location, PlanetShape)? planet;

  @override
  String toString() {
    return 'PlanetDetailRouteArgs{key: $key, planet: $planet}';
  }
}

/// generated route for
/// [PreHomeScreen]
class PreHomeRoute extends PageRouteInfo<void> {
  const PreHomeRoute({List<PageRouteInfo>? children})
      : super(
          PreHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
