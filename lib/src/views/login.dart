import 'package:Unreel/src/logic/model/auth_service.dart';
import 'package:Unreel/src/logic/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyBlack,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.dark_grey,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 120),
                    child: Text(
                      'Unreel',
                      style: TextStyle(
                        color: AppTheme.unreel,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: const Text(
                      'Creative is better.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppTheme.nearlyWhite,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  _loginForm(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppTheme.unreel,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());

                              context.read<AuthenticationService>().signIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                  ),
                  Text(
                    'Inicia con redes sociales',
                    style: TextStyle(
                        color: AppTheme.nearlyWhite,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                  ),
                  SignInButton(
                    Buttons.Google,
                    text: 'Entrar con Google',
                    onPressed: () {
                      context.read<AuthenticationService>().signInWithGoogle();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 32, right: 32),
      child: Column(
        children: [
          new Text(
            ' Inicia sesión',
            style: TextStyle(
                color: AppTheme.nearlyWhite,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: AppTheme.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: new EdgeInsets.only(left: 20),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  onChanged: (String txt) {},
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontSize: 18,
                    color: AppTheme.nearlyWhite,
                  ),
                  showCursor: true,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Correo electrónico'),
                ),
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: AppTheme.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                margin: new EdgeInsets.only(left: 20),
                child: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  onChanged: (String txt) {},
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontSize: 18,
                    color: AppTheme.nearlyWhite,
                  ),
                  obscureText: true,
                  showCursor: true,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Contraseña'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
