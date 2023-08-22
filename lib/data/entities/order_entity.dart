import 'dart:convert';
/// order_id : ""
/// content_id : ""
/// transaction_id : ""
/// amount : 555.0
/// status : "PENDING/DONE/CANCELLED/REJECTED/REFUNDED"
/// added_on : 444447777
/// description : ""
/// original_price : 545
/// discount : 55

OrderEntity orderEntityFromJson(String str) => OrderEntity.fromJson(json.decode(str));
String orderEntityToJson(OrderEntity data) => json.encode(data.toJson());
class OrderEntity {
  OrderEntity({
      String? orderId, 
      String? contentId, 
      String? transactionId, 
      num? amount, 
      String? status, 
      num? addedOn, 
      String? description, 
      num? originalPrice, 
      num? discount,}){
    _orderId = orderId;
    _contentId = contentId;
    _transactionId = transactionId;
    _amount = amount;
    _status = status;
    _addedOn = addedOn;
    _description = description;
    _originalPrice = originalPrice;
    _discount = discount;
}

  OrderEntity.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _contentId = json['content_id'];
    _transactionId = json['transaction_id'];
    _amount = json['amount'];
    _status = json['status'];
    _addedOn = json['added_on'];
    _description = json['description'];
    _originalPrice = json['original_price'];
    _discount = json['discount'];
  }
  String? _orderId;
  String? _contentId;
  String? _transactionId;
  num? _amount;
  String? _status;
  num? _addedOn;
  String? _description;
  num? _originalPrice;
  num? _discount;
OrderEntity copyWith({  String? orderId,
  String? contentId,
  String? transactionId,
  num? amount,
  String? status,
  num? addedOn,
  String? description,
  num? originalPrice,
  num? discount,
}) => OrderEntity(  orderId: orderId ?? _orderId,
  contentId: contentId ?? _contentId,
  transactionId: transactionId ?? _transactionId,
  amount: amount ?? _amount,
  status: status ?? _status,
  addedOn: addedOn ?? _addedOn,
  description: description ?? _description,
  originalPrice: originalPrice ?? _originalPrice,
  discount: discount ?? _discount,
);
  String? get orderId => _orderId;
  String? get contentId => _contentId;
  String? get transactionId => _transactionId;
  num? get amount => _amount;
  String? get status => _status;
  num? get addedOn => _addedOn;
  String? get description => _description;
  num? get originalPrice => _originalPrice;
  num? get discount => _discount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['content_id'] = _contentId;
    map['transaction_id'] = _transactionId;
    map['amount'] = _amount;
    map['status'] = _status;
    map['added_on'] = _addedOn;
    map['description'] = _description;
    map['original_price'] = _originalPrice;
    map['discount'] = _discount;
    return map;
  }

}