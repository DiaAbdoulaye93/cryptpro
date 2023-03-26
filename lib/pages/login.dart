import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

import '../data/commonrequest.dart';
import 'dart:developer' as developer;
import 'package:jwt_decode/jwt_decode.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  bool _isLoading = false;
  String _errorMessage = '';

  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: showLockScreen(
        context,
        opaque: false,
        cancelButton: const Text(
          'Annuler',
          style: TextStyle(fontSize: 16, color: Colors.white),
          semanticsLabel: 'Annuler',
        ),
      )),
    );
  }

  showLockScreen(
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
    return PasscodeScreen(
      title: Column(
        children: [
          Container(
            height: 200,
            child: Image.asset("assets/homePerson.gif"),
          ),
          const Text(
            "Saisir votre code secrêt",
            style: TextStyle(color: Colors.white, letterSpacing: 2),
          )
        ],
      ),
      circleUIConfig: circleUIConfig,
      keyboardUIConfig: keyboardUIConfig,
      passwordEnteredCallback: _onPasscodeEntered,
      cancelButton: cancelButton,
      deleteButton: const Text(
        'Effacer',
        style: TextStyle(fontSize: 16, color: Colors.white),
        semanticsLabel: 'Effacer',
      ),
      shouldTriggerVerification: _verificationNotifier.stream,
      backgroundColor: Colors.black.withOpacity(0.8),
      cancelCallback: _onPasscodeCancelled,
      digits: digits,
      passwordDigits: 4,
      // bottomWidget: _buildPasscodeRestoreButton(),
    );
  }

  _onPasscodeEntered(String enteredPasscode) async {
    // bool isValid = storedPasscode == enteredPasscode;
    // _verificationNotifier.add(isValid);
    // if (isValid) {
    //   setState(() {
    //     this.isAuthenticated = isValid;
    //   });
    // }
    try {
      const telephone = "772258817";
      final password = enteredPasscode;
      dynamic response = login(telephone, password);
      var value = await response;
      Map<String, dynamic> payload = Jwt.parseJwt('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKV1QgRGVjb2RlIiwiaWF0IjoxNjA4NTgxNzczLCJleHAiOjE2NDAxMTc3NzMsImF1ZCI6Ind3dy5qd3RkZWNvZGUuY29tIiwic3ViIjoiQSBzYW1wbGUgSldUIiwibmFtZSI6IlZhcnVuIFMgQXRocmV5YSIsImVtYWlsIjoidmFydW4uc2F0aHJleWFAZ21haWwuY29tIiwicm9sZSI6IkRldmVsb3BlciJ9.vXE9ogUeMMsOTz2XQYHxE2hihVKyyxrhi_qfhJXamPQ');
      print(payload);
      if (value['status'] == true) {
        Navigator.pushNamed(context, '/home');
      } else {
        _verificationNotifier.add(false);
      }

      // Save login token to shared preferences or other storage
      // Redirect user to home screen
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  // _buildPasscodeRestoreButton() => Align(
  //       alignment: Alignment.bottomCenter,
  //       child: Container(
  //         margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
  //         child: TextButton(
  //           onPressed: _resetAppPassword,
  //           child: const Text(
  //             "Réinitialiser le mot de passe",
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //                 fontSize: 16,
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.w300),
  //           ),
  //           // splashColor: Colors.white.withOpacity(0.4),
  //           // highlightColor: Colors.white.withOpacity(0.2),
  //           // ),
  //         ),
  //       ),
  //     );

  _resetAppPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _showRestoreDialog(() {
        Navigator.maybePop(context);
        //TODO: Clear your stored passcode here
      });
    });
  }

  _showRestoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Réinitialiser le mot de passe",
            style: TextStyle(color: Colors.black87),
          ),
          content: const Text(
            "La réinitialisation du code d'accès est une opération non sécurisée !\n\n Pensez à supprimer toutes les données de l'utilisateur si vous effectuez cette opération.",
            style: TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: const Text(
                "Annuler",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            TextButton(
              onPressed: onAccepted,
              child: const Text(
                "J'ai compris",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }
}
