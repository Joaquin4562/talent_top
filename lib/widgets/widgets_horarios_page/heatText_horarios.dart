import 'package:flutter/material.dart';

class HeadTextHorarios extends StatelessWidget {
  Color color;
  double height;
  HeadTextHorarios({this.color,this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width-1,
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
                      fontSize: height < 600 ? 29:30,
                      color: Colors.white,
                      fontFamily: 'Microsoft sans serif'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 22),
                    child: Text(
                      "Selecciona tus talleres o conferencias",
                      style: TextStyle(fontSize: height < 600 || MediaQuery.of(context).size.width < 400  ? 14:16, color: Colors.white),
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
