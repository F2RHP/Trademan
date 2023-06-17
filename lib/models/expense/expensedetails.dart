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

  factory ExpenseDetails.fromMap(Map<String, dynamic> json) {
    return ExpenseDetails(
      expenseID: json['ExpenseID'],
      expenseName: json['ExpenseName'],
      expenseDescription: json['ExpenseDescription'],
      expenseTypeId: json['ExpenseTypeId'],
      expenseTypeName: json['ExpenseTypeName'],
      expenseDate: json['ExpenseDate'] != null
          ? DateTime.parse(json['ExpenseDate'])
          : null,
      expenseCost: json['ExpenseCost'],
    );
  }


}
