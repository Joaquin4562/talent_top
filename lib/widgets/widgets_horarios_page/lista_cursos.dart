import 'package:flutter/material.dart';
import 'package:talent_top_v0_1/class/simple_animation_class.dart';

class ListaCursos extends StatefulWidget {
  ListaCursos({Key key}) : super(key: key);

  @override
  _ListaCursosState createState() => _ListaCursosState();
}

class _ListaCursosState extends State<ListaCursos> {
  List<String> cursos = [
    'Curso de ser guapo',
  ];
    Color colorFondo = Color.fromRGBO(255, 52, 68, 1);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: _mostrarCursos(),
      ),
    );
     
  }
  List<Widget> _mostrarCursos() {
    List<Widget> lista = new List();
    for (var item in cursos) {
      lista.add(ListTile(
        trailing:Icon(Icons.arrow_forward_ios,color:colorFondo,),
        leading:CircleAvatar(
          child: Text('jc'),
        ),
        title: Text("$item",style: TextStyle(color: Colors.black,fontSize: 20),),
        onTap: (){
          Navigator.of(context).pushReplacementNamed("HorariosPage");
        },
      ));
    }
    return lista;
  }
}
