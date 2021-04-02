import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

abstract class CounterState {}

class ResultCounterState extends CounterState {
  final int counter;

  ResultCounterState(this.counter);
}

class DecrementCounterBloc extends Bloc<CounterEvent, CounterState> {
  static final int initialValue = 50;
  int counter = initialValue;

  DecrementCounterBloc() : super(ResultCounterState(initialValue));

  void decrementCounter() {
    add(DecrementCounterEvent());
  }

  void incrementCounter() {
    add(IncrementCounterEvent());
  }

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is DecrementCounterEvent) {
      yield ResultCounterState(--counter);
    }
    if (event is IncrementCounterEvent) {
      yield ResultCounterState(counter++);
    }
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DecrementCounterBloc>(
      create: (_) => DecrementCounterBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Text('HELLO WORLD'),
            BlocBuilder<DecrementCounterBloc, CounterState>(
              buildWhen: (_, CounterState newState) {
                if (newState is ResultCounterState) {
                  return newState.counter % 2 == 0;
                } else {
                  return false;
                }
              },
              builder: (BuildContext context, CounterState state) {
                if (state is ResultCounterState) {
                  return Text(state.counter.toString());
                } else {
                  return const SizedBox();
                }
              },
            ),
            Text('pins'),
            Builder(builder: (BuildContext context) {
              return TextButton(
                  onPressed: () {
                    BlocProvider.of<DecrementCounterBloc>(context)
                        .decrementCounter();
                  },
                  child: Text('diminuer -'));
            }),
            Builder(builder: (BuildContext context) {
              return TextButton(
                  onPressed: () {
                    BlocProvider.of<DecrementCounterBloc>(context)
                        .incrementCounter();
                  },
                  child: Text('add +'));
            }),
          ],
        ),
      ),
    );
  }
}
