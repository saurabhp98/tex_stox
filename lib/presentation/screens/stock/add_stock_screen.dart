import 'package:dropdown_search/dropdown_search.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tex_stox/cubit/client_cubit/client_cubit_cubit.dart';
import 'package:tex_stox/cubit/item_cubit/item_cubit.dart';
import 'package:tex_stox/cubit/transport_cubit/transport_cubit.dart';
import 'package:tex_stox/data/models/AddStockModel.dart';
import 'package:tex_stox/data/models/TransportModel.dart';
import 'package:tex_stox/data/repository/purchase_repository.dart';
import 'package:tex_stox/data/repository/transport_repository.dart';
import 'package:tex_stox/presentation/router.dart';
import 'package:tex_stox/presentation/screens/stock/widgets/add_dialog.dart';
import 'package:tex_stox/presentation/screens/stock/widgets/add_stock_widget.dart';
import 'package:tex_stox/presentation/screens/stock/widgets/bottom_navbar.dart';

import '../../../cubit/purchase_cubit/purchase_cubit.dart';
import '../../../cubit/stock_cubit/stock_cubit.dart';
import '../../../data/models/PurchaseModel.dart';

class AddStock extends StatefulWidget {
  AddStock({
    Key? key,
  }) : super(key: key);

  @override
  State<AddStock> createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  // List<AddStockWidgetList> listOfAddStock = [];
  int valueIn = 1;

  String invNo = "";
  String invDate = "";
  String challanNo = "";
  String challanDate = "";
  String lrNo = "";
  late dynamic clientId;
  late dynamic transportId;
  List<Stock> stocklist = [];

  // List<AddStockWidgetList> addStockWidgetList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<StockCubit>(context).getStockStateList();
    BlocProvider.of<TransportCubit>(context).getTransportDetail();
    BlocProvider.of<ClientCubitCubit>(context)
        .fetchClientsFromClientRepository();
  }

  @override
  Widget build(BuildContext context) {
    final stockCubit = context.read<StockCubit>();
    final itemCubit = context.read<ItemCubit>();
    double formFieldWidth = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      bottomNavigationBar: BottomNavbar(
        onImportPressed: () {},
        onAddPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState?.save();
          }

          print("invno : $invNo");
          print("invDate: $invDate");
          print("challanNo: $challanNo");
          print("challanDate: $challanDate");
          print("lrNo: $lrNo");
          print("clientId: $clientId");
          print("transportId: $transportId");

          final data = PurchaseModel(
              invNo: invNo,
              invDate: invDate.toString(),
              challanNo: challanNo,
              challanDate: challanDate,
              lrNo: lrNo,
              clientId: clientId,
              transportId: transportId);
          BlocProvider.of<StockCubit>(context).addBulkStock(data);
          // BlocProvider.of<PurchaseCubit>(context).addPurchase(data);
        },
      ),
      body: SafeArea(
        child: Form(
            key: _formKey,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: formFieldWidth,
                                child: TextFormField(
                                  onSaved: (value) {
                                    print(value);
                                    invNo = value!;
                                  },
                                  onChanged: (value) {
                                    invNo = value;
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Invoice No."),
                                ),
                              ),
                              SizedBox(
                                width: formFieldWidth,
                                child: TextFormField(
                                  onSaved: (value) {
                                    print(value);
                                    invDate = value!;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Invoice Date"),
                                ),
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: formFieldWidth,
                                child: TextFormField(
                                  onSaved: (value) {
                                    print(value);
                                    challanNo = value!;
                                  },
                                  decoration:
                                      InputDecoration(labelText: "Challan No."),
                                ),
                              ),
                              SizedBox(
                                width: formFieldWidth,
                                child: TextFormField(
                                  onSaved: (value) {
                                    print(value);
                                    challanDate = value!;
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Challan Date"),
                                ),
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: formFieldWidth,
                                child: TextFormField(
                                  onSaved: (value) {
                                    print(value);
                                    lrNo = value!;
                                  },
                                  decoration:
                                      InputDecoration(labelText: "LR No."),
                                ),
                              ),
                              SizedBox(
                                width: formFieldWidth,
                                child: TextFormField(
                                  onSaved: (value) {
                                    print(value);
                                  },
                                  decoration:
                                      InputDecoration(labelText: "LR Date"),
                                ),
                              ),
                            ]),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: BlocBuilder<ClientCubitCubit,
                                        ClientCubitState>(
                                    builder: (context, state) {
                                  if (state is! ClientsLoaded) {
                                    return CircularProgressIndicator();
                                  }
                                  return DropDownTextField(
                                      onChanged: (value) {
                                        DropDownValueModel val =
                                            value as DropDownValueModel;
                                        clientId = val.value;
                                      },
                                      textFieldDecoration:
                                          InputDecoration(hintText: 'Client'),
                                      enableSearch: true,
                                      dropDownItemCount: 5,
                                      listTextStyle: TextStyle(
                                        fontSize: 12,
                                      ),
                                      dropDownList: state.clientModel!
                                          .map((e) => DropDownValueModel(
                                              name: e.name, value: e.id))
                                          .toList());
                                })),
                            GestureDetector(
                                onTap: () {
                                  print("add client clicked");
                                },
                                child: Icon(Icons.add))
                          ],
                        ),
                        BlocBuilder<TransportCubit, TransportState>(
                          builder: (context, state) {
                            if (state is! TransportLoaded) {
                              return Visibility(child: Text('nodata'));
                            }
                            return SizedBox(
                                child: StreamBuilder<List<TransportModel>>(
                                    stream: state.transportStream,
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return CircularProgressIndicator();
                                      }
                                      return DropDownTextField(
                                          onChanged: (value) {
                                            DropDownValueModel val =
                                                value as DropDownValueModel;
                                            transportId = val.value;
                                          },
                                          textFieldDecoration: InputDecoration(
                                              hintText: 'Transport'),
                                          enableSearch: true,
                                          dropDownItemCount: 5,
                                          listTextStyle:
                                              TextStyle(fontSize: 10),
                                          dropDownList: snapshot.data!
                                              .map((e) => DropDownValueModel(
                                                  name: e.name, value: e.id))
                                              .toList());
                                    }));
                          },
                        ),
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
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                          child: MultiBlocProvider(providers: [
                                        BlocProvider.value(value: stockCubit),
                                        BlocProvider.value(value: itemCubit),
                                      ], child: AddDialog()));
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            valueIn++;
                          });
                        },
                        child: Text('click')),
                    Text('$valueIn'),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: InkWell(
                            onTap: () {
                              FlutterBarcodeScanner.getBarcodeStreamReceiver(
                                      "#ff6666",
                                      "Cancel",
                                      false,
                                      ScanMode.DEFAULT)
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
                    AddStockWidgetList(
                      sort: 'Sort',
                      roll_no: 'Roll',
                      grade: 'Grade',
                      mtr: 'Mtr',
                      weight: 'Weight',
                    )
                  ],
                ),
                BlocBuilder<StockCubit, StockState>(builder: (context, state) {
                  if (state is! StockLoaded) {
                    return Text('add roll');
                  }
                  return Expanded(
                    child: StreamBuilder<dynamic>(
                        // initialData: [Text('add data')],
                        stream: state.stockStream,
                        builder: (context, snapshot) {
                          print("${snapshot.data} : from ui");
                          if (!snapshot.hasData) {
                            return Text('add roll detail');
                          }
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return AddStockWidgetList(
                                  sort:
                                      (snapshot.data[index] as Stock).itemName,
                                  roll_no:
                                      (snapshot.data[index] as Stock).rollNo,
                                  grade: (snapshot.data[index] as Stock).grade,
                                  mtr: (snapshot.data[index] as Stock)
                                      .meter
                                      .toString(),
                                  weight: (snapshot.data[index] as Stock)
                                      .weight
                                      .toString());
                            },
                          );
                        }),
                  );
                })
              ],
            )),
      ),
    );
  }
}
