class ServiceHelper {

  // ignore: non_constant_identifier_names
  static int Sucesscode = 200;
  // ignore: non_constant_identifier_names
  static String BaseUrl = "http://ponsinghclone-001-site5.itempurl.com/api";

  // Product related API
  static String productGetUrl = "Products/GetAllProducts";
  static String productById ="Products/GetProductByID";

  //Customer related API
  static String listCustomer = 'Customer/GetAllCustomer';
  static String getCustomerById = 'Customer/GetCustomerByID';

  //Expense related API
  static String listExpensesType = 'Utility/GetAllExpenseTypes';
  static String listExpenses = 'Expense/GetExpenseDetails';
   static String postExpenses = 'Expense/AddExpense';

static String listQuantityType = 'Utility/GetAllQuantityTypes';
static String listProductType = 'Utility/GetAllProductTypes';
static String listSaletransactionType = 'Utility/GetAllSaleTransactionTypes';
static String listAlltransactionType = 'Utility/GetAllTransactionTypes';

static String listAllSuppliers = 'Suppliers/GetSuppliers';



  // Sale Order
  static String cashTransactionGetUrl = "CustomerOrder/GetAllCustomerCashTransaction";
   static String customerOrderGetUrl = "CustomerOrder/GetAllCustomerOrders";
   static String customerOrderDetailsGetUrl = "CustomerOrder/GetAllCustomerOrdersDetailsByOrderID";
static String SalecustomersDetails ="Customer/GetAllCustomerDetails";

static String PostMoneyDetails ="CustomerOrder/PostCashInorOut";
}
