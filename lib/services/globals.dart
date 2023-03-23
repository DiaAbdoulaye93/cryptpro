import 'package:cryptpro/data/Model/walletModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
const String baseURL = "http://127.0.0.1:8000/api/"; //emulator localhost
const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}

class StudentService{
  static Future<List<Wallet>> getStudent() async {
    
    final response = await  http.get(Uri.parse("${baseURL}list-wallets"));
    List<Wallet> list = parseResponse(response.body);
    return list;
  }
  
  static List<Wallet> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Wallet>((json) => Wallet.fromJson(json)).toList();
  }
}
