class VariantModel {
  String variant = '';
  int price = 0;
  bool stock = true;

  VariantModel(
      {required this.variant, required this.price, required this.stock});

  factory VariantModel.fromJSON(Map<String, dynamic> json) {
    return VariantModel(
      variant: json['variant'],
      price: json['price'],
      stock: json['stock'],
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'variant': variant,
      'price': price,
      'stock': stock,
    };
  }
}

class OptionModel {
  String option = '';
  bool stock = true;

  OptionModel({required this.option, required this.stock});

  factory OptionModel.fromJSON(Map<String, dynamic> json) {
    return OptionModel(
      option: json['option'],
      stock: json['stock'],
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'option': option,
      'stock': stock,
    };
  }
}

class ProductModel {
  String id = '';
  String storeID = '';
  String title = '';
  String desc = '';

  int price = 0;
  bool stock = true;

  List<String> tags = [];

  Map<String, List<VariantModel>> variants = {};
  Map<String, List<OptionModel>> options = {};

  ProductModel(
      {required this.id,
      required this.storeID,
      required this.title,
      required this.desc,
      required this.price,
      required this.stock,
      required this.tags,
      required this.variants,
      required this.options});

  factory ProductModel.fromJSON(Map<String, dynamic> json) {
    Map<String, List<VariantModel>> variants = {};
    (json['variants'] as Map<String, dynamic>).forEach((key, keyVariants) {
      List<VariantModel> kvs = [];
      (keyVariants as List<dynamic>).forEach((v) {
        kvs.add(VariantModel.fromJSON(v));
      });

      variants[key] = kvs;
    });

    Map<String, List<OptionModel>> options = {};
    (json['options'] as Map<String, dynamic>).forEach((key, keyOptions) {
      List<OptionModel> kos = [];
      (keyOptions as List<dynamic>).forEach((o) {
        kos.add(OptionModel.fromJSON(o));
      });

      options[key] = kos;
    });

    return ProductModel(
      id: json['ID'],
      storeID: json['storeID'],
      title: json['title'],
      desc: json['desc'],
      price: json['price'],
      stock: json['stock'],
      tags: (json['tags'] as List).map((tag) => tag as String).toList(),
      variants: variants,
      options: options,
    );
  }
}
