import 'dart:math';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState.init());
  final _random = Random();

  get _getRandom => _random.nextInt(255);

  void changeBackgroundColor() {
    Color background = _getRandomColor();
    Color mainText = _getTextColor(background);
    emit(
      state.copyWith(
        backgroundColorA: background,
        backgroundColorB: state.backgroundColorA,
        mainColor: mainText,
      ),
    );
  }

  void changeAppbarColor() {
    Color appBar = _getRandomColor();
    Color titleText = _getTextColor(appBar);
    emit(state.copyWith(appBarColor: appBar, titleColor: titleText));
  }

  Color _getRandomColor() =>
      Color.fromARGB(_getRandom, _getRandom, _getRandom, 255);

  Color _getTextColor(Color color) =>
      color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}
