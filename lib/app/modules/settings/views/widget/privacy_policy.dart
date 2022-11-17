import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mtracker/app/modules/home/views/widget/common_widget.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Column(
        children: [
          commonSizedBox(10.0),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          commonSizedBox(10.0),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  ' This privacy notice for Mtracker describes how and why we  might collect, store, use, and/or share your information when you use our services, such as when  you:\n Question or concern?If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at support@mtracker.com.',
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.3),
                ),
              ),
              commonSizedBox(40.0),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Done'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 101, 209, 190),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: const Size(150, 40)))
            ],
          )
        ],
      ),
    );
  }
}
