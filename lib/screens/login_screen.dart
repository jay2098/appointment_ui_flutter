import 'package:appointment_ui/screens/my_appointment.dart';
import 'package:appointment_ui/util/color_res.dart';
import 'package:appointment_ui/util/string_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorRes.blue,
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20, top: MediaQuery.of(context).size.height * 0.10),
                  child: Text(
                    StringRes.welcomeBack,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: ColorRes.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 40),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringRes.login,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorRes.blue,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        StringRes.email,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      validator: (String value) {
                                        Pattern pattern =
                                            r'^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})|([0-9]{10})+$';
                                        RegExp regex = new RegExp(pattern);
                                        if (value.isEmpty) {
                                          return 'Please enter Email';
                                        } else {
                                          if (!regex.hasMatch(value))
                                            return 'Enter valid Email';
                                          else
                                            return null;
                                        }
                                      },
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      obscureText: false,
                                      style: TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                        hintText: "Enter email",
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        StringRes.password,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      validator: (String value) {
                                        if (value == null || value.isEmpty) {
                                          return "Enter password here";
                                        } else if (value.length < 8) {
                                          return "Password must be at least 8 character";
                                        } else
                                          return null;
                                      },
                                      maxLines: 1,
                                      keyboardType: TextInputType.text,
                                      controller: passwordController,
                                      obscureText: false,
                                      style: TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                        hintText: "Enter password",
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: InkWell(
                                  onTap: () {
                                    validateInput();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: ColorRes.blue,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: ColorRes.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: ColorRes.white,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringRes.dontHaveAccount + ' ',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                StringRes.signUp,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorRes.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validateInput() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyAppointment(),
        ),
      );
    } else {}
  }
}
