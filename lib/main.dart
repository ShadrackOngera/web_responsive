import 'package:flutter/material.dart';
import 'package:web_responsive/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    injectControllers();
    return GetMaterialApp(
      translations: LanguageTranslations(),
      locale: Locale('en', ''),
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        // Locale('sw', ''),
        // Locale('fr', ''),
        // Locale('ru', ''),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MasterLayout(),
    );
  }

  void injectControllers() {
    Get.put(NavigationController());
  }
}
