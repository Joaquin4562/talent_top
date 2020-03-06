import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';
import 'package:talent_top_v0_1/widgets/widgets_login/botonStart.dart';
import 'package:talent_top_v0_1/widgets/widgets_login/botonRegister.dart';
import 'package:talent_top_v0_1/widgets/widgets_login/txtEmail.dart';
import 'package:talent_top_v0_1/widgets/widgets_login/txtPassword.dart';
import 'package:talent_top_v0_1/widgets/widgets_login/headerText.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(1,Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/cohete.png'), fit: BoxFit.fill),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]
              ),
        ),
        
        child: ListView(
          children: <Widget>[
              Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Row(children: <Widget>[
                  FadeAnimation(2,HeaderText()),
                ]),
                SizedBox(height: 80,),
                FadeAnimation(2,TxtEmail()),
                FadeAnimation(2.3,TxtPassword()),
                FadeAnimation(2.4,BotonStart()),
                FadeAnimation(2.5,BtnRegister()),
              ],
            ),
          ],
        ),
      )),
    );
  }
}


