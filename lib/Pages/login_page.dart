import 'package:flutter/material.dart';
import 'package:peepster/components/buttons.dart';
import 'package:peepster/components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final TextEditingController emailController=TextEditingController();
  final TextEditingController pwController=TextEditingController();


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

             MyButton(onTap: (){},
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
                    onTap: (){

                    },
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


