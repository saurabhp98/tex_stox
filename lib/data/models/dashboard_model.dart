import 'dart:convert';

import 'package:flutter/foundation.dart';

class DashboardModel {
  late String sort_name;
  late String grade;
  late int mtr;

  DashboardModel(
      {required this.sort_name, required this.grade, required this.mtr});

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
        sort_name: json['sort_name'], grade: json['grade'], mtr: json['mtr']);
  }
}
