import 'package:flutter/material.dart';

import '../components/buttons.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController pwController=TextEditingController();
  final TextEditingController confirmPwController=TextEditingController();


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
                  obscureText:true
              ),

              SizedBox(height: 10,),

              MyTextField(controller: emailController,
                  hintText: 'Enter your email..',
                  obscureText:true
              ),

              SizedBox(height: 10,),
              MyTextField(controller: pwController,
                  hintText: 'Enter password',
                  obscureText:false),
              SizedBox(height: 10,),
              MyTextField(controller: confirmPwController,
                  hintText: 'Confirm password',
                  obscureText:true
              ),

              SizedBox(height: 25,),

              MyButton(onTap: (){},
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
                    onTap: (){

                    },
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
