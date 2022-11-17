import 'package:get/get.dart';
import 'package:mtracker/app/data/controller/data_controller.dart';
import 'package:mtracker/app/data/model/transaction_model.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/amount_widget.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/category_widget.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/datepick_widget.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/transtype_widget.dart';
import 'package:mtracker/app/modules/home/views/dash_view.dart';

class AddTransactionController extends GetxController {
  @override
  void onInit() {
    type = 'Income';
    super.onInit();
  }

  void onButtonClick() {
    final dataController = Get.put(DataController());
    if (amount == 0 || category.isEmpty || amount == null) {
     showError();
    } else {
      final transaction = TransactionModel(
          amount: amount!, date: selectedDate, category: category, type: type);

      dataController.addData(transaction);

      Get.offAll(DashView());
      amount = 0;
      category = '';
    }
  }

  void showError() {
    Get.snackbar("Not all data provided", "");
  }
}
