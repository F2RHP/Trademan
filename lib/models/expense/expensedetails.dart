class ExpenseDetails {
  int? expenseID;
  String? expenseName;
  String? expenseDescription;
  int? expenseTypeId;
  String? expenseTypeName;
  DateTime? expenseDate;
  double expenseCost;

  ExpenseDetails({
    this.expenseID,
    this.expenseName,
    this.expenseDescription,
    this.expenseTypeId,
    this.expenseTypeName,
    this.expenseDate,
    required this.expenseCost,
  });

  factory ExpenseDetails.fromMap(Map<String, dynamic> map) {
    return ExpenseDetails(
      expenseID: map['expenseID'],
      expenseName: map['expenseName'],
      expenseDescription: map['expenseDescription'],
      expenseTypeId: map['expenseTypeId'],
      expenseTypeName: map['expenseTypeName'],
      expenseDate: map['expenseDate'] != null
          ? DateTime.parse(map['expenseDate'])
          : null,
      expenseCost: map['expenseCost']?.toDouble(),
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'expenseID': expenseID,
      'expenseName': expenseName,
      'expenseDescription': expenseDescription,
      'expenseTypeId': expenseTypeId,
      'expenseTypeName': expenseTypeName,
      'expenseDate': expenseDate != null ? expenseDate!.toIso8601String() : null,
      'expenseCost': expenseCost,
    };
  }


}
