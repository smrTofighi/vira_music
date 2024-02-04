import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vira_music_app/core/themes/themes.dart';
import 'package:vira_music_app/routes/name.dart';
import 'package:vira_music_app/routes/route.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vira Music',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      getPages: AppRoutes.getPages,
      initialRoute: NamePages.homePage,
    );
  }
}
