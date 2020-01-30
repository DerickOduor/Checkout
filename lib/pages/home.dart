import 'package:checkout/models/session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

final backgroundColor=Colors.white;

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  bool isCollapsed=true;
  double screenWidth,screenHeight;
  final Duration duration=const Duration(milliseconds: 300);

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: duration);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    new Session().load();
    screenHeight=size.height;
    screenWidth=size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context)
        ],
      ),
    );
  }

  Widget menu(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 16.0,top: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[SizedBox(height: 20.0,),
                Text("Home"),
                SizedBox(height: 20.0,),
                Text("Transactions"),
                SizedBox(height: 20.0,),
                Text("History"),
                SizedBox(height: 20.0,),
                Text("Profile"),
                SizedBox(height: 20.0,),
                Text("Logout")],
            )
          ],
        ),
      ),
    );
  }

  Widget dashboard(BuildContext context){
    return AnimatedPositioned(
      duration: duration,
      top: isCollapsed ? 0 :0.2*screenHeight,
      right: isCollapsed ? 0 : -0.4*screenWidth,
      left: isCollapsed ? 0 : 0.6*screenWidth,
      bottom: isCollapsed ? 0 :0.2*screenWidth,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        elevation: 8,
        color: backgroundColor,
        child: Container(
          padding: const EdgeInsets.only(top: 40.0,left: 20.0,right: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  InkWell(
                    child: Icon(Icons.menu,color: Color.fromRGBO(32, 178, 170,1),),
                    onTap: (){
                      setState(() {
                        isCollapsed=!isCollapsed;
                      });
                    },
                  ),
                  Text("Check-Out",style: TextStyle(color: Color.fromRGBO(32, 178, 170,1),fontWeight: FontWeight.bold,),),
                  Icon(Icons.settings,color: Color.fromRGBO(32, 178, 170,1),),
                ],
              ),
              SizedBox(height: 20.0,),
              Container(
                height: 300,
                child: PageView(
                  controller: PageController(viewportFraction: 0.8),
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  children: <Widget>[
                    Container(
                      color: Colors.blueAccent,
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Container(
                      color: Colors.greenAccent,
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Container(
                      color: Colors.redAccent,
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}