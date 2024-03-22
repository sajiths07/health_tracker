import 'dart:math';

import 'package:flutter/material.dart';

class HealthTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int stepsCount = 0;
  double waterIntake = 0.0;
  int calorieIntake = 0;

  // Simulated function to update values (you will need to replace this with actual data updates)
  void updateValues() {
    setState(() {
      stepsCount = _getRandomNumber(10000);
      waterIntake = _getRandomDouble(3.0);
      calorieIntake = _getRandomNumber(3000);
    });
  }

  // Helper function to generate a random integer
  int _getRandomNumber(int max) {
    return Random().nextInt(max);
  }

  // Helper function to generate a random double
  double _getRandomDouble(double max) {
    return Random().nextDouble() * max;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle profile icon tap
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Navigate to profile page
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings page
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            DashboardCard(
              title: 'Steps Count',
              value: '$stepsCount',
              unit: 'steps',
            ),
            SizedBox(height: 10.0),
            DashboardCard(
              title: 'Water Intake',
              value: '$waterIntake',
              unit: 'liters',
            ),
            SizedBox(height: 10.0),
            DashboardCard(
              title: 'Calorie Intake',
              value: '$calorieIntake',
              unit: 'calories',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: updateValues,
        tooltip: 'Update Values',
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;

  DashboardCard({
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              '$value $unit',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}