import 'package:blog_minimal/models/user.dart';
import 'package:blog_minimal/screens/signin.dart';
import 'package:blog_minimal/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService authService = AuthService();
 var   _password,_confirmpassword;
  bool _isHidden = false;
  bool _isHiddens = false;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserPrimary>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Sign Up',
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
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        labelText: 'Email'),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      setState(() {
                        userdata.username = value;
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
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isHidden = !_isHidden;
                              });
                            }),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        labelText: 'Password'),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    }),
                Container(
                  padding: const EdgeInsets.all(5),
                ),
                TextField(
                    obscureText: !_isHiddens,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.security),
                        suffixIcon: IconButton(
                            icon: Icon(
                              _isHiddens
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isHiddens = !_isHiddens;
                              });
                            }),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        labelText: 'Confirm Password'),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      setState(() {
                        _confirmpassword = value;
                      });
                    }),
                  const Padding(padding: EdgeInsets.all(5)),
                Center(
                  child: SizedBox(
                      width: width * 0.5,
                      height: height * 0.06,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff11586b))),
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            if (_password == _confirmpassword) {
                              dynamic userCredential =
                                  await authService.signIncreat(
                                      userdata.username.toString(),
                                      _password.toString());
                            
                              if (userCredential == null) {
                                Fluttertoast.showToast(
                                    msg: 'Error !!! Enter the details',
                                    backgroundColor: Colors.black);
                                    
                              } else {
                                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()),
                          );
                              }
                            }
                          },
                          child: const Text("Sign-Up"))),
                )
              ],
            ),
          )),
    );
  }
}
