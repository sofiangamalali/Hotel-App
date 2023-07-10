import 'product_model.dart';

class Order {
  List<Carts>? carts;

  Order({this.carts});

  Order.fromJson(Map<String, dynamic> json) {
    if (json['carts'] != null) {
      carts = <Carts>[];
      json['carts'].forEach((v) {
        carts!.add(Carts.fromJson(v));
      });
    }
  }
  Order.fromProductList(List<Product> productList) {
    carts = productList.map((product) {
      return Carts(
        quantity: product.quantity,
        serviceId: product.id,
      );
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (carts != null) {
      data['carts'] = carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Carts {
  int? quantity;
  String? serviceId;

  Carts({this.quantity, this.serviceId});

  Carts.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    serviceId = json['service_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['quantity'] = quantity;
    data['service_id'] = serviceId;
    return data;
  }
}
