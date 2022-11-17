import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingWidget extends StatelessWidget {
  SettingWidget(
      {Key? key,
      required this.stext,
      required this.sicon,
      this.trail = const Text('')})
      : super(key: key);
  String stext;
  IconData sicon;
  Widget trail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        sicon,
        color: Colors.black,
        size: 25,
      ),
      title: Text(
        stext,
        style: const TextStyle(fontSize: 20),
      ),
      trailing: trail,
    );
  }
}
