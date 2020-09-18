import 'package:flutter/foundation.dart';

class Item {
  int serviceId;
  String productType;
  String serialNumber;
  String productDescription;
  num price;
  bool serviceStatus;
  bool paymentStatus;
  String serviceDescription;
  int userId;
  String receivedDate;
  String completedDate;
  String phoneNumber;
  String contactPerson;
  String email;
  String password;

  Item({this.serviceId,
    this.productType,
    this.serialNumber,
    this.productDescription,
    this.price,
    this.serviceStatus,
    this.paymentStatus,
    this.serviceDescription,
    this.userId,
    this.receivedDate,
    this.completedDate,
    this.phoneNumber,
    this.contactPerson,
    this.email,
    this.password});

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      serviceId : json['serviceId'],
      productType : json['productType'],
      serialNumber : json['serialNumber'],
      productDescription: json['productDesc'],
      price : json['price'],
      receivedDate : json['receivedDate'],
      completedDate : json['completedDate'],
      serviceStatus : json['serviceStatus'],
      paymentStatus : json['paymentStatus'],
      serviceDescription : json['serviceDesc'],
      userId : json['userId'],
      phoneNumber : json['phoneNumber'],
      contactPerson : json['contactPerson'],
      email: json['emailAddress'],
      password: json['emailPassword']
    );
  }
}