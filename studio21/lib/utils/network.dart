import 'dart:convert';

import 'package:studio21/model/serviceitem.dart';
import 'package:http/http.dart' as http;

class Network {
  final String url = "http://localhost:8080/service";

  Future<List<Item>> fetchItems() async {
    String username = 'xhemil';
    String password = 'xhemil123';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final response = await http.get(url, headers: {'authorization': basicAuth});

    if(response.statusCode == 200){
      return (jsonDecode(response.body) as List)
          .map<Item>((json) =>
          Item.fromJson(json)
      ).toList(); //compute(parseItem, response.body);
    }
    return null;
  }

  Future<http.Response> sendData(Item item){
    String username = 'xhemil';
    String password = 'xhemil123';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    return http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': basicAuth
      },
      body: jsonEncode(
        <String,String>{
          'serviceId': item.serviceId.toString(),
          'productType': item.productType,
          'serialNumber': item.serialNumber,
          'price': item.price.toString(),
          'receivedDate': item.receivedDate,
          'completedDate': item.completedDate,
          'serviceStatus': item.serviceStatus.toString(),
          'paymentStatus': item.paymentStatus.toString(),
          'serviceDesc': item.serviceDescription,
          'userId': item.userId.toString(),
          'phoneNumber': item.phoneNumber,
          'contactPerson': item.contactPerson,
          'emailAddress': item.email,
          'emailPassword': item.password
        }
      ),
    );
  }
}