import 'package:flutter/material.dart';
import 'package:gaspayapp/controllers/auth_controller.dart';

import 'package:gaspayapp/pages/login_page.dart';
import 'package:gaspayapp/widgets/large_buttons.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthController controller = Get.find();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage("images/background.png"))),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        height: 200,
                        width: 200,
                        child: Image.asset("images/logo.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const LoginPage());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 20, top: 20),
                          alignment: Alignment.center,
                          child: const Text(
                            "Sign up",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
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
                cursorColor: Colors.indigo,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  hintText: "Full Name",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  controller.name.value = value;
                },
                style: const TextStyle(fontSize: 17),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
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
                cursorColor: Colors.indigo,
                onChanged: (value) {
                  controller.phone.value = value;
                },
                style: const TextStyle(fontSize: 17),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a valid phone number";
                  } else if (value.length < 9) {
                    return "Please enter a valid phone number";
                  } else if (value.startsWith("0")) {
                    return "Remove the 0 from the beginning of your phone number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixText: controller.phone.value.isEmpty ? "+233 " : "",
                  icon: const Icon(
                    Icons.phone_android,
                    color: Colors.grey,
                  ),
                  hintText: "Phone Number",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50),
            //     color: Colors.black26,
            //     boxShadow: const [
            //       BoxShadow(
            //           offset: Offset(0, 10),
            //           blurRadius: 50,
            //           color: Colors.white)
            //     ],
            //   ),
            //   alignment: Alignment.center,
            //   child: TextFormField(
            //     cursorColor: Colors.indigo,
            //     controller: id,
            //     decoration: const InputDecoration(
            //       icon: Icon(
            //         Icons.numbers,
            //         color: Colors.grey,
            //       ),
            //       hintText: "Enter national ID number",
            //       enabledBorder: InputBorder.none,
            //       focusedBorder: InputBorder.none,
            //     ),
            //   ),
            // ),

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
                cursorColor: Colors.indigo,
                onChanged: (value) {
                  controller.email.value = value;
                },
                style: const TextStyle(fontSize: 17),
                validator: (value) {
                  if (!value!.validateEmail()) {
                    return "Please enter a valid email";
                  }else if (value.isEmpty) {
                    return "Please enter email address";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: "Email Address",
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
                obscureText: true,
                onChanged: (value) {
                  controller.password.value = value;
                },
                style: const TextStyle(fontSize: 17),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please create a password";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                cursorColor: Colors.indigo,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.vpn_key_outlined,
                    color: Colors.grey,
                  ),
                  hintText: "Password",
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
                obscureText: true,
                onChanged: (value) {
                  controller.password.value = value;
                },
                style: const TextStyle(fontSize: 17),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please create a pin";
                  } else if (value.length > 4) {
                    return "Password must be 4 characters";
                  }
                  return null;
                },
                cursorColor: Colors.indigo,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.vpn_key_outlined,
                    color: Colors.grey,
                  ),
                  hintText: "Enter 4 digit pin",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(50),
            //     color: Colors.black26,
            //     boxShadow: const [
            //       BoxShadow(
            //           offset: Offset(0, 10),
            //           blurRadius: 50,
            //           color: Colors.white)
            //     ],
            //   ),
            //   alignment: Alignment.center,
            //   child: TextFormField(
            //     obscureText: true,
            //     controller: cPassword,
            //     cursorColor: Colors.indigo,
            //     decoration: const InputDecoration(
            //       icon: Icon(
            //         Icons.vpn_key,
            //         color: Colors.grey,
            //       ),
            //       hintText: "Confirm Password",
            //       enabledBorder: InputBorder.none,
            //       focusedBorder: InputBorder.none,
            //     ),
            //   ),
            // ),
            isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                  )
                : Container(
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 10),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    height: 54,
                    child: AppLargeButton(
                      onTap: () {
                        if (!_formKey.currentState!.validate()) return;
                        setState(() {
                          isLoading = true;
                        });
                        controller.signup().then((value) {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: const Text("Verification Sent"),
                                  content: Text(
                                      "A verification link has been sent to ${controller.email.value}"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Get.to(() => const LoginPage());
                                        },
                                        child: const Text("Okay"))
                                  ],
                                );
                              }));
                        }).catchError((e) {
                          setState(() {
                            isLoading = false;
                          });
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: const Text("Error Ocurred!"),
                                  content: Text("$e"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Okay"))
                                  ],
                                );
                              }));
                        });
                      },
                      text: "Sign Up",
                      textColor: Colors.white,
                    ),
                  ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: () => {Get.to(const LoginPage())},
                    child: const Text(
                      " Sign In",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
