import 'dart:convert';
import 'dart:math';

import 'package:cryptpro/data/Model/walletModel.dart';
import 'package:cryptpro/services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

const String baseUrl = 'http://127.0.0.1:8000/api/';
const String loginEndpoint = 'auth/login';


Future<http.Response> fetchWallets() {
  // return http.get(Uri.parse("${baseURL}list-wallets"));
  return http.get(Uri.parse(baseURL + "list-wallets"));
}

// ignore: non_constant_identifier_names
Future<List> getPublicData(suffixUrl) async {
  http.Response response = await http.get(Uri.parse(baseURL + suffixUrl));
  try {
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => Wallet.fromJson(e)).toList();
    } else {
      throw Exception('robléme de chargement des données');
    }
  } catch (e) {
    throw Exception('Erreur de la base de données');
  }
}

getPublicData2(suffixUrl) async {
  http.Response response = await http.get(Uri.parse(baseURL + suffixUrl));
  try {
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result;
    } else {
      throw Exception('Probléme de chargement des données');
    }
  } catch (e) {
    throw Exception('Erreur de la base de données');
  }
}

Future<Map<String, dynamic>> login(String telephone, String password) async {
  final url = '$baseUrl$loginEndpoint';
  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'telephone': telephone,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    return jsonDecode(response.body);
  }
}
