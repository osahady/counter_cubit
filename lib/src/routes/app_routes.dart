import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_cubit/src/cubit/counter_cubit.dart';
import 'package:flutter_counter_cubit/src/cubit/settings_cubit/settings_cubit.dart';
import 'package:flutter_counter_cubit/src/screens/home.dart';
import 'package:flutter_counter_cubit/src/screens/second_screen.dart';
import 'package:flutter_counter_cubit/src/screens/settings.dart';
import 'package:flutter_counter_cubit/src/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) =>
              HomeScreen(title: 'Home Screen', color: Colors.blue),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) =>
              SecondScreen(title: 'Second Screen', color: Colors.orange),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) =>
              ThirdScreen(title: 'Third Screen', color: Colors.amber),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => SettingsCubit(),
              child: AppSettings(),
            );
          },
        );
      default:
        throw Exception();
    }
  }
}
