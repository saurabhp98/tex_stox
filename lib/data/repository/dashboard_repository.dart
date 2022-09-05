import 'package:tex_stox/data/models/dashboard_model.dart';
import 'package:tex_stox/data/services/dashboard_services.dart';

class DashboardRepository {
  late DashboardServices dashboardServices;
  DashboardRepository() {
    dashboardServices = DashboardServices();
  }
  Future<List<DashboardModel>> fetchDashboardDataFromRepository() async {
    List recData = await dashboardServices.fetchDashboardData();
    // print(recData);
    // print(recData.map((e) => DashboardModel.fromJson(e)));

    return recData.map((e) => DashboardModel.fromJson(e)).toList();
  }

  Future<String> fetchSoldStockMtr() async {
    return await dashboardServices.fetchSoldStockMtr();
  }

  Future<String> fetchCurrentStockMtr() async {
    return await dashboardServices.fetchCurrentStockMtr();
  }
}
