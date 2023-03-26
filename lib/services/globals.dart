import 'package:cryptpro/data/Model/walletModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/Model/authModel.dart';
import 'dart:developer' as developer;

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

    static Future<Map<String, dynamic>> login(User user) async {
    final response = await http.post(
      Uri.parse("${baseURL}auth/login"), 
      body: jsonEncode(user.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON response and return it
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to login');
    }
  }
}
