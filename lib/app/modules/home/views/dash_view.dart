import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtracker/app/modules/add_transaction/views/add_transaction_view.dart';
import 'package:mtracker/app/modules/all_transaction/views/all_transaction_view.dart';
import 'package:mtracker/app/modules/home/controllers/home_controller.dart';
import 'package:mtracker/app/modules/home/views/home_view.dart';
import 'package:mtracker/app/modules/settings/views/settings_view.dart';
import 'package:mtracker/app/modules/statistics/views/statistics_view.dart';

class DashView extends GetView {
  @override
  Widget build(BuildContext context) {
    final dashController = Get.put(HomeController());
    final pages = [
      HomeView(),
      AllTransactionView(),
      AddTransactionView(),
      StatisticsView(),
      SettingsView()
    ];
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: GetBuilder<HomeController>(
          init: HomeController(),
          initState: (_) {},
          builder: (context) {
            return SizedBox(
              height: 68,
              width: 68,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor:const Color.fromARGB(255, 101, 209, 190),
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Get.to(()=>AddTransactionView());
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GetBuilder<HomeController>(
        builder: (context) {
          return Stack(
            children: [
              pages.elementAt(dashController.currentSelectedIntex),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: const Alignment(0.0, 1.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: const Color.fromARGB(255, 101, 209, 190),
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      currentIndex: dashController.currentSelectedIntex,
                      onTap: (newIntex) {
                        dashController.bottomIndex(newIntex);
                      },
                      backgroundColor: Colors.white,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home_filled,
                              size: 30,
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.list_outlined,
                              size: 30,
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.transparent,
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.bar_chart_outlined,
                              size: 30,
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.settings,
                              size: 30,
                            ),
                            label: '')
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
