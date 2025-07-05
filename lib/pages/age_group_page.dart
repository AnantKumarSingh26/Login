import 'package:flutter/material.dart';

class AgeGroupPage extends StatefulWidget {
  const AgeGroupPage({super.key});

  @override
  State<AgeGroupPage> createState() => _AgeGroupPageState();
}

class _AgeGroupPageState extends State<AgeGroupPage> {
  String? _selectedAgeGroup;  
  final List<String> _ageGroups = [
    '1-10',
    '11-20',
    '21-30',
    '31-40',
    '41-50',
    '51-60',
    '61-70',
    '71+',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Select Age Group',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please select your age group:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedAgeGroup,
              hint: const Text('Select Age Group'),
              items: _ageGroups.map((String ageGroup) {
                return DropdownMenuItem<String>(
                  value: ageGroup,
                  child: Text(ageGroup),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAgeGroup = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedAgeGroup != null) {
                  Navigator.pop(context, _selectedAgeGroup);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}