part of 'medicine_bloc.dart';

@immutable
sealed class MedicineEvent {}
class MedicineLoadEvent extends MedicineEvent {}

class MedicineAdded extends MedicineEvent {
  final MedicineModel medicine;

  MedicineAdded(this.medicine);
}

class MedicineDeleted extends MedicineEvent {
  final MedicineModel medicine;

  MedicineDeleted(this.medicine);

}

class MedicineUpdated extends MedicineEvent {
  final MedicineModel medicine;
  final String id;
  MedicineUpdated(this.medicine,this.id);
}
// class MedicineChangeState extends MedicineEvent {
//   final MedicineModel medicine;
//   final String id;
//   MedicineUpdated(this.medicine,this.id);
// }