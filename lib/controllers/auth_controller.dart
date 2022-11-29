import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaspayapp/model/user_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;
  RxString name = "".obs;
  RxString phone = "".obs;
  final _auth = FirebaseAuth.instance;

  Future<bool> login() async {

    try {
      var cred = await _auth.signInWithEmailAndPassword(
          email: email.value, password: password.value);
      var user = cred.user;
      if (user != null
          //TODO: && user.emailVerified
          ) {
      
        return true;
      } else {
      
        return throw (FirebaseAuthException(
            message: "Please verify your email", code: "0"));
      }
    } on FirebaseAuthException catch (e) {
    
      throw (e.message ?? "Something went wrong");
    } catch (e) {
    
      rethrow;
    }
  }

  Future<bool> signup() async {

    try {
      var cred = await _auth.createUserWithEmailAndPassword(
          email: email.value, password: password.value);
      var user = cred.user;
      if (user != null && !user.emailVerified) {
        user.sendEmailVerification();
        user.updateDisplayName(name.value);
        UserModel newUser = UserModel(
            name: name.value,
            email: email.value,
            phone: phone.value,
            createdAt: DateTime.now(),
            uid: user.uid);
        await newUser.saveNewUser();
      
        return true;
      } else {
      
        return throw (FirebaseAuthException(
            message: "Something went wrong", code: "0"));
      }
    } on FirebaseAuthException catch (e) {
    
      throw (e.message ?? "Something went wrong");
    } catch (e) {
    
      rethrow;
    }
  }
}
