import 'dart:async';

import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  
  @override
   LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  String storedPasscode = '1111';
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
            )
      ),
    );
  }

  // _defaultLockScreenButton(BuildContext context) => MaterialButton(
  //       color: Theme.of(context).primaryColor,
  //       child: const Text('Open Default Lock Screen'),
  //       onPressed: () {
  //         _showLockScreen(
  //           context,
  //           opaque: false,
  //           cancelButton: const Text(
  //             'Cancel',
  //             style: TextStyle(fontSize: 16, color: Colors.white),
  //             semanticsLabel: 'Cancel',
  //           ),
  //         );
  //       },
  //     );

  // _customColorsLockScreenButton(BuildContext context) {
  //   return MaterialButton(
  //     color: Theme.of(context).primaryColor,
  //     child: const Text('Open Custom Lock Screen'),
  //     onPressed: () {
  //       _showLockScreen(context,
  //           opaque: false,
  //           circleUIConfig: const CircleUIConfig(
  //               borderColor: Colors.blue,
  //               fillColor: Colors.blue,
  //               circleSize: 30),
  //           keyboardUIConfig: const KeyboardUIConfig(
  //               digitBorderWidth: 2, primaryColor: Colors.blue),
  //           cancelButton: const Icon(
  //             Icons.arrow_back,
  //             color: Colors.blue,
  //           ),
  //           digits: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '零']);
  //     },
  //   );
  // }

    showLockScreen (
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
     return PasscodeScreen(
            title: const Text(
              'Entrer votre code',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback:_onPasscodeEntered,
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
            bottomWidget: _buildPasscodeRestoreButton(),
         
        );
  }


  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
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

  _buildPasscodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: TextButton(
            onPressed: _resetAppPassword,
            child: const Text(
              "Réinitialiser le mot de passe",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            // splashColor: Colors.white.withOpacity(0.4),
            // highlightColor: Colors.white.withOpacity(0.2),
            // ),
          ),
        ),
      );

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
