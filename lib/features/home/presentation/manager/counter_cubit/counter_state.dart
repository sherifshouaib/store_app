part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {}

final class CounterIncrement extends CounterState {}

final class CounterDecrement extends CounterState {}
