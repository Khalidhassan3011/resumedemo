import 'dart:convert';

import 'address.dart';
import 'name.dart';

class User {
  User({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
    required this.v,
  });

  Address address;
  int id;
  String email;
  String username;
  String password;
  Name name;
  String phone;
  int v;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    address: Address.fromJson(json["address"]),
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],
    name: Name.fromJson(json["name"]),
    phone: json["phone"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    // "address": address.toJson(),
    "id": id,
    "email": email,
    "username": username,
    "password": password,
    "name": name.toJson(),
    "phone": phone,
    "__v": v,
  };

  static User demoUser() => User.fromJson(
      {
        "id":0,
        "email":'',
        "username":'',
        "password":'',
        "name":{
          "firstname":'Not',
          "lastname":'Login'
        },
        "address":{
          "city":'kilcoole',
          "street":'7835 new road',
          "number":3,
          "zipcode":'12926-3874',
          "geolocation":{
            "lat":'-37.3159',
            "long":'81.1496'
          }
        },
        "phone":'1-570-236-7033',
        "__v": 0,
      },
  );
}
