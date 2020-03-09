import 'package:flutter/material.dart';

class HeadTextHorarios extends StatelessWidget {
  Color color;
  HeadTextHorarios({this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
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
                    margin: EdgeInsets.only(right: 50),
                    child: Text(
                      "Crea tu horario",
                      style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Microsoft sans serif'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      "Selecciona tus talleres o conferencias",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              )),
          Image(
            alignment: Alignment.centerRight,
            image: AssetImage('assets/images/logoCortado.png'),
          )
        ],
      ),
    );
  }
}
