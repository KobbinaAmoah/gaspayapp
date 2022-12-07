import 'package:flutter/material.dart';
import 'package:gaspayapp/component/colors.dart';

void main()=>runApp(const MaterialApp(
  home: Deposit(),
  debugShowCheckedModeBanner: false,
));

class Deposit extends StatefulWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.backGroundColor,
      body: SizedBox(
        child: Stack(
          children: [
            //_headSection(),
            // Obx((){
            //   if(_controller.loading == false){
            //     return Center(
            //       child: Container(
            //           width: 100,
            //           height: 100,
            //           child: const CircularProgressIndicator()),
            //     );
            //   }else{
            //     return _listbills();
            //   }
            // }),
            // _payButton(),
            const Positioned(
                left: 10,
                top: 70,
                child: Text(
                  "Pending ",
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                )),
            const Positioned(
                right: 50,
                top: 120,
                child: Text(
                  "Payments",
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ))
          ],
        ),
      ),
    );
    //   appBar: AppBar(leading: Icon(
    //     Icons.notes,
    //     size: 30,
    //     color: Colors.white,
    //   ),
    //   toolbarHeight: 38,
    //   backgroundColor: Colors.grey,
    //   elevation: 0,
    //   actions: [
    //     Padding(padding: EdgeInsets.only(right: 15.0),
    //     child: Icon(
    //       Icons.info,
    //       size: 30,
    //       color: Colors.white,
    //     )
    //     )
    //   ]
    // ),
  }
  Widget body(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100)
            )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "DEPOSIT",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50
                  ),
                ),
            Text("Please fill the form to complete payment",
              style: TextStyle(
                color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
