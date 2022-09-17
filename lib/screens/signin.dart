import 'package:blog_minimal/models/user.dart';
import 'package:blog_minimal/screens/home_page.dart';
import 'package:blog_minimal/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key ?key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

var _password;
  bool _isHidden = false;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    final userdata=Provider.of<UserPrimary>(context);
    final AuthService authService = AuthService();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Sign In',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: width,
                    child: Image.asset(
                      'assets/images/logo-png.png',
                      width: width * 0.5,
                      height: height * 0.3,
                    )),
                 TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.account_circle),
                    suffixIcon: const Icon(Icons.create_rounded),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    labelText: 'Email'),
                        textInputAction: TextInputAction.next,
                onChanged: (value) {
                  setState(() {
                     userdata.username=value;
                  });
                }),
            Container(
              padding: const EdgeInsets.all(5),
            ),
            TextField(
                obscureText: !_isHidden,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.security),
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        }),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    labelText: 'Password'),
                        textInputAction: TextInputAction.next,
                onChanged: (value) {
                 setState(() {
                   _password=value;
                 });
                }),
                       const Padding(padding: EdgeInsets.all(5)),
                Center(
                  child: SizedBox(
                      width: width * 0.5,
                      height: height * 0.06,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(const Color(0xff11586b))),
                           onPressed: () async {
                                    dynamic result = await authService.signInAnon(
                              userdata.username.toString(),_password.toString());
                          if (result == null) {
                            // ignore: avoid_print
                            Fluttertoast.showToast(
                              msg: ' Error Cannot log in  !!! ',
                            );
                          } else {
                                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  HomePage()),
                          );
                          }
                          },
                          child: const Text("Sign-In"))),
                )
              ],
            ),
          )),
    );
  }
}
