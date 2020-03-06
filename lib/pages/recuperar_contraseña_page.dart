import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';
import 'package:talent_top_v0_1/widgets/widgets_recuperar_page/boton_recuperar.dart';
import 'package:talent_top_v0_1/widgets/widgets_recuperar_page/header_text_recuperar.dart';
import 'package:talent_top_v0_1/widgets/widgets_recuperar_page/input_numero_control.dart';
import 'package:talent_top_v0_1/widgets/widgets_register_page/logoNew.dart';

class RecuperarPassPage extends StatefulWidget {
  @override
  _RecuperarPassPageState createState() => _RecuperarPassPageState();
}

class _RecuperarPassPageState extends State<RecuperarPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(
          1,
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/cohete.png'),
                  fit: BoxFit.cover),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.lightBlueAccent, Colors.blue[300]]),
            ),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(2,NewLogo()),
                    FadeAnimation(2.2,HeaderTextRecuperar()),
                    FadeAnimation(2.4,Center(heightFactor: 2, child: InputNumeroControl())),
                    FadeAnimation(1,BotonRecuperar()),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
