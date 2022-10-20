import 'package:tex_stox/data/models/ItemModel.dart';
import 'package:tex_stox/data/services/item_services.dart';

class ItemRepository {
  late ItemServices itemServices;
  ItemRepository() {
    itemServices = ItemServices();
  }

  Future<List<ItemModel>> getItemDetails() async {
    // print(await transportServices.getTransportDetails());
    List transportDetail = await itemServices.getItemDetails();
    // print(transportDetail);

    return transportDetail.map((e) => ItemModel.fromJson(e)).toList();
  }
}
