part of 'counter_cubit.dart';

@immutable
class CounterState {
  final int counterValue;
  final bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'],
      wasIncremented: map['wasIncremented'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));

  @override
  String toString() =>
      'CounterState(counterValue: $counterValue, wasIncremented: $wasIncremented)';
}
