import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'presentation/page/MainScreenWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(
          supportedLocales: const [Locale('en', ''), Locale('hu', '')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en', ''),
          startLocale: const Locale('hu'),
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: const Locale("hu", ""),
      scrollBehavior: const MaterialScrollBehavior().copyWith( // for Win
        dragDevices: {ui.PointerDeviceKind.mouse, ui.PointerDeviceKind.touch, ui.PointerDeviceKind.stylus, ui.PointerDeviceKind.unknown},
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MainScreenWidget(),
    );
  }
}

