import 'dart:convert';
import 'dart:math';

import 'package:cryptpro/data/Model/walletModel.dart';
import 'package:cryptpro/services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<http.Response> fetchWallets() {
  // return http.get(Uri.parse("${baseURL}list-wallets"));
  return http.get(Uri.parse(baseURL +"list-wallets"));
}


 // ignore: non_constant_identifier_names
 Future<List> getPublicData(suffixUrl) async {
    http.Response response = await http.get(
        Uri.parse(baseURL+suffixUrl)) ;
    try {
      if (response.statusCode == 200) {
         final List result = json.decode(response.body);
          return result.map((e) => Wallet.fromJson(e)).toList();
      } else {
         throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
       throw Exception('Failed to load data');
    }
  }