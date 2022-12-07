import 'package:flutter/material.dart';
import 'package:gaspayapp/component/error_dialog.dart';
import 'package:gaspayapp/controllers/data_controllers.dart';
import 'package:gaspayapp/controllers/payment_controller.dart';
import 'package:gaspayapp/pages/home.dart';
import 'package:gaspayapp/pages/payment_page.dart';
import 'package:gaspayapp/pages/sign_up.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../widgets/large_buttons.dart';
import 'package:nb_utils/nb_utils.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  // const Verify({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  final DataController _dataController = Get.find();
  final PaymentController _payController = Get.find();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Pin"),
        centerTitle: true,
        backgroundColor: Colors.white24,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 120, bottom: 45),
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
                      return "Please enter pin to verify payment";
                    } else if (value.length > 4) {
                      return "Pin must be 4 digits";
                    } else if (value.length < 4) {
                      return "Pin must be 4 digits";
                    }
                    return null;
                  },
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: const Color.fromARGB(245, 198, 182, 203),
                  style: const TextStyle(fontSize: 17),
                  controller: pinController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.pin,
                      color: Colors.grey,
                    ),
                    hintText: "Enter pin to verify payment",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              AppLargeButton(
                onTap: () {
                  if (!_formKey.currentState!.validate()) return;
                  if (pinController.text == getStringAsync("pin")) {
                    //Remove items from main list
                    for (var item in _payController.cart) {
                      _dataController.removeItem(item["id"]);
                    }
                    Get.to(() => PaymentPage());
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const ErrorDialog("Incorrect Pin");
                        });
                  }
                },
                text: "Confirm PIN",
                textColor: Colors.white,
              ).paddingSymmetric(horizontal: 20),
            ],
          )),
    );
  }
}
