import 'dart:convert';

import 'package:flutter/foundation.dart';

class ClientModel {
  late int? id;
  late String name;
  late String gst_id;
  late String address;
  late String email;
  late int mobileNumber;
  late int? purchase;
  late int? sale;
  ClientModel(
      {this.id,
      required this.name,
      required this.mobileNumber,
      this.purchase,
      this.sale,
      required this.address,
      required this.email,
      required this.gst_id});

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
        id: json['id'],
        name: json['name'],
        mobileNumber: json['number'],
        purchase: json['purchase'],
        sale: json['sale'],
        address: json['address'],
        email: json['email'],
        gst_id: json['gst_id']);
  }

  Map tojson() {
    return {
      'name': name,
      'number': mobileNumber.toString(),
      'address': address,
      'email': email,
      'gst_id': gst_id
    };
  }
}
