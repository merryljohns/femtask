import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addNewExpense() {
    showDialog(
      context: context, 
      builder: (context)=>const AlertDialog(
        title:Text('Add new expense')
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed:addNewExpense,
        child: const Icon(Icons.add), 
      ),
    );
  }
}