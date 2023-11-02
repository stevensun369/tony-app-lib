class TransactionModel {
  String id = '';
  String tag = '';

  String from = '';
  String to = '';

  String orderID = '';

  int value = 0;

  String date = '';
  String time = '';

  TransactionModel({
    required this.id,
    required this.tag,
    required this.from,
    required this.to,
    required this.orderID,
    required this.value,
    required this.date,
    required this.time,
  });

  factory TransactionModel.fromJSON(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['ID'],
      tag: json['tag'],
      from: json['from'],
      to: json['to'],
      orderID: json['orderID'],
      value: json['value'],
      date: json['date'],
      time: json['time'],
    );
  }
}
