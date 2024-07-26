import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/apis/apis.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/ip_details.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final ipData = IPDetails.fromJson({}).obs;
    APIs.getIPDetails(ipData: ipData);
    final height = MediaQuery.of(context).size.height * 1;

    return Obx(
      () => Drawer(
        backgroundColor: Color(0xff13152a),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,radius: mq.height*0.04,
                    child: Icon(Icons.person,color: Colors.grey,size:mq.height*0.035 ,),
                  ),
                  SizedBox(height: height * 0.01),
                  const Text(
                    'SpeedSecure VPN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),

                //flag
                leading:
                    Icon(CupertinoIcons.location_solid, color: Colors.blue),

                //title
                title: Text('IP Address',style: TextStyle(color: Colors.white),),

                //subtitle
                subtitle: Text(ipData.value.query,style: TextStyle(color: Colors.white),),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),

                //flag
                leading: Icon(Icons.business, color: Colors.orange),

                //title
                title: Text('Internet Provider',style: TextStyle(color: Colors.white),),

                //subtitle
                subtitle: Text(ipData.value.isp,style: TextStyle(color: Colors.white),),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),

                //flag
                leading: Icon(CupertinoIcons.location, color: Colors.pink),

                //title
                title: Text('Location',style: TextStyle(color: Colors.white),),

                //subtitle
                subtitle: Text(
                  ipData.value.country.isEmpty
                      ? 'Fetching ...'
                      : '${ipData.value.city}, ${ipData.value.regionName}, ${ipData.value.country}',style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),

                //flag
                leading:
                    Icon(CupertinoIcons.location_solid, color: Colors.cyan),

                //title
                title: Text('Pin-code',style: TextStyle(color: Colors.white),),

                //subtitle
                subtitle: Text(ipData.value.zip,style: TextStyle(color: Colors.white),),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),

                //flag
                leading: Icon(CupertinoIcons.time, color: Colors.green),

                //title
                title: Text('Timezone',style: TextStyle(color: Colors.white),),

                //subtitle
                subtitle: Text(ipData.value.timezone,style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
