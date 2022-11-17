import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mtracker/app/data/controller/data_controller.dart';
import 'package:mtracker/app/modules/settings/views/widget/privacy_policy.dart';

class SettingsController extends GetxController {
  TimeOfDay? pickedTime;
  TimeOfDay currentTimme = TimeOfDay.now();
  final messageController = TextEditingController();

  void showResetAlert() {
    final dataController = Get.put(DataController());
    Get.defaultDialog(content: Text("Are you sure want to reset?"), actions: [
      ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel")),
      ElevatedButton(
          onPressed: () {
            dataController.resetData();
          },
          child: Text("Yes"))
    ]);
  }

  void showPrivacyBottomSheet() {
    Get.bottomSheet(PrivacyPolicy(), backgroundColor: Colors.white);
  }

  sendMail() async {
    // ignore: deprecated_member_use
    if (!await launch(
        "mailto:aswinsubhash3@gmail.com?subject=Feedback About Mtracker App&body=")) {
      throw 'could not launch';
    }
  }

  void timeSet(context) async {
    pickedTime =
        await showTimePicker(context: context, initialTime: currentTimme);
  }
}
