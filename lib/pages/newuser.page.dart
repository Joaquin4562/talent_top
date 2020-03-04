import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/widgets/buttonNewUser.dart';
import 'package:talent_top_v0_1/widgets/newEmail.dart';
import 'package:talent_top_v0_1/widgets/newLastname.dart';
import 'package:talent_top_v0_1/widgets/newName.dart';
import 'package:talent_top_v0_1/widgets/newNumeroC.dart';
import 'package:talent_top_v0_1/widgets/newSemestre.dart';
import 'package:talent_top_v0_1/widgets/password.dart';
import 'package:talent_top_v0_1/widgets/singup.dart';
import 'package:talent_top_v0_1/widgets/logoNew.dart';
import 'package:talent_top_v0_1/widgets/userOld.dart';
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
                    SingUp(),
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
