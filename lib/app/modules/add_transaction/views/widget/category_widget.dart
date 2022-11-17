import 'package:flutter/material.dart';

String category = '';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final categoryController = TextEditingController();
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
                Icons.category,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 210,
                height: 60,
                child: Form(
                  child: TextField(
                    controller: categoryController,
                    onChanged: (val) {
                      category = val;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: 'Category',
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
