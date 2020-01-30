
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:checkout/pages/login_page.dart';

class LaunchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/back_ground_3.jpg'),
                  fit: BoxFit.cover
              )
          ),
        child: FutureBuilder(
          future: getParameters(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.data==null){
              return Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(height: 180.0,),
                    Text("Loading..."),
                  ],
                ),
              );
            }else{if(true){}
              return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,int index){
                    if(snapshot.data[index].name==("APPLICATION_NAME")){
                      return null;/*ListTile(
                        leading: CircleAvatar(
                          //child: Image.memory(base64Decode(snapshot.data[index].value)),
                          // backgroundImage: Image.memory(snapshot.data[index].bytes),
                          backgroundColor: Colors.transparent,

                        ),
                        title: Text(snapshot.data[index].value),
                      );*/
                    }else if(snapshot.data[index].name==("APPLICATION_LOGO_LIGHT")){
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: <Widget>[
                            SizedBox(height: 150.0,),
                            ListTile(
                              leading: Image.memory(
                                base64Decode(snapshot.data[index].value),
                                fit: BoxFit.cover,
                              ),

                            )
                          ],
                        )
                      );
                    }else{
                      return ButtonBar(
                        children: <Widget>[
                          SizedBox(height: 100.0),
                          FlatButton(
                            child: Text("Proceed"),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                            textColor: Colors.white,
                            color: Color.fromRGBO(32, 178, 170,1),
                          )
                        ],
                      );
                    }

                  });
            }
          },
        ),
        /*child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text("Load"),
                      onPressed: (){
                        getParameters();
                      },
                    )
                  ],
                ),

              ],
            ),
            Row(
              children: <Widget>[

              ],
            )
          ],
        ),*/
      ),
    );
  }

  Future<List<Parameter>> getParameters() async {
    List<Parameter> parameters=[];
    try{
      print("Starting...");
      var result=await http.get("https://b6097243.ngrok.io/api/Launch");
      var jsonData=jsonDecode(result.body);
      try{
        for(var p in jsonData){
          parameters.add(new Parameter(p["id"], p["name"], p["value"], p["code"], p["description"]/*,bytes*/));
        }
        print("parameters count:"+parameters.length.toString());
      }catch(e){
        debugPrint("Get Parameters Error 1:\n"+e);
      }
      return parameters;
    }catch(e){
      debugPrint("Get Parameters Error:\n"+e);
      return parameters;
    }
  }

}

class Parameter{
  String id;
  String name;
  String value;
  int code;
  String description;
  Uint8List _bytesImage;

  Parameter(this.id,this.name,this.value,this.code,this.description/*,this._bytesImage*/);
}