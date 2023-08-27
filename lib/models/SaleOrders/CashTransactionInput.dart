class CashTransactionData {
  final String actionCode;
  final int transactionId;
  final int transactionTypeId;
  final String transactionDate;
  final String transactionAmount;
  final int customerId;
  final String comments;

  CashTransactionData({
    required this.actionCode,
    required this.transactionId,
    required this.transactionTypeId,
    required this.transactionDate,
    required this.transactionAmount,
    required this.customerId,
    required this.comments,
  });

  factory CashTransactionData.fromJson(Map<String, dynamic> json) {
    return CashTransactionData(
      actionCode: json['actionCode'],
      transactionId: json['transactionId'],
      transactionTypeId: json['transactionTypeId'],
      transactionDate: json['transactionDate'],
      transactionAmount: json['transactionAmount'],
      customerId: json['customerId'],
      comments: json['comments'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'actionCode': actionCode,
      'transactionId': transactionId,
      'transactionTypeId': transactionTypeId,
      'transactionDate': transactionDate,
      'transactionAmount': transactionAmount,
      'customerId': customerId,
      'comments': comments,
    };
  }
}
