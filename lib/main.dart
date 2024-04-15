import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/providers/theme_provider.dart';
import 'package:utip/providers/tip_calulator_model.dart';
import 'package:utip/screen/utip.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => TipCalulatorModel()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'uTip App',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: UTip(),
    );
  }
}
