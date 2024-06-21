import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
import 'package:food_delivery_app/views/homePage.dart';
class RegisterPage extends StatefulWidget {
  RegisterPage({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  //register method
  void register() async{
    //get auth service
    final _auth = AuthService();
    //check if password match
    if(passwordController.text == confirmPasswordController.text){
      try {
        await _auth.signUpWithEmailAndPassword(
            emailController.text,
            passwordController.text,
        );
      }
      catch(e){
       // show error message
        showDialog(
            context: context,
          builder: (context)=>AlertDialog(
            title: Text(e.toString()),
        ),
        );
      }
    }
    //if password does not match, show error message
    else{
      showDialog(
        context: context,
        builder: (context)=>const AlertDialog(
          title: Text("Passwords do not match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.lock_open_rounded,
                size: 72,
                color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 25),
            //message, app slogan
            Text("Let's create an account",
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary)),
            const SizedBox(height: 25),
            //email textfield
            MyTextfield(hintText: 'Email',
              controller: emailController,
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //password Textfield
            MyTextfield(hintText: 'Password',
              controller: passwordController,
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //confirm password Textfield
            MyTextfield(hintText: 'Confirm Password',
              controller: confirmPasswordController,
              obscureText: true,
            ),

            const SizedBox(height: 25),

            //Sign in button
            MyButton(
              onTap: register,
              text: 'Sign Up',
            ),

            const SizedBox(height: 25),

            // Already have an account? Login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text('Sign In',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],),
          ],
        ),
      ),
    );
  }
}
