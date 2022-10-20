class AddStockModel {
  String? invNo;
  List<Stock>? stock;

  AddStockModel({this.invNo, this.stock});

  AddStockModel.fromJson(Map<String, dynamic> json) {
    invNo = json['inv_no'];
    if (json['stock'] != null) {
      stock = <Stock>[];
      json['stock'].forEach((v) {
        stock!.add(new Stock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inv_no'] = this.invNo;
    if (this.stock != null) {
      data['stock'] = this.stock!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stock {
  String? rollNo;
  String? grade;
  String? itemName;
  int? meter;
  int? width;
  int? weight;
  int? itemId;

  Stock(
      {this.rollNo,
      this.grade,
      this.meter,
      this.width,
      this.weight,
      this.itemId,
      this.itemName});

  Stock.fromJson(Map<String, dynamic> json) {
    rollNo = json['roll_no'];
    grade = json['grade'];
    meter = json['meter'];
    width = json['width'];
    weight = json['weight'];
    itemId = json['item_id'];
    itemName = json['item_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roll_no'] = this.rollNo;
    data['grade'] = this.grade;
    data['meter'] = this.meter;
    data['width'] = this.width;
    data['weight'] = this.weight;
    data['item_id'] = this.itemId;

    return data;
  }
}
