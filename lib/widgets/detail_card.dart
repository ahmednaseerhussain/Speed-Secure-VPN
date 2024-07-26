import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';

class DetailCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final String cardName;
  final String cardData;
  const DetailCard(
      {super.key,
      required this.iconColor,
      required this.cardName,
      required this.icon,
      required this.cardData});

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mq.height * 0.18,
      width: mq.width * 0.4,
      child: Card(
        color: Color(0xff23263e),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: mq.height * .02,
                  left: mq.height * .02,
                  top: mq.height * .04,
                  bottom: mq.height * .02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    widget.icon,
                    color: widget.iconColor,
                  ),
                  SizedBox(
                    width: mq.width * 0.02,
                  ),
                  Text(
                    widget.cardName,
                    style: TextStyle(
                        color: Color(0xff6a6b9d), fontSize: mq.height * 0.02),
                  )
                ],
              ),
            ),
            Container(
              width: mq.width * 0.9,padding: EdgeInsets.symmetric(horizontal: mq.width*0.05),
              child: Center(
                child: Text(
                             widget.cardData,
                  style: TextStyle(
                    fontSize: mq.height * 0.025,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  maxLines: 1 ,
                   overflow: TextOverflow.clip,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
