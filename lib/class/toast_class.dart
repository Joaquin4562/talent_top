import 'package:flutter/material.dart';

class ToastClass extends StatelessWidget {
  String text;
  IconData icon;
  ToastClass({this.text,this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      height: 40,
      width: 20 * text.length.toDouble(),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 10.0, offset: Offset(0.0, 1.0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('$text',
              style: TextStyle(fontSize: 20, color: Colors.black)),
          Icon(
            icon,
            color: Colors.black,
            size: 20,
          )
        ],
      ),
    );
  }
}