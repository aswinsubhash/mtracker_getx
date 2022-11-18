import 'package:get/get.dart';
import 'package:mtracker/app/data/controller/data_controller.dart';
import 'package:mtracker/app/data/model/transaction_model.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/transtype_widget.dart';
import 'package:mtracker/app/modules/edit/views/widget/edit_amount.dart';
import 'package:mtracker/app/modules/edit/views/widget/edit_category.dart';
import 'package:mtracker/app/modules/edit/views/widget/edit_date.dart';
import 'package:mtracker/app/modules/home/views/dash_view.dart';

class EditController extends GetxController {
  void dataUpdate() async {
    final dataController = Get.put(DataController());
    final updatedData = TransactionModel(
        amount:
            dataController.transactionDataList[dataController.listIndex].amount,
        date: dataController.transactionDataList[dataController.listIndex].date,
        category: dataController
            .transactionDataList[dataController.listIndex].category,
        type:
            dataController.transactionDataList[dataController.listIndex].type);
    await dataController.updateData(dataController.listIndex, updatedData);
  }

  void dataUpdateto() async {
    final dataController = Get.put(DataController());
    final updatedData = TransactionModel(
        amount: editedamount!,
        date: editedDate,
        category: editedCategory,
        type: type);
    await dataController.updateData(dataController.listIndex, updatedData);
  }

  void buttonClick() {
    final dataController = Get.put(DataController());
    final editController = Get.put(EditController());
    if (editedCategory.isEmpty || editedamount == 0 || editedamount == null) {
      editedCategory =
          dataController.transactionDataList[dataController.listIndex].category;
      editedamount =
          dataController.transactionDataList[dataController.listIndex].amount;
      editController.dataUpdate();

      Get.off(()=>DashView());
      dataController.getAllData();
    } else {
      editController.dataUpdateto();
      Get.off(()=>DashView());
    }
  }

  void showError() {
    Get.snackbar("Not all data provided", "");
  }
}
