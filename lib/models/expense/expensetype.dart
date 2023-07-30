class ExpenseType {
  int? expenseTypeID;
  String? expenseName;
  String? expenseNotes;

  ExpenseType({
    this.expenseTypeID,
    this.expenseName,
    this.expenseNotes,
  });

  factory ExpenseType.fromMap(Map<String, dynamic> json) {
    return ExpenseType(
      expenseTypeID: json['expenseTypeId'],
      expenseName: json['name'],
      expenseNotes: json['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ExpenseTypeID': expenseTypeID,
      'ExpenseName': expenseName,
      'ExpenseNotes': expenseNotes,
    };
  }



}
