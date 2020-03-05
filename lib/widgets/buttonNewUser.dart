import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/utils/register_utils.dart';

import 'newEmail.dart';
import 'newEmail.dart';
import 'newLastname.dart';
import 'newLastname.dart';
import 'newName.dart';
import 'newName.dart';
import 'newNumeroC.dart';
import 'newSemestre.dart';
import 'newSemestre.dart';
import 'password.dart';

class ButtonNewUser extends StatefulWidget {
  @override
  _ButtonNewUserState createState() => _ButtonNewUserState();
}

class _ButtonNewUserState extends State<ButtonNewUser> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300],
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FlatButton(
          onPressed: (){
            if (obtenerInfo(
                NewNCState.nc.toUpperCase(), 
                NewSemestreState.newSemestre, 
                NewNomeState.newName, 
                NewLastnameState.newLastName, 
                NewEmailState.newEmail.toLowerCase(), 
                PasswordInputState.password
              )
            ) {
              Navigator.pop(context);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.arrow_forward,
                size: 35,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
