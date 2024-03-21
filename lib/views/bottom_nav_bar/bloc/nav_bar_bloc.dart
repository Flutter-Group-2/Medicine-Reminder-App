import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medicine_reminder_app/views/home_page.dart';
import 'package:meta/meta.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  List<Widget> pages = <Widget>[
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView()
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
