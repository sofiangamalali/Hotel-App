class Home {
  bool? status;
  String? msg;
  Data? data;

  Home({this.status, this.msg, this.data});

  Home.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Guest? guest;
  Room? room;

  Data({this.guest, this.room});

  Data.fromJson(Map<String, dynamic> json) {
    guest = json['guest'] != null ? Guest.fromJson(json['guest']) : null;
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (guest != null) {
      data['guest'] = guest!.toJson();
    }
    if (room != null) {
      data['room'] = room!.toJson();
    }
    return data;
  }
}

class Guest {
  int? id;
  String? name;
  String? countryCode;
  String? phone;
  int? roomId;
  String? checkin;
  String? checkout;
  int? hotelId;
  Hotel? hotel;

  Guest(
      {this.id,
      this.name,
      this.countryCode,
      this.phone,
      this.roomId,
      this.checkin,
      this.checkout,
      this.hotelId,
      this.hotel});

  Guest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    phone = json['phone'];
    roomId = json['room_id'];
    checkin = json['checkin'];
    checkout = json['checkout'];
    hotelId = json['hotel_id'];
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_code'] = countryCode;
    data['phone'] = phone;
    data['room_id'] = roomId;
    data['checkin'] = checkin;
    data['checkout'] = checkout;
    data['hotel_id'] = hotelId;
    if (hotel != null) {
      data['hotel'] = hotel!.toJson();
    }
    return data;
  }
}

class Hotel {
  int? id;
  String? name;
  String? description;

  Hotel({this.id, this.name, this.description});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}

class Room {
  int? id;
  String? image;
  String? code;
  int? floorId;
  Floor? floor;
  String? status;
  int? hotelId;
  int? typeRoomId;
  RoomType? roomType;

  Room(
      {this.id,
      this.image,
      this.code,
      this.floorId,
      this.floor,
      this.status,
      this.hotelId,
      this.typeRoomId,
      this.roomType});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    code = json['code'];
    floorId = json['floor_id'];
    floor = json['floor'] != null ? Floor.fromJson(json['floor']) : null;
    status = json['status'];
    hotelId = json['hotel_id'];
    typeRoomId = json['type_room_id'];
    roomType =
        json['room_type'] != null ? RoomType.fromJson(json['room_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['code'] = code;
    data['floor_id'] = floorId;
    if (floor != null) {
      data['floor'] = floor!.toJson();
    }
    data['status'] = status;
    data['hotel_id'] = hotelId;
    data['type_room_id'] = typeRoomId;
    if (roomType != null) {
      data['room_type'] = roomType!.toJson();
    }
    return data;
  }
}

class Floor {
  int? id;
  String? floorNum;
  String? image;

  Floor({this.id, this.floorNum, this.image});

  Floor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    floorNum = json['floor_num'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['floor_num'] = floorNum;
    data['image'] = image;
    return data;
  }
}

class RoomType {
  int? id;
  String? image;
  String? roomType;

  RoomType({this.id, this.image, this.roomType});

  RoomType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    roomType = json['room_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['room_type'] = roomType;
    return data;
  }
}
