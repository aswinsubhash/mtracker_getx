import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtracker/app/data/controller/data_controller.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/transtype_widget.dart';
import 'package:mtracker/app/modules/edit/views/widget/edit_category.dart';
import 'package:mtracker/app/modules/edit/views/widget/edit_date.dart';
import 'package:mtracker/app/modules/home/views/widget/common_widget.dart';
import '../controllers/edit_controller.dart';
import 'widget/edit_amount.dart';

class EditView extends GetView<EditController> {
  @override
  Widget build(BuildContext context) {
    final editController = Get.put(EditController());
    final dataController = Get.put(DataController());
    type = dataController.transactionDataList[dataController.listIndex].type;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            )),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    commonSizedBox(40.0),
                    Text(
                      'Edit Transaction',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600)),
                    ),
                    commonSizedBox(30.0),
                    EditAmountWidget(
                        editAmount: dataController
                            .transactionDataList[dataController.listIndex]
                            .amount),
                    commonSizedBox(20.0),
                    EditCategoryWidget(
                      editCategory: dataController
                          .transactionDataList[dataController.listIndex]
                          .category,
                    ),
                    commonSizedBox(20.0),
                    TransType(),
                    commonSizedBox(20.0),
                    EditDatepick(
                      editdate: dataController
                          .transactionDataList[dataController.listIndex].date,
                    ),
                    commonSizedBox(20.0),
                    ElevatedButton(
                        onPressed: () {
                         editController.buttonClick();
                        },
                        child: const Text('Update'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 101, 209, 190),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(150, 40)))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
