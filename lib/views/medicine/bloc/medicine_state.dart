part of 'medicine_bloc.dart';

@immutable
sealed class MedicineState {}

final class MedicineInitial extends MedicineState {}

final class MedicineLoadingState extends MedicineState {}

final class MedicineLoadedState extends MedicineState {
  List<MedicineModel> list;
  MedicineLoadedState(this.list);
}

final class MedicineErrorState extends MedicineState {}
