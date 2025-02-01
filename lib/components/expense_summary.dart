import 'package:femtask/bar%20graph/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:femtask/pages/expense_data.dart';
import 'package:provider/provider.dart';
import 'package:femtask/datetime/date_time_helper.dart';


class ExpenseSummary extends StatelessWidget{
  final DateTime startOfWeek;
  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
    });

  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(startOfWeek.add(const Duration(days:0)));
    String monday = convertDateTimeToString(startOfWeek.add(const Duration(days:1)));
    String tuesday = convertDateTimeToString(startOfWeek.add(const Duration(days:2)));
    String wednesday = convertDateTimeToString(startOfWeek.add(const Duration(days:3)));
    String thursday = convertDateTimeToString(startOfWeek.add(const Duration(days:4)));
    String friday = convertDateTimeToString(startOfWeek.add(const Duration(days:5)));
    String saturday = convertDateTimeToString(startOfWeek.add(const Duration(days:6)));
    return Consumer<ExpenseData>(
      builder:(context, value, child)=>SizedBox(
        height: 200,
        child:MyBarGraph(
          maxY: 100,
          sunAmount: value.calculateDailyExpense()[sunday]??0, 
          monAmount: value.calculateDailyExpense()[monday]??0, 
          tueAmount: value.calculateDailyExpense()[tuesday]??0,  
          wedAmount: value.calculateDailyExpense()[wednesday]??0,  
          thuAmount: value.calculateDailyExpense()[thursday]??0,  
          friAmount: value.calculateDailyExpense()[friday]??0,  
          satAmount: value.calculateDailyExpense()[saturday]??0, 
        ),
      ),
    );
  }
}