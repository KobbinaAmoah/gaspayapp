import 'package:flutter/material.dart';
import 'package:gaspayapp/pages/home.dart';
import 'package:get/get.dart';

import '../widgets/large_buttons.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static String id = "/login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
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
                          alignment: Alignment.topRight,
                          child: const Text(
                            "Sign In",
                            style:
                            TextStyle(fontSize: 25, color: Colors.black),
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
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black26,
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white
                  )
                  ],
                ),
                alignment: Alignment.center,
                child: TextField(
                  cursorColor: Colors.indigo,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    hintText: "Enter Phone Number",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black26,
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white
                  )
                  ],
                ),
                alignment: Alignment.center,
                child: TextField(
                  obscureText: true,
                  cursorColor: Color(0xFF5C6B6CB),
                  decoration: InputDecoration(
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

                  margin: EdgeInsets.only(top: 10, right: 20),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Text("forgot Password?"),
                    onTap: () =>{

                    },
                  )
              ),
              GestureDetector(

                onTap: () =>
                {
                  /*onclick code here*/

                },
                child: AppLargeButton(

                  onTap: (){Get.to(()=>HomePage());},
                  text: "LOGIN",
                  textColor: Colors.white,
                ),
                // child: Container(
                //   margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   alignment: Alignment.center,
                //   height: 54,
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //         colors: [(new Color(0xFF5C6B6CB)), (new Color(0xFF5C6B6CB))],
                //         begin: Alignment.centerLeft,
                //         end: Alignment.centerRight
                //     ),
                //     boxShadow: [BoxShadow(
                //         offset: Offset(0, 10),
                //         blurRadius: 50,
                //         color: Colors.white
                //     )],
                //   ),
                //   child: Text(
                //     "LOGIN",
                //     style: TextStyle(
                //         color: Colors.white
                //     ),
                //   ),
                // ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account?"),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()
                        ))
                      },
                      child: Text(

                        "Register Now",
                        style: TextStyle(
                            color: Colors.purple
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]
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