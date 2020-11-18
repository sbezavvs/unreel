import 'package:Unreel/src/logic/utils/app_theme.dart';
import 'package:Unreel/src/views/main_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
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
                  )
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
            'Log in or Sign up',
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
