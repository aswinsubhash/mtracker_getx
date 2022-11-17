import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mtracker/app/data/controller/data_controller.dart';
import 'package:mtracker/app/data/model/transaction_model.dart';
import 'package:mtracker/app/modules/home/views/home_view.dart';
import 'package:mtracker/app/modules/home/views/widget/balance_card_widget.dart';
import 'package:mtracker/app/modules/home/views/widget/home_recent.dart';
import 'package:mtracker/main.dart';

class HomeController extends GetxController {
  final dataController = Get.put(DataController());
  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;
  @override
  void onInit() {
    super.onInit();
    getProfileName();
    dataController.getAllData();
    getTotalBalance();
  }

  int currentSelectedIntex = 0;
  bottomIndex(newIntex) {
    currentSelectedIntex = newIntex;
    update();
  }

  DateTime timeCheck = DateTime.now();
 

  getProfileName() async {
    final sharedprfns = await SharedPreferences.getInstance();
    final profileName = sharedprfns.getString(saveKey);
    profName = profileName;
    update();
  }

  changeChipIndex(int changeIndex) {
    monthIndex = changeIndex;
    today = changeIndex == 1
        ? DateTime.now()
        : DateTime(now.year, now.month - (changeIndex - 1), today.day);
    update();
  }

  getTotalBalance() {
    final entiredata = dataController.transactionDataList;
    totalBalance = 0;
    totalExpense = 0;
    totalIncome = 0;

    for (TransactionModel data in entiredata) {
      if (data.date.month == today.month) {
        if (data.type == "Income") {
          totalBalance += data.amount;
          totalIncome += data.amount;
        } else {
          totalBalance -= data.amount;
          totalExpense += data.amount;
        }
      }
    }
  }

  getBalanceCard() {
    return BalanceCard(
        totalbal: totalBalance,
        totalIncome: totalIncome,
        totalExpense: totalExpense);
  }

  getHomeRecentWidget() {
    return HomeRecentWidget(data: dataController.transactionDataList);
  }
}
