import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tex_stox/data/models/dashboard_model.dart';
import 'package:tex_stox/data/repository/dashboard_repository.dart';
import 'package:http/http.dart' as http;

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardRepository dashboardRepository;
  DashboardCubit({required this.dashboardRepository})
      : super(DashboardInitial());

  void fetchDashboardData() async {
    Stream<dynamic> currentStockMtr = (() async* {
      yield await dashboardRepository.fetchCurrentStockMtr();
    })();

    Stream<dynamic> soldStockMtr = (() async* {
      yield await dashboardRepository.fetchSoldStockMtr();
    })();

    Stream<List<DashboardModel>> dashboardData = (() async* {
      yield await dashboardRepository.fetchDashboardDataFromRepository();
    })();

    emit(DashboardLoaded(
        currentStockMtr: currentStockMtr,
        soldStockMtr: soldStockMtr,
        dashboardList: dashboardData));
  }
}
