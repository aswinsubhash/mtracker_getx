import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Column(
              children: [
                Image(
                    width: MediaQuery.of(context).size.width * 0.8,
                    image:
                        const AssetImage('assets/images/onboard_logo.png')),
                Text(
                  'Save Your Money With \n Mtracker',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 20, 5, 64))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'A money manager you can \ntrust for life',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 126, 123, 123)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.off(ProfileView());
                  },
                  child: const Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 101, 209, 190),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(150, 40),
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
