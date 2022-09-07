import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Stock Screen "),
      ),
    );
  }
}

class AddStock extends StatelessWidget {
  const AddStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          onSaved: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(labelText: "Invoice No"),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          onSaved: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(labelText: "Challan No"),
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          onSaved: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(labelText: "Client"),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          onSaved: (value) {
                            print(value);
                          },
                          decoration: InputDecoration(labelText: "Challan No"),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
