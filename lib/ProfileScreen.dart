import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "John Doe", // Replace with dynamic user data
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "johndoe@example.com", // Replace with dynamic user data
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildProfileOption(Icons.person, "Edit Profile"),
            _buildProfileOption(Icons.lock, "Change Password"),
            _buildProfileOption(Icons.history, "Job History"),
            _buildProfileOption(Icons.notifications, "Notifications"),
            _buildProfileOption(Icons.logout, "Logout", isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
      title: Text(
        title,
        style: TextStyle(color: isLogout ? Colors.red : Colors.black),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Implement navigation or functionality
      },
    );
  }
}