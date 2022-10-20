import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tex_stox/cubit/purchase_cubit/purchase_cubit.dart';
import 'package:tex_stox/data/models/AddStockModel.dart';
import 'package:tex_stox/data/models/PurchaseModel.dart';
import 'package:tex_stox/data/repository/client_repository.dart';
import 'package:tex_stox/data/repository/stock_repository.dart';
import 'package:tex_stox/presentation/screens/stock/widgets/add_stock_widget.dart';

part 'stock_state.dart';

class StockCubit extends Cubit<StockState> {
  StockRepository stockRepository;
  PurchaseCubit purchaseCubit;

  StockCubit({required this.stockRepository, required this.purchaseCubit})
      : super(StockInitial());
  addStockList(Stock addStock) async {
    await stockRepository.addStockfromUi(addStock);
  }

  addBulkStock(PurchaseModel purchaseModel) async {
    // stockRepository.addBulkStock(addStockModel);

    List<Stock> stockList = await stockRepository.getAddStockList();
    final responseCode = await purchaseCubit.addPurchase(purchaseModel);
    print(responseCode);
    if (responseCode == 200 || responseCode == 201) {
      stockRepository.addBulkStock(
          AddStockModel(invNo: purchaseModel.invNo, stock: stockList));
    } else {
      print("wrong invoice data");
    }
  }

  getStockStateList() {
    Stream getAddStockWidgetStream = (() async* {
      yield await stockRepository.getAddStockList();
    })();

    emit(StockLoaded(stockStream: getAddStockWidgetStream));
  }
}
