import 'package:flutter/material.dart';
import 'package:provider_base_app/UI/views/base_view.dart';
import 'package:provider_base_app/UI/widgets/login_header.dart';
import 'package:provider_base_app/core/enums/viewstate.dart';
import 'package:provider_base_app/core/viewmodels/login_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, loginModel, child) {
        return Scaffold(
          backgroundColor: Colors.pink,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeader(
                  validationMessage: loginModel.errorMessage,
                  controller: _textEditingController),
              loginModel.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : TextButton(
                      onPressed: () async {
                        var loginSuccess =
                            await loginModel.login(_textEditingController.text);

                        if (loginSuccess) {
                          // Navigate to the home view
                           Navigator.pushNamed(context, '/home');
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                        
                      ),
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
              )
            ],
          ),
        );
      },
    );
  }
}
