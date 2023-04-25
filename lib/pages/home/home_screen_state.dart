part of 'home_screen_cubit.dart';

class HomeScreenState {
  Color appBarColor;
  Color titleColor;
  Color backgroundColorA;
  Color backgroundColorB;
  Color mainTextColor;

  HomeScreenState(this.appBarColor, this.titleColor, this.backgroundColorA,
      this.backgroundColorB, this.mainTextColor);

  static init() => HomeScreenState(Colors.blueAccent, Colors.white,
      Colors.green, Colors.cyan, Colors.white);

  HomeScreenState copyWith({
    Color? appBarColor,
    Color? titleColor,
    Color? backgroundColorA,
    Color? backgroundColorB,
    Color? mainTextColor,
  }) {
    return HomeScreenState(
        appBarColor ?? this.appBarColor,
        titleColor ?? this.titleColor,
        backgroundColorA ?? this.backgroundColorA,
        backgroundColorB ?? this.backgroundColorB,
        mainTextColor ?? this.mainTextColor);
  }
}
