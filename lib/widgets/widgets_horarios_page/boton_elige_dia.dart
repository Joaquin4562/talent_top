import 'package:flutter/material.dart';

class BotonElige extends StatefulWidget {
  @override
  _BotonEligeState createState() => _BotonEligeState();
    static String get dia => _BotonEligeState._diaSeleccionado;
}
class _BotonEligeState extends State<BotonElige> {
  List<String> dias = ['Lunes','Martes','Miercoles','Jueves'];
  static String _diaSeleccionado = "Lunes";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: FlatButton(
        splashColor: Colors.redAccent,
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: Text('Selecciona un dia',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20
                      ),
                      ),
                    children: _mostrarDias(),
                  ));
        },
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Selecciona tu dia',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontFamily: 'Oswaldo'
                ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _mostrarDias() {
    List<Widget> lista = new List();
    for (var item in dias) {
      lista.add(ListTile(
        leading: CircleAvatar(child: Text('${item.substring(0,1)}'),),
        title: Text("$item",style: TextStyle(color: Colors.black,fontSize: 20),),
        onTap: (){
          _diaSeleccionado=item;
          Navigator.of(context).pushReplacementNamed("HorariosPage");
        },
      ));
    }
    return lista;
  }
}
