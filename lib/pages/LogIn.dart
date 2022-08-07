import 'package:ecommerce/widgets/LogIn/LogSignInAppBar.dart';
import 'package:ecommerce/widgets/Me/MeAppBar.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), child: LogSignInAppBar()),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Put image here',
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
              child: TextField(
                controller: nameController,
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
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF4C53A5),
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
                    'Sign in',
                    style: TextStyle(fontSize: 20, color: Color(0xFF4C53A5)),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}