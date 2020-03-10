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

  final enabled = ValueNotifier<bool>(true);

  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  bool _enable=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable:  widget.enabled,
          builder: (context, value, child) {
             return  FadeAnimation(1, Container(
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
                          FadeAnimation(0.5,NewLogo()),
                          FadeAnimation(0.6,TxtRegistrate()),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          FadeAnimation(0.7,NewNC(widget.enabled)),
                          FadeAnimation(0.8,NewSemestre(widget.enabled))
                        ],
                      ),
                      FadeAnimation(0.9,NewNome(widget.enabled)),
                      FadeAnimation(1,NewLastname(widget.enabled)),
                      FadeAnimation(1.1,NewEmail(widget.enabled)),
                      FadeAnimation(1.1,PasswordInput(widget.enabled)),
                      FadeAnimation(1.2,ButtonNewUser(widget.enabled)),
                      FadeAnimation(1.3,UserOld()),
                      SizedBox(height: 10,)
                    ],
                  ),
                ],
              ),
            ));
          },
       ),
    );
  }
  void enableOn(){
    setState(() {
      _enable=false;
    });
  }
}
