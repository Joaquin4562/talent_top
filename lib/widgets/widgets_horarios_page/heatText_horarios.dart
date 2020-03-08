import 'package:flutter/material.dart';

class HeadTextHorarios extends StatelessWidget {
  Color color;
  HeadTextHorarios({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
                    height: 150,
                    width: double.infinity,
                    color: color,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            height: 60,
                            color: color,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 80),
                                  child: Text(
                                  "Crea tu horario",
                                  style: TextStyle(
                                      fontSize: 30, 
                                      color: Colors.white),
                                ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                  "Selecciona tus talleres o conferencias",
                                  style: TextStyle(
                                      fontSize: 18, 
                                      color: Colors.white),
                                ),
                                ),
                              ],
                            )
                            ),
                        Image(
                          image: AssetImage('assets/images/logoCortado.png'),
                          )
                      ],
                    ),
                  );
  }
}