import 'package:femtask/components/expense_tile.dart';
import 'package:femtask/models/expense_data.dart';
import 'package:femtask/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controllers
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  //add new expense
  void addNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Add new expense'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //expense name
                  TextField(
                    controller: newExpenseNameController,
                    decoration: const InputDecoration(labelText: 'Expense Name'),
                  ),

                  //expense amount
                  TextField(
                    controller: newExpenseAmountController,
                    decoration: const InputDecoration(labelText: 'Expense Amount'),
                    keyboardType: TextInputType.number, // For numeric input
                  )
                ],
              ),
              actions: [
                //save button
                MaterialButton(
                  onPressed: save,
                  child: const Text('Save'),
                ),
                //cancel button
                MaterialButton(
                  onPressed: cancel,
                  child: const Text('Cancel'),
                ),
              ],
            ));
  }

  //save
  void save() {
    //create expense item
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: double.tryParse(newExpenseAmountController.text) ?? 0.0, // Parse to double
      dateTime: DateTime.now(),
    ); //ExpenseItem
    //add the new expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
    clear();
  }

  //cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            // weekly summary
            // Replace this with actual summary widgets
            Container(
              height: 100, // Example height for weekly summary
              color: Colors.blue,
              child: Center(child: Text('Weekly Summary')),
            ),
            
            // Expense list
            Expanded(  // Use Expanded to make the list scrollable
              child: ListView.builder(
                itemCount: value.getAllExp().length,
                itemBuilder: (context, index) => ExpenseTile(
                  name: value.getAllExp()[index].name,
                  amount: value.getAllExp()[index].amount.toString(),  // Convert amount to string
                  dateTime: value.getAllExp()[index].dateTime,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
