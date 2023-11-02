class ShortVariantModel {
  String variant = '';
  int price = 0;

  ShortVariantModel({required this.variant, required this.price});

  factory ShortVariantModel.fromJSON(Map<String, dynamic> json) {
    return ShortVariantModel(variant: json['variant'], price: json['price']);
  }
}

class ProductConfigModel {
  String id = '';

  String title = '';
  Map<String, ShortVariantModel> variants = {};
  Map<String, String> options = {};

  int price = 0;
  int quantity = 1;

  ProductConfigModel({
    required this.id,
    required this.title,
    required this.variants,
    required this.options,
    required this.price,
    required this.quantity,
  });

  factory ProductConfigModel.fromJSON(Map<String, dynamic> json) {
    Map<String, ShortVariantModel> variants = {};
    (json['variants'] as Map<String, dynamic>).forEach((key, variant) {
      variants[key] = ShortVariantModel.fromJSON(variant);
    });

    Map<String, String> options = {};
    (json['options'] as Map<String, dynamic>).forEach((key, option) {
      options[key] = option.toString();
    });

    return ProductConfigModel(
      id: json['productID'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      variants: variants,
      options: options,
    );
  }
}

class OrderModel {
  String id = '';
  String storeID = '';
  String clerkID = '';

  List<ProductConfigModel> receipt = [];

  String transactionID = '';

  int value = 0;

  String date = '';
  String time = '';

  OrderModel({
    required this.id,
    required this.storeID,
    required this.clerkID,
    required this.receipt,
    required this.transactionID,
    required this.value,
    required this.date,
    required this.time,
  });

  factory OrderModel.fromJSON(Map<String, dynamic> json) {
    List<ProductConfigModel> receipt = [];
    (json['receipt'] as List<dynamic>).forEach((pc) {
      receipt.add(ProductConfigModel.fromJSON(pc));
    });

    return OrderModel(
      id: json['ID'],
      storeID: json['storeID'],
      clerkID: json['clerkID'],
      transactionID: json['transactionID'],
      receipt: receipt,
      value: json['value'],
      date: json['date'],
      time: json['time'],
    );
  }
}
