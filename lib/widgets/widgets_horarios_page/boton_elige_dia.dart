import 'package:flutter/material.dart';
class BotonElige extends StatefulWidget {
  @override
  _BotonEligeState createState() => _BotonEligeState();
}

class _BotonEligeState extends State<BotonElige> {
    static const menuItems = <String>[
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItem = menuItems.map(
    (String value)=>DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  ).toList();
  String _selectedVal;
  @override
  Widget build(BuildContext context) {
    return InkWell(  
                    child: FlatButton(
                      splashColor: Colors.redAccent,
                      onPressed: () {   
                        showBottomSheet<String>(
                          context: context,
                          builder: (BuildContext context)=>Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(top:BorderSide(color:Colors.black12)),
                            ),
                            child: ListView(
                              shrinkWrap: true,
                              primary: false,
                              children: <Widget>[
                                InkWell(
                                  onTap: ()=>Navigator.pop(context),
                                  child: Text('Lunes'),
                                ),
                                InkWell(
                                  onTap: ()=>Navigator.pop(context),
                                  child: Text('Martes'),
                                ),InkWell(
                                  onTap: ()=>Navigator.pop(context),
                                  child: Text('Miercoles'),
                                )
                              ],
                            ),
                          ));
                      },
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Elige tu dia',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.white,size: 20,)
                        ],
                      ),
                    ),
                  );
  }
}