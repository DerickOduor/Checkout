import 'package:checkout/views/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:checkout/pages/home.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back_ground_dark_2.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(height: 180.0,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username / E-mail",
                  focusColor: Colors.white,
                ),
                cursorColor: Colors.white/*.fromRGBO(32, 178, 170,1)*/,
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Password",
                    focusColor: Colors.white
                ),style: TextStyle(
                color: Colors.white,
              ),
                obscureText: true,
                cursorColor: Colors.white/*.fromRGBO(32, 178, 170,1)*/,
              ),
              SizedBox(height: 20.0,),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.black/*.fromARGB(55, 55, 55, 55)*/,
                    onPressed: (){
                      //Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("Login"),
                    textColor: Colors.black,
                    color: Colors.white/*.fromRGBO(32, 178, 170,1)*/,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                    },
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text("Proceed to register?",style: TextStyle(color: Colors.white),),
                    onPressed: (){},
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }

}