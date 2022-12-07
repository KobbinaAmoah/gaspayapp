import 'package:flutter/material.dart';
import 'package:gaspayapp/component/colors.dart';
import 'package:gaspayapp/controllers/data_controllers.dart';
import 'package:gaspayapp/controllers/payment_controller.dart';
import 'package:gaspayapp/pages/home.dart';
import 'package:gaspayapp/widgets/buttons.dart';
import 'package:gaspayapp/widgets/large_buttons.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final PaymentController _controller = Get.find();

  double total = 0;
  @override
  void initState() {
    for (var e in _controller.cart) {
      total += double.parse(e["due"]);
      
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("images/paymentbackground.png"))),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: h * 0.14,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("images/success.png"))),
            ),
            const Text(
              "Payment Successful !",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColor.mainColor,
              ),
            ),
            SizedBox(
              height: h * 0.045,
            ),
            Container(
                height: 170,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(width: 2, color: Colors.grey.withOpacity(0.5)),
                ),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: _controller.cart.length,
                    itemBuilder: (_, index) {
                      final item = _controller.cart[index];

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 15,
                                        left: 20,
                                        right: 10,
                                        bottom: 10),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.green),
                                    child: const Icon(
                                      Icons.done,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["brand"],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.mainColor),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "ID:${item["id"]}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.idColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  "₵ ${item["due"]}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.mainColor),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      );
                    },
                  ),
                )),
            SizedBox(
              height: h * 0.05,
            ),
            Column(
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.idColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "₵ ${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 30,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: h * 0.15,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     AppButtons(
            //       text: "Share",
            //       icon: Icons.share_sharp,
            //       onTap: () {},
            //     ),
            //     SizedBox(
            //       width: 80,
            //     ),
            //     AppButtons(
            //       text: "Print",
            //       icon: Icons.print_outlined,
            //       onTap: () {},
            //     ),
            //   ],
            // ),
            SizedBox(
              height: h * 0.02,
            ),
            AppLargeButton(
              text: "Done",
              backgroundColor: Colors.white,
              textColor: AppColor.mainColor,
              onTap: () {
                Get.to(HomePage());
              },
            )
          ],
        ),
      ),
    );
  }
}
