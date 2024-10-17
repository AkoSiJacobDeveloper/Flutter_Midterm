import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tocmo Paul Jacob_MidtermExam',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Item> items = [
    Item(name: 'Lion', details: 'This is Lion'),
    Item(name: 'Tiger', details: 'This is Tiger'),
    Item(name: 'Elephant', details: 'This is Elephant'),
    Item(name: 'Giraffe', details: 'This is Giraffe'),
    Item(name: 'Zebra', details: 'This is Zebra'),
    Item(name: 'Kangaroo', details: 'This is Kangaroo'),
    Item(name: 'Panda', details: 'This is Panda'),
    Item(name: 'Penguin', details: 'This is Penguin'),
    Item(name: 'Dolphin', details: 'This is Dolphin'),
    Item(name: 'Cheetah', details: 'This is Cheetah'),
  ];

  void _showDetails(String details) {
    print(details); 
  }

  void _addItem(int index) {
    setState(() {
      items[index].isAdded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tocmo, Paul Jacob - Midterm Exam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: items[index].isAdded ? Colors.green : Colors.white,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].name,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _showDetails(items[index].details);
                                },
                                child: Text('Details'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _addItem(index);
                                },
                                child: Text(items[index].isAdded ? 'Added' : 'Add'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String details;
  bool isAdded;

  Item({required this.name, required this.details, this.isAdded = false});
}
