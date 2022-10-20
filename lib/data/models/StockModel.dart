class StockModel {
  int? id;
  String? rollNo;
  String? grade;
  String? meter;
  String? width;
  String? weight;
  String? purchasesId;
  String? saleId;
  String? itemId;
  String? salegrId;
  String? purchasegrId;

  StockModel(
      {this.id,
      this.rollNo,
      this.grade,
      this.meter,
      this.width,
      this.weight,
      this.purchasesId,
      this.saleId,
      this.itemId,
      this.salegrId,
      this.purchasegrId});

  StockModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rollNo = json['roll_no'];
    grade = json['grade'];
    meter = json['meter'];
    width = json['width'];
    weight = json['weight'];
    purchasesId = json['purchases_id'];
    saleId = json['sale_id'];

    itemId = json['item_id'];
    salegrId = json['salegr_id'];
    purchasegrId = json['purchasegr_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['roll_no'] = rollNo;
    data['grade'] = grade;
    data['meter'] = meter;
    data['width'] = width;
    data['weight'] = weight;
    data['purchases_id'] = purchasesId;
    data['sale_id'] = saleId;
    data['item_id'] = itemId;
    data['salegr_id'] = salegrId;
    data['purchasegr_id'] = purchasegrId;
    return data;
  }
}
