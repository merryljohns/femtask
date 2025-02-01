import 'package:femtask/pages/expense_item.dart';

class ExpenseData {
  List<ExpenseItem> expenselist = [];
// list of all exp
  List<ExpenseItem> allExpenses() 
  {
    return expenselist;
  }

void NewExp(ExpenseItem newexp)
{
  expenselist.add(newexp);
}

void delete(ExpenseItem delexp)
{
  expenselist.remove(delexp);
}
}

// daily exp total
Map<String,double> 