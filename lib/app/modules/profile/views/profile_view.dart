import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final _textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image(
                      width: MediaQuery.of(context).size.width * 0.6,
                      image: const AssetImage(
                          'assets/images/MTRACKER LOGO CLR.png'),
                    ),
                  ),
                  Text(
                    'What should we call \n you?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.signika(
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                        color: const Color.fromARGB(255, 74, 74, 74)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 350,
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 228, 226),
                        borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                      controller: _textcontroller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: 'Enter Your Nick Name',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 143, 143, 143)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 70,
                    width: 320,
                    child: Text(
                      'By clicking the submit button below,i here by agree to accept the following terms and conditions governing my \nuse of Mtracker app.I further refirm my acceptance of the \ngeneral terms and conditions',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 109, 108, 108)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        profileController.checkLogin(_textcontroller);
                      },
                      child: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 101, 209, 190),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          minimumSize: const Size(150, 40)))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
