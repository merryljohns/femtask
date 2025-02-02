// File: lib/controllers/expense_controller.dart
import 'package:get/get.dart'; // Import GetX
import 'package:femtask/models/expense_item.dart'; // Import ExpenseItem model

class ExpenseController extends GetxController {
  // Observable list of expenses
  var expenses = <ExpenseItem>[].obs;

  // Add new expense to the list
  void addNewExpense(ExpenseItem newExpense) {
    expenses.add(newExpense);
  }

  // Get all expenses
  List<ExpenseItem> get getAllExp => expenses;
}
