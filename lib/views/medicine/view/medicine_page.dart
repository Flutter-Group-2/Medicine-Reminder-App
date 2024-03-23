import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder_app/utils/colors.dart';
import 'package:medicine_reminder_app/utils/spacing.dart';
import 'package:medicine_reminder_app/views/medicine/bloc/medicine_bloc.dart';
import 'package:medicine_reminder_app/widgets/custom_container_medican.dart';

class MedicineView extends StatelessWidget {
  const MedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => MedicineBloc()..add(MedicineLoadEvent()),
      child: Builder(
        builder: (context) {
          final bloc = BlocProvider.of<MedicineBloc>(context);
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    height20,
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "أدويتي",
                        style: TextStyle(
                            fontSize: 40, color: black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    height10,
                    BlocBuilder<MedicineBloc, MedicineState>(
                      builder: (context, state) {
                        if(state is MedicineLoadingState){
                          return const Center(child: CircularProgressIndicator());
                        }
                        if(state is MedicineLoadedState){
                        
                        return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: state.list.length,
                                            itemBuilder: (context, index) {
                                              return
                                              ContainerMedication(
                                                medicine:state.list[index] ,
                                                isShowState: false,isEditState: true ,
                                              );
                                            });
                      }return Text("data");
                    }),
                  ],
                ),
              ),
            );
        }
      ),
    );
  }
}