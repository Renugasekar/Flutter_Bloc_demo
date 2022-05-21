import 'package:bloc_demo/logic/cubit/counter_cubit.dart';
import 'package:bloc_demo/presentation/router/app_router.dart';
import 'package:bloc_demo/presentation/screens/home_screen.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:bloc_demo/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
final AppRouter _appRouter =AppRouter();
class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit=CounterCubit();
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}

