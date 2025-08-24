part of 'change_location_cubit.dart';

sealed class ChangeLocationState extends Equatable {
  const ChangeLocationState();

  @override
  List<Object?> get props => [];
}

final class ChangeLocationInitial extends ChangeLocationState {}

final class ChangeLocationLoading extends ChangeLocationState {}

final class ChangeLocationSucceed extends ChangeLocationState {
  final String title;
  final String subtitle;

  const ChangeLocationSucceed({required this.title, required this.subtitle});

  @override
  List<Object?> get props => [title, subtitle];
}

final class ChangeLocationFailure extends ChangeLocationState {
  final String errorMessage;

  const ChangeLocationFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}