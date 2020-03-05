import 'package:flutter/material.dart';
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
      body: Container(
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
                    NewLogo(),
                    TxtRegistrate(),
                  ],
                ),
                Row(
                  children: <Widget>[
                    NewNC(),
                    NewSemestre()
                  ],
                ),
                NewNome(),
                NewLastname(),
                NewEmail(),
                PasswordInput(),
                ButtonNewUser(),
                UserOld(),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
