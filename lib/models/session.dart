import 'dart:io';
import 'package:checkout/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:requests/requests.dart';
class Session{
  int success;
  SessionData data;

  Future<String> req()async{
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      /*'Authorization': '<Your token>',*/
      "X-Oc-Merchant-Id":"123"
    };
    //GET
    var r = await Requests.get("api.opencart-api.com/api/rest/",headers: requestHeaders);
    r.raiseForStatus();
    String body = r.content();


    //POST
    r = await Requests.post(
        "https://reqres.in/api/users",
        body: {
          "userId": 10,
          "id": 91,
          "title": "aut amet sed",
        },
        bodyEncoding: RequestBodyEncoding.JSON);

    r.raiseForStatus();
    dynamic json = r.json();
    print(json['id']);

    //UPDATE
    r = await Requests.put(
        "https://reqres.in/api/users/1",
        body: {
          "userId": 10,
          "id": 91,
          "title": "aut amet sed",
        },
        bodyEncoding: RequestBodyEncoding.JSON);

    r.raiseForStatus();
    json = r.json();
    print(json['id']);

    //DELETE
     r = await Requests.delete("https://reqres.in/api/users/10");
    r.raiseForStatus();

    //Ignore SSL self-signed certificate
    r = await Requests.get('https://expired.badssl.com/', verify: false);
    r.raiseForStatus();
  }
  dynamic _extractData(http.Response resp) {
    // initialze Jsona
    //Jsona jsona = new Jsona();

    // convert to `Map<String, dynamic>` from `String`
    var response = json.decode(resp.body);

    // deserialize response body
    //return jsona.deserialize(response);
  }

  Exception _handleError(dynamic e) {
    return Exception('Server error; cause: $e');
  }
  Future<ProductResponse> load()async{
    print('load');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      /*'Authorization': '<Your token>',*/
      "X-Oc-Merchant-Id":"123"
    };
    //GET
    var r = await http.get("https://api.opencart-api.com/api/rest/products",headers: requestHeaders);
    print(r.body);
    //r.raiseForStatus();
    //String body_ = r.content();
    final jsonResponse = json.decode(r.body);
    ProductResponse productResponse = new ProductResponse.fromJson(jsonResponse);
    print("Products: "+productResponse.data.length.toString());
    //Jsona jsona = new Jsona();

    Map<String, dynamic> body = {
      'data': {
        'type': 'town',
        'id': '123',
        'attributes': {
          'name': 'Barcelona',
        },
        'relationships': {
          'country': {
            'data': {
              'type': 'country',
              'id': '32',
            }
          }
        }
      },
      'included': [{
        'type': 'country',
        'id': '32',
        'attributes': {
          'name': 'Spain',
        }
      }]
    };

    //final dynamic town = jsona.deserialize(body);

    //print(town);
    /**
     * {
     *  type: town,
     *  id: 123,
     *  name: Barcelona,
     *  country: {
     *    type: country,
     *    id: 32, name: Spain
     *  },
     *  relationshipNames: [country]}
     */


    //Map<String, Object> jsonBody = jsona.serialize(stuff: town, includeNames: ['country']);

    //print(jsonBody);
    /**
     * {
     *   data: {
     *     id: 123,
     *     type: town,
     *     attributes: {
     *       name: Barcelona
     *     },
     *     relationships: {
     *       country: {
     *         data: {
     *           id: 32, type: country
     *         }
     *       }
     *     }
     *   },
     *   included: [{
     *     id: 32,
     *     type: country,
     *     attributes: {
     *       name: Spain
     *     }
     *   }]
     * }
     */
    return productResponse;
  }
}

class SessionData{
  String session;
}

