import 'package:ecommerce/widgets/LogIn/LogSignInAppBar.dart';
import 'package:ecommerce/widgets/Me/MeAppBar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../model/http_exception.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: LogSignInAppBar()),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isHiddenPass = true;
  final chk = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState?.save();

    try {
      // Log user in
      await Provider.of<Auth>(context, listen: false).login(
        nameController.text,
        passwordController.text,
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('No user found')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('Wrong password')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        color: Color(0xFF4C53A5),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              // Container(
              //     alignment: Alignment.center,
              //     padding: const EdgeInsets.all(10),
              //     child: const Text(
              //       'Sign in',
              //       style: TextStyle(fontSize: 20),
              //     )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  // autofillHints: [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter an Email";
                    } else if (!chk.hasMatch(value)) {
                      return "Enter vaild email";
                    }
                    return null;
                  },
                  maxLength: 20,
                  // controller: nameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFF4C53A5),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF4C53A5), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF4C53A5), width: 2)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xFF4C53A5))),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    } else if (value.length <= 5) {
                      return "Password must be more than 6 fileds";
                    }
                    return null;
                  },
                  obscureText: isHiddenPass,
                  controller: passwordController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFF4C53A5),
                      ),
                      suffixIcon: InkWell(
                        onTap: (() {
                          isHiddenPass = !isHiddenPass;

                          setState(() {});
                        }),
                        child: Icon(
                          Icons.visibility,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF4C53A5), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF4C53A5), width: 2)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xFF4C53A5))),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xFF4C53A5)),
                ),
              ),
              // Container(

              //     height: 50,
              //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //     child: ElevatedButton(
              //       child: const Text('Login'),
              //       onPressed: () {
              //         print(nameController.text);
              //         print(passwordController.text);
              //       },
              //     )),
              // GestureDetector(
              //   onTap: () {
              //     Future.delayed(const Duration(milliseconds: 200), () {
              //       print(nameController.text);
              //       print(passwordController.text);
              //     });
              //   },
              //   child:
              Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      Future.delayed(const Duration(milliseconds: 200), () {
                        print(nameController.text);
                        print(passwordController.text);
                      });

                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        _submit();
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                          color: Color(0xFF4C53A5),
                          borderRadius: BorderRadius.circular(30)),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.05),
                      child: Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.045),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),

              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20, color: Color(0xFF4C53A5)),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, "/registration"),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ));
  }
}
