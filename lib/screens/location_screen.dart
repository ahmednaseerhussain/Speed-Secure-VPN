import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../controllers/location_controller.dart';
import '../controllers/native_ad_controller.dart';
import '../helpers/ad_helper.dart';
import '../main.dart';
import '../widgets/vpn_card.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final _controller = LocationController();
  final _adController = NativeAdController();

  @override
  Widget build(BuildContext context) {
    if (_controller.vpnList.isEmpty) _controller.getVpnData();

    _adController.ad = AdHelper.loadNativeAd(adController: _adController);

    return Obx(
      () => Scaffold(
        backgroundColor: Color(0xff13152a),
        //app bar

        appBar: AppBar(
          automaticallyImplyLeading: true,
          foregroundColor: Colors.white,
          backgroundColor: Color(0xff13152a),
          title: Text(
            'VPN Locations (${_controller.vpnList.length})',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
          ),
        ),

        bottomNavigationBar:
            _adController.ad != null && _adController.adLoaded.isTrue
                ? SafeArea(
                    child: SizedBox(
                        height: 85, child: AdWidget(ad: _adController.ad!)))
                : null,

        //refresh button
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: FloatingActionButton(
              backgroundColor: Color(0xff6a6b9d),
              onPressed: () => _controller.getVpnData(),
              child: Icon(Icons.refresh)),
        ),

        body: _controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _controller.vpnList.isEmpty
                ? _noVPNFound()
                : _vpnData(),
      ),
    );
  }

  _vpnData() {
    // Sorting the VPN list by speed in descending order
    List vpnList = List.from(_controller.vpnList);
    vpnList.sort((a, b) => b.speed.compareTo(a.speed)); // Assuming speed is a numerical property

    return ListView.builder(
      itemCount: vpnList.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        top: mq.height * .015,
        bottom: mq.height * .1,
        left: mq.width * .04,
        right: mq.width * .04,
      ),
      itemBuilder: (ctx, i) => VpnCard(vpn: vpnList[i]),
    );
  }

  _noVPNFound() => Center(
        child: Text(
          'VPNs Not Found! 😔',
          style: TextStyle(
              fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      );
}
