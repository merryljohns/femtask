import 'package:femtask/pages/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData {
  
  List<ExpenseItem> expenselist = [];
// list of all exp
  List<ExpenseItem> getAllExp() 
  {
    return expenselist;
  }
// add new expense
  void addNewExpense(ExpenseItem newexp) {
    expenselist.add(newexp);
  }

// delete an expense
  void deleteExpense(ExpenseItem delexp) {
    expenselist.remove(delexp);
  }

// fn to convert datetime to string
String convert(DateTime dateTime) {
  String year = dateTime.year.toString();

  String month =dateTime.month.toString();
  if (month.length == 1) {
    month='0'+month;
  }

  String day = dateTime.day.toString();
  if (day.length == 1){
    day='0'+ day;
  }

  String date= year+month+day;

  return date;
}


// daily exp total

Map<String, double> calculateDailyExpense(){
  Map<String, double> dailyExpSummary = {
    // add els here
  };
}




for (var exp in expenselist)
async {
  String date= convert(exp.dateTime);
  double amount = double.parse(exp.amount);

  if (dailyExpSummary.containsKey(date))
  {
    double curAmt= dailyExpSummary[date];
    curAmt+= amount;
    dailyExpSummary[date]= curAmt;
  }
  else 
  {
    dailyExpSummary.addAll({date:amount});
  }
  return dailyExpSummary; 
}


}

