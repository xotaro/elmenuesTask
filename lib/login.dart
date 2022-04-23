import 'package:elmenues/theme/app_colors';
import 'package:elmenues/view/home_navigate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_vm.dart';
import 'core/di/configuartion.dart';

class LoginTest extends StatefulWidget {
  const LoginTest({Key? key}) : super(key: key);

  @override
  _LoginTestState createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider<LoginViewModel>.value(
          value: getIt<LoginViewModel>(),
          child: Consumer<LoginViewModel>(
            builder: (context, model, _) => Center(
              child: model.connecting
                  ? const CircularProgressIndicator()
                  : model.loggedIn
                      ? HomeNavigate()
                      : Login(model.loginAction, model.errorMessage),
            ),
          ),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  final loginAction;
  final String? loginError;

  const Login(this.loginAction, this.loginError);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: appColor.primary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: appColor.primary,
                ),
              )),
          onPressed: () {
            loginAction();
          },
          child: Text(
            'Login',
            style: TextStyle(color: appColor.primary),
          ),
        ),
        Text(loginError ?? ""),
      ],
    );
  }
}
