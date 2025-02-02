import 'package:femtask/models/expense_item.dart';
import "../data/database.dart";
import 'dart:math';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  List<ExpenseItem> expenselist = [];
// list of all exp
  List<ExpenseItem> getAllExp() {
    return expenselist;
  }
  // after getAllExp
// import "../data/hive_database.dart"
final db = HiveDataBase();
void prepareData() {
  if (db.readData().isNotEmpty) {
    expenselist = db.readData();
  }
}


// add new expense
  void addNewExpense(ExpenseItem newexp) {
    expenselist.add(newexp);

    notifyListeners();
    db.savedata(expenselist);
  }

// delete an expense
  void deleteExpense(ExpenseItem delexp) {
    expenselist.remove(delexp);
    
    notifyListeners();
    db.savedata(expenselist);
  }

// fn to get day of the week
  String dayname(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return '';
    }
  }

// get date of closest sunday
  DateTime? weekStart() {
    DateTime? start;
    DateTime today= DateTime.now();
    for (int i=0; i<7;i++)
    {
      if (dayname(today.subtract(Duration(days:i)))=="Sun")
      {
        start=today.subtract(Duration(days:i));
      }
    } 
    return start;

  }

// fn to convert datetime to string
  String convert(DateTime dateTime) {
    String year = dateTime.year.toString();

    String month = dateTime.month.toString();
    if (month.length == 1) {
      month = '0$month';
    }

    String day = dateTime.day.toString();
    if (day.length == 1) {
      day = '0$day';
    }

    String date = year + month + day;

    return date;
  }

// daily exp total

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};
    for (var exp in expenselist) {
      String date = convert(exp.dateTime);
      double amount = double.parse(exp.amount as String);

      if (dailyExpenseSummary.containsKey(date)) {
        double curAmt = dailyExpenseSummary[date]!;
        curAmt += amount;
        dailyExpenseSummary[date] = curAmt;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
      
      

    }
    return dailyExpenseSummary;
  }
}
