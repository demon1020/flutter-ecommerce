import 'package:meta/meta.dart';
import 'dart:convert';

class UserRegister {
  final String? email;
  final String? username;
  final String? password;
  final Name? name;
  final Address? address;
  final String? phone;

  UserRegister({
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  UserRegister copyWith({
    String? email,
    String? username,
    String? password,
    Name? name,
    Address? address,
    String? phone,
  }) =>
      UserRegister(
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
      );

  factory UserRegister.fromRawJson(String str) => UserRegister.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
    email: json["email"],
    username: json["username"],
    password: json["password"],
    name: Name.fromJson(json["name"]),
    address: Address.fromJson(json["address"]),
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "username": username,
    "password": password,
    "name": name?.toJson(),
    "address": address?.toJson(),
    "phone": phone,
  };
}

class Address {
  late final String city;
  late final String street;
  late final int number;
  late final String zipcode;
  final Geolocation geolocation;

  Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  Address copyWith({
    String? city,
    String? street,
    int? number,
    String? zipcode,
    Geolocation? geolocation,
  }) =>
      Address(
        city: city ?? this.city,
        street: street ?? this.street,
        number: number ?? this.number,
        zipcode: zipcode ?? this.zipcode,
        geolocation: geolocation ?? this.geolocation,
      );

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    street: json["street"],
    number: json["number"],
    zipcode: json["zipcode"],
    geolocation: Geolocation.fromJson(json["geolocation"]),
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "street": street,
    "number": number,
    "zipcode": zipcode,
    "geolocation": geolocation.toJson(),
  };
}

class Geolocation {
  late final String lat;
  late final String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  Geolocation copyWith({
    String? lat,
    String? long,
  }) =>
      Geolocation(
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );

  factory Geolocation.fromRawJson(String str) => Geolocation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}

class Name {
  late final String firstname;
  late final String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  Name copyWith({
    String? firstname,
    String? lastname,
  }) =>
      Name(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
      );

  factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
  };
}
