import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mtracker/app/data/model/transaction_model.dart';
import 'package:mtracker/app/modules/splash/views/splash_view.dart';

class DataController extends GetxController {
  RxList<TransactionModel> transactionDataList = <TransactionModel>[].obs;
  int listIndex = 0;
  void addData(TransactionModel value) async {
    final transactionDb =
        await Hive.openBox<TransactionModel>('transaction_db');
    transactionDb.add(value);
    transactionDataList.add(value);
    print(transactionDb);
  }

  void updateIndex(int index) {
    listIndex = index;
    update();
  }

  void getAllData() async {
    final transactionDb =
        await Hive.openBox<TransactionModel>('transaction_db');
    transactionDataList.clear();
    transactionDataList.addAll(transactionDb.values);
    update();
  }

  deleteData(index) async {
    final transactionDb =
        await Hive.openBox<TransactionModel>('transaction_db');
    transactionDb.deleteAt(index);
    getAllData();
  }

  updateData(int index, TransactionModel value) async {
    final transactionDb =
        await Hive.openBox<TransactionModel>('transaction_db');
    transactionDb.putAt(index, value);
    getAllData();
  }

  resetData() async {
    final transactionDb =
        await Hive.openBox<TransactionModel>('transaction_db');
    transactionDb.clear();
    transactionDataList.clear();
    final sharedprfns = await SharedPreferences.getInstance();
    sharedprfns.clear();
    Get.offAll(SplashView());
  }
}