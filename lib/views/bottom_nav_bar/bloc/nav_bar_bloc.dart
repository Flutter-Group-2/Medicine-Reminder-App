import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/views/add_medication_page.dart';
import 'package:medicine_reminder_app/views/ai_chat/view/chat_page.dart';
import 'package:medicine_reminder_app/views/home_page.dart';
import 'package:medicine_reminder_app/views/medicine_page.dart';
import 'package:medicine_reminder_app/views/qr_barcode/scan_code_page.dart';
import 'package:meta/meta.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  List<Widget> pages = <Widget>[
    HomeView(),
    MedicineView(),
    AddMedicationPage(),
    ChatPage(),
    ScanView()
  ];

  int selectIndex = 0;
  NavBarBloc() : super(NavBarInitial()) {
    on<NavBarEvent>((event, emit) {});
    on<ChangeIndexEvent>(ChangeIndex);
  }

  FutureOr<void> ChangeIndex(
      ChangeIndexEvent event, Emitter<NavBarState> emit) {
    selectIndex = event.index;
    emit(SuccessChangeIndex());
  }
}
