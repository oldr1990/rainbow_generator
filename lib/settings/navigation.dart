import 'package:flutter/material.dart';
import 'package:rainbow_generator/pages/home/home_screen.dart';
import 'package:rainbow_generator/pages/home/home_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic>? Function(RouteSettings)? navigation = (settings) {
  if (settings.name == AppRoutes.home.name) {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider(
          create: (context) => HomeScreenCubit(),
          child:const HomeScreen(),
    );
    });
  }
  return null;
};

enum AppRoutes { home }
