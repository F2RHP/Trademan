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
      expenseTypeID: json['ExpenseTypeID'],
      expenseName: json['ExpenseName'],
      expenseNotes: json['ExpenseNotes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ExpenseTypeID': expenseTypeID,
      'ExpenseName': expenseName,
      'ExpenseNotes': expenseNotes,
    };
  }

  List<ExpenseType> expenseList = [
  ExpenseType(
    expenseTypeID: 1,
    expenseName: 'Food',
    expenseNotes: 'Lunch at a restaurant',
  ),
  ExpenseType(
    expenseTypeID: 2,
    expenseName: 'Transportation',
    expenseNotes: 'Taxi fare',
  ),
  ExpenseType(
    expenseTypeID: 3,
    expenseName: 'Entertainment',
    expenseNotes: 'Movie ticket',
  ),
];

}
