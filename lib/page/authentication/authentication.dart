import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_app/page/authentication/register_page.dart';
import 'package:firebase_app/page/authentication/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';


class AuthenticationPage extends StatefulWidget {
  final String title;

  var logger = Logger(
    printer: PrettyPrinter(),
  );

  AuthenticationPage({Key key, this.title}) : super(key: key) {
    logger.d('AuthenticationPage: $title');
  }

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  String loginStatus;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        loginStatus = 'User is currently signed out!';
        print('User is currently signed out!');
      } else {
        loginStatus = 'User is signed in!';
        print('User is signed in!');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Login Status: '), Text(loginStatus ?? '')]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                RaisedButton(
                  child: Text("Register Page"),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    );
                  },
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                RaisedButton(
                  child: Text("Signin Page"),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) {
                          return SignInPage();
                        },
                      ),
                    );
                  },
                ),
              ])
            ])));
  }
}