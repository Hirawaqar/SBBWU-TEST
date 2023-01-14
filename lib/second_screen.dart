import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(
    this.id,
    this.Name,
    this.fatherName,
    this.dept,
    this.description, {
    super.key,
  });
  final int id;
  final String Name;
  final String fatherName;
  final String dept;
  final String description;

  @override
  State<SecondScreen> createState() => _SecondScreenState(
        id,
        Name,
        fatherName,
        dept,
        description,
      );
}

class _SecondScreenState extends State<SecondScreen> {
  _SecondScreenState(
    this.id,
    this.Name,
    this.fatherName,
    this.dept,
    this.description,
  );
  final int id;
  final String Name;
  final String fatherName;
  final String dept;
  final String description;
  @override
  void initState() {
    super.initState();
    print('id=$id');
    print('Name=$Name');
    print('fatherName=$fatherName');
    print('dept=$dept');
    print('description=$description');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$id'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                Name,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              Text(
                fatherName,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          const SizedBox(height: 50),
          Text('Name'),
          const SizedBox(height: 50),
          Text('description'),
        ],
      ),
    );
  }
}
