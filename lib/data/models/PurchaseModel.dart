class PurchaseModel {
  String? invNo;
  String? invDate;
  String? challanNo;
  String? challanDate;
  String? lrNo;
  int? clientId;
  int? transportId;

  PurchaseModel({
    this.invNo,
    this.invDate,
    this.challanNo,
    this.challanDate,
    this.lrNo,
    this.clientId,
    this.transportId,
  });

  PurchaseModel.fromJson(Map<String, dynamic> json) {
    invNo = json['inv_no'];
    invDate = json['inv_date'];
    challanNo = json['challan_no'];
    challanDate = json['challan_date'];
    lrNo = json['lr_no'];
    clientId = json['client_id'];
    transportId = json['transport_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['inv_no'] = this.invNo;
    data['inv_date'] = this.invDate;
    data['challan_no'] = this.challanNo;
    data['challan_date'] = this.challanDate;
    data['lr_no'] = this.lrNo;
    data['client_id'] = this.clientId.toString();
    data['transport_id'] = this.transportId.toString();

    return data;
  }
}
