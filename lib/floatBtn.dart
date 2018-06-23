import 'package:flutter/material.dart';

class FloatActBtn extends StatelessWidget {
  FloatActBtn({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
               RotatedBox(quarterTurns: 1,child: Icon(Icons.explore, color: Colors.white,)),
               SizedBox(width: 8.0,),
               Text(
                'PURCHASE',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
