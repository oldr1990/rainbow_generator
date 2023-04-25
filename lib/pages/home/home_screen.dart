import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rainbow_generator/pages/home/home_screen_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAnimationAlignment;
  late Animation<Alignment> _bottomAnimationAlignment;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _topAnimationAlignment = TweenSequence<Alignment>([
      TweenSequenceItem(
        tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.topRight, end: Alignment.bottomRight),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.bottomLeft, end: Alignment.topLeft),
        weight: 1,
      ),
    ]).animate(_controller);
    _bottomAnimationAlignment = TweenSequence<Alignment>([
      TweenSequenceItem(
        tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.bottomLeft, end: Alignment.topLeft),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(begin: Alignment.topRight, end: Alignment.bottomRight),
        weight: 1,
      ),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (cubit, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: state.appBarColor,
            title: TextButton(
              onPressed: () {
                cubit.read<HomeScreenCubit>().changeAppbarColor();
              },
              child: Text(
                AppLocalizations.of(context)!.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: state.titleColor),
              ),
            ),
          ),
          body: GestureDetector(
              onTap: () {
                cubit.read<HomeScreenCubit>().changeBackgroundColor();
              },
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    return Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            state.backgroundColorA,
                            state.backgroundColorB
                          ],
                              begin: _topAnimationAlignment.value,
                              end: _bottomAnimationAlignment.value)),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.welcome_message,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: state.mainColor),
                        ),
                      ),
                    );
                  })),
        );
      },
    );
  }
}
