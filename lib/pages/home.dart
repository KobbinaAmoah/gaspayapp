import 'package:flutter/material.dart';
import 'package:gaspayapp/component/colors.dart';
import 'package:gaspayapp/controllers/data_controllers.dart';
import 'package:gaspayapp/controllers/payment_controller.dart';
import 'package:gaspayapp/pages/send_money.dart';
import 'package:gaspayapp/pages/pin_verify.dart';
import 'package:gaspayapp/pages/scan_page.dart';
import 'package:gaspayapp/pages/login_page.dart';
import 'package:gaspayapp/widgets/buttons.dart';
import 'package:gaspayapp/widgets/large_buttons.dart';
import 'package:gaspayapp/widgets/text_size.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataController _controller = Get.put(DataController());
  final _paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    print(_controller.list);
    double h = MediaQuery.of(context).size.height;
    //double w = MediaQuery.of(context).size.width;
    return Scaffold(
      //     appBar: AppBar(leading: Icon(
      //     Icons.notes,
      //     size: 30,
      //     color: Colors.white,
      // ),
      // toolbarHeight: 30,
      // elevation: 0,
      // backgroundColor: Colors.transparent,
      // actions:[
      // Padding(padding: EdgeInsets.only(right: 15.0),
      // child: Icon(
      // Icons.info,
      // size: 30,
      // color: Colors.white,
      // )
      // )
      // ],
      //     ),
      //
      backgroundColor: AppColor.backGroundColor,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (_controller.loading == false) {
                return Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      child: const CircularProgressIndicator()),
                );
              } else {
                return _listbills();
              }
            }),
            _payButton(),
            const Positioned(
                left: 10,
                top: 70,
                child: Text(
                  "Pending ",
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            const Positioned(
                right: 50,
                top: 120,
                child: Text(
                  "Payments",
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  _headSection() {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          _mainbackground(),
          _curveImageContainer(),
          _buttoncontainer(),
          //_textContainer(),
        ],
      ),
    );
  }

  _buttoncontainer() {
    return Positioned(
        right: 50,
        bottom: 0,
        child: GestureDetector(
            onTap: () {
              showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext bc) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 180,
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              child: Container(
                                color: const Color(0xFFeef1f4).withOpacity(0.5),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height - 260,
                              )),
                          Positioned(
                              right: MediaQuery.of(context).size.width*0.11,
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(6),
                                width: MediaQuery.of(context).size.width*0.18,
                                height: MediaQuery.of(context).size.height*0.45,
                                decoration: BoxDecoration(
                                  color: AppColor.mainColor,
                                  borderRadius: BorderRadius.circular(29),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    AppButtons(
                                      icon: Icons.cancel,
                                      iconColor: AppColor.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      text: "Close",
                                    ),
                                    AppButtons(
                                      icon: Icons.monetization_on,
                                      iconColor: AppColor.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () {
                                        Get.to(const Deposit());
                                      },
                                      text: "Deposit",
                                    ),
                                    AppButtons(
                                      icon: Icons.qr_code_scanner,
                                      iconColor: AppColor.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () {
                                        Get.to(const Scanpage());
                                      },
                                      text: "Scan to Pay",
                                    ),
                                    AppButtons(
                                      icon: Icons.history,
                                      iconColor: AppColor.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () {
                                        Get.to(const HomePage());
                                      },
                                      text: "History",
                                    ),
                                    AppButtons(
                                      icon: Icons.door_back_door_outlined,
                                      iconColor: AppColor.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () {
                                        Get.to(() => const LoginPage());
                                      },
                                      text: "Logout",
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("images/lines.png")),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(0, 1),
                      color: const Color(0xFF11324d).withOpacity(0.2))
                ],
              ),
            )));
  }

  _mainbackground() {
    return Positioned(
        child: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("images/background.png"))),
    ));
  }

  _curveImageContainer() {
    return Positioned(
        left: 0,
        right: -5,
        bottom: 0,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("images/curve.png"))),
        ));
  }

  _listbills() {
    return Positioned(
        top: 250,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              itemCount: _controller.list.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, right: 20),
                  height: 110,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(1, 1),
                            blurRadius: 20.5,
                            spreadRadius: 10)
                      ]),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              _controller.list[index]["img"]))),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      _controller.list[index]["brand"],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.mainColor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      _controller.list[index]["date"],
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.idColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedText(
                                text: _controller.list[index]["more"],
                                color: AppColor.green),
                            const SizedBox(
                              height: 0,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _controller.list[index]["status"] =
                                        !_controller.list[index]["status"];
                                    print(_controller.list[index]["status"]);
                                    _controller.list.refresh();
                                    if (_controller.list[index]["status"] ==
                                        false) {
                                      _paymentController
                                          .removeCart(_controller.list[index]);
                                    } else {
                                      _paymentController
                                          .addToCart(_controller.list[index]);
                                    }
                                  },
                                  child: Container(
                                    width: 70,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: _controller.list[index]
                                                    ["status"] ==
                                                false
                                            ? AppColor.selectBackground
                                            : AppColor.green),
                                    child: Text(
                                      "Select",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: _controller.list[index]
                                                      ["status"] ==
                                                  false
                                              ? AppColor.selectColor
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Text(
                                  "\$" + _controller.list[index]["due"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: AppColor.selectColor),
                                ),
                                Text(
                                  "status",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.idColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 5,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: AppColor.halfOval,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )));
  }

  _payButton() {
    return Positioned(
        bottom: 10,
        child: AppLargeButton(
          onTap: () {
            Get.to(() => Verify());
          },
          text: "Pay Bills",
          textColor: Colors.white,
        ));
  }

  // _textContainer() {
  //   return Stack(
  //     children: [
  //       Positioned(
  //           left: 0,
  //           top: 100,
  //           child: Text(
  //             "Gas Pay",
  //             style: TextStyle(
  //                 fontSize: 70,
  //                 fontWeight: FontWeight.bold,
  //                 color: Color(0xFF293952)
  //             ),
  //           )),
  //       Positioned(
  //           left: 40,
  //           top: 80,
  //           child: Text(
  //             "Gas Pay",
  //             style: TextStyle(
  //                 fontSize: 50,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.white
  //             ),
  //           )),
  //     ],
  //   );
  // }
}
