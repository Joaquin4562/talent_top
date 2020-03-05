import 'package:talent_top_v0_1/widgets/button.dart';
import 'package:talent_top_v0_1/widgets/first.dart';
import 'package:talent_top_v0_1/widgets/inputEmail.dart';
import 'package:talent_top_v0_1/widgets/password.dart';
import 'package:talent_top_v0_1/widgets/verticalText.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                ]),
                SizedBox(height: 40,),
                InputEmail(),
                PasswordInput(),
                ButtonLogin(),
                FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


