import 'package:get/get.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/models/expense/expensetype.dart';
import 'package:trader_app/services/expenseservice.dart';
import '../../Ui/Expense/add_expense.dart';
import '../../models/expense/expensedetails.dart';

class ListExpenseCtrl extends BaseController {
  late ExpenseService service;
  var expenseList = <ExpenseDetails>[].obs;
  var filteredExpenseList = <ExpenseDetails>[].obs;
  final Rx<String> selectedDate = "".obs;
  final Rx<int> selectedExpenseTypeId = 0.obs;
  final Rx<bool> isFiltered = false.obs;
  var expenseType = <ExpenseType>[].obs;
  var dropDownExpenseType;

  final filteredExpenseText = ''.obs;
  @override
  void onInit() async {
    isLoading.value = true;
    service = ExpenseService();
    expenseType.value = await service.getAllListExpensesType();
    loadExpenseList();
    // TODO: implement onInit
    super.onInit();
    isLoading.value = false;
  }

  Future<void> loadExpenseList() async {
    isLoading.value = true;
    expenseList.value = await service.getAllListExpenses();
    isLoading.value = false;
  }

  loadFilteredExpenseList(int? filterId, String? dateRange) {
    if (dropDownExpenseType != null && selectedDate.value != '') {
      dataFilter(dateRange);
      filteredExpenseList.value = filteredExpenseList
          .where((e) => e.expenseTypeName!
              .toLowerCase()
              .contains(filteredExpenseText.toLowerCase()))
          .toList();
    } else if (selectedDate.value != '') {
      dataFilter(dateRange);
    } else if (dropDownExpenseType != null) {
      filteredExpenseList.value = expenseList
          .where((e) => e.expenseName!
              .toLowerCase()
              .contains(dropDownExpenseType.toString().toLowerCase()))
          .toList();
    }
  }

  void dataFilter(String? dateRange) {
    DateTime currentDate = DateTime.now();
    DateTime lastWeekStartDate = DateTime.now();
    switch (dateRange) {
      case "Today":
        lastWeekStartDate = currentDate;
        break;
      case "Last Week":
        lastWeekStartDate = currentDate.subtract(const Duration(days: 6));
        break;
      case "Last Month":
        lastWeekStartDate = currentDate.subtract(const Duration(days: 30));
        break;
    }
    filteredExpenseList.value = expenseList.where((element) {
      return element.expenseDate!.isBefore(currentDate) &&
          element.expenseDate!.isAfter(lastWeekStartDate);
    }).toList();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void addnewExpense() {
    Get.to(const AddExpense());
  }
}
