import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/buttonNewUser.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/logoNew.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newEmail.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newLastname.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newName.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newNumeroC.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/newSemestre.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/password.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/txtRegistrarte.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/userOld.dart';
class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(1,Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.redAccent[100], Colors.blue]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(1,NewLogo()),
                    FadeAnimation(1.1,TxtRegistrate()),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FadeAnimation(1.3,NewNC()),
                    FadeAnimation(1.6,NewSemestre())
                  ],
                ),
                FadeAnimation(1.9,NewNome()),
                FadeAnimation(2.2,NewLastname()),
                FadeAnimation(2.5,NewEmail()),
                FadeAnimation(2.8,PasswordInput()),
                FadeAnimation(3.1,ButtonNewUser()),
                FadeAnimation(3.4,UserOld()),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      )),
    );
  }
}
