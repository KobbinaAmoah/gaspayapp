import 'package:flutter/material.dart';
import 'package:gaspayapp/controllers/auth_controller.dart';
import 'package:gaspayapp/pages/home.dart';
import 'package:gaspayapp/pages/sign_up.dart';
import 'package:get/get.dart';

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 300,
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage("images/background.png"))),
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
            // Container(
            //   height: 300,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
            //     color: Colors.indigoAccent,
            //     gradient: LinearGradient(
            //       colors: [(new Color(0xFF5C6B6CB)),(new Color(0xFF5C6B6CB))],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //     ),
            //   ),
            //   child: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Container(
            //           margin: EdgeInsets.only(top: 40),
            //           child: Image.asset("images/logo.png"),
            //           height: 200,
            //           width: 200,
            //         ),
            //         Container( margin: EdgeInsets.only(right: 20, top: 20),
            //           alignment: Alignment.bottomRight,
            //           child: Text(
            //             "Login",
            //             style: TextStyle(
            //               fontSize: 20,
            //               color: Colors.indigo,
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
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
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        controller.login().then((value) {
                          if (value) {
                            Get.offAll(() => const HomePage());
                          }
                        });
                      } catch (e) {
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
                      }
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


// class LoginPage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => initState();
//
//   initState() {}
//
// }
// class InitState extends State<LoginPage>{
//   @override
//   Widget build(BuildContext context) {
//     return initWidget();
//   }
//
// }
//
// Widget initWidget() {
//   return Scaffold(
//     body: SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             height: 300,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
//               color: Color(0xFFBBDEFB),
//               gradient: LinearGradient(
//                 colors: [(new Color(0xFFBBDEFB)),(new Color(0xFFE3F2FD))],
//                   begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//             ),
//           ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 40),
//                 child: Image.asset("images/logo.png"),
//                 height: 90,
//                 width: 90,
//               ),
//               Container(
//                 child: Text(
//                   "login",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Color(0xB3FFFFFF),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//           )],
//
//       ),
//     ),
//   );
// }