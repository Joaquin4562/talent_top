import 'package:flutter/material.dart';

import 'package:talent_top_v0_1/class/simple_animation_class.dart';

import 'package:talent_top_v0_1/widgets/widgets_horarios_page/boton_elige_dia.dart';
import 'package:talent_top_v0_1/widgets/widgets_horarios_page/bottom_buttons.dart';
import 'package:talent_top_v0_1/widgets/widgets_horarios_page/dia_text.dart';
import 'package:talent_top_v0_1/widgets/widgets_horarios_page/heatText_horarios.dart';
import 'package:talent_top_v0_1/widgets/widgets_horarios_page/lista_cursos.dart';

class HorariosPage extends StatefulWidget {
  
  @override
  _HorariosPageState createState() => _HorariosPageState();
  
}

class _HorariosPageState extends State<HorariosPage> {

  Color colorFondo = Color.fromRGBO(255, 52, 68, 1);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorFondo,
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              FadeAnimation( 0.3,
                HeadTextHorarios(
                  color: colorFondo,
                  height: height,
                )
              ),
              BotonElige()
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 198,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation( 0.5, DiaText() ),
                    ListaCursos(),
                    FadeAnimation( 0.6, BottomButtons() ),
                  ],
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}
