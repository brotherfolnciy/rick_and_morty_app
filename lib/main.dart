import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/presentation/cubits/planets/planets_cubit.dart';

import 'injection/di.dart';
import 'presentation/stars_background_drawer.dart';
import 'presentation/warp_speed_drawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => PlanetsCubit(),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          constraints: BoxConstraints.expand(),
          alignment: Alignment.center,
          child: Stack(
            children: [
              StarsBackgroundDrawer(),
              WarpSpeedDrawer(),
              Builder(builder: (context) {
                return MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    context.read<PlanetsCubit>().fetchAllPlanets();
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
