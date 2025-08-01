part of 'change_location_cubit.dart';

sealed class ChangeLocationState extends Equatable {
  const ChangeLocationState();

  @override
  List<Object> get props => [];
}

final class ChangeLocationInitial extends ChangeLocationState {}

final class ChangeLocationSucceed extends ChangeLocationState {}






