import 'package:flutter/material.dart';
import 'package:kommely/ChatScreen.dart'; // Import the ChatScreen file

class JobDetailsScreen extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final String condition;
  final String mobility;

  const JobDetailsScreen({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    required this.condition,
    required this.mobility,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    name, // Display job name dynamically
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$gender, $age", // Display gender and age dynamically
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            const Text("Personal Information", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildInfoRow("Gender", gender, "Medical Conditions", condition),
            _buildInfoRow("Mobility Status", mobility, "Allergies", "N/A"),
            _buildInfoRow("Type of Care Needed", "Lorem Ipsum", "Age", age),
            const SizedBox(height: 16),
            const Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("12, Bailey Street, Shomolu, Lagos"),
            const SizedBox(height: 16),
            const Text("Additional Notes", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(
              "Lorem ipsum dolor sit amet consectetur. Ultricies scelerisque nullam proin vitae.",
              style: TextStyle(color: Colors.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(name: name), // Pass client's name
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("Message Client"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label1, String value1, String label2, String value2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildInfoColumn(label1, value1)),
        Expanded(child: _buildInfoColumn(label2, value2)),
      ],
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}