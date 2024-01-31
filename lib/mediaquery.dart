import 'package:demo_logo_games/demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(
      home: demo1(),debugShowCheckedModeBanner: false,
    ));
}
class demo1 extends StatefulWidget {
  const demo1({super.key});

  @override
  State<demo1> createState() => _demo1State();
}

class _demo1State extends State<demo1> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double status_bar = MediaQuery.of(context).padding.top;
    double app_bar = kToolbarHeight;
    double total = height-status_bar-app_bar;
    double font_size = total*0.05;

    return Scaffold(
      appBar: AppBar(
        title: Text("MEDIA QUERY"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade300,
      ),
      body: Column(children: [
         Container(
           height: total/2,
           width: width,
           alignment: Alignment.center,
           color: Colors.brown.shade900,
           child: Text("HELLO",style: TextStyle(fontSize: font_size,)),
         ),
         Container(
            height: total/2,
            width: width,
            alignment: Alignment.center,
            color: Colors.brown,
            child: Text("HELLO",style: TextStyle(fontSize: font_size,)),
          ),
      ]),
    );
  }
}
