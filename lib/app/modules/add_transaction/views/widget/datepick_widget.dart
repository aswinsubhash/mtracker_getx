import 'package:flutter/material.dart';

DateTime selectedDate = DateTime.now();

class Datepick extends StatefulWidget {
  const Datepick({Key? key}) : super(key: key);

  @override
  State<Datepick> createState() => _DatepickState();
}

class _DatepickState extends State<Datepick> {
  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  Future<void> _selectdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 12),
      lastDate: DateTime(2100, 01),
      builder: (context, child) {
        //date picker theme
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(
                    255, 101, 209, 190), // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 254, 254, 254), // button  color
                ),
              ),
            ),
            child: child!);
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                // MyFlutterApp.calender,
                Icons.calendar_month,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 210,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    _selectdate(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        '${selectedDate.day} ${month[selectedDate.month - 1]}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 95, 94, 94),
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
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
