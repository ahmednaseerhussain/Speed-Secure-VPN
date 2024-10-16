import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/ad_helper.dart';
import '../helpers/my_dialogs.dart';
import '../helpers/pref.dart';
import '../models/vpn.dart';
import '../models/vpn_config.dart';
import '../services/vpn_engine.dart';
import 'location_controller.dart'; // Import the LocationController

class HomeController extends GetxController {
  final Rx<Vpn> vpn = Pref.vpn.obs;
  final vpnState = VpnEngine.vpnDisconnected.obs;
  final LocationController locationController = Get.put(LocationController());

  void connectToVpn() async {
    // Automatically select the first VPN if none is selected
    if (vpn.value.openVPNConfigDataBase64.isEmpty) {
      await locationController.getVpnData(); // Ensure VPN data is loaded
      if (locationController.vpnList.isNotEmpty) {
        vpn.value = locationController.vpnList.first; // Auto-select the first available VPN
      } else {
        MyDialogs.info(msg: 'No VPN servers available to connect.');
        return;
      }
    }

    if (vpnState.value == VpnEngine.vpnDisconnected) {
      // Decode VPN configuration
      final data = Base64Decoder().convert(vpn.value.openVPNConfigDataBase64);
      final config = Utf8Decoder().convert(data);
      final vpnConfig = VpnConfig(
        country: vpn.value.countryLong,
        username: 'vpn',
        password: 'vpn',
        config: config,
      );

      // Show interstitial ad and then connect to VPN
      AdHelper.showInterstitialAd(onComplete: () async {
        await VpnEngine.startVpn(vpnConfig);
        vpnState.value = VpnEngine.vpnConnected; // Update VPN state after connection
      });
    } else {
      // Stop VPN if already connected
      await VpnEngine.stopVpn();
      vpnState.value = VpnEngine.vpnDisconnected; // Update VPN state after disconnection
    }
  }

  // VPN button color based on the current state
  Color get getButtonColor {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return Color(0xff6a6b9d);
      case VpnEngine.vpnConnected:
        return Colors.green;
      default:
        return Colors.orangeAccent;
    }
  }
}
