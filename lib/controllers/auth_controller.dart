import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaspayapp/model/user_model.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
class AuthController extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;
  RxString name = "".obs;
  RxString phone = "".obs;
  RxString pin ="".obs;
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
        throw ("Please verify your email");
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
        await user.sendEmailVerification();
        await user.updateDisplayName(name.value);
        UserModel newUser = UserModel(
            name: name.value,
            email: email.value,
            phone: "+233${phone.value}",
            createdAt: DateTime.now(),
            uid: user.uid);
        await newUser.saveNewUser();
        await setValue("pin", pin.value);
        return true;
      } else {
        throw ("Something went wrong");
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      throw (e.message ?? "Something went wrong");
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
