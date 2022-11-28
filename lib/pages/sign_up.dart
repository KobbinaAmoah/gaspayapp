import 'package:flutter/material.dart';
import 'package:gaspayapp/pages/home.dart';
import 'package:gaspayapp/pages/login_page.dart';
import 'package:gaspayapp/widgets/large_buttons.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
  Widget initWidget() {
    TextEditingController fullname = TextEditingController();
    TextEditingController number = TextEditingController();
    TextEditingController id = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
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
                        alignment: Alignment.topRight,
                        child: const Text(
                          "Sign up",
                          style:
                              TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ),
                    )
                  ],
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
                  hintText: "Enter Fullname",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                controller: fullname,
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
                controller: number,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.phone_android,
                    color: Colors.grey,
                  ),
                  hintText: "Enter Phone Number",
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
                cursorColor: Colors.indigo,
                controller: id,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.numbers,
                    color: Colors.grey,
                  ),
                  hintText: "Enter national ID number",
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
                cursorColor: Colors.indigo,
                controller: email,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: "Enter Email",
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
                controller: password,
                cursorColor: Colors.indigo,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.vpn_key_outlined,
                    color: Colors.grey,
                  ),
                  hintText: "Enter Password",
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
            GestureDetector(
              onTap: () => {
              Get.to(const LoginPage())
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 40, bottom: 50),
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 54,
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //       colors: [(new Color(0xFF5C6B6CB)), (new Color(0xFF5C6B6CB))],
                //       begin: Alignment.centerLeft,
                //       end: Alignment.centerRight
                //   ),
                //   boxShadow: [BoxShadow(
                //       offset: Offset(0, 10),
                //       blurRadius: 50,
                //       color: Colors.white
                //   )],
                // ),
                child: AppLargeButton(

                  onTap: () {
                    Get.to(() => const HomePage());
                    // print("Fullname: ${fullname.text}");
                    // print("email: ${email.text}");
                    // print("id: ${id.text}");
                    // print("number: ${number.text}");
                    // print("password: ${password.text}");
                    // print("cPassword: ${cPassword.text}");
                  },
                  text: "Sign Up",
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
