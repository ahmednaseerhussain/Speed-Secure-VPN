import 'package:get/get.dart';

import '../apis/apis.dart';
import '../helpers/pref.dart';
import '../models/vpn.dart';

class LocationController extends GetxController {
  List<Vpn> vpnList = Pref.vpnList;
  final RxBool isLoading = false.obs;

  Future<void> getVpnData() async {
    isLoading.value = true;
    vpnList.clear();
    vpnList = await APIs.getVPNServers(); // Fetch VPN servers from API
    isLoading.value = false;
  }
}
