class Cash_Transaction {
  int customerId;
  String customerName;
  String customerNickname;
  int transactionId;
  String transactionTypeName;
  double transactionAmount;
  DateTime transactionDate;
  String comments;

  Cash_Transaction({
    required this.customerId,
    required this.customerName,
    required this.customerNickname,
    required this.transactionId,
    required this.transactionTypeName,
    required this.transactionAmount,
    required this.transactionDate,
    required this.comments,
  });

  factory Cash_Transaction.fromMap(Map<String, dynamic> map) {
    return Cash_Transaction(
      customerId: map['customerId'],
      customerName: map['customerName'],
      customerNickname: map['customerNickname'],
      transactionId: map['transactionId'],
      transactionTypeName: map['transactionTypeName'],
      transactionAmount: map['transactionAmount'],
      transactionDate: DateTime.parse(map['transactionDate']),
      comments: map['comments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'customerNickname': customerNickname,
      'transactionId': transactionId,
      'transactionTypeName': transactionTypeName,
      'transactionAmount': transactionAmount,
      'transactionDate': transactionDate.toIso8601String(),
      'comments': comments,
    };
  }
}
