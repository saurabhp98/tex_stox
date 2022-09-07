import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        title: Text(
          'Items',
          style: TextStyle(color: Colors.blueGrey),
        ),
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        _itemList(),
        _itemList(),
        _itemList(),
        _itemList(),
        _itemList(),
      ]),
    );
  }
}

Widget _itemList() {
  return InkWell(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sort",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54)),
                Text("2101",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Width",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54)),
                Text("76.0",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
