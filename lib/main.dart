import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home:Home() ,));
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("myassets/main_background_bottom_logos.png")))),
    );
  }
}
