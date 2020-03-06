import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/widgets/widgets_horarios_page/boton_elige_dia.dart';
import 'package:talent_top_v0_1/widgets/widgets_horarios_page/heatText_horarios.dart';

class HorariosPage extends StatefulWidget {
  HorariosPage({Key key}) : super(key: key);

  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  Color colorFondo = Color.fromRGBO(255, 52, 68, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorFondo,
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                HeadTextHorarios(color: colorFondo,),
                BotonElige()
                ],
            ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 600,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(100)),
                      ),
                      child: ListView(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Card(
                                margin: EdgeInsets.only(left: 20),
                                elevation: 10,
                                child: Container(
                                  height: 50,
                                  width: 380,
                                  child: InkWell(
                                    onTap: (){},
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text('Curso x',
                                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                        ),
                                        Icon(Icons.arrow_forward_ios)
                                      ],
                                    ),
                                  ),
                                )
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
        );
  }
}
