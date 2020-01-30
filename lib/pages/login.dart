import 'package:checkout/common/app_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Center(
              /*child:*/
            AppCard(
              child: Text(
                "CHECK OUT",
                style: TextStyle(fontSize: 32.0,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            AppCard(
              child: Container(
                //margin: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email"
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password"
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      child: FlatButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: (){

                        },
                        child: Text("Login"),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: (){},
                        child: Text("Forgot Password?"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                FlatButton(
                  onPressed: (){},
                  child: Text("Sign up"),
                )
              ],
            )
            //)
          ],
        ),
      ),
    );
  }

}