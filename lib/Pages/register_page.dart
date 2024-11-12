import 'package:flutter/material.dart';
import 'package:peepster/components/loading_circle.dart';
import 'package:peepster/services/auth/auth_service.dart';
import 'package:peepster/services/database/database_service.dart';

import '../components/buttons.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function( )? onTap;
  const RegisterPage({super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _auth=AuthService();
  final _db=DatabaseService();

  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController pwController=TextEditingController();
  final TextEditingController confirmPwController=TextEditingController();

  void register()async{
    if(pwController.text == confirmPwController.text) {
      showLoadingCircle(context);
      try {
        await _auth.registerEmailPassword(
            emailController.text,
            pwController.text
        );
        if (mounted) hideLoadingCircle(context);


        await _db.saveUserInfoInFirebase(name: nameController.text, email: emailController.text);


      } catch (e) {
        if (mounted) hideLoadingCircle(context);
        if (mounted) {
          showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    title: Text(e.toString())
                    ,
                  )
          );
        }
      }
    }else{
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text("password dont match"),
              )
      );
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              SafeArea(
                child: Center(
                  child: Icon(
                    Icons.lock_open_rounded,
                    size:72,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Text("Let's create an account for you",
                style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16),
              ),

              SizedBox(height: 25,),

              MyTextField(controller: nameController,
                  hintText: 'Enter name',
                  obscureText:false
              ),

              SizedBox(height: 10,),

              MyTextField(controller: emailController,
                  hintText: 'Enter your email..',
                  obscureText:false
              ),

              SizedBox(height: 10,),
              MyTextField(controller: pwController,
                  hintText: 'Enter password',
                  obscureText:true),
              SizedBox(height: 10,),
              MyTextField(controller: confirmPwController,
                  hintText: 'Confirm password',
                  obscureText:true
              ),

              SizedBox(height: 25,),

              MyButton(onTap:register,
                text:'Register now',
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a member?',style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(' Login now',style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}