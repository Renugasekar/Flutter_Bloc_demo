import 'package:bloc_demo/logic/cubit/counter_cubit.dart';
import 'package:bloc_demo/presentation/screens/home_screen.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:bloc_demo/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter{
final CounterCubit _counterCubit =CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings){
  switch (routeSettings.name) {
    case '/' :
      return MaterialPageRoute(
        builder: (_)=>BlocProvider.value(
          value:_counterCubit,
          child: MyHomePage(title: 'Home Screen', color: Colors.deepPurple)));
      break;
    case '/second':
      return MaterialPageRoute(builder: (_)=>BlocProvider.value(
          value:_counterCubit,
          child:SecondPage(title: 'Second Screen', color: Colors.amber)));
      break;
      case '/third':
      return MaterialPageRoute(builder: (_)=>BlocProvider.value(
          value:_counterCubit,
          child:ThirdPage(title: 'Third Screen', color: Colors.pink)));
      break;
    default:
    return null;
  }
}
@override
  void dispose() {
    _counterCubit.close();
  }
}