import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tex_stox/data/models/ItemModel.dart';
import 'package:tex_stox/data/repository/item_repository.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemRepository itemRepository;

  ItemCubit({required this.itemRepository}) : super(ItemInitial());
  void getItemDetail() async {
    Stream<List<ItemModel>> itemStream = (() async* {
      yield await itemRepository.getItemDetails();
    })();

    emit(ItemLoaded(itemStream: itemStream));
  }
}
