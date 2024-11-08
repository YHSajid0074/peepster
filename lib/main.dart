import 'package:flutter/material.dart';
import 'package:peepster/Themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'Pages/home_page.dart';
import 'Themes/dark.dart';
import 'Themes/light.dart';
void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>ThemeProvider(),
        child:MyApp()
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
