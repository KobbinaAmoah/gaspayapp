import 'package:gaspayapp/services/data_services.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var list = [].obs;
  final service =  DataServices();
  var _loading = false.obs;

  get loading => _loading.value;

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  get newList => list.where((e) => e["status"]).map((e) => e).toList();

  _loadData() async {
    _loading.value = false;
    try {
      var info = service.getUsers();
      list.addAll(await info);
    } catch (e) {
      print("Encountered an error!!");
      print(e);
    } finally {
      _loading.value = true;
    }
  }

  Future<void> addItem(Map<String, dynamic> item) async {
      list.add(item);
  }
  void removeItem(String id) {
    return list.removeWhere((e) => e["id"] == id);
  }
}
