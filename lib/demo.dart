import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
      runApp(MaterialApp(
        home: demo(),
      ));
}
class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(
          height: 500,
          width: 500,
          // color: Colors.brown,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 10),
              image: DecorationImage(
                  image: AssetImage("img/day_earth_tiny.png"),
                  fit: BoxFit.fill)
          ),
        ),
      ],)
    );
  }
}
