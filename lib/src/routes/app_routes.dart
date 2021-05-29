import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_cubit/src/cubit/counter_cubit.dart';
import 'package:flutter_counter_cubit/src/screens/home.dart';
import 'package:flutter_counter_cubit/src/screens/second_screen.dart';
import 'package:flutter_counter_cubit/src/screens/third_screen.dart';

class AppRouter {
  final _counterCubit = CounterCubit();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(title: 'Home Screen', color: Colors.blue),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(title: 'Second Screen', color: Colors.orange),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdScreen(title: 'Third Screen', color: Colors.amber),
          ),
        );
      default:
        throw Exception();
    }
  }
}
