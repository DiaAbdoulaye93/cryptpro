import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : PinCodeTextField(
                controller: _textEditingController,
                appContext: context,
                length: 4,
                onChanged: (value) {},
                onCompleted: (value) {
                  if (value == '1234') {
                    setState(() {
                      _isLoading = true;
                    });
                    // do your loading logic here
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text('Invalid Passcode'),
                              content: Text('Please try again.'),
                              actions: [
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ));
                  }
                },
              ),
      ),
    );
  }
}
