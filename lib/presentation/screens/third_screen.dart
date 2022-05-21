import 'package:bloc_demo/logic/cubit/counter_cubit.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key, required this.title, required this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
        backgroundColor: widget.color,
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
                  backgroundColor: widget.color,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  backgroundColor: widget.color,
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
