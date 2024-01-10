import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/presentation/tinkok_icons.dart';

part 'home_screen_cubit.freezed.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState());

  void setCurrentTab(HomeScreenTab tab) {
    emit(state.copyWith(
      previousTab: state.currentTab,
      currentTab: tab,
    ));
  }

  void selectAccount(int index) {
    emit(state.copyWith(selectedAccountIndex: index));
  }

  void toggleScrolling(bool scrollingAllowed) {
    emit(state.copyWith(
      scrollingAllowed: scrollingAllowed,
    ));
  }
}
