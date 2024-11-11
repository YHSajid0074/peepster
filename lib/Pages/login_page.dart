import 'package:flutter/material.dart';
import 'package:peepster/components/buttons.dart';
import 'package:peepster/components/loading_circle.dart';
import 'package:peepster/components/text_field.dart';
import 'package:peepster/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {

  final void Function( )? onTap;

  const LoginPage({super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth=AuthService();
  @override
  final TextEditingController emailController=TextEditingController();
  final TextEditingController pwController=TextEditingController();

  void login()async{
    showLoadingCircle(context);
    try{
      await _auth.loginEmailPassword(emailController.text, pwController.text);
     if(mounted) hideLoadingCircle(context);
    }catch(e){
      if(mounted) hideLoadingCircle(context);
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text(e.toString()),
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
              Text('Welcome back, you\'ve been missed!',
                style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 16),
              ),
              SizedBox(height: 25,),
              MyTextField(controller: emailController,
                  hintText: 'Enter your email..',
                  obscureText:false),
              SizedBox(height: 10,),
              MyTextField(controller: pwController,
                  hintText: 'Enter password',
                  obscureText:true
              ),

              SizedBox(height: 10,),

              Align(
                  alignment: Alignment.centerRight,
                  child: Text("Forgot Password?",style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),)
              ),


              SizedBox(height: 25,),

              MyButton(onTap: login,
                text:'Login',
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(' Register now',style: TextStyle(
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


