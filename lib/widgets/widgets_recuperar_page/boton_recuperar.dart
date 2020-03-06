import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/class/toast_class.dart';

class BotonRecuperar extends StatefulWidget {
  @override
  _BotonRecuperarState createState() => _BotonRecuperarState();
}

class _BotonRecuperarState extends State<BotonRecuperar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 250),
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300],
              blurRadius: 6.0, // has the effect of softening the shadow
              spreadRadius: 0.0, // has the effect of extending the shadow
              offset: Offset(
                1.0, // horizontal, move right 10
                1.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: () {
            ///ToastPersonalizables
            showToastWidget(
                ToastClass(icon: Icons.send,text: "mensaje enviado",),
                duration: Duration(seconds: 2),
                curve: Curves.easeOutBack,
                textDirection: TextDirection.ltr,
                alignment: Alignment.center,
                context: context,
                position: StyledToastPosition.bottom,
                animation: StyledToastAnimation.fadeScale);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.arrow_forward,
                size: 30,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
