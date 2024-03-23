import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medicine_reminder_app/model/medicine_model.dart';
import 'package:medicine_reminder_app/service/supabase_services.dart';
import 'package:medicine_reminder_app/views/medicine/view/add_medication_page.dart';
import 'package:meta/meta.dart';

part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final locator = GetIt.I.get<DBServices>();
  List<MedicineModel> listOfMedicine = [];

  MedicineBloc() : super(MedicineInitial()) {
    on<MedicineEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MedicineLoadEvent>(
      (event, emit) async {
        emit(MedicineLoadingState());

        listOfMedicine = await locator.getAllMedicine();
        emit(MedicineLoadingState());

        emit(MedicineLoadedState(listOfMedicine));
      },
    );

    on<MedicineAdded>(
      (event, emit) async {
         if(event.medicine.name!.trim().isNotEmpty){
        try {

        await locator.insertMediationData(event.medicine);
         
         }   catch (e) {
          print(e);
        }
        emit(MedicineLoadedState(listOfMedicine));
      }});

    on<MedicineUpdated>(
      (event, emit) async {
        if(event.medicine.name!.trim().isNotEmpty){
        try {
          await locator.upDateMediationData(event.medicine, event.id!);
          emit(MedicineLoadingState());
        } catch (e) {
          print(e);
        } }
        emit(MedicineLoadedState(listOfMedicine));
      },
    );
    on<MedicineDeleted>(
      (event, emit) async {
        await locator.deleteMediationData(event.medicine.id!);
        emit(MedicineLoadedState(listOfMedicine));
      },
    );
  }
}
