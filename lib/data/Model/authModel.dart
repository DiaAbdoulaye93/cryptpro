import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class User {
  String telephone;
  String password;

  User({required this.telephone, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['telephone'] = this.telephone;
    data['password'] = this.password;
    return data;
  }
}