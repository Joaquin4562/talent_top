import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';
import 'package:talent_top_v0_1/widgets/widgets_horario_completo/HeadTextHorarioCompleto.dart';
import 'package:talent_top_v0_1/widgets/widgets_horario_completo/boton_elige_dia_completo.dart';
import 'package:talent_top_v0_1/widgets/widgets_horario_completo/lista_cursos_completo.dart';
import 'package:talent_top_v0_1/widgets/widgets_horarios_page/dia_text.dart';

class HorarioCompletoPage extends StatefulWidget {
  HorarioCompletoPage({Key key}) : super(key: key);

  @override
  _HorarioCompletoPageState createState() => _HorarioCompletoPageState();
}

class _HorarioCompletoPageState extends State<HorarioCompletoPage> {
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
                HeadTextHorarioCompleto(
                  color: colorFondo,
                  height: height,
                )
              ),
              BotonEligeDiaCompleto()
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
                    ListaCursosCompleto(),
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