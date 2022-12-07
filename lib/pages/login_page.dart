import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaspayapp/component/error_dialog.dart';
import 'package:gaspayapp/controllers/auth_controller.dart';
import 'package:gaspayapp/pages/home.dart';
import 'package:gaspayapp/pages/scan_page.dart';
import 'package:gaspayapp/pages/sign_up.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../widgets/large_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static String id = "/login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final AuthController controller = Get.put(AuthController());
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: Image.asset("images/logo.png"),
                          height: 200,
                          width: 200,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(const LoginPage());
                            },
                          child: Container(
                            margin: const EdgeInsets.only(right: 20, top: 20),
                            alignment: Alignment.center,
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontSize: 25, color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black26,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white)
                ],
              ),
              alignment: Alignment.center,
              child: TextFormField(
                onChanged: (value) {
                  controller.email.value = value;
                },
                validator: (value) {
                  if (!value.validateEmail()) {
                    return "Please enter valid email";
                  }
                  return null;
                },
                cursorColor: Colors.indigo,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: "Enter Email Address",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black26,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white)
                ],
              ),
              alignment: Alignment.center,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
                obscureText: true,
                cursorColor: Color.fromARGB(245, 198, 182, 203),
                style: const TextStyle(fontSize: 17),
                onChanged: (value) {
                  controller.password.value = value;
                },
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Colors.grey,
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),

            Container(
                margin: const EdgeInsets.only(top: 10, right: 20, bottom: 10),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: const Text("Forgot Password?",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      )),
                  onTap: () => {},
                )),
            isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                  )
                : AppLargeButton(
                    onTap: () {
                      if (!_formKey.currentState!.validate()) return;
                      setState(() {
                        isLoading = true;
                      });

                      controller.login().then((value) {
                        if (value) {
                          Get.offAll(() => const Scanpage());
                        }
                      }).catchError((e) {
                        setState(() {
                          isLoading = false;
                        });
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return ErrorDialog(e.toString());
                            }));
                      });
                    },
                    text: "LOGIN",
                    textColor: Colors.white,
                  ).paddingSymmetric(horizontal: 20),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have account?"),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignUpScreen());
                    },
                    child: const Text(
                      " Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
