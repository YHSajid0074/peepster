
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peepster/Pages/login_page.dart';
import 'package:peepster/Themes/theme_provider.dart';
import 'package:peepster/services/auth/auth_get.dart';

import 'package:peepster/services/auth/login_or_register.dart';
import 'package:provider/provider.dart';
import 'Pages/home_page.dart';
import 'Pages/register_page.dart';
import 'Themes/dark.dart';
import 'Themes/light.dart';
import 'firebase_options.dart';
void main() async{

  // firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      home: const AuthGet(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}