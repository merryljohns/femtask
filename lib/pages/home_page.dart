import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
        title: const Text('My App'),
        backgroundColor: Colors.pink,
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Food expence tinkerspace'),
              trailing: Icon(Icons.delete),
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Food expence tinkerspace'),
              trailing: Icon(Icons.delete),
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Food expence tinkerspace'),
              trailing: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
              child: Text(
            'Welcome to Expence Tracker App',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          const ListTile(
            leading: Icon(Icons.money),
            title: Text('Food expence tinkerspace'),
            trailing: Icon(Icons.delete),
          ),
          const ListTile(
            leading: Icon(Icons.money),
            title: Text('Food expence tinkerspace'),
            trailing: Icon(Icons.delete),
          ),
          const ListTile(
            leading: Icon(Icons.money),
            title: Text('Food expence tinkerspace'),
            trailing: Icon(Icons.delete),
          ),
          Center(
              child:
                  FilledButton(onPressed: () {}, child: const Text('Add Expence'))),
          const Text('666'),
        ],
      ),
        );
    }
  }

