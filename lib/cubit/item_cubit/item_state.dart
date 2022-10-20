part of 'item_cubit.dart';

@immutable
abstract class ItemState {}

class ItemInitial extends ItemState {}

class ItemLoaded extends ItemState {
  Stream<List<ItemModel>> itemStream;
  ItemLoaded({required this.itemStream});
}
