import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.directions_bike, "text": "bike"},
    {"icon": Icons.directions_boat, "text": "boat"},
    {"icon": Icons.directions_bus, "text": "bus"},
    {"icon": Icons.directions_car, "text": "car"},
    {"icon": Icons.train, "text": "railway"},
    {"icon": Icons.directions_run, "text": "run"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Examen de Eliziel 1159"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: items.map((item) {
          return _buildListItem(context, item["icon"], item["text"]);
        }).toList(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, IconData icon, String text) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(text),
        onTap: () {
          // Navegar a una nueva pantalla
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(text: text, icon: icon),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String text;
  final IconData icon;

  DetailScreen({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles de $text"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              "Has seleccionado: $text",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}
