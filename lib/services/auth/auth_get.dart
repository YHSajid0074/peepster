import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peepster/Pages/home_page.dart';
import 'package:peepster/Pages/register_page.dart';
import 'package:peepster/services/auth/login_or_register.dart';


class AuthGet extends StatelessWidget {
  const AuthGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream:FirebaseAuth.instance.authStateChanges(),
          builder:(context,snapshot){
            if(snapshot.hasData){
              return const HomePage();
            }else{
              return const LoginOrRegister();
            }
          }
      ),
    );
  }
}
