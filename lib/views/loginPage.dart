import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/views/homePage.dart';

import '../services/auth/auth_service.dart';
class LoginPage extends StatefulWidget {
   LoginPage({
     super.key,
      required this.onTap,
   });
   final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void Login() async{
    //get instance of auth service
    AuthService _auth = AuthService();
    //try sign in
    try{
      await _auth.signInWithEmailAndPassword(emailController.text, passwordController.text);

    }
    catch(e){
      //show error message
      showDialog(
          context: context,builder: (context)=>AlertDialog(
            title: Text(e.toString()),
          ),

      );
    }

    //navigate to home page


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
            Text('Food Delivery App',
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

            const SizedBox(height: 25),

            //Sign in button
            MyButton(
                onTap: Login,
                text: 'Sign In',
            ),

            const SizedBox(height: 25),

            // not a member? sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member? ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text('Sign Up',
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
