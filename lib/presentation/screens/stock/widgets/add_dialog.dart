import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tex_stox/cubit/item_cubit/item_cubit.dart';
import 'package:tex_stox/cubit/stock_cubit/stock_cubit.dart';
import 'package:tex_stox/data/models/AddStockModel.dart';
import 'package:tex_stox/data/models/ItemModel.dart';
import 'package:tex_stox/presentation/screens/stock/widgets/add_stock_widget.dart';

class AddDialog extends StatefulWidget {
  AddDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ItemCubit>(context).getItemDetail();
  }

  @override
  Widget build(BuildContext context) {
    String sort = "";
    int itemId = 0;
    String roll_no = "";
    String grade = "";
    int mtr = 0;
    int weight = 0;
    int width = 0;

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.7,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                BlocBuilder<ItemCubit, ItemState>(
                  builder: (context, state) {
                    if (state is! ItemLoaded) {
                      CircularProgressIndicator();
                    }
                    if (state is ItemLoaded) {
                      return StreamBuilder<List<ItemModel>>(
                          stream: state.itemStream,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return DropDownTextField(
                                onChanged: (value) {
                                  DropDownValueModel val =
                                      value as DropDownValueModel;
                                  itemId = int.parse(value.value);
                                  sort = value.name.toString();
                                },
                                enableSearch: true,
                                dropDownList: snapshot.data!
                                    .map((e) => DropDownValueModel(
                                        name: e.itemName,
                                        value: e.id.toString()))
                                    .toList());
                          });
                    }
                    return Text('Nothing found');
                  },
                ),
                TextFormField(
                  onSaved: (newValue) {
                    roll_no = newValue!;
                  },
                  decoration: InputDecoration(labelText: "Enter Roll No."),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    grade = newValue!;
                  },
                  decoration: InputDecoration(labelText: "Enter Grade"),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    mtr = int.parse(newValue!);
                  },
                  decoration: InputDecoration(labelText: "Enter mtr"),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    weight = int.parse(newValue!);
                  },
                  decoration: InputDecoration(labelText: "Enter Weight"),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    width = int.parse(newValue!);
                  },
                  decoration: InputDecoration(labelText: "Enter width"),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Go Back",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                          }

                          await BlocProvider.of<StockCubit>(context)
                              .addStockList(Stock(
                                  itemId: itemId,
                                  grade: grade,
                                  itemName: sort,
                                  meter: mtr,
                                  rollNo: roll_no,
                                  weight: weight,
                                  width: width));
                          BlocProvider.of<StockCubit>(context)
                              .getStockStateList();
                          print(roll_no);
                          Navigator.pop(context);
                        },
                        child: Text("Add"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
