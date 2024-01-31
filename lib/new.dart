import 'dart:js_util';

import 'package:demo_logo_games/logo/first.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
      runApp(MaterialApp(
        home: newfile(),
      ));
}
class newfile extends StatefulWidget {
  // const newfile({super.key});
  static SharedPreferences ?prefs;

  @override
  State<newfile> createState() => _newfileState();
}

class _newfileState extends State<newfile> {

  static int a=20;
  int b=0;
  // int point=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
    // get1();
  }
  get()
  async {
    newfile.prefs = await SharedPreferences.getInstance();
    a=newfile.prefs!.getInt("store") ?? 20;
    setState(() { });
  }
  // get1()
  // {
  //   int b=newfile.prefs!.getInt("store") ?? a;
  //   setState(() { });
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("${a}",style: TextStyle(fontSize: 35),),
          ElevatedButton(onPressed: () {
            a=a-1;
            // newfile.prefs!.setInt("store", a);
            print("a=${a}");
            // print("b=${newfile.prefs!.setInt("store", a)}");
            setState(() { });
          }, child: Text("one letter")),
          ElevatedButton(onPressed: () {
            a=a-2;
            print("a=${a}");
            setState(() { });
          }, child: Text("two letter")),
          ElevatedButton(onPressed: () {
            newfile.prefs!.setInt("store", a);
            print("next a=${a}");
            setState(() { });
          }, child: Text("next"))
        ],
      ),
    );
  }
}
