import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtracker/app/data/controller/data_controller.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/amount_widget.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/category_widget.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/datepick_widget.dart';
import 'package:mtracker/app/modules/add_transaction/views/widget/transtype_widget.dart';
import 'package:mtracker/app/modules/home/views/widget/common_widget.dart';
import '../controllers/add_transaction_controller.dart';

class AddTransactionView extends GetView<AddTransactionController> {
  final amountcontroller = TextEditingController();
  final dataController = Get.put(DataController());
  final categorycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final addTransactionController = Get.put(AddTransactionController());
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
        ),
      ),
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
                    'Add Transaction',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  commonSizedBox(30.0),
                  const AmountWidget(),
                  commonSizedBox(20.0),
                  const CategoryWidget(),
                  commonSizedBox(20.0),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TransType()),
                  commonSizedBox(20.0),
                  const Datepick(),
                  commonSizedBox(20.0),
                  ElevatedButton(
                      onPressed: () {
                        addTransactionController.onButtonClick();
                      },
                      child: const Text('Add'),
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
      ),
    );
  }
}
