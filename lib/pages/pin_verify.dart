import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class verify extends StatelessWidget {
  const verify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value){
                if (value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1) {},
              decoration: const InputDecoration(hintText: "0"),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value){
                if (value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: const InputDecoration(hintText: "0"),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value){
                if (value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: const InputDecoration(hintText: "0"),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value){
                if (value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: const InputDecoration(hintText: "0"),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly],
            ),
          ),
        ],
      ),

    );

  }
}
