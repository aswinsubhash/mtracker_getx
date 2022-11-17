import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mtracker/app/data/controller/data_controller.dart';
import 'package:mtracker/app/modules/home/views/widget/common_widget.dart';
import 'package:mtracker/app/modules/statistics/views/widget/chart_widget.dart';

import '../controllers/statistics_controller.dart';

int statIndex = 1;

RxString statDropDownValue = 'Income'.obs;

class StatisticsView extends GetView<StatisticsController> {
  final items = <String>['Income', 'Expense'];
  @override
  Widget build(BuildContext context) {
    final statisticsController = Get.put(StatisticsController());
    final dataController = Get.put(DataController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Statistics',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GetBuilder<StatisticsController>(builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SizedBox(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: GetBuilder<StatisticsController>(
                          builder: (controller) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.26,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 101, 209, 190),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: DropdownButton<String>(
                                    iconEnabledColor: Colors.white,
                                    dropdownColor: const Color.fromARGB(
                                        255, 101, 209, 190),
                                    style: const TextStyle(color: Colors.white),
                                    underline: const Text(''),
                                    borderRadius: BorderRadius.circular(10),
                                    items: items.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                          value: value, child: Text(value));
                                    }).toList(),
                                    value: statDropDownValue.value,
                                    onChanged: (String? newValue) {
                                      statisticsController
                                          .changeDropValue(newValue!);
                                    }),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    statisticsController.changeStatIndex(1);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.26,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                        color: statIndex == 1
                                            ? const Color.fromARGB(
                                                255, 101, 209, 190)
                                            :  const Color.fromARGB(255, 201, 245, 235),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                      'This Month',
                                      style: TextStyle(
                                          color: statIndex == 1
                                              ? Colors.white
                                              : Colors.grey),
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    statisticsController.changeStatIndex(2);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.26,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                        color: statIndex == 2
                                            ? const Color.fromARGB(
                                                255, 101, 209, 190)
                                            : const Color.fromARGB(
                                                255, 201, 245, 235),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                      'This Year',
                                      style: TextStyle(
                                          color: statIndex == 2
                                              ? Colors.white
                                              : const Color.fromARGB(
                                                  255, 99, 98, 98)),
                                    )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        commonSizedBox(20.0),
                        ChartWidget(
                          entiredata: dataController.transactionDataList,
                          height: MediaQuery.of(context).size.height * 0.65,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
