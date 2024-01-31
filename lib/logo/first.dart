import 'package:demo_logo_games/logo/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
    runApp(MaterialApp(
       debugShowCheckedModeBanner: false,
       home: first(),
    ));
}
class first extends StatefulWidget {
  // const first({super.key});
  static SharedPreferences? prefs;

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  bool temp1=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    share();
  }

  share()
  async {
    first.prefs = await SharedPreferences.getInstance();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              // image: DecorationImage(image: AssetImage("img/main_background_top_logos.png"))
            ),
            child: Column(children: [
              Expanded(flex: 2,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  // color: Colors.amberAccent,
                  child: Row(children: [
                    Expanded(flex: 1,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // color: Colors.brown,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("img/main_background_top_logos.png"),
                          )
                        ),
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          // color: Colors.blue,
                          padding: EdgeInsets.fromLTRB(10, 30, 5, 10),
                          // alignment: Alignment.centerLeft,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
                            Text("LOGO GAME",style: TextStyle(fontSize: 40,wordSpacing: 1.5)),
                            Text("Quiz your brands Knowledge",style: TextStyle(fontSize: 20,letterSpacing: 0.5)),
                          ]),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(flex: 7,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  // color: Colors.deepPurpleAccent,
                  child: Column(children: [
                    Expanded(
                      child: Stack(alignment: Alignment.topRight,children: [
                        GestureDetector(
                          onTapUp: (details)
                          {
                            print("hello");
                            temp1=false;
                            setState(() { });
                          },
                          onTapCancel: ()
                          {
                            print("hi..");
                            temp1=false;
                            setState(() { });
                          },
                          onTapDown: (details)
                          {
                            print("how are you");
                            temp1=true;
                            setState(() { });
                          },
                          child: InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return second();
                            },));
                          },
                            child: (temp1==true)?Container(
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(90, 10, 90, 10),
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("img/main_button_play_clicked.png"),
                                  )
                              ),
                              child: Text("PLAY",style: TextStyle(color: Colors.white,fontSize: 35,)),
                            ):Container(
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(90, 10, 90, 10),
                              decoration: BoxDecoration(
                                // color: Colors.amber,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("img/main_button_play.png"),
                                  )
                              ),
                              child: Text("PLAY",style: TextStyle(color: Colors.white,fontSize: 35,)),
                            ),
                          ),
                        ),
                        Container(
                          height: 105,
                          width: 105,
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(200, 10, 100, 5),
                          // color: Colors.pink,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            //   color: Colors.pink,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("img/main_button_play_badge.png"),
                              )
                          ),
                          child: Text("LOGOS\n0/2565",style: TextStyle(color: Colors.white,fontSize: 15,)),
                        ),
                      ],),
                    ),
                    Expanded(
                      child: Row(children: [
                        SizedBox(width: 80,),
                        Expanded(
                          child: InkWell(onTap: () {
                            showAnimatedDialog(
                              duration: Duration(milliseconds: 500),
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  alignment: Alignment.center,
                                  title: Text(
                                    "Leaderboards",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  content: Text(
                                    "You need to log in to google+ to be able to record your scores",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: [
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: AssetImage("img/googleg_standard_color_18.png"))),
                                        ),
                                      ],
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(child: InkWell(onTap: () {
                                          Navigator.pop(context);
                                          setState(() { });
                                        },
                                          child: Container(
                                           color: Colors.black38,
                                            height: 30,
                                            alignment: Alignment.center,
                                            width: 100,
                                            child: Text("Close",style: TextStyle(color: Colors.white),),),
                                        ))],
                                    ),
                                  ],
                                  backgroundColor: Colors.black,
                                );
                              },
                              animationType: DialogTransitionType.scale,
                            );
                          },
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(0, 80, 0, 90),
                              decoration: BoxDecoration(
                                  // color: Colors.lightGreen,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("img/main_button_ranking.png"),
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                          child: InkWell(onTap: () {
                            showAnimatedDialog(
                              duration: Duration(milliseconds: 500),
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  alignment: Alignment.center,
                                  title: Text(
                                    "Leaderboards",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  content: Text(
                                    "You need to log in to google+ to be able to record your scores",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: [
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: AssetImage("img/googleg_standard_color_18.png"))),
                                        ),
                                      ],
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(child: InkWell(onTap: () {
                                          Navigator.pop(context);
                                          setState(() { });
                                        },
                                          child: Container(
                                            color: Colors.black38,
                                            height: 30,
                                            alignment: Alignment.center,
                                            width: 100,
                                            child: Text("Close",style: TextStyle(color: Colors.white),),),
                                        ))],
                                    ),
                                  ],
                                  backgroundColor: Colors.black,
                                );
                              },
                              animationType: DialogTransitionType.scale,
                            );
                          },
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(0, 80, 0, 90),
                              decoration: BoxDecoration(
                                  // color: Colors.lightGreen.shade300,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("img/main_button_stats.png"),
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                          child: InkWell(onTap: () {
                            showAnimatedDialog(
                              duration: Duration(milliseconds: 500),
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  alignment: Alignment.center,
                                  title: Text(
                                    "Leaderboards",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  content: Text(
                                    "You need to log in to google+ to be able to record your scores",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: [
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: AssetImage("img/googleg_standard_color_18.png"))),
                                        ),
                                      ],
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(child: InkWell(onTap: () {
                                          Navigator.pop(context);
                                          setState(() { });
                                        },
                                          child: Container(
                                            color: Colors.black38,
                                            height: 30,
                                            alignment: Alignment.center,
                                            width: 100,
                                            child: Text("Close",style: TextStyle(color: Colors.white),),),
                                        ))],
                                    ),
                                  ],
                                  backgroundColor: Colors.black,
                                );
                              },
                              animationType: DialogTransitionType.scale,
                            );
                          },
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(0, 80, 0, 90),
                              decoration: BoxDecoration(
                                  // color: Colors.lightGreen,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("img/main_button_achievements.png"),
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 80,),
                        ],),
                    )
                  ],)
                ),
              ),
              Expanded(flex: 2,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.amberAccent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("img/main_background_bottom_logos.png"),
                      )
                  ),
                ),
              ),
            ]),
          ),
      ),
    );
  }
}
