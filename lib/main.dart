import 'package:bloc_demo/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                 if(state.wasIncremented ==true){
                   Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Incremented!'),
                      duration: Duration(milliseconds: 400),
                      ));
                    }
                    else{
                      Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Decremented!'),
                      duration: Duration(milliseconds: 400),
                      ));
            }
              },
              builder: (context, state) {
                return BlocBuilder<CounterCubit, CounterState>(
                              builder: (context, state) {
                            if (state.counterValue < 0) {
                              return Text(
                                'NEGATIVE' + state.counterValue.toString(),
                                style: Theme.of(context).textTheme.headline4,
                              );
                            } else if (state.counterValue % 2 == 0) {
                              return Text(
                                'Even' + state.counterValue.toString(),
                                style: Theme.of(context).textTheme.headline4,
                              );
                            } else {
                              return Text(
                                state.counterValue.toString(),
                                style: Theme.of(context).textTheme.headline4,
                              );
                            }
                          });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    //context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
