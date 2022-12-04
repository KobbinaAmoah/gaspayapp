import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaspayapp/widgets/large_buttons.dart';
import 'dart:math' as math;


class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Color(0xFFecf1f4),
      appBar: myAppBar(title: 'Deposit', implyLeading: true, context: context),
      bottomSheet: Container(
        color: Color(0xFFecf1f4),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: AppLargeButton(
          // color: Color(0xFFf1f4f8),
          // context: context,
         // callback: () {},
          text: 'Send Money',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFecf1f4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20, right: 5),
                          child: Text('\$20,000.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.white)),
                        ),
                      ],
                    ),

                    customColumn(
                        title: 'CARD NUMBER', subtitle: '3829 4820 4629 5025'),

                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 70,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
                    color: Color(0xFFecf1f4),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFecf1f4),
                    ),
                    child: Icon(Icons.keyboard_backspace_rounded, color: Colors.white.withOpacity(0.5), size: 18),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 18,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(50)),
                    color: Color(0xFFecf1f4),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFecf1f4),
                    ),
                    child: Transform.rotate(
                      angle: math.pi,
                      child: const Icon(Icons.keyboard_backspace_rounded,
                          color: Colors.white, size: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF73be93),
                border: Border.all(color: Color(0xFF73be93))            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$1600.00',
                          style: TextStyle(
                              color: Color(0xFF73be93),
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color(0xFF73be93),
                          ),
                          child: Row(
                            children: [
                              Text('USD',
                                  style: TextStyle(
                                      color: Color(0xFF73be93),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Icon(CupertinoIcons.chevron_down,
                                  color: Color(0xFF73be93),
                                  size: 18)
                            ],
                          )),
                    ],
                  ),
                ),
                Divider(color: Color(0xFF73be93), thickness: 2),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text('Send Money Purpose',
                        style:
                        TextStyle(color: Color(0xFF6f7c8b)))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customColumn({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(),
            style:
            TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.5))),
        Text(subtitle,
            style:
            TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8))),
      ],
    );
  }
}

myAppBar({required String title, required bool implyLeading, required BuildContext context}) {
}