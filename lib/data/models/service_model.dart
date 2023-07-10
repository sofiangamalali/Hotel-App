class Service {
  bool? status;
  String? msg;
  List<Data>? data;

  Service({this.status, this.msg, this.data});

  Service.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? image;
  String? status;
  int? hotelId;
  int? price;
  String? period;
  int? unitId;
  int? quantity;

  Data(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.status,
      this.hotelId,
      this.price,
      this.period,
      this.unitId,
      this.quantity});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    hotelId = json['hotel_id'];
    price = json['price'];
    period = json['period'];
    unitId = json['unit_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['hotel_id'] = hotelId;
    data['price'] = price;
    data['period'] = period;
    data['unit_id'] = unitId;
    data['quantity'] = quantity;
    return data;
  }
}
