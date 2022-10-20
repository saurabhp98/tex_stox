class ItemModel {
  int? id;
  late String itemName;
  int? width;
  String? shade;

  ItemModel({this.id, required this.itemName, this.width, this.shade});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemName = json['item_name'];
    width = json['width'];
    shade = json['shade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_name'] = this.itemName;
    data['width'] = this.width;
    data['shade'] = this.shade;
    return data;
  }
}
