import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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

// add Stock Screen
class AddStock extends StatelessWidget {
  const AddStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Calcel"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent))),
            ElevatedButton(
                onPressed: () {},
                child: Text("Import"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.tealAccent))),
            ElevatedButton(
                onPressed: () {},
                child: Text("Add"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.greenAccent))),
          ],
        ),
      ),
      body: Form(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(10),
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
                            decoration:
                                InputDecoration(labelText: "Invoice No"),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            onSaved: (value) {
                              print(value);
                            },
                            decoration:
                                InputDecoration(labelText: "Challan No"),
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
                            decoration:
                                InputDecoration(labelText: "Challan No"),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                BorderSide(width: 2, color: Colors.teal)),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(color: Colors.teal)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shadowColor:
                                MaterialStateProperty.all(Colors.teal)),
                        onPressed: () {
                          // showModalBottomSheet(
                          //     context: context,

                          //     constraints: BoxConstraints(

                          //         minHeight:
                          //             MediaQuery.of(context).size.height * 0.7),
                          //     builder: (BuildContext context) {
                          //       return Text("data");
                          //     });

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: Form(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "Enter Sort"),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "Enter Roll No."),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "Enter Grade"),
                                            ),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "Enter mtr"),
                                            ),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Go Back",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .greenAccent)),
                                                    onPressed: () {},
                                                    child: Text("Add"))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.teal,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Add Roll",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ))),
              ),
              Form(
                  child: Container(
                width: 50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Container(
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      onTap: () {
                        FlutterBarcodeScanner.getBarcodeStreamReceiver(
                                "#ff6666", "Cancel", false, ScanMode.DEFAULT)
                            ?.listen((barcode) {
                          /// barcode to be used
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.qr_code_scanner,
                          size: 30,
                          color: Colors.teal,
                        ),
                      ),
                    )),
              )),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    )),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sort',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Roll',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Grade',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Text('mtr',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
