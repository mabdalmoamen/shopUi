import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:ui_app/models/auth_mode.dart';
import 'package:ui_app/services/main.dart';
import 'package:ui_app/shared/ui_widget/theme_ui.dart';

class Signup extends StatefulWidget {
  Signup({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Login;
  String name;
  String email;
  String password;
  String phone;
  String error;
  dynamic user;
  validateName(String val) {
    if (val.length < 4)
      return 'Name must be more than 4 charater';
    else
      return null;
  }

  validateMobile(String val) {
    if (val.length != 11)
      return 'Mobile Number must be of 11 digit';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _authMode != AuthMode.Login ? Text('SignUp') : Text(' Login'),
        centerTitle: true,
        actions: <Widget>[
          _authMode != AuthMode.Login
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _authMode = _authMode == AuthMode.Login
                          ? AuthMode.SignUp
                          : AuthMode.Login;
                    });
                  },
                  icon: FaIcon(FontAwesomeIcons.signInAlt),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      _authMode = _authMode == AuthMode.Login
                          ? AuthMode.SignUp
                          : AuthMode.Login;
                    });
                  },
                  icon: FaIcon(FontAwesomeIcons.userPlus),
                ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            children: <Widget>[
              TextFormField(
                onChanged: (String val) {
                  setState(() {
                    email = val;
                  });
                },
                validator: (val) {
                  if (!ThemeUi.regex.hasMatch(val))
                    return 'Enter Valid Email';
                  else
                    return null;
                },
                decoration: ThemeUi.inputDecorationBox.copyWith(
                    icon: FaIcon(FontAwesomeIcons.envelope),
                    labelText: 'Email',
                    hintText: 'Enter Your Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(
                    () {
                      password = val;
                    },
                  );
                },
                obscureText: true,
                decoration: ThemeUi.inputDecorationBox.copyWith(
                    icon: FaIcon(FontAwesomeIcons.eye),
                    labelText: 'Password',
                    hintText: 'Enter Your Password'),
              ),
              _authMode != AuthMode.Login
                  ? Column(
                      children: <Widget>[
                        TextFormField(
                          onChanged: (val) {
                            name = val;
                          },
                          decoration: ThemeUi.inputDecorationBox.copyWith(
                              icon: FaIcon(FontAwesomeIcons.user),
                              labelText: 'Name',
                              hintText: 'Enter Your Name'),
                          validator: (String val) {
                            if (val.length < 4)
                              return 'Name must be more than 4 charater';
                            else
                              return null;
                          },
                        ),
                        TextFormField(
                          decoration: ThemeUi.inputDecorationBox.copyWith(
                              icon: FaIcon(FontAwesomeIcons.calendar),
                              labelText: 'Birth',
                              hintText: 'Enter Your Birth'),
                          keyboardType: TextInputType.datetime,
                        ),
                        TextFormField(
                          onChanged: (val) {
                            phone = val;
                          },
                          decoration: ThemeUi.inputDecorationBox.copyWith(
                              icon: FaIcon(FontAwesomeIcons.phone),
                              labelText: 'Phone',
                              hintText: 'Enter Your Phone'),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                          ],
                          validator: (String val) {
                            if (val.length < 11)
                              return 'Name must be  11 charater';
                            else
                              return null;
                          },
                        ),
                      ],
                    )
                  : Container(),
              Container(
                padding: EdgeInsets.only(left: 40.0, top: 20.0),
                child: ScopedModelDescendant(
                  builder:
                      (BuildContext context, Widget child, MainService model) {
                    return RaisedButton(
                      child: _authMode != AuthMode.Login
                          ? Text('SignUp')
                          : Text(' Login'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          if (_authMode != AuthMode.Login) {
                            user = await model.registerFunc(email, password);
                            print(user);
                          } else {
                            user = await model.signInFun(email, password);
                          }
                          if (user == null) {
                            setState(
                              () {
                                error = 'Please Enter data';
                              },
                            );
                          } else {
                            Navigator.of(context).pushReplacementNamed('/');
                          }
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
