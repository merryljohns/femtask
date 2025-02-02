import 'package:femtask/components/expense_tile.dart';
import 'package:femtask/models/expense_data.dart';
import 'package:femtask/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';  // Import GetX
import 'package:femtask/controllers/expense_controller.dart';
import 'package:provider/src/provider.dart';  // Import ExpenseController

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text controllers
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

 

  // Add new expense dialog
  void addNewExpense(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add new expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Expense name
            TextField(
              controller: newExpenseNameController,
              decoration: const InputDecoration(labelText: 'Expense Name'),
            ),
            // Expense amount
            TextField(
              controller: newExpenseAmountController,
              decoration: const InputDecoration(labelText: 'Expense Amount'),
              keyboardType: TextInputType.number, // Numeric input
            ),
          ],
        ),
        actions: [
          // Save button
          MaterialButton(
            onPressed: save,
            child: const Text('Save'),
          ),
          // Cancel button
          MaterialButton(
            onPressed: cancel,
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  // Save expense
  void save() {
    // Create ExpenseItem
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: double.tryParse(newExpenseAmountController.text) ?? 0.0,  // Parse amount to double
      dateTime: DateTime.now(),
    );
    
    // Access the ExpenseController and add the new expense
    Get.find<ExpenseController>().addNewExpense(newExpense);

    // Close dialog and clear text fields
    Get.back();
    clear();
  }

  // Cancel action
  void cancel() {
    Get.back();
    clear();
  }

  // Clear text controllers
  void clear() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  @override
  void initState() {
    super.initState();
  // Provider.of<ExpenseData>(context, listen:false).prepareData();
  }
  @override
  Widget build(BuildContext context) {
    return GetX<ExpenseController>(
      init: ExpenseController(),  // Initialize the controller
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 181, 209, 242),
          floatingActionButton: FloatingActionButton(
            onPressed: () => addNewExpense(context),
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              // Weekly summary placeholder
              Container(
                height: 100,  // Example height for weekly summary
                color: Colors.blue,
                child: Center(child: Text(
                  'Weekly Summary',
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              
              // Expense list
              Expanded(
                child: ListView.builder(
                  itemCount: controller.getAllExp.length,
                  itemBuilder: (context, index) {
                    return ExpenseTile(
                      name: controller.getAllExp[index].name,
                      amount: controller.getAllExp[index].amount,  // Convert amount to string
                      dateTime: controller.getAllExp[index].dateTime,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

