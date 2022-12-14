import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtracker/app/data/controller/data_controller.dart';
import 'package:mtracker/app/modules/home/views/widget/common_widget.dart';
import 'package:mtracker/app/modules/statistics/views/statistics_view.dart';
import 'package:mtracker/app/modules/statistics/views/widget/chart_widget.dart';

import '../controllers/home_controller.dart';

String? profName = '';
// ignore: prefer_typing_uninitialized_variables
var totalData;
DateTime today = DateTime.now();
DateTime now = DateTime.now();
int monthIndex = 1;
//String statDropDownValue = 'Income';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final dataController = Get.put(DataController());

    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    statDropDownValue.value = 'Expense';
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: SizedBox(
        child: GetBuilder<HomeController>(builder: (controller) {
          homeController.getTotalBalance();
          return ListView(
            children: [
              commonSizedBox(26.0),
              Row(
                children: [
                  Text(
                   "Welcome $profName",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              commonSizedBox(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      homeController.changeChipIndex(3);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.26,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: monthIndex == 3
                              ? const Color.fromARGB(255, 101, 209, 190)
                              : const Color.fromARGB(255, 214, 213, 213)),
                      alignment: Alignment.center,
                      child: Text(
                        months[now.month - 3],
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                monthIndex == 3 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      homeController.changeChipIndex(2);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.26,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: monthIndex == 2
                              ? const Color.fromARGB(255, 101, 209, 190)
                              : const Color.fromARGB(255, 214, 213, 213)),
                      alignment: Alignment.center,
                      child: Text(
                        months[now.month - 2],
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                monthIndex == 2 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      homeController.changeChipIndex(1);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.26,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: monthIndex == 1
                              ? const Color.fromARGB(255, 101, 209, 190)
                              : const Color.fromARGB(255, 214, 213, 213)),
                      alignment: Alignment.center,
                      child: Text(
                        months[now.month - 1],
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                monthIndex == 1 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              commonSizedBox(30.0),
              Column(
                children: [
                  homeController.getBalanceCard(),
                  commonSizedBox(20.0),
                  Row(
                    children: const [
                      Text(
                        'Expense',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  commonSizedBox(20.0),
                  ChartWidget(
                    height: 300,
                    entiredata: dataController.transactionDataList,
                  ),
                  commonSizedBox(20.0),
                  Row(
                    children: const [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  commonSizedBox(20.0),
                  homeController.getHomeRecentWidget(),
                  commonSizedBox(85.0),
                ],
              )
            ],
          );
        }),
      ),
    )));
  }
}
