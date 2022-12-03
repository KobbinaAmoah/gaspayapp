import 'package:flutter/material.dart';
import 'package:gaspayapp/component/colors.dart';
import 'package:gaspayapp/widgets/buttons.dart';
import 'package:gaspayapp/widgets/large_buttons.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50,left: 20, right: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/paymentbackground.png")
            )
        ),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: h*0.14,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage("images/success.png")
                  )
              ),
            ),
            Text("Payment Successful !",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColor.mainColor,
            ),
            ),
            SizedBox(height: h*0.045,),
            Container(
              height: 170,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.grey.withOpacity(0.5)
                ),

              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                itemCount: 3,
                itemBuilder: (_, index){
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15, left: 20,bottom: 10),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.green
                            ),
                            child: Icon(Icons.done, size: 30, color: Colors.white,),
                          ),
                          SizedBox(height: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Petrolieum",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.mainColor
                                ),),
                              SizedBox(height: 10,),
                              Text("ID:65456356",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.idColor
                                ),)
                            ],
                          ),
                          SizedBox(height: 20,width: 60,),
                          Column(
                            children: [
                              Text(
                                "₵120.00",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.mainColor
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Divider(thickness: 2, color: Colors.grey.withOpacity(0.5),),
                    ],
                  );
                },
              ),

            )),
            SizedBox(height: h*0.05,),
            Column(
              children: [
                Text("Total Amount",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.idColor,
                  ),),
                SizedBox(height: 10,),
                Text("₵360.00",
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.w600
                  ),)
              ],
            ),
            SizedBox(height: h*0.13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButtons(text: "Share", icon: Icons.share_sharp, onTap: (){},),
                SizedBox(width: 80,),
                AppButtons(text: "Print", icon: Icons.print_outlined, onTap: (){},),
              ],
            ),
            SizedBox(height: h*0.02,),
            AppLargeButton(text: "Done", backgroundColor: Colors.white, textColor: AppColor.mainColor,onTap: (){Get.back();},)
          ],
        ),
      ),
    );
  }
}
