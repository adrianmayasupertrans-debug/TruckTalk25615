import 'package:shared_preferences/shared_preferences.dart';

class PurchaseService {
  Future<bool> isPurchased() async {
    final p = await SharedPreferences.getInstance();
    return p.getBool("paid") ?? false;
  }

  Future<void> buy() async {
    final p = await SharedPreferences.getInstance();
    await p.setBool("paid", true);
  }
}
