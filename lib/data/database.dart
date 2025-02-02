import "package:femtask/models/expense_item.dart";
import 'package:hive_flutter/hive_flutter.dart';
class HiveDataBase {
  final box = Hive.box("app_database");

  void savedata(List<ExpenseItem> expense){

    List<List<dynamic>> allExpenses=[];
    for (var exp in expense)
    {
    List<dynamic> expnew=[
      exp.name,
      exp.amount,
      exp.dateTime,
    ];
    allExpenses.add(expnew);
    box.put("ALL_EXPENSES",allExpenses);
  
    }
  }

  List<ExpenseItem> readData(){
    List savedExp=box.get("ALL_EXPENSES")?? [];
    List <ExpenseItem> allExp=[];

    for (int i=0; i<savedExp.length; i++){
      String name= savedExp[i][0];
      String amount = savedExp[i][1];
      DateTime dateTime = savedExp[i][2];

      ExpenseItem expense = ExpenseItem(
        name: name,
        amount: double.parse(amount),
        dateTime: dateTime,
      );
      allExp.add(expense);

    }
    return allExp;
  }
}
