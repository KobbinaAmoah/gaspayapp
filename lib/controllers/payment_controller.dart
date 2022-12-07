import 'package:get/get.dart';

class PaymentController extends GetxController{
  List cart = [];

  void addToCart(dynamic data){
    cart.add(data);
    print(cart.length);
  }
  void removeCart(dynamic data){
    cart.remove(data);
    print(cart.length);
  }
}