part of 'counter_cubit.dart';

@immutable
class CounterState {
  final int counterValue;
  final bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});
}
