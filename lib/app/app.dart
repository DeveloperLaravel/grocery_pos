import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../features/home/presentation/home_page.dart';

class GroceryPosApp extends StatelessWidget {
  const GroceryPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نقطة البيع',
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: const Color(0xfff7f8fa),
        cardTheme: const CardThemeData(margin: EdgeInsets.zero),
      ),
      home: const Directionality(textDirection: TextDirection.rtl, child: HomePage()),
    );
  }
}
