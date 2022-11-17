import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtracker/app/modules/home/views/widget/common_widget.dart';
import 'package:mtracker/app/modules/settings/views/widget/setting_widget.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black,fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Column(
              children: [
                commonSizedBox(10.0),
                GestureDetector(
                  onTap: () {
                    settingsController.showResetAlert();
                  },
                  child: SettingWidget(
                      stext: 'Reset Data', sicon: Icons.restart_alt),
                ),
                InkWell(
                  onTap: () {
                    settingsController.showPrivacyBottomSheet();
                  },
                  child: SettingWidget(
                    stext: 'Privacy Policy',
                    sicon: Icons.privacy_tip_outlined,
                  ),
                ),
                SettingWidget(
                  stext: 'Share',
                  sicon: Icons.share_rounded,
                ),
                SettingWidget(
                  stext: 'Rate This App',
                  sicon: Icons.star,
                ),
                InkWell(
                  onTap: () {
                    settingsController.sendMail();
                  },
                  child: SettingWidget(
                      stext: 'Feedback', sicon: Icons.feedback),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SettingWidget(
                    stext: 'About Us',
                    sicon: Icons.info,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
