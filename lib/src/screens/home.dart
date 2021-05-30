import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_cubit/src/constants/enums.dart';
import 'package:flutter_counter_cubit/src/cubit/counter_cubit.dart';
import 'package:flutter_counter_cubit/src/cubit/internetCubit/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // return BlocListener<InternetCubit, InternetState>(
    //   listener: (context, state) {
    //     if (state is InternetConnected &&
    //         state.connectionType == ConnectionType.wifi) {
    //       context.read<CounterCubit>().increment();
    //     } else if (state is InternetConnected &&
    //         state.connectionType == ConnectionType.mobile) {
    //       context.read<CounterCubit>().decrement();
    //     }
    //   },
    //   child:
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
              }),
        ],
        title: Text(title),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text('wifi');
                }
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return Text('mobile');
                }
                if (state is InternetDisconnected) {
                  return Text('disconnected');
                }
                return CircularProgressIndicator();
              },
            ),
            Builder(builder: (context) {
              final counterValue = context
                  .select((CounterCubit cubit) => cubit.state.counterValue);
              return Text('hello watch: $counterValue');
            }),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Second'),
            ),
            Text(
              'Home timesss:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Counter incremented'),
                      ),
                    );
                } else {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(content: Text('Counter Decremented')),
                    );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: Key('home_counter_increment'),
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 15),
          FloatingActionButton(
            key: Key('home_counter_decrement'),
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            tooltip: 'decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
    // );
  }
}
