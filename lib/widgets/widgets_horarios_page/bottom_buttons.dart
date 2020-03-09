import 'package:flutter/material.dart';

class BottomButtons extends StatefulWidget {
  BottomButtons({Key key}) : super(key: key);

  @override
  _BottomButtonsState createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
    Color colorFondo = Color.fromRGBO(255, 52, 68, 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Aun te falta!',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Oswaldo',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(color: Colors.transparent),
            child: InkWell(
              child: OutlineButton(
                  borderSide: BorderSide(
                      color: colorFondo, style: BorderStyle.solid, width: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Limpiar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
            ),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: colorFondo),
            child: InkWell(
              child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Confirmar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
