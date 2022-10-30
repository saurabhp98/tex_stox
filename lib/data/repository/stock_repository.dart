import '../../presentation/screens/stock/widgets/add_stock_widget.dart';
import '../models/AddStockModel.dart';
import '../services/stock_services.dart';

class StockRepository {
  late StockServices stockServices;

  StockRepository() {
    stockServices = StockServices();
  }

  List<Stock> addStockWidgetList = [];
  addStockfromUi(Stock addStock) {
    addStockWidgetList.add(addStock);
    print(addStockWidgetList);
  }

  List<Stock> getAddStockList() {
    return addStockWidgetList;
  }

  addBulkStock(AddStockModel addStockModel) {
    stockServices.addBulkStock(addStockModel);
    // print("${addStockModel.invNo} ${addStockModel.stock}");
  }

  void clearAddStockData() {
    addStockWidgetList.clear();
  }
}
