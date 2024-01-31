import 'dart:math';

import 'package:demo_logo_games/logo/first.dart';
import 'package:demo_logo_games/logo/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

void main()
{
   runApp(MaterialApp(
     debugShowCheckedModeBanner: false,
   ));
}
class three extends StatefulWidget {
  // const three({super.key});
  List list;
  int index;
  three(this.list,this.index);

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  List<String> ans = ["one","two","three","four","five","six","seven","eight","nine","ten",
    "eleven","tweleve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","ninteen","twenty",
    "twenty1","twenty2","twenty3","twenty4","twenty5","twenty6",];
  List<String> random_op = ["A","B","C","D","E","F","G","H","I","J","K","L","M",
                            "N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
  // List point=["10","12","14","16","18","20","22","24","26","28",
  //             "30","32","34","36","38","40","42","44","46","48",
  //             "50","52","54","56","58","60",];
  List temp = [];
  List temp1 = [];
  int levelNo=0;
  List user_ans = [];
  String user_ans1 = "";
  String user_ans2 = "";
  String user_ans3 = "";
  String user_ans4 = "";
  List option = [];
  int cnt = 0;
  static int point = 20;
  String click = "";
  static int app_point = 80;

  PageController? controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    levelNo=widget.index;
    controller=PageController(initialPage: widget.index);
    point=first.prefs!.getInt("points$levelNo") ?? 20;
    get();
    setState(() { });
  }
  get()
  {
    // user_ans = List.filled(ans[levelNo].toString().length, "");
    user_ans = List.filled(ans[levelNo].toString().length, "");
    random_op.shuffle();
    print(random_op);
    option = List.filled(14, "");
    temp = List.filled(user_ans.length, "");
    temp1 = List.filled(user_ans.length, "");

    for(int i=0 ; i<user_ans.length ; i++)
    {
      // option[i] = ans[levelNo][i];
      option[i] = ans[levelNo][i];
    }
    for(int i=user_ans.length ; i<14 ; i++)
    {
      option[i] = random_op[i];
    }
    option.shuffle();
    print("shuffle option=${option}");
    setState(() { });
  }

  List ar=[];
  @override
  Widget build(BuildContext context) {
    first.prefs!.setInt("tot_hint", app_point);
    return WillPopScope(child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("logo ${levelNo+1}/${widget.list.length}"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue.shade900,Colors.blue.shade400]
              ),
            ),
          ),
          actions: [
            InkWell(onTap: () {
              showDialog(context: context, builder:  (context) {
                return AlertDialog(
                  backgroundColor: Colors.black,
                  title: Row(children: [
                    Expanded(flex: 1,
                      child: Container(
                        height: 25,
                        margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 10,
                        decoration: BoxDecoration(
                          image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/hints_present.png"))
                        ),
                      ),
                    ),
                    Expanded(flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        height: 25,
                        width: 50,
                        // color: Colors.redAccent,
                        child: Text("free hint",style: TextStyle(color: Colors.white,fontFamily: "two")),
                      ),
                    )
                  ]),
                  content: Container(
                    height: 170,width: double.infinity,
                    // color: Colors.lightGreenAccent,
                    child: Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                        Expanded(flex: 2,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            width: 10,
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/day_welcome_tiny.png"))
                            ),
                          ),
                        ),
                        Expanded(flex: 8,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
                            height: 30,
                            width: 50,
                            // color: Colors.redAccent,
                            child: Text("Welcome gift!",style: TextStyle(color: Colors.white,fontFamily: "two")),
                          ),
                        ),
                        Expanded(flex: 3,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/give_hints_button_blue.png"))
                            ),
                            child: Text("+30"),
                          ),
                        ),
                      ],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                        Expanded(flex: 2,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            width: 10,
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/day_wednesday_tiny.png"))
                            ),
                          ),
                        ),
                        Expanded(flex: 8,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
                            height: 30,
                            width: 50,
                            // color: Colors.redAccent,
                            child: Text("Sunday",style: TextStyle(color: Colors.white,fontFamily: "two")),
                          ),
                        ),
                        Expanded(flex: 3,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/give_hints_button_blue.png"))
                            ),
                            child: Text("+30"),
                          ),
                        ),
                      ],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                        Expanded(flex: 2,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            width: 10,
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/day_weekend_tiny.png"))
                            ),
                          ),
                        ),
                        Expanded(flex: 8,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
                            height: 30,
                            width: 50,
                            // color: Colors.redAccent,
                            child: Text("Weekend Bonus!",style: TextStyle(color: Colors.white,fontFamily: "two")),
                          ),
                        ),
                        Expanded(flex: 3,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/give_hints_button_blue.png"))
                            ),
                            child: Text("+75"),
                          ),
                        ),
                      ],),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                        Expanded(flex: 2,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            width: 10,
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/day_united_nations_tiny.png"))
                            ),
                          ),
                        ),
                        Expanded(flex: 8,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(10, 10, 20, 0),
                            height: 30,
                            width: 50,
                            // color: Colors.redAccent,
                            child: Text("United nation day",style: TextStyle(color: Colors.white,fontFamily: "two")),
                          ),
                        ),
                        Expanded(flex: 3,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/give_hints_button_blue.png"))
                            ),
                            child: Text("+75"),
                          ),
                        ),
                      ],)
                    ]),
                  ),
                  actions: [
                    Center(
                      child: InkWell(onTap: () {
                        Navigator.pop(context);
                      },
                        child: Container(
                          height: 30,
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [Colors.black38,Colors.black12]),
                            border: Border.all(color: Colors.white,width: 2)
                          ),
                          child: Text("OK",style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                );
              },);
            },
              child: Container(
                width: 40,
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 10, 3, 10),
                // color: Colors.brown,
                decoration: BoxDecoration(
                  // color: Colors.cyanAccent,
                    image: DecorationImage(
                        image: AssetImage("img/n_bulb_transparent_full_mark.png"))
                ),
              ),
            ),
            Container(
              width: 40,
              height: 20,
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 15, 2, 10),
              // color: Colors.brown,
              child: Text("Hints\n ${app_point}"),
            ),
          ],
        ),
        body: PageView.builder(
          onPageChanged: (value) {
            levelNo=value;
            // levelNo++;
            get();
            setState(() {   });
          },
          controller: controller,
          itemCount: widget.list.length,
          itemBuilder: (context, index)
          {
            String test=first.prefs!.getString("level$index") ?? "";
            String test1=first.prefs!.getString("level$index") ?? "";
            // int store_point = first.prefs!.getInt("store") ?? point;
            return (test=="yes")?
            Column(children: [
              Expanded(flex: 4,
                child: Row(children: [
                  InkWell(onTap: () {
                    if(levelNo>0)
                    {
                      levelNo--;
                    }
                    controller!.jumpToPage(levelNo);
                    setState(() { });
                  },child: Icon(Icons.arrow_back_ios_sharp,size: 40)),
                  Expanded(flex: 8,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      decoration: BoxDecoration(
                        // color: Colors.cyanAccent,
                          image: DecorationImage(
                              image: AssetImage("${widget.list[index]}"))
                      ),
                      // child: Text("${levelNo+1}",style: TextStyle(fontSize: 50)),
                    ),
                  ),
                  InkWell(onTap: () {
                    if(levelNo<widget.list.length-1)
                    {
                      levelNo++;
                    }
                    controller!.jumpToPage(levelNo);
                    setState(() { });
                  },child: Icon(Icons.arrow_forward_ios_sharp,size: 40)),
                ],),
              ),
              Expanded(flex: 1,child: Text("${ans[levelNo]}",style: TextStyle(color: Colors.black,fontSize: 30),)),
              Expanded(flex: 4,child: Container(
                height: 100,
                width: double.infinity,
                // color: Colors.blue,
                margin: EdgeInsets.fromLTRB(20, 40, 20, 70),
                decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid,color: Colors.white70),
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Colors.green.shade900,Colors.green.shade700],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )
                  ),
                child: Column(children: [
                    Expanded(flex: 1,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        // color: Colors.pink,
                        alignment: Alignment.center,
                        child: Text("8 X perfrct in a row!",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Expanded(flex: 1,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        // color: Colors.brown,
                        alignment: Alignment.center,
                        child: Text("try the Next level",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Expanded(flex: 1,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        // color: Colors.deepPurple,
                        alignment: Alignment.center,
                        child: Text("Good jobs!!",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Expanded(flex: 1,
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        // color: Colors.green,
                        margin: EdgeInsets.all(10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(0, 5, 200, 5),
                              // color: Colors.cyanAccent,
                              child: Row(children: [
                                Container(
                                  height: 60,
                                  width: 40,
                                  // color: Colors.brown,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/n_circle_points_green.png")),
                                  ),
                                  child: Text("${first.prefs!.getInt("points$levelNo") ?? point}",style: TextStyle(color: Colors.black,fontSize: 14)),
                                ),
                                Text(" points",style: TextStyle(color: Colors.white))
                              ]),
                            ),
                          ),
                          ElevatedButton(onPressed: () {
                            first.prefs!.setString("level${levelNo}", "yes");
                            // first.prefs!.setInt("store${levelNo}", store);
                            levelNo++;
                            point=20;
                            // controller!.jumpToPage(levelNo);
                            if(levelNo=="yes" || levelNo=="yes1")
                            {
                              point=point;
                            }
                            else
                            {
                              point=20;
                            }
                            controller!.animateToPage(levelNo, duration: Duration(seconds: 1), curve: Curves.linear);
                            Navigator.pop(context);
                            setState(() { });
                          }, child: Text("NEXT"),
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black26)),)
                        ]),
                      ),
                    ),
                  ],),
              ),),
            ],):(click == "solve" || test1=="yes1")?        //green win
            Column(children: [
              Expanded(flex: 4,
                child: Row(children: [
                  InkWell(onTap: () {
                    if(levelNo>0)
                    {
                      // levelNo--;
                      levelNo--;
                    }
                    controller!.jumpToPage(levelNo);
                    setState(() { });
                  },child: Icon(Icons.arrow_back_ios_sharp,size: 40)),
                  Expanded(flex: 8,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      decoration: BoxDecoration(
                        // color: Colors.cyanAccent,
                          image: DecorationImage(
                              image: AssetImage("${widget.list[index]}"))
                      ),
                      // child: Text("${levelNo+1}",style: TextStyle(fontSize: 50)),
                    ),
                  ),
                  InkWell(onTap: () {
                    if(levelNo<widget.list.length-1)
                    {
                      // levelNo++;
                      // point=20;
                      levelNo++;
                    }
                    controller!.jumpToPage(levelNo);
                    setState(() { });
                  },child: Icon(Icons.arrow_forward_ios_sharp,size: 40)),
                ],),
              ),
              Expanded(flex: 1,child: Text("${ans[levelNo]}",style: TextStyle(color: Colors.black,fontSize: 30),)),
              Expanded(flex: 4,child: Container(
                height: 80,
                width: double.infinity,
                // color: Colors.blue,
                margin: EdgeInsets.fromLTRB(20, 30, 20, 70),
                decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid,color: Colors.white70),
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Colors.yellow.shade300,Colors.yellow.shade500],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                ),
                child: Column(children: [
                  Expanded(flex: 1,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      // color: Colors.pink,
                      alignment: Alignment.center,
                      child: Text("NOT BAD !",style: TextStyle(color: Colors.white,fontSize: 30)),
                    ),
                  ),
                  Expanded(flex: 1,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      // color: Colors.brown,
                      alignment: Alignment.center,
                      child: Text("try the Next level",style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Expanded(flex: 1,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      // color: Colors.green,
                      margin: EdgeInsets.all(10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(0, 5, 200, 5),
                            // color: Colors.cyanAccent,
                            child: Row(children: [
                              Container(
                                height: 40,
                                width: 40,
                                // color: Colors.brown,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/n_circle_points_green.png")),
                                ),
                                child: Text("${first.prefs!.getInt("points$levelNo") ?? point}",style: TextStyle(color: Colors.black,fontSize: 15)),
                              ),
                              Text(" points",style: TextStyle(color: Colors.white))
                            ]),
                          ),
                        ),
                        ElevatedButton(onPressed: () {
                          // first.prefs!.setString("level${levelNo}", "yes");
                          first.prefs!.setString("level${levelNo}", "yes1");
                          levelNo++;
                          // point=first.prefs!.getInt("points$levelNo") ?? point;
                          point=20;
                          // if(levelNo=="yes" || levelNo=="yes1")
                          // {
                          //   point=first.prefs!.getInt("points$levelNo") ?? point;
                          // }
                          // else
                          // {
                          //   point=20;
                          // }
                          controller!.jumpToPage(levelNo);
                          // controller!.animateToPage(levelNo, duration: Duration(seconds: 1), curve: Curves.linear);
                          Navigator.pop(context);
                          setState(() { });
                        }, child: Text("NEXT"),
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black26)),)
                      ]),
                    ),
                  ),
                ],),
              ),),
            ],):                                            //yellow win
            Column(children: [
              Expanded(flex: 4,
                child: Row(children: [
                  InkWell(onTap: () {
                    if(levelNo>0)
                    {
                      levelNo--;
                      // point=20;
                    }
                    controller!.jumpToPage(levelNo);
                    setState(() { });
                  },child: Icon(Icons.arrow_back_ios_sharp,size: 40)),
                  Expanded(flex: 6,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      decoration: BoxDecoration(
                        // color: Colors.cyanAccent,
                          image: DecorationImage(
                              image: AssetImage("${widget.list[index]}"))
                      ),
                      // child: Text("${levelNo+1}",style: TextStyle(fontSize: 50)),
                    ),
                  ),
                  InkWell(onTap: () {
                    if(levelNo<widget.list.length-1)
                    {
                      levelNo++;
                      // point=20;
                    }
                    controller!.jumpToPage(levelNo);
                    setState(() { });
                  },child: Icon(Icons.arrow_forward_ios_sharp,size: 40)),
                ],),
              ),
              Expanded(child: Container(
                // color: Colors.pink,
                height: 30,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(380, 0, 20, 0),
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 50,
                  // color: Colors.brown,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/n_circle_points_green.png")),
                  ),
                  child: Text("${first.prefs!.getInt("points$levelNo") ?? point}",style: TextStyle(color: Colors.black,fontSize: 15)),
                  // child: (levelNo=="yes" || levelNo=="yes1")?Text("${first.prefs!.getInt("points$levelNo") ?? point}",style: TextStyle(color: Colors.black,fontSize: 15)):Text("${20}",style: TextStyle(color: Colors.black,fontSize: 15)),
                ),
              )),
              Expanded(flex: 1,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    // color: Colors.pink,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        user_ans.length, (index) => InkWell(onTap: () {
                        if(temp1[index]==false)
                        {
                          if(user_ans[index] != "")
                          {
                            option[temp[index]] = user_ans[index];
                            print("option=${option[temp[index]]}");
                            user_ans[index] = "";
                          }
                        }
                        setState(() { });
                      },
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              gradient: (temp1[index]==true)?LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [Colors.black54,Colors.black26]
                              ):LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [Colors.black26,Colors.black12]
                              ),
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Text("${user_ans[index]}"),
                        ),
                      ),
                      ),
                    ),
                  )
              ),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                  Expanded(flex: 3,
                    child: InkWell(onTap: () {
                      showAnimatedDialog(
                        duration: Duration(milliseconds: 500),
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            alignment: Alignment.center,
                            title: Text("You Have Hints", textAlign: TextAlign.center, style: TextStyle(color: Colors.white,),),
                            content: Container(
                              height: 300,
                              child: Column(children: [
                                Expanded(
                                  child: Container(
                                    height: 50,width: 300,
                                    padding: EdgeInsets.all(2),
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.lightGreen.shade900,Colors.lightGreen.shade800],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: InkWell(onTap: () {
                                      int r=Random().nextInt(user_ans.length);
                                      print("random=$r");
                                      List abc=[];
                                      abc=List.filled(user_ans.length, "");
                                      for(int i=0;i<ans[levelNo].toString().length;i++)
                                      {
                                        abc[i] = ans[levelNo].toString()[i];
                                      }
                                      user_ans[r]=abc[r];
                                      if(app_point!=0)
                                        {
                                          for(int i=0;i<option.length;i++)
                                          {
                                            if(abc[r]==option[i])
                                            {
                                              temp[r]=i;
                                              temp1[r]=true;
                                              option[i]="";
                                              break;
                                            }
                                          }
                                        }
                                      print("user_ans=${user_ans}");
                                      user_ans3=user_ans.join();
                                      print("final user ans join=${user_ans3}");
                                      if(user_ans3==ans[levelNo])
                                      {
                                        print(" random win the game");
                                        app_point=app_point+2;
                                        showDialog(context: context, builder: (context) {
                                          return AnimatedContainer(
                                            duration: Duration(milliseconds: 500),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              padding: EdgeInsets.all(20),
                                              margin: EdgeInsets.fromLTRB(15, 400, 15, 90),
                                              // color: Colors.yellow,
                                              decoration: BoxDecoration(
                                                  border: Border.all(style: BorderStyle.solid,color: Colors.white70),
                                                  borderRadius: BorderRadius.circular(10),
                                                  gradient: LinearGradient(
                                                    colors: [Colors.green.shade900,Colors.green.shade700],
                                                    begin: Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                  )
                                              ),
                                              child: Column(children: [
                                                Expanded(flex: 1,
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    // color: Colors.pink,
                                                    alignment: Alignment.center,
                                                    child: Text("8 X perfect in a row!",style: TextStyle(color: Colors.white)),
                                                  ),
                                                ),
                                                Expanded(flex: 1,
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    // color: Colors.brown,
                                                    alignment: Alignment.center,
                                                    child: Text("Next points +30%",style: TextStyle(color: Colors.white)),
                                                  ),
                                                ),
                                                Expanded(flex: 1,
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    // color: Colors.deepPurple,
                                                    alignment: Alignment.center,
                                                    child: Text("Good jobs!!",style: TextStyle(color: Colors.white)),
                                                  ),
                                                ),
                                                Expanded(flex: 1,
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    // color: Colors.green,
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                                                      Expanded(
                                                        child: Container(
                                                            height: 50,
                                                            width: double.infinity,
                                                            alignment: Alignment.center,
                                                            margin: EdgeInsets.fromLTRB(0, 5, 200, 5),
                                                            // color: Colors.cyanAccent,
                                                            child: Row(children: [
                                                              Container(
                                                                height: 40,
                                                                width: 40,
                                                                // color: Colors.brown,
                                                                alignment: Alignment.center,
                                                                decoration: BoxDecoration(
                                                                  image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/n_circle_points_green.png")),
                                                                ),
                                                                child: Text("${point}",style: TextStyle(color: Colors.black,fontSize: 15)),
                                                              ),
                                                              Text(" points",style: TextStyle(color: Colors.white,fontSize: 20),)
                                                            ],)
                                                        ),
                                                      ),
                                                      ElevatedButton(onPressed: () {
                                                        first.prefs!.setString("level${levelNo}", "yes");
                                                        levelNo++;
                                                        point=20;
                                                        // controller!.jumpToPage(levelNo);
                                                        controller!.animateToPage(levelNo, duration: Duration(seconds: 1), curve: Curves.linear);
                                                        Navigator.pop(context);
                                                        setState(() { });
                                                      }, child: Text("NEXT"),
                                                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black26)),)
                                                    ]),
                                                  ),
                                                ),
                                              ],),
                                            ),
                                          );
                                        },);
                                      }

                                      // point = point -1;
                                      if(app_point==0 || point==0)
                                        {
                                          app_point = app_point -0;
                                          point = point -0;
                                        }
                                      else
                                        {
                                          app_point = app_point -1;
                                          point = point -1;
                                          // first.prefs!.setInt("points$levelNo", point);
                                        }
                                      first.prefs!.setInt("points$levelNo", point);
                                      print("points : $point");
                                      Navigator.pop(context);
                                      setState(() { });
                                    },
                                      child: Row(children: [
                                        Container(
                                          height: 40,
                                          width: 50,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/hint_icon_random_letter.png"))),
                                          // child: Text("1"),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 160,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.pinkAccent,
                                          alignment: Alignment.center,
                                          child: Text("Random letter 1",style: TextStyle(fontSize: 15,color: Colors.white)),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/n_bulb.png"))),
                                          // child: Text("3"),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,width: 300,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.lightGreen.shade900,Colors.lightGreen.shade800],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: InkWell(onTap: () {
                                      int r=Random().nextInt(user_ans.length);
                                      // int r1=Random().nextInt(user_ans.length);
                                      int r1=0;
                                      for (int i = 0; i < user_ans.length; i++) {
                                        if(user_ans[i]=="")
                                          {
                                        r1 = Random().nextInt(user_ans.length);
                                        }
                                      }
                                      // if(user_ans=="") {
                                      //   for (int i = 0; i < user_ans.length; i++) {
                                      //     // if(user_ans[i]=="")
                                      //     //   {
                                      //     r1 = Random().nextInt(user_ans.length);
                                      //     // }
                                      //   }
                                      // }
                                      print("random=$r");
                                      print("random1=$r1");
                                      List abc=[];
                                      List abc1=[];
                                      abc=List.filled(user_ans.length, "");
                                      abc1=List.filled(user_ans.length, "");
                                      for(int i=0;i<ans[levelNo].toString().length;i++)
                                      {
                                        abc[i] = ans[levelNo].toString()[i];
                                        abc1[i] = ans[levelNo].toString()[i];
                                      }
                                      user_ans[r]=abc[r];
                                      user_ans[r1]=abc1[r1];
                                      if(app_point!=0)
                                        {
                                          for(int i=0;i<option.length;i++)
                                          {
                                            if(abc[r]==option[i])
                                            {
                                              temp[r]=i;
                                              temp1[r]=true;
                                              option[i]="";
                                              break;
                                            }
                                          }
                                          for(int i=0;i<option.length;i++)
                                          {
                                            if(abc1[r1]==option[i])
                                            {
                                              temp[r1]=i;
                                              temp1[r1]=true;
                                              option[i]="";
                                              break;
                                            }
                                          }

                                        }
                                      print("user_ans=${user_ans}");
                                      user_ans2=user_ans.join();
                                      print("final user ans join=${user_ans2}");
                                      if(user_ans2==ans[levelNo])
                                      {
                                        print(" random win the game");
                                        app_point=app_point+2;
                                        showDialog(context: context, builder: (context) {
                                          return AnimatedContainer(
                                            duration: Duration(milliseconds: 500),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              padding: EdgeInsets.all(20),
                                              margin: EdgeInsets.fromLTRB(15, 400, 15, 90),
                                              // color: Colors.yellow,
                                              decoration: BoxDecoration(
                                                  border: Border.all(style: BorderStyle.solid,color: Colors.white70),
                                                  borderRadius: BorderRadius.circular(10),
                                                  gradient: LinearGradient(
                                                    colors: [Colors.green.shade900,Colors.green.shade700],
                                                    begin: Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                  )
                                              ),
                                              child: Column(children: [
                                                Expanded(flex: 1,
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    // color: Colors.pink,
                                                    alignment: Alignment.center,
                                                    child: Text("8 X perfect in a row!",style: TextStyle(color: Colors.white)),
                                                  ),
                                                ),
                                                Expanded(flex: 1,
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    // color: Colors.brown,
                                                    alignment: Alignment.center,
                                                    child: Text("Next points +30%",style: TextStyle(color: Colors.white)),
                                                  ),
                                                ),
                                                Expanded(flex: 1,
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    // color: Colors.deepPurple,
                                                    alignment: Alignment.center,
                                                    child: Text("Good jobs!!",style: TextStyle(color: Colors.white)),
                                                  ),
                                                ),
                                                Expanded(flex: 1,
                                                  child: Container(
                                                    height: 50,
                                                    width: double.infinity,
                                                    // color: Colors.green,
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                                                      Expanded(
                                                        child: Container(
                                                            height: 50,
                                                            width: double.infinity,
                                                            alignment: Alignment.center,
                                                            margin: EdgeInsets.fromLTRB(0, 5, 200, 5),
                                                            // color: Colors.cyanAccent,
                                                            child: Row(children: [
                                                              Container(
                                                                height: 40,
                                                                width: 40,
                                                                // color: Colors.brown,
                                                                alignment: Alignment.center,
                                                                decoration: BoxDecoration(
                                                                  image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/n_circle_points_green.png")),
                                                                ),
                                                                child: Text("${point}",style: TextStyle(color: Colors.black,fontSize: 15)),
                                                              ),
                                                              Text(" points",style: TextStyle(color: Colors.white,fontSize: 20),)
                                                            ],)
                                                        ),
                                                      ),
                                                      ElevatedButton(onPressed: () {
                                                        first.prefs!.setString("level${levelNo}", "yes");
                                                        levelNo++;
                                                        point=20;
                                                        // controller!.jumpToPage(levelNo);
                                                        controller!.animateToPage(levelNo, duration: Duration(seconds: 1), curve: Curves.linear);
                                                        Navigator.pop(context);
                                                        setState(() { });
                                                      }, child: Text("NEXT"),
                                                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black26)),)
                                                    ]),
                                                  ),
                                                ),
                                              ],),
                                            ),
                                          );
                                        },);
                                      }

                                      // point = point -2;
                                      if(app_point==0 || point==0)
                                      {
                                        app_point = app_point -0;
                                        point = point -0;
                                      }
                                      else
                                      {
                                        app_point = app_point -2;
                                        point = point -2;
                                        // first.prefs!.setInt("points$levelNo", point);
                                      }

                                      first.prefs!.setInt("points$levelNo", point);
                                      print("points : $point");
                                      Navigator.pop(context);
                                      setState(() { });
                                    },
                                      child: Row(children: [
                                        Container(
                                          height: 40,
                                          width: 50,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/hint_icon_category.png"))),
                                          // child: Text("1"),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 160,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.pinkAccent,
                                          alignment: Alignment.center,
                                          child: Text("Random Letters 2",style: TextStyle(fontSize: 15,color: Colors.white)),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/n_bulb.png"))),
                                          // child: Text("3"),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,width: 300,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.blue.shade900,Colors.blue.shade800],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: InkWell(onTap: () {
                                      // int r=Random().nextInt(user_ans.length);
                                      // print("random=$r");
                                      // List abc=[];
                                      // abc=List.filled(user_ans.length, "");
                                      // for(int i=0;i<ans[levelNo].toString().length;i++)
                                      // {
                                      //   abc[i] = ans[levelNo].toString()[i];
                                      // }
                                      // user_ans[r]=abc[r];
                                      // for(int i=0;i<option.length;i++)
                                      // {
                                      //   if(abc[r]==option[i])
                                      //   {
                                      //     temp[r]=i;
                                      //     temp1[r]=true;
                                      //     option[i]="";
                                      //     break;
                                      //   }
                                      // }
                                      setState(() { });
                                    },
                                      child: Row(children: [
                                        Container(
                                          height: 40,
                                          width: 50,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/hint_icon_selected_letter.png"))),
                                          // child: Text("1"),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 160,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.pinkAccent,
                                          alignment: Alignment.center,
                                          child: Text("selected letters",style: TextStyle(fontSize: 15,color: Colors.white)),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/n_bulb.png"))),
                                          // child: Text("3"),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,width: 300,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.blue.shade900,Colors.blue.shade800],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: InkWell(onTap: () {
                                      // print("length=${option.length}");
                                      // print({"ans=${ans[levelNo]}"});
                                      // var compare = ans[levelNo].split("");
                                      // print("compare = ${compare}");
                                      // var option1 = option.toSet().toList();
                                      // var compare1 = compare.toSet().toList();
                                      // print("option1 = ${option1}");
                                      // print("compare1 = ${compare1}");
                                      // for(int i=0;i<14;i++)
                                      //   {
                                      //         if(option[i]!=compare1[i])
                                      //           {
                                      //               option[i]="";
                                      //           }
                                      //   }
                                      print("option=${option}");
                                      print("random=${random_op}");
                                      if(app_point!=0)
                                        {
                                          for(int i=0;i<option.length;i++)
                                          {
                                            option[i]="";
                                            for(int i=0;i<user_ans.length;i++)
                                            {
                                              option[i]=ans[levelNo][i];
                                            }
                                          }
                                          option.shuffle();
                                        }
                                      print("user_ans=${user_ans}");
                                      user_ans4=user_ans.join();
                                      print("final user ans join=${user_ans4}");
                                      if(user_ans4==ans[levelNo])
                                        {
                                            print("winner");
                                            app_point=app_point+2;
                                        }
                                      if(app_point==0 || point==0)
                                      {
                                        app_point = app_point -0;
                                        point = point -0;
                                      }
                                      else
                                      {
                                        app_point = app_point -3;
                                        point = point -3;
                                        // first.prefs!.setInt("points$levelNo", point);
                                      }
                                      first.prefs!.setInt("points$levelNo", point);
                                      Navigator.pop(context);
                                      setState(() { });
                                    },
                                      child: Row(children: [
                                        Container(
                                          height: 40,
                                          width: 50,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/hint_icon_remove_letters.png"))),
                                          // child: Text("1"),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 160,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.pinkAccent,
                                          alignment: Alignment.center,
                                          child: Text("Remove extra letters",style: TextStyle(fontSize: 15,color: Colors.white)),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/n_bulb.png"))),
                                          // child: Text("3"),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,width: 300,
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [Colors.pink.shade900,Colors.pink.shade800],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: InkWell(onTap: () {
                                      print("solve");
                                      if(app_point!=0)
                                        {
                                          click = "solve";
                                        }
                                      // point = point - 8;
                                      if(app_point==0 || point==0)
                                      {
                                        app_point = app_point -0;
                                        point = point -0;
                                      }
                                      else
                                      {
                                        app_point = app_point -8;
                                        point = point -8;
                                        // first.prefs!.setInt("points$levelNo", point);
                                      }
                                      first.prefs!.setInt("points$levelNo", point);
                                      setState(() {

                                      });
                                      Navigator.pop(context);
                                      // showDialog(context: context, builder: (context) {
                                      //       return Scaffold(
                                      //         appBar: ,
                                      //       );
                                      // },);
                                      // setState(() { });
                                    },
                                      child: Row(children: [
                                        Container(
                                          height: 40,
                                          width: 50,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/hint_icon_solve.png"))),
                                          // child: Text("1"),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 160,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.pinkAccent,
                                          alignment: Alignment.center,
                                          child: Text("solve",style: TextStyle(fontSize: 15,color: Colors.white)),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          margin: EdgeInsets.all(5),
                                          // color:  Colors.brown,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("img/n_bulb.png"))),
                                          // child: Text("3"),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            actions: [
                              InkWell(onTap: () {
                                Navigator.pop(context);
                                setState(() { });
                              },
                                child: Container(
                                  // color: Colors.black38,
                                  height: 30,width: 70,
                                  // margin: EdgeInsets.all(50),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.black,Colors.black54],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Text("OK",style: TextStyle(color: Colors.white),),),
                              ),
                            ],
                          );
                        },
                        animationType: DialogTransitionType.scale,
                      );
                    },
                      child: Container(
                        height: 50,
                        width: 70,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.fromLTRB(50, 10, 5, 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              tileMode: TileMode.repeated,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.green.shade400,Colors.green.shade900]
                          ),
                          // color: Colors.green.shade800,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                          Text("   "),
                          Expanded(flex: 1,child: Image(fit: BoxFit.fill,image: AssetImage("img/n_bulb.png"))),
                          // Text("bulb"),
                          Text("   Use Hints   ",style: TextStyle(color: Colors.white,fontSize: 25)),
                        ]),
                      ),
                    ),),
                  Expanded(flex: 1,
                    child: InkWell(onTap: () {
                      for(int i=0 ; i<user_ans.length ; i++)
                      {
                        if(user_ans[i] != "")
                        {
                          option[temp[i]] = user_ans[i];
                          print("option=${option[temp[i]]}");
                          user_ans[i] = "";
                        }
                      }
                      setState(() { });
                    },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              tileMode: TileMode.repeated,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.pink.shade400,Colors.pink.shade900]
                          ),
                          // color: Colors.pink.shade700,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.close_sharp,color: Colors.white,size: 50),
                      ),
                    ),),
                  Expanded(flex: 1,
                    child: InkWell(onTap: () {
                      for(int i=temp.length-1;i>=0;i--)
                      {
                        if(temp[i]!="")
                        {
                          option[temp[i]]=user_ans[i];
                          temp[i]="";
                          user_ans[i]="";
                          break;
                        }
                      }
                      setState(() { });
                    },
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.fromLTRB(0, 10, 40, 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              tileMode: TileMode.repeated,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.pink.shade400,Colors.pink.shade900]
                          ),
                          // color: Colors.pink.shade700,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.arrow_back,color: Colors.white,size: 50),
                      ),
                    ),),
                ],),
              ),
              Expanded(flex: 2,child:
              GridView.builder(
                itemCount: 14,
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return (option[index]!="") ? InkWell(onTap: () {
                    for(int i=0 ; i<user_ans.length ; i++)
                    {
                      if(user_ans[i] == "")
                      {
                        user_ans[i] = option[index];
                        temp[i] = index;
                        option[index] = "";

                        print("user_ans=${user_ans}");
                        user_ans1=user_ans.join();
                        print("final user ans join=${user_ans1}");
                        print("ans=${ans[levelNo]}");

                        // cnt++;
                        // print("cnt=$cnt");
                        // var compare1=user_ans1.split('');
                        // var compare2=ans[levelNo].split("");
                        // print("split user ans=${compare1}");
                        // print("split ans=${compare2}");
                        // print("user ans length=${user_ans.length}");

                        temp[i]=index;
                        temp1[i]=false;
                        option[index]="";

                        if(user_ans1==ans[levelNo])
                        {
                          print("win game");
                          app_point=app_point+2;
                          showDialog(context: context, builder: (context) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                height: 60,
                                width: 100,
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.fromLTRB(15, 450, 15, 150),
                                // color: Colors.yellow,
                                decoration: BoxDecoration(
                                    border: Border.all(style: BorderStyle.solid,color: Colors.white70),
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [Colors.green.shade900,Colors.green.shade700],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    )
                                ),
                                child: Column(children: [
                                  Expanded(flex: 1,
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      // color: Colors.pink,
                                      alignment: Alignment.center,
                                      child: Text("8 X perfect in a row!",style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  Expanded(flex: 1,
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      // color: Colors.brown,
                                      alignment: Alignment.center,
                                      child: Text("Next points +30%",style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  Expanded(flex: 1,
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      // color: Colors.deepPurple,
                                      alignment: Alignment.center,
                                      child: Text("Good jobs!!",style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  Expanded(flex: 1,
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      // color: Colors.green,
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                                        Expanded(
                                          child: Container(
                                              height: 50,
                                              width: double.infinity,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(0, 5, 200, 5),
                                              // color: Colors.cyanAccent,
                                              child: Row(children: [
                                                Container(
                                                  height: 40,
                                                  width: 30,
                                                  // color: Colors.brown,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    // color: Colors.brown,
                                                    image: DecorationImage(fit: BoxFit.fill,image: AssetImage("img/n_circle_points_green.png")),
                                                  ),
                                                  child: Text("${point}",style: TextStyle(color: Colors.black,fontSize: 15)),
                                                ),
                                                Text(" points",style: TextStyle(color: Colors.white,fontSize: 19),)
                                              ],)
                                          ),
                                        ),
                                        ElevatedButton(onPressed: () {
                                          first.prefs!.setString("level${levelNo}", "yes");
                                          levelNo++;
                                          point=20;
                                          // controller!.jumpToPage(levelNo);
                                          controller!.animateToPage(levelNo, duration: Duration(seconds: 1), curve: Curves.linear);
                                          Navigator.pop(context);
                                          setState(() { });
                                        }, child: Text("NEXT"),
                                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black26)),)
                                      ]),
                                    ),
                                  ),
                                ],),
                              ),
                            );
                          },);
                        }

                        break;
                      }
                      // else if(user_ans[i] != "" || user_ans1!=ans[levelNo])
                      // {
                      //   print("lose the game");
                      //   showDialog(context: context, builder: (context) {
                      //     return AlertDialog(
                      //       backgroundColor: Colors.black,
                      //       alignment: Alignment.center,
                      //       content: Text("Incorrect answer",style: TextStyle(color: Colors.white)),
                      //       actions: [
                      //         ElevatedButton(onPressed: () {
                      //           Navigator.pop(context);
                      //           setState(() { });
                      //         }, child: Text("OK"),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black26)),)
                      //       ],
                      //     );
                      //   },);
                      // }

                    }

                    setState(() { });
                  },
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Colors.grey.shade500,Colors.grey.shade200]
                          ),
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: Text("${option[index]}"),
                    ),
                  ) : Text("");
                },
              ),
              ),
              Expanded(flex: 1,child: Text("")),
            ],);                                            //game page
          },
        ),
      ),
    ), onWillPop: ()async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return second();
      },));
      return true;
    },);
  }
}


