import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_location_state.dart';

class ChangeLocationCubit extends Cubit<ChangeLocationState> {
  ChangeLocationCubit() : super(ChangeLocationInitial());

  String title1 = "";
  String subtitle1 = "";

  void changeLocation({String title = "", String subtitle = ""}) {
    title1 = title;
    subtitle1 = subtitle;

    emit(ChangeLocationSucceed());
  }
}
