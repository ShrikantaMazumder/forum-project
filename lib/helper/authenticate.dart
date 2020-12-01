import 'package:flutter/material.dart';
import 'package:forum_project/widgets/sign_in.dart';
import 'package:forum_project/widgets/sign_up.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleForm() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return showSignIn ? SignInForm(toggleForm) : SignUpForm(toggleForm);
  }
}
