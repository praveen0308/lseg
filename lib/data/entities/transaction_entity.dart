import 'dart:convert';
/// transaction_id : ""
/// sender_id : ""
/// receiver_id : ""
/// sender : ""
/// receiver : ""
/// status : "PENDING/DONE/CANCELLED/REJECTED/REFUNDED/REQUESTED"
/// added_on : 444447777
/// description : ""
/// remark : ""
/// type : "PRIZE/WITHDRAWL/PURCHASE/REFUND"
/// reference_id : ""
/// payment_method : "UPI/NETBANKING/GATEWAY/INAPP"

TransactionEntity transactionEntityFromJson(String str) => TransactionEntity.fromJson(json.decode(str));
String transactionEntityToJson(TransactionEntity data) => json.encode(data.toJson());
class TransactionEntity {
  TransactionEntity({
      String? transactionId, 
      String? senderId, 
      String? receiverId, 
      String? sender, 
      String? receiver, 
      String? status, 
      num? addedOn, 
      String? description, 
      String? remark, 
      String? type, 
      String? referenceId, 
      String? paymentMethod,}){
    _transactionId = transactionId;
    _senderId = senderId;
    _receiverId = receiverId;
    _sender = sender;
    _receiver = receiver;
    _status = status;
    _addedOn = addedOn;
    _description = description;
    _remark = remark;
    _type = type;
    _referenceId = referenceId;
    _paymentMethod = paymentMethod;
}

  TransactionEntity.fromJson(dynamic json) {
    _transactionId = json['transaction_id'];
    _senderId = json['sender_id'];
    _receiverId = json['receiver_id'];
    _sender = json['sender'];
    _receiver = json['receiver'];
    _status = json['status'];
    _addedOn = json['added_on'];
    _description = json['description'];
    _remark = json['remark'];
    _type = json['type'];
    _referenceId = json['reference_id'];
    _paymentMethod = json['payment_method'];
  }
  String? _transactionId;
  String? _senderId;
  String? _receiverId;
  String? _sender;
  String? _receiver;
  String? _status;
  num? _addedOn;
  String? _description;
  String? _remark;
  String? _type;
  String? _referenceId;
  String? _paymentMethod;
TransactionEntity copyWith({  String? transactionId,
  String? senderId,
  String? receiverId,
  String? sender,
  String? receiver,
  String? status,
  num? addedOn,
  String? description,
  String? remark,
  String? type,
  String? referenceId,
  String? paymentMethod,
}) => TransactionEntity(  transactionId: transactionId ?? _transactionId,
  senderId: senderId ?? _senderId,
  receiverId: receiverId ?? _receiverId,
  sender: sender ?? _sender,
  receiver: receiver ?? _receiver,
  status: status ?? _status,
  addedOn: addedOn ?? _addedOn,
  description: description ?? _description,
  remark: remark ?? _remark,
  type: type ?? _type,
  referenceId: referenceId ?? _referenceId,
  paymentMethod: paymentMethod ?? _paymentMethod,
);
  String? get transactionId => _transactionId;
  String? get senderId => _senderId;
  String? get receiverId => _receiverId;
  String? get sender => _sender;
  String? get receiver => _receiver;
  String? get status => _status;
  num? get addedOn => _addedOn;
  String? get description => _description;
  String? get remark => _remark;
  String? get type => _type;
  String? get referenceId => _referenceId;
  String? get paymentMethod => _paymentMethod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transaction_id'] = _transactionId;
    map['sender_id'] = _senderId;
    map['receiver_id'] = _receiverId;
    map['sender'] = _sender;
    map['receiver'] = _receiver;
    map['status'] = _status;
    map['added_on'] = _addedOn;
    map['description'] = _description;
    map['remark'] = _remark;
    map['type'] = _type;
    map['reference_id'] = _referenceId;
    map['payment_method'] = _paymentMethod;
    return map;
  }

}