import 'package:femtask/models/expense_item.dart';


class ExpenseData {
  List<ExpenseItem> expenselist = [];
// list of all exp
  List<ExpenseItem> getAllExp() {
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
      month = '0' + month;
    }

    String day = dateTime.day.toString();
    if (day.length == 1) {
      day = '0' + day;
    }

    String date = year + month + day;

    return date;
  }

// daily exp total

  Map<String, double> calculateDailyExpense() {
    Map<String, double> dailyExpSummary = {};
    for (var exp in expenselist) {
      String date = convert(exp.dateTime);
      double amount = double.parse(exp.amount);

      if (dailyExpSummary.containsKey(date)) {
        double curAmt = dailyExpSummary[date]!;
        curAmt += amount;
        dailyExpSummary[date] = curAmt;
      } else {
        dailyExpSummary.addAll({date: amount});
      }
      return dailyExpSummary;
      

    }
  }
}
