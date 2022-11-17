// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mtracker/app/data/model/transaction_model.dart';

import 'app/modules/settings/controllers/settings_controller.dart';
import 'app/routes/app_pages.dart';

const saveKey = 'profile name';
const themeKey = "themekey";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  final settingsController = Get.put(SettingsController());
  runApp(
    GetBuilder<SettingsController>(
      builder: (controller) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData(primaryColor: const Color.fromARGB(255, 101, 209, 190)),
        );
      },
    ),
  );
}
