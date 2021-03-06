import 'package:flutter/material.dart';

import 'package:talent_top_v0_1/class/simple_animation_class.dart';

import 'package:talent_top_v0_1/widgets/widgets_login/botonRecuperar.dart';
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
    double height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FadeAnimation(0.2,Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/cohete.png'),
          fit: BoxFit.cover),
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

                SizedBox(height: 10,),
                Row(children: <Widget>[
                  FadeAnimation(0.7,HeaderText()),
                ]),
                SizedBox(height: height < 600 ? 30:80,),
                FadeAnimation(0.4,TxtEmail()),
                FadeAnimation(0.5,TxtPassword()),
                FadeAnimation(0.6,BtnRecuperar(height)),
                FadeAnimation(0.7,BotonStart(height)),
                FadeAnimation(0.8,BtnRegister(height)),
              ],
              
            ),
          
          ],
        ),
      )),
    );
  }
}


