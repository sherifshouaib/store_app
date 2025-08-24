import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'change_location_state.dart';

class ChangeLocationCubit extends Cubit<ChangeLocationState> {
  ChangeLocationCubit() : super(ChangeLocationInitial());

  Future<void> changeLocation({
    required String uid,
    required String title,
    required String subtitle,
  }) async {
    emit(ChangeLocationLoading());
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("order")
          .doc("orderlocation")
          .set({
        "title": title,
        "subtitle": subtitle,
      }, SetOptions(merge: true));

      emit(ChangeLocationSucceed(title: title, subtitle: subtitle));
    } catch (e) {
      emit(ChangeLocationFailure("Failed to update location: $e"));
    }
  }

  Future<void> loadLocation(String uid) async {
    emit(ChangeLocationLoading());
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("order")
          .doc("orderlocation")
          .get();

      if (snapshot.exists) {
        final data = snapshot.data()!;
        final title = data['title'] ?? "";
        final subtitle = data['subtitle'] ?? "";

        emit(ChangeLocationSucceed(title: title, subtitle: subtitle));
      } else {
        emit(ChangeLocationInitial());
      }
    } catch (e) {
      emit(ChangeLocationFailure("Failed to load location: $e"));
    }
  }
}