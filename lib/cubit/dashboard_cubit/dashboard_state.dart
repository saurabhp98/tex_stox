part of 'dashboard_cubit.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoaded extends DashboardState {
  DashboardLoaded(
      {required this.currentStockMtr,
      required this.soldStockMtr,
      required this.dashboardList});
  Stream<dynamic> soldStockMtr;
  Stream<dynamic> currentStockMtr;
  Stream<List<DashboardModel>> dashboardList;
}
