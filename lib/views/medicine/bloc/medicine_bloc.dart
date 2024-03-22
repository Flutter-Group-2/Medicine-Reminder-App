import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medicine_reminder_app/model/medicine_model.dart';
import 'package:medicine_reminder_app/service/supabase_services.dart';
import 'package:meta/meta.dart';

part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final locator = GetIt.I.get<DBServices>();
  List<MedicineModel> listOfMedicine = [];

  MedicineBloc() : super(MedicineInitial()) {
    on<MedicineEvent>((event, emit) {});

    on<MedicineLoadEvent>(
      (event, emit) async {
        emit(MedicineLoadingState());

        listOfMedicine = await locator.getAllMedicine();
        emit(MedicineLoadedState(listOfMedicine));
      },
    );
  }
}
