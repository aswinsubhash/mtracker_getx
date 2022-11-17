import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//int? amount;
int? editedamount;

class EditAmountWidget extends StatelessWidget {
  EditAmountWidget({required this.editAmount, Key? key}) : super(key: key);
  final int editAmount;
  final editAmountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    editAmountController.text = editAmount.toString();
    editedamount = int.parse(editAmountController.text);
    return Container(
      width: 350,
      height: 60,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 201, 245, 235),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 101, 209, 190),
              child: Icon(
                Icons.currency_rupee_sharp,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 210,
                height: 60,
                child: TextField(
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  controller: editAmountController,
                  onChanged: (val) {
                    editedamount = int.parse(val);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Enter Amount',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
