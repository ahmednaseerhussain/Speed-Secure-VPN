import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';

class CenterText extends StatefulWidget {
  final String text;
  final Widget value;
  const CenterText({super.key, required this.text, required this.value});

  @override
  State<CenterText> createState() => _CenterTextState();
}

class _CenterTextState extends State<CenterText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: TextStyle(color: Color(0xff5a6a86)),
        ),
        SizedBox(
          height: mq.height * 0.01,
        ),
        widget.value,
      ],
    );
  }
}
