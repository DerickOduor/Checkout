import 'package:checkout/models/product.dart';
import 'package:checkout/models/session.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WelcomePage extends StatefulWidget{
  @override
  WelcomePageState createState() => new WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  List<Product> products;

  @override
  void initState(){
    this.load();
    print("Init...");
    //ProductResponse productResponse=new Session().load() as ProductResponse;
    //products=productResponse.data;
  }

  @override
  Widget build(BuildContext context) {
    //new Session().load();
    //ProductResponse productResponse=new Session().load() as ProductResponse;
    //products=productResponse.data;
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.transparent,
      appBar: _appBar(context),
      drawer: _drawer(context),
      body: Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back_ground_dark_2.jpg'),
                fit: BoxFit.cover
            )
        ),
        //height: size.height,
        child:_mid(context,size) /*Column(

          children: <Widget>[
            _top(context),
            _mid(context,size)
          ],
        )*/,
      ),

    );
  }

  Widget _drawer(BuildContext context){
    BuildContext scaffoldContext=context;
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/back_ground_3.jpg'),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                margin: EdgeInsets.only(left: 0.0,top: 50.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/back_ground_dark_2.jpg'),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(height: 20.0,),
                        Text('Derick Oduor',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(height: 20.0,),
                        Text('oduorderick@gmail.com')
                      ],
                    )
                  ],
                ),
              )
          ),
          ListTile(
            title: Text("Home"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Logout"),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context){
    return AppBar(
      centerTitle: true,
      actions: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: Icon(
            Icons.shopping_cart,
          ),
        ),
      ],
      title: Text("Check-Out",style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.grey,
    );
  }

  Widget _top(BuildContext context){
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/back_ground_3.jpg"),
          fit: BoxFit.cover,
        ),

      ),
    );
  }

  Widget _mid(BuildContext context,Size size){

    return Center(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: products==null?0:products.length,
          itemBuilder: (BuildContext context,int index){
            return Card(
              color: Color.fromRGBO(64, 75, 96, .9),
              child: Padding(
                padding: EdgeInsets.all(7.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(64, 75, 96, .9),
                  ),
                  child: ListTile(
                    leading: Image.network(products[index].image,),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(products[index].name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        Text("Price: "+products[index].price_formated,style: TextStyle(color: Colors.white),),
                        FlatButton(
                          child: Text("View",),
                          onPressed: (){

                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<ProductResponse> load()async{
    ProductResponse productResponse=null;
    print('load');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      /*'Authorization': '<Your token>',*/
      "X-Oc-Merchant-Id":"123"
    };
    //GET
    var r = await http.get("https://api.opencart-api.com/api/rest/products",headers: requestHeaders);
    //print(r.body);
    //r.raiseForStatus();
    //String body_ = r.content();
    final jsonResponse = json.decode(r.body);
    productResponse = new ProductResponse.fromJson(jsonResponse);
    print("Products: "+productResponse.data.length.toString());
    this.setState(() {
      products = productResponse.data;
    });
    return productResponse;
  }


/*  Stack(
  children: <Widget>[
  Image.network(products[index].image),
  Align(
  alignment: Alignment.bottomCenter,
  child: Center(
  child: Container(
  decoration: BoxDecoration(
  color: Color.fromRGBO(196, 193, 192, 0.95),

  ),
  padding: EdgeInsets.all(10.0),
  alignment: Alignment.bottomCenter,
  child: Column(
  children: <Widget>[
  Text(products[index].name),
  Text(products[index].price_formated)
  ],
  ),
  )
  ),
  )
  ],
  )*/
}
