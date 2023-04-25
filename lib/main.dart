import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rainbow_generator/settings/localization.dart';
import 'package:rainbow_generator/settings/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rainbow_generator/settings/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: AppRoutes.home.name,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      onGenerateRoute: navigation,
      theme: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? RainbowGeneratorTheme.dark()
          : RainbowGeneratorTheme.light(),
      title: AppLocalizations.of(context)?.title ?? "Rainbow Generator",
    );
  }
}
