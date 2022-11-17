import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mtracker/app/modules/home/views/widget/common_widget.dart';

class BalanceCard extends StatelessWidget {
  final int totalbal;
  final int totalIncome;
  final int totalExpense;

  BalanceCard(
      {Key? key,
      required this.totalbal,
      required this.totalIncome,
      required this.totalExpense})
      : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color.fromARGB(255, 101, 209, 190)),
      child: Column(
        children: [
          commonSizedBox(30.0),
          Text(
            'Total Balance',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
          commonSizedBox(3.0),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AutoSizeText(
              '₹ ${totalbal < 0 ? 0 : totalbal} ',
              maxLines: 1,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        child: Icon(
                          Icons.keyboard_double_arrow_up_rounded,
                          color: Color.fromARGB(255, 18, 233, 26),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Income',
                            style: TextStyle(color: Colors.white),
                          ),
                          AutoSizeText(
                            '₹ $totalIncome',
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                            textAlign: TextAlign.start,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        child: Icon(
                          Icons.keyboard_double_arrow_down_rounded,
                          color: Color.fromARGB(255, 245, 6, 6),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          const Text('Expense',
                              style: TextStyle(color: Colors.white)),
                          AutoSizeText(
                            '₹ $totalExpense',
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                            textAlign: TextAlign.start,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
