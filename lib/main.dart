import 'package:flutter/material.dart';
// ignore: unused_import
import 'registrationpage.dart'; // Import your login page file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserSelectionScreen(),
    );
  }
}

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserSelectionScreenState createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  String selectedRole = 'Caregiver';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Lorem ipsum dolor sit amet consectetur. Vestibulum vulputate id.",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  _buildRoleButton("Caregiver", selectedRole == "Caregiver"),
                  const SizedBox(width: 16),
                  _buildRoleButton("Senior Citizen", selectedRole == "Senior Citizen"),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to LoginPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registrationpage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Log in",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  "In Partnership MMM",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(String role, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRole = role;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: isSelected ? Colors.white : Colors.grey[300],
              ),
              const SizedBox(height: 8),
              Text(
                role,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}