import 'package:flutter/material.dart';
import 'package:kommely/AllJobsScreen.dart'; // Import the All Jobs screen
import 'package:kommely/ProfileScreen.dart'; // Import the Profile screen

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Track selected tab

  final List<Widget> _screens = [
    DashboardContent(),
    AllJobsScreen(), // Jobs screen
    ProfileScreen(), // Profile screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _screens[_selectedIndex], // Show selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// Dashboard Content Widget
class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Text(
            "Afternoon, Kemi",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Welcome to your dashboard",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // Identity Verification Card
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: ListTile(
              leading: Icon(Icons.verified_user, color: Colors.blue),
              title: Text("Identity Verification"),
              trailing: Text(
                "Approved",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Active Job Card
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Active Job",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "In-Active",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.work_off, size: 40, color: Colors.grey[400]),
                        const SizedBox(height: 8),
                        Text(
                          "You don't have any active job",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}