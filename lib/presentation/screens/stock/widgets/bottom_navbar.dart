import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tex_stox/cubit/client_cubit/client_cubit_cubit.dart';
import 'package:tex_stox/cubit/stock_cubit/stock_cubit.dart';
import 'package:tex_stox/data/repository/purchase_repository.dart';
import 'package:tex_stox/data/services/purchase_services.dart';

import '../../../../data/models/PurchaseModel.dart';

class BottomNavbar extends StatefulWidget {
  Function()? onImportPressed;
  Function()? onAddPressed;
  BottomNavbar(
      {Key? key, required this.onAddPressed, required this.onImportPressed})
      : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                BlocProvider.of<StockCubit>(context).clearAddStockData();
              },
              child: Text("Cancel"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.redAccent))),
          ElevatedButton(
              onPressed: widget.onImportPressed,
              child: Text("Import"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.tealAccent))),
          ElevatedButton(
              onPressed: widget.onAddPressed,
              child: Text("Add"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent))),
        ],
      ),
    );
  }
}
