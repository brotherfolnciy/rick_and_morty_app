import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/presentation/router/app_router.dart';

import 'injection/di.dart';

final _appRouter = AppRouter();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
