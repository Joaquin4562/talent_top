import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:talent_top_v0_1/providers/cursos.dart';

class BotonEligeDiaCompleto extends StatefulWidget {

  @override
  _BotonEligeDiaCompletoState createState() => _BotonEligeDiaCompletoState();

}
class _BotonEligeDiaCompletoState extends State<BotonEligeDiaCompleto> {

  List<String> dias = ['Lunes','Martes','Miércoles','Jueves'];
  Cursos cursosProvider;
  
  @override
  Widget build(BuildContext context) {

    cursosProvider = Provider.of<Cursos>(context);

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
            )
          );
        },
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Selecciona un dia',
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
        title: Text("$item",
          style: TextStyle(color: Colors.black,fontSize: 20),
        ),
        onTap: (){
          cursosProvider.dia = item;
          Navigator.pop(context);
        },
      ));
    }
    return lista;
  }
  
}
