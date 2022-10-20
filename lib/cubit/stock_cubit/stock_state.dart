part of 'stock_cubit.dart';

@immutable
abstract class StockState {}

class StockInitial extends StockState {}

class StockLoaded extends StockState {
  Stream stockStream;
  StockLoaded({required this.stockStream});
}
