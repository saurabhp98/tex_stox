class TransportModel {
  int? id;
  late String name;
  String? gstId;
  String? address;
  int? number;
  String? email;

  TransportModel(
      {this.id,
      required this.name,
      this.gstId,
      this.address,
      this.number,
      this.email});

  TransportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gstId = json['gst_id'];
    address = json['address'];
    number = json['number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['gst_id'] = gstId;
    data['address'] = address;
    data['number'] = number;
    data['email'] = email;
    return data;
  }
}
