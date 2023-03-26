import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Wallet {
  int id;
  String? name;
  String? code;
  String? icone;
  double montant;
  double taux;

  Wallet(
      {required this.id,
      required this.name,
      required this.code,
      this.icone,
      required this.montant,
      required this.taux});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      icone: json['icone'],
      montant: json['montant'],
      taux: json['taux'],
    );
  }

    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['montant'] = montant;
    data['icone'] = icone;
    return data;
  }
}
