class Receipt {
  bool? status;
  String? msg;
  Data? data;

  Receipt({this.status, this.msg, this.data});

  Receipt.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? guestName;
  int? roomCharge;
  int? totalCharge;
  List<Order>? orders;

  Data({this.guestName, this.roomCharge, this.totalCharge, this.orders});

  Data.fromJson(Map<String, dynamic> json) {
    guestName = json['guest_name'];
    roomCharge = json['room_charge'];
    totalCharge = json['total_charge'];
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['guest_name'] = guestName;
    data['room_charge'] = roomCharge;
    data['total_charge'] = totalCharge;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  int? id;
  String? guestName;
  String? employeeName;
  String? supervisorName;
  String? status;
  String? roomNum;
  int? roomId;
  String? date;
  int? price;
  List<Carts>? carts;

  Order(
      {this.id,
      this.guestName,
      this.employeeName,
      this.supervisorName,
      this.status,
      this.roomNum,
      this.roomId,
      this.date,
      this.price,
      this.carts});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guestName = json['guest_name'];
    employeeName = json['employee_name'];
    supervisorName = json['supervisor_name'];
    status = json['status'];
    roomNum = json['room_num'];
    roomId = json['room_id'];
    date = json['date'];
    price = json['price'];
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) {
        carts!.add(Carts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['guest_name'] = guestName;
    data['employee_name'] = employeeName;
    data['supervisor_name'] = supervisorName;
    data['status'] = status;
    data['room_num'] = roomNum;
    data['room_id'] = roomId;
    data['date'] = date;
    data['price'] = price;
    if (carts != null) {
      data['carts'] = carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Carts {
  int? id;
  Service? service;
  String? price;
  int? quantity;

  Carts({this.id, this.service, this.price, this.quantity});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (service != null) {
      data['service'] = service!.toJson();
    }
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}

class Service {
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

  Service(
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

  Service.fromJson(Map<String, dynamic> json) {
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
