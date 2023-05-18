import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/button_list.dart';
import '../firebase/auth.dart';
import 'package:my_project/home.dart';
import 'package:my_project/history.dart';


class Login extends StatelessWidget {
  static const String id = 'Login';
  Login({Key? key}) : super(key:key);
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
          elevation: 0,
          title: const Text('Login!'),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                Buttons.Google,
                onPressed: ()async{
                  bool result = await _authMethods.signInWithGoogle();
                  if(result){
                    Navigator.of(context).pushNamed(MyHome.id);
                  }
                },),

            ],
          ),
        ) ,
      ),
    );
  }
}