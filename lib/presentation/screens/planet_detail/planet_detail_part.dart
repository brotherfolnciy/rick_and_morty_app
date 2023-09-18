library planet_detail;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/domain/domain.dart';
import 'package:rick_and_morty_app/presentation/cubits/characters/characters_cubit.dart';
import 'package:rick_and_morty_app/presentation/helpers/helpers_part.dart';
import 'package:rick_and_morty_app/presentation/models/models.dart';
import 'package:rick_and_morty_app/presentation/router/app_router.dart';
import 'package:rick_and_morty_app/presentation/screens/planet_detail/widgets/info_tile.dart';
import 'package:rick_and_morty_app/presentation/screens/widgets/widgets_part.dart';

part 'planet_detail_screen.dart';
