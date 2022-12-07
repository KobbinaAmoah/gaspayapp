import 'package:flutter/material.dart';

class Inputpage extends StatelessWidget {
  const Inputpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
        child: ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      prototypeItem: Container(
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
          // onChanged: (value) {
          //   controller.password.value = value;
          // },
          decoration: const InputDecoration(
            icon: Icon(
              Icons.vpn_key,
              color: Colors.grey,
            ),
            hintText: "Enter Pin",
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    )
        )
    );
  }
}