class ServiceHelper {

  // ignore: non_constant_identifier_names
  static int Sucesscode = 200;
  // ignore: non_constant_identifier_names
  static String BaseUrl = "http://ponsinghclone-001-site5.itempurl.com/api";

  // Product related API
  static String productGetUrl = "Products/GetAllProducts";

  //Customer related API
  static String listCustomer = 'Customer/GetAllCustomer';
  static String getCustomerById = 'Customer/GetCustomerByID';

  //Expense related API
  static String listExpensesType = 'Expense/GetExpenseDetails';
  static String listExpenses = 'Expense/GetExpenseDetails';
   static String postExpenses = 'Expense/AddExpense';


}
